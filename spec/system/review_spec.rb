# frozen_string_literal: true

require 'rails_helper'

describe "ログインのテスト" do
  before do 
    @customer = FactoryBot.create(:customer)
  end
end

describe "ログイン画面に遷移" do 
  before do 
    visit new_customer_session_path
  end
end



describe "レビュー投稿のテスト" do
  let!(:review) {create(:review,title:'hoge',body:'body')}
  describe 'トップ画面のテスト(root_path)' do
    before do 
      visit root_path
    end
    
    context '表示の確認' do
      it 'トップ画面(root_path)にゲーム上達のためのサイトですと表示されている' do
        expect(page).to have_content 'ゲーム上達のためのサイトです'
      end
    end
    
  end
end