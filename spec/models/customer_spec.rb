require 'rails_helper'

RSpec.describe Customer, type: :model do
    describe 'ユーザー登録' do
      it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
       customer = build(:customer)
       expect(customer).to be_valid  # user.valid? が true になればパスする
      end
    end
end