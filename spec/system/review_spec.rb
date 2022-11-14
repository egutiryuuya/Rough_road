# frozen_string_literal: true

require 'rails_helper'


describe "root_pathへの遷移" do
  context '表示の確認' do
    before do 
      visit root_path
    end
    it 'トップ画面(root_path)にゲーム上達のためのサイトですと表示されている' do
      expect(page).to have_content 'ゲーム上達のためのサイトです'
    end
  end
end



describe "レビュー投稿のテスト" do
  let!(:review) {create(:review,title:'hoge',body:'body')}
  describe 'トップ画面のテスト(root_path)' do
    
  end
end

describe "練習" do
  context "足し算" do
    it "3+3が六になる" do 
      expect(3+3).to eq 6 
    end
  end
end