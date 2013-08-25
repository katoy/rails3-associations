# coding: utf-8

require 'spec_helper'
require 'pp'

describe 'トップページ' do
  specify 'ブランド名の表示' do
    visit root_path
    pp page
    expect(page).to have_css('a.brand', text: 'Rails3Associations')
  end
end
