# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_one(:user_library) }
  end

  describe "validations" do
    subject { User.create(email: "some_email@myemail.com") }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
