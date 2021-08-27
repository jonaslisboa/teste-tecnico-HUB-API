#####################################################################################
# Name:           Class BookAPI - default structure
# Description:    Methods used to build the steps
# Project:        Teste tecnico | HUB/Inmetrics
# Author:         Jonas Lisboa Silva | jonasbrasil016@gmail.com
# Date:           27/08/21
#####################################################################################
class BookAPI

    include HTTParty
    base_uri (CONFIG_UI["fakeRESTApi"])

    # Performs API access and writes a file.json
    def request_access_api
        @response = self.class.get('/Books',
            :headers => {"Content-Type": 'application/json; charset=utf-8; v=1.0'})                              
        File.write("library.json", JSON.pretty_generate(@response.parsed_response))
    end

    # count the number of books returned in the response
    def count_books(number_books)
        file = File.read("library.json").each_line do |line|
            data = line.split(/\t/)
            data.map{|d| d.split(": ")[1] }.flatten
        end
        puts file
        count = JSON.parse(file)
        $number_books = count.count
    end


    # search for a book via id_book
    def search_specifc_book(id_book,book_title,book_id,book_publishDate)
        @response = self.class.get("/Books/#{id_book}",
            :headers => {"Content-Type": 'application/json; charset=utf-8; v=1.0', "path": "#{$id_book}"})   
            $book_title = @response["title"]
            $book_id = @response["id"]
    end
    
    # method for create a new book
    def create_book(response_body)
        @body = BodyCreateBook.new.body_create_book.to_json
        @response = self.class.post('/Books',
            :headers => {"Content-Type": 'application/json; charset=utf-8; v=1.0'},
            :body => @body)
            $code_success = @response.code
            $response_body =  @response
    end


    # server response code
    def return_code
        @response.code
    end


end