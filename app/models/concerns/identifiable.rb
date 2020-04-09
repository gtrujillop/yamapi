module Identifiable
  extend ActiveSupport::Concern

  included do
    validates :title, presence: true
    validates :plot, presence: true
    validates :number, presence: true
  end
end
