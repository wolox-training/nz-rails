class OpenLibraryService
  include HTTParty

  def book_info(isbn)
    response = HTTParty.get(
      "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    )
    pretty_response = response.parsed_response
    if pretty_response.empty?
      parse_empty_json(isbn)
    else
      parser_json_isbn(response.parsed_response, isbn)
    end
  end

  private def parser_json_isbn(response, isbn)
    {
      ISBN: isbn,
      title: response[response.keys.first]['title'],
      subtitle: response[response.keys.first]['subtitle'],
      number_of_pages: response[response.keys.first]['number_of_pages'],
      authors: response[response.keys.first]['authors']
    }
  end
  private def parse_empty_json(isbn)
    {ISBN: isbn}
  end
end
