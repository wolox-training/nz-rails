class OpenLibraryService
  include HTTParty

  def book_info(isbn_params)
    @ISBN_code= 'ISBN:'+isbn_params
    response = HTTParty.get("https://openlibrary.org/api/books",
      query: { bibkeys:@ISBN_code, format:"json", jscmd: "data" }
    )
    parser_json_isbn(response.parsed_response, isbn_params)
  end

  private def parser_json_isbn(response, isbn)
    key = response[response.keys.first]
    { ISBN: isbn,
      title: key['title'],
      subtitle: key['subtitle'],
      number_of_pages: key['number_of_pages'],
      authors: key['authors'] }
  end

  private def isbn_params
      params.permit(:isbn)
  end

end
