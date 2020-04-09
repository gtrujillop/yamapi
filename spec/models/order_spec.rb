# == Schema Information
#
# Table name: orders
#
#  id                :bigint           not null, primary key
#  purchaseable_type :string           not null
#  total_price       :float            default(0.0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  purchaseable_id   :integer          not null
#  user_library_id   :bigint           not null
#
# Indexes
#
#  index_orders_on_purchaseable_id_and_purchaseable_type  (purchaseable_id,purchaseable_type)
#  index_orders_on_user_library_id                        (user_library_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_library_id => user_libraries.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "associations" do
    it { should belong_to(:user_library) }
    it { should belong_to(:purchaseable) }
  end

  describe "validations" do
    it { should validate_numericality_of(:total_price) }
  end
end
