# == Schema Information
#
# Table name: orders
#
#  id                :bigint           not null, primary key
#  purchaseable_type :string           not null
#  quality           :enum
#  total_price       :float            default(0.0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  purchaseable_id   :integer          not null
#  user_library_id   :bigint           not null
#
# Indexes
#
#  index_orders_on_purchaseable_id_and_purchaseable_type  (purchaseable_id,purchaseable_type)
#  index_orders_on_quality                                (quality)
#  index_orders_on_user_library_id                        (user_library_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_library_id => user_libraries.id)
#
class Order < ApplicationRecord
  belongs_to :purchaseable, polymorphic: true
  belongs_to :user_library, required: true
  enum quality: { hd: 'hd', full_hd: 'full_hd', standard: 'standard' }

  validates :total_price, numericality: true
  validates :quality, inclusion: { in: qualities.keys }
  validate :can_purchase

  delegate :available_items, to: :user_library, allow_nil: true

  private

  def can_purchase
    if available_items&.include?(purchaseable)
      errors.add(:user_library, I18n.t('order.item_already_in_user_library'))
    end
  end
  
end
