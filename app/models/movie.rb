# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  plot       :integer          default("drama"), not null
#  title      :text             not null
#  unit_price :float            default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_movies_on_title_and_plot  (title,plot)
#
class Movie < ApplicationRecord
  include Monetizable
  
  has_many :seasons
  
  enum plot: { 
    drama: 0, 
    action: 1, 
    comedy: 2,
    documentary: 3,
    animation: 4,
    belic: 5 
  }

  validates :title, presence: true
  validates :plot, presence: true
end
