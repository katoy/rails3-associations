# coding: utf-8

require 'test_helper'

class IdeaTest2 < ActiveSupport::TestCase

  setup do
    Fabrication.clear_definitions

    @idea = Fabricate(:idea)
    @comment = Fabricate(:comment, idea: @idea)
    @idea.comments = [@comment]
  end

  test 'should get name, description, comments' do
    assert_equal @idea.name, 'idea_name-10000'
    assert_equal @idea.description, 'description...'
    assert_equal @idea.comments.size, 1
    assert_equal @idea.comments[0].user_name, 'comment_user_name-2000'

    idea = @idea.comments[0].idea
    assert_equal idea.name, 'idea_name-10000'
    assert_equal idea.description, 'description...'
    assert_equal idea.comments.size, 1
    assert_equal idea.comments[0].user_name, 'comment_user_name-2000'
    assert_equal idea.comments[0].idea.name, 'idea_name-10000'

  end

end
