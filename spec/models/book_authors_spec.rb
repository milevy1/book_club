require 'rails_helper'

RSpec.describe BookAuthor, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :book_id }
    it { should validate_presence_of :author_id }
  end

  describe 'Relationships' do
    it { should belong_to :authors }
    it { should belong_to :books }
  end
end
