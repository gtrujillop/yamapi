# == Schema Information
#
# Table name: seasons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  plot       :integer          not null
#  title      :text             not null
#  unit_price :float            default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint           not null
#
# Indexes
#
#  index_seasons_on_movie_id                   (movie_id)
#  index_seasons_on_title_and_plot_and_number  (title,plot,number)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#
class Season < ApplicationRecord
  include Identifiable
  include Monetizable
  
  belongs_to :movie, required: true
  has_many :episodes
end
