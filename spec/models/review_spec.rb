# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do 
    expec(FactoryBot.build(:review)).to be_vaild
  end
end