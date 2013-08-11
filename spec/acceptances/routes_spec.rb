# coding: utf-8

require 'spec_helper'

feature "routes", :js => true do
  before do
    Capybara.current_driver = :poltergeist
  end
  
  after do
    Capybara.current_driver = :rack_test
  end
  
  scenario "can access" do
    sno = 0

    visit root_path
    # page.status_code.should be 200
    current_path.should == "/ideas"
    # ルート画面
    sno = my_screenshot(sno, "root")
    
    click_on '新規登録'
    current_path.should == "/ideas/new"
    # アイデア登録フォーム
    sno = my_screenshot(sno, "index_form")
    
    click_on '登録する'
    current_path.should == "/ideas"
    # アイデア登録フォーム 入力データ不足絵絵r−あ
    sno = my_screenshot(sno, "index_form_error")
    
    fill_in "名前",        with: :"アイデァ001" 
    fill_in "本文",        with: :"アイデア001\n詳細\内容"
    sno = my_screenshot(sno, "index_form_fill_data")

    click_on '登録する'
    current_path.should == "/ideas/1"
    # アイデア登録フォーム 登録成功画面
    sno = my_screenshot(sno, "index_new_ok")

    fill_in "名前", with: :"katoy" 
    fill_in "本文", with: :"コメント内容"
    sno = my_screenshot(sno, "comment_form_filled")

    click_on '登録する'
    current_path.should == "/comments/1"
    # コメント登録 フォーム
    sno = my_screenshot(sno, "comment_new_ok")

    click_on '編集'
    current_path.should == "/comments/1/edit"
    # コメント編集 フォーム
    sno = my_screenshot(sno, "comment_form_edit")

    fill_in "本文", with: :"コメント内容XXX"
    sno = my_screenshot(sno, "comment_form_edit_filled")

    click_on '更新する'
    current_path.should == "/comments/1"
    # コメント内容表示
    sno = my_screenshot(sno, "comment_edit_ok")

    click_on '一覧へ戻る'
    current_path.should == "/comments"
    # コメント内容表示
    sno = my_screenshot(sno, "comments")

    click_on 'Ideas'
    current_path.should == "/ideas"
    # コメント内容表示
    sno = my_screenshot(sno, "ideas")

    click_on '表示'
    current_path.should == "/ideas/1"
    # コメント内容表示
    sno = my_screenshot(sno, "idea_show_1")

    click_on '一覧へ戻る'
    current_path.should == "/ideas"
    # アイデア一覧
    sno = my_screenshot(sno, "ideas")

    click_on '編集'
    current_path.should == "/ideas/1/edit"
    # アイデア内容表示
    sno = my_screenshot(sno, "idea_form_edit_1")

    click_on '一覧へ戻る'
    current_path.should == "/ideas"
    # アイデア内容表示
    sno = my_screenshot(sno, "ideas")

    click_on '削除'
    alert = page.driver.browser.switch_to.alert

    current_path.should == "/ideas"
    # アイデア削除確認
    sno = my_screenshot(sno, "idea_delete_1")

    #click_on 'OK'
    #current_path.should == "/ideas"
    # アイデア削除後の一覧
    #sno = my_screenshot(sno, "root")

  end

end
