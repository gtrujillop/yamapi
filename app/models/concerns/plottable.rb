module Plottable
  extend ActiveSupport::Concern

  included do
    serialize :plot, HashSerializer
    store_accessor :plot

    validates_with PlotValidator
  end
end
