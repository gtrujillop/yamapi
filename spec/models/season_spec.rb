# == Schema Information
#
# Table name: seasons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  plot       :jsonb
#  title      :text             not null
#  unit_price :float            default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint           not null
#
# Indexes
#
#  index_seasons_on_movie_id          (movie_id)
#  index_seasons_on_plot              (plot) USING gin
#  index_seasons_on_title_and_number  (title,number)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#
require 'rails_helper'

RSpec.describe Season, type: :model do
  describe "associations" do
    it { should belong_to(:movie).required }
    it { should have_many(:episodes) }

  end
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:number) }
    it { should validate_numericality_of(:unit_price) }
    context "validates plot" do
      let(:movie) { Movie.create(title: 'This Tv Show') } 
      context "and the plot is not present" do
        let(:season) { Season.new(title: 'The Green Mile', number: 1, movie: movie)  } 
        it 'is valid' do
          expect(season).to be_valid
        end
      end
      context "and the plot has the wrong structure" do
        let(:season) { Season.new(title: 'The Green Mile', number: 1, plot: plot, movie: movie)  } 
        let(:plot) do
          {
            synopsis: 'Some Random Synopsis',
            acts: []
          }
        end
        it 'is invalid' do
          expect(season).to_not be_valid
        end
      end
      context "and the plot has the right structure" do
        let(:season) { Season.new(title: 'The Green Mile', number: 1, plot: plot, movie: movie)  } 
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
          expect(season).to be_valid
        end
      end
    end
  end
  
end
