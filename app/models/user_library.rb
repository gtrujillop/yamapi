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
class UserLibrary < ApplicationRecord
  belongs_to :user
  has_many :orders

  def available_items
    orders.where('created_at >= ?', DateTime.now - 2.days).includes(:purchaseable).map do |order|
      order.purchaseable
    end
  end
  
end
