class OpenLibraryService
  include HTTParty

  def book_info(isbn)
    response = HTTParty.get(
      "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    )
    parser_json_isbn(response.parsed_response, isbn)
  end

  private def parser_json_isbn(response, isbn)
    key = response[response.keys.first]
    { ISBN: isbn,
      title: key['title'],
      subtitle: key['subtitle'],
      number_of_pages: key['number_of_pages'],
      authors: key['authors'] }
  end
end
