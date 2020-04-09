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
require 'rails_helper'

RSpec.describe Season, type: :model do
  describe "associations" do
    it { should belong_to(:movie).required }
    it { should have_many(:episodes) }

  end
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:plot) }
    it { should validate_presence_of(:number) }
    it { should validate_numericality_of(:unit_price) }
  end
  
end
