# == Schema Information
#
# Table name: episodes
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  plot       :integer          not null
#  title      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :bigint           not null
#
# Indexes
#
#  index_episodes_on_season_id                  (season_id)
#  index_episodes_on_title_and_plot_and_number  (title,plot,number)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#
class Episode < ApplicationRecord
  include Identifiable

  belongs_to :season, required: true
end
