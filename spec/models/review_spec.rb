require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :rating }
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :username }

    it { should validate_numericality_of(:rating).only_integer }
  end

  describe 'Relationships' do
    it { should belong_to :book }
  end

  describe 'Class methods' do
    describe '.most_active_users' do
      it 'returns array of arrays for top 3 reviewers, .first as username and .last as their review count' do
        @book_1 = Book.create(thumbnail: 'steve.jpg', title: 'Book 1 title', pages: 40, year_published: 1987)
        @book_2 = Book.create(thumbnail: 'steve.jpg', title: 'Book 2 title', pages: 40, year_published: 1987)
        @book_3 = Book.create(thumbnail: 'steve.jpg', title: 'Book 3 title', pages: 40, year_published: 1987)
        @book_4 = Book.create(thumbnail: 'steve.jpg', title: 'Book 4 title', pages: 40, year_published: 1987)
        @book_5 = Book.create(thumbnail: 'steve.jpg', title: 'Book 5 title', pages: 40, year_published: 1987)

        @book_1.reviews.create(rating: 1, title: 'Review_title', description: 'Review_description', username: 'User1')

        @book_2.reviews.create(rating: 2, title: 'Review_title', description: 'Review_description', username: 'User2')
        @book_2.reviews.create(rating: 2, title: 'Review_title', description: 'Review_description', username: 'User3')

        @book_3.reviews.create(rating: 3, title: 'Review_title', description: 'Review_description', username: 'User2')

        @book_4.reviews.create(rating: 4, title: 'Review_title', description: 'Review_description', username: 'User3')
        @book_4.reviews.create(rating: 4, title: 'Review_title', description: 'Review_description', username: 'User4')

        @book_5.reviews.create(rating: 4, title: 'Review_title', description: 'Review_description', username: 'User3')
        @book_5.reviews.create(rating: 5, title: 'Review_title', description: 'Review_description', username: 'User4')

        expected = [
          ['User3', 3],
          ['User4', 2],
          ['User2', 2]
        ]

        expect(Review.most_active_users).to eq(expected)
      end
    end
  end
end
