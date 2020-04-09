module Monetizable
  extend ActiveSupport::Concern

  included do
    validates :unit_price, numericality: true
  end
end
