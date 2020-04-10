# == Schema Information
#
# Table name: episodes
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  plot       :jsonb
#  title      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :bigint           not null
#
# Indexes
#
#  index_episodes_on_plot              (plot) USING gin
#  index_episodes_on_season_id         (season_id)
#  index_episodes_on_title_and_number  (title,number)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#
class Episode < ApplicationRecord
  include Identifiable
  include Plottable
  
  belongs_to :season, required: true

  default_scope { order('number ASC') }
end
