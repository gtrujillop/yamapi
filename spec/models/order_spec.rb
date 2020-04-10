# == Schema Information
#
# Table name: orders
#
#  id                :bigint           not null, primary key
#  purchaseable_type :string           not null
#  quality           :enum
#  total_price       :float            default(0.0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  purchaseable_id   :integer          not null
#  user_library_id   :bigint           not null
#
# Indexes
#
#  index_orders_on_purchaseable_id_and_purchaseable_type  (purchaseable_id,purchaseable_type)
#  index_orders_on_quality                                (quality)
#  index_orders_on_user_library_id                        (user_library_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_library_id => user_libraries.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:movie) { Movie.create(title: 'Star Wars: The Return of the Jedi') }
  let(:user) { User.create(email: 'dummy_email@my_email.com') }
  let(:user_library) { UserLibrary.create(user: user) }

  describe "associations" do
    subject { Order.create(purchaseable: movie, quality: :hd, user_library: user_library, total_price: 100) }
    it { should belong_to(:user_library).required }
    it { should belong_to(:purchaseable) }
  end

  describe "validations" do
    subject { Order.create(purchaseable: movie, quality: :hd, user_library: user_library, total_price: 100) }
    it { should validate_numericality_of(:total_price) }
    it { should define_enum_for(:quality).backed_by_column_of_type(:enum) }

    context "when the user buys a movie" do
      let(:old_movie) { Movie.create(title: 'The Green Mile', plot: plot)  } 
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
     
      let!(:order1) { Order.create(purchaseable: old_movie, quality: :hd, user_library: user_library, total_price: 100) }
      let!(:order2) { Order.create(purchaseable: movie, quality: :full_hd, user_library: user_library, total_price: 110) }

      context "and the movie is still available" do
        it 'is invalid' do
          travel 1.days do
            new_order = Order.new(
              purchaseable: movie,
              quality: :full_hd,
              total_price: 110,
              user_library: user_library
            )
            expect(new_order).to be_invalid
          end
        end
      end

      context "and the movie is not available" do
        it 'is valid' do
          travel 3.days do
            new_order = Order.new(
              purchaseable: old_movie,
              quality: :full_hd,
              total_price: 100,
              user_library: user_library
            )
            expect(new_order).to be_valid
          end
        end
      end
    end
  end
end
