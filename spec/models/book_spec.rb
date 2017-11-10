require 'rails_helper'
require 'faker'
require 'rspec-rails'

describe Book, type: :model do
  it do
    should validate_presence_of(:genre)
  end

  it do
    should validate_presence_of(:author)
  end

  it do
    should validate_presence_of(:title)
  end

  it do
    should validate_presence_of(:image)
  end

  it do
    should validate_presence_of(:publisher)
  end

  it do
    should validate_presence_of(:year)
  end

  subject(:book) do
    Book.new(
      author: author,
      genre: genre,
      title: title,
      image: image,
      publisher: publisher,
      year: year
    )
  end

  let(:author) { Faker::Book.author }
  let(:genre) { Faker::Book.genre }
  let(:title) { Faker::Book.title }
  let(:publisher) { Faker::Book.publisher }
  let(:year) { Faker::Number.between(1000, 2018).to_s }
  let(:image) { 'test' }

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the author is nil' do
      let(:author) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the genre is nil' do
      let(:genre) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the title is nil' do
      let(:title) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the publisher is nil' do
      let(:publisher) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the year is nil' do
      let(:year) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the image is nil' do
      let(:image) { nil }

      it do
        is_expected.to be_invalid
      end
    end
  end
end
