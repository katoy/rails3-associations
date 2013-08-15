# coding: utf-8

require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  setup do
    @idea = ideas(:one)
  end

  test "should get has_many, has_one" do
    assert_equal @idea.name, "IDEA_001"

    # has_many
    assert_equal @idea.comments.size, 2
    assert_equal @idea.xcomments.size, 2

    # has_one
    assert_not_nil @idea.info
    assert_not_nil @idea.xinfo
  end

  test "should delete item of has_many, has_one" do
    assert_equal Comment.all.size, 3
    assert_equal Info.all.size, 2
    assert_equal Xcomment.all.size, 3
    assert_equal Xinfo.all.size, 2

    @idea.destroy

    # ependent: :destroy を指定していると、関連しているデータも自動敵に削除される。
    assert_equal Comment.all.size, 1
    assert_equal Info.all.size, 1
    # ependent: :destroy を指定していないと、関連しているデータは自動敵に削除されない。
    assert_equal Xcomment.all.size, 3
    assert_equal Xinfo.all.size, 2

  end

  test "should sync idea and info.idea, no-sync idea and xinfo.idea" do

    assert_equal @idea.name, @idea.info.idea.name
    assert_equal @idea.name, @idea.xinfo.idea.name

    @idea.info.idea.name = "xxx"
    assert_equal @idea.name, "xxx"
    assert_equal @idea.object_id, @idea.info.idea.object_id

    @idea.xinfo.idea.name = "yyy"
    assert_equal @idea.name, "xxx"
    assert_not_equal @idea.object_id, @idea.xinfo.idea.object_id

    assert_equal     @idea.object_id, @idea.info.idea.info.idea.object_id
    assert_not_equal @idea.object_id, @idea.xinfo.idea.xinfo.idea.object_id

  end

  test "should sync idea and commnt.idea, no-sync idea and xcomment.idea" do
    com = @idea.comments.first
    xcom = @idea.xcomments.first

    assert_equal @idea.name, com.idea.name
    assert_equal @idea.name, xcom.idea.name

    assert_equal @idea.object_id, com.idea.object_id
    assert_not_equal @idea.object_id, xcom.idea.object_id

    com.idea.name = "xxx"
    assert_equal @idea.name, "xxx"

    xcom.idea.name = "yyy"
    assert_equal @idea.name, "xxx"

  end

  test "Idea.name = nil is invalid" do
    @idea.name = nil
    assert @idea.invalid?
    assert @idea.errors[:name].any?
  end

  test "Idea.name = '' is invalid" do
    @idea.name = ""
    assert @idea.invalid?
    assert @idea.errors[:name].any?
  end

  test "Idea.name = '1234567890123456789012345678901234567890' is invalid" do
    @idea.name = "1234567890123456789012345678901234567890"
    assert @idea.invalid?
    assert @idea.errors[:name].any?
  end

  test "Idea.name = '1234567890' is valid" do
    @idea.name = "1234567890"
    assert @idea.valid?
  end

  test "non-uniq name is invalid for ActveRecord" do
    idea1 = ideas(:two)
    idea1.name = @idea.name
    assert idea1.invalid?
    assert idea1.errors[:name].any?
  end

  test "non-uniq name is invalid for DB" do
    idea = Idea.new
    idea.name = "1234"
    idea.description = "1234"
    idea.save!(validate: false)
    assert_equal idea.errors.full_messages, []

    idea = Idea.new
    idea.name = "1234"
    idea.description = "1234"

    # model の validte を skip して重複データを登録しようとしても DB でのチェックに引っかかる。
    assert_record_not_unique do
      idea.save!(validate: false)
    end
  end

  test "can read polymorphic" do
   ### assert_equal @idea.pictures.size, 1
   ### assert_equal @idea.pictures[0].name, "picture_1"

   p = Picture.first
   assert_equal p.imageable_type, 'Comment'
   assert_equal p.imageable.user_name, 'katoy'
  end

  test "success in tansaction for idea and info" do
    @idea = nil
    begin
      Idea.transaction do
        info = Info.new
        info.writer = "t_kato"
        
        @idea = Idea.new
        @idea.name = "idea_t01"
        @idea.description = "about about about"
        @idea.info= info
        @idea.info.writer = "t_kato"
        @idea.save!
      end
      assert true
    rescue
      assert false
    end

    assert_equal @idea.errors.full_messages, []
    assert_equal @idea.info.errors.full_messages, []

    idea = Idea.find_by_name "idea_t01"
    assert idea != nil
    assert_equal idea.info.writer, "t_kato"
    info = Info.find_by_writer "t_kato"
    assert_equal info.idea.name, "idea_t01"

  end

  test "error on idea in transaction" do
    @idea = nil
    @info = nil
    begin
      Idea.transaction do
        @info = Info.new
        @info.writer = "t_kato"
        
        @idea = Idea.new
        @idea.name = nil  
        @idea.description = "about about about"
        @idea.info= @info
        @idea.save!
      end      
      assert false
    rescue
      assert true
      assert_equal @idea.errors.size, 1
      assert_equal @idea.errors.full_messages, ["名前は4文字以上で入力してください。"]

      assert_equal @idea.info.errors.full_messages, []
    end
  end

  test "error on info in transaction" do
    @idea = Idea.new
    @info = Info.new
    begin
      Idea.transaction do
        @info.writer = nil
        @info.save!
        
        @idea.name = "idea_t01" 
        @idea.description = "about about about"
        @idea.info= info
        @idea.save!
      end      
      assert false, "can not catch error"
    rescue
      assert true
      assert_equal @idea.errors.full_messages, []
      assert_equal @idea.info, nil
      assert_equal @info.errors.full_messages, ["名前は1文字以上で入力してください。"]
    end
  end
  
end
