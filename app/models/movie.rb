# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  plot       :jsonb
#  title      :text             not null
#  unit_price :float            default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_movies_on_plot   (plot) USING gin
#  index_movies_on_title  (title)
#
class Movie < ApplicationRecord
  include Monetizable
  include Plottable
  
  has_many :seasons

  validates :title, presence: true
end
