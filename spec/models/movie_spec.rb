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
require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "associations" do
    it { should have_many(:seasons) }

  end
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:plot) }
    it { should validate_numericality_of(:unit_price) }
  end
  
end
