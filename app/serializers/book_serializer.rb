class BookSerializer < ActiveModel::Serializer
  attributes :id, :genre, :author, :year, :image, :publisher, :title
end
