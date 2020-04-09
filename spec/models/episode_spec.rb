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
require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe "associations" do
    it { should belong_to(:season).required }
  end
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:plot) }
    it { should validate_presence_of(:number) }
  end
  
end
