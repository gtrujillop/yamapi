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
require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "associations" do
    it { should have_many(:seasons) }
    it { should have_many(:orders) }
  end
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:unit_price) }
    context "validates plot" do
      context "and the plot is not present" do
        let(:movie) { Movie.new(title: 'The Green Mile') } 
        it 'is valid' do
          expect(movie).to be_valid
        end
      end
      context "and the plot has the wrong structure" do
        let(:movie) { Movie.new(title: 'The Green Mile', plot: plot)  } 
        let(:plot) do
          {
            synopsis: 'Some Random Synopsis',
            acts: []
          }
        end
        it 'is invalid' do
          expect(movie).to_not be_valid
        end
      end
      context "and the plot has the right structure" do
        let(:movie) { Movie.new(title: 'The Green Mile', plot: plot)  } 
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
          expect(movie).to be_valid
        end
      end
    end
  end
end
