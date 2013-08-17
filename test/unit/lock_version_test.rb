# coding: utf-8

require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  setup do
    @idea1 = Idea.first
    @idea2 = Idea.first
  end

  test "get error in save for conflict" do

    @idea1.name= "11111"
    @idea2.name= "22222"
    assert_equal true, @idea1.save
    assert_equal false, @idea2.save
    assert_equal [" #{I18n.t(:conflict_edit, scope: :'views.errors')}"], @idea2.errors.full_messages

    assert_equal "11111", @idea1.name
    assert_equal "11111", Idea.first.name
  end

  test "get error in save! for conflict" do
    @idea1.name= "11111"
    @idea2.name= "22222"
    
    @idea1.save!
    assert_raise(ActiveRecord::StaleObjectError) {
      @idea2.save!
    }
    assert_equal [" #{I18n.t(:conflict_edit, scope: :'views.errors')}"], @idea2.errors.full_messages

    assert_equal "11111", @idea1.name
    assert_equal "11111", Idea.first.name
  end

  test "get error in update_attributes! for conflict" do
    @idea1.update_attributes!(name: "11111", lock_version: @idea1.lock_version)
    assert_raise(ActiveRecord::StaleObjectError) {
      @idea2.update_attributes!(name: "22222", lock_version: @idea2.lock_version)
    }
    assert_equal [" #{I18n.t(:conflict_edit, scope: :'views.errors')}"], @idea2.errors.full_messages
    assert_equal "11111", @idea1.name
    assert_equal "11111", Idea.first.name
  end

  test "get error in update_attribute for conflict" do
    assert_equal true,  @idea1.update_attributes(name: "11111", lock_version: @idea1.lock_version)
    assert_equal false, @idea2.update_attributes(name: "22222", lock_version: @idea2.lock_version)

    assert_equal "11111", @idea1.name
    assert_equal "11111", Idea.first.name
    assert_equal [" #{I18n.t(:conflict_edit, scope: :'views.errors')}"], @idea2.errors.full_messages
  end

  test "get error in destroy for conflict" do
    assert_equal @idea1, @idea1.destroy
    assert_equal 0,      @idea2.destroy
    assert_equal [" #{I18n.t(:conflict_edit, scope: :'views.errors')}"], @idea2.errors.full_messages
    assert_equal [], Idea.where(id: @idea1.id).all
  end

  test "get no-error in delete for conflict" do
    assert_equal @idea1, @idea1.delete
    assert_equal @idea2, @idea2.delete
    assert_equal [], @idea2.errors.full_messages
    assert_equal [], Idea.where(id: @idea1.id).all
  end

end
