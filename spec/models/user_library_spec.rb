# == Schema Information
#
# Table name: user_libraries
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_libraries_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserLibrary, type: :model do
  describe "associations" do
    it { should have_many(:orders) }
  end

  describe "validations" do
    
  end
end
