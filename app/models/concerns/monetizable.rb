module Monetizable
  extend ActiveSupport::Concern

  included do
    has_many :orders, as: :purchaseable
    validates :unit_price, numericality: true
    
    default_scope { order('created_at ASC') }

    def blueprint
      "#{self.class}Blueprint".constantize
    end
  end
end
