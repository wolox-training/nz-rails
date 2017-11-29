class OpenLibraryService
  include HTTParty

  def book_info(isbn_params)
    @isbn_code = 'ISBN:' + isbn_params
    response = HTTParty.get('https://openlibrary.org/api/books',
                            query: { bibkeys: @isbn_code, format: 'json', jscmd: 'data' })
    return nil if response.parsed_response.empty?
    parse_json_isbn(response.parsed_response, isbn_params)
  end

  private
  def parse_json_isbn(response, isbn)
    key = response[response.keys.first]
    { ISBN: isbn,
      title: key['title'],
      subtitle: key['subtitle'],
      number_of_pages: key['number_of_pages'],
      authors: key['authors'] }
  end
end
