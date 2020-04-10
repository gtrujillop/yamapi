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
require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe "associations" do
    it { should belong_to(:season).required }
  end
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:number) }
    context "validates plot" do
      let(:movie) { Movie.create(title: 'This Tv Show') } 
      let(:season) { Season.create(title: 'Season 1', number: 1, movie: movie)  } 
      context "and the plot is not present" do
        let(:episode) { Episode.new(title: 'Episode 1', number: 1, season: season)  } 
        it 'is valid' do
          expect(episode).to be_valid
        end
      end
      context "and the plot has the wrong structure" do
        let(:episode) { Episode.new(title: 'Episode 1', number: 1, plot: plot, season: season)  } 
        let(:plot) do
          {
            synopsis: 'Some Random Synopsis',
            acts: []
          }
        end
        it 'is invalid' do
          expect(episode).to_not be_valid
        end
      end
      context "and the plot has the right structure" do
        let(:episode) { Episode.new(title: 'Episode 1', number: 1, plot: plot, season: season)  } 
        let(:plot) do
          {
            synopsis: 'Some Random Synopsis',
            acts: [
              {
                type: :exposition,
                min_from: 45,
                min_to: 50,
                description: 'Something happened that makes people cry'
              }
            ]
          }
        end
        it 'is valid' do
          expect(episode).to be_valid
        end
      end
    end
  end
  
end
