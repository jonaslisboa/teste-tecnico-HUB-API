#####################################################################################
# Name:           Consult Books Steps - default structure
# Description:    Methods used to consult the book in the steps
# Project:        Teste tecnico | HUB/Inmetrics
# Author:         Jonas Lisboa Silva | jonasbrasil016@gmail.com
# Date:           27/08/21
#####################################################################################
  
Given("That I have access to the library API") do
    @request_consult_books = BookAPI.new
    @request_consult_books.request_access_api
    return_code = 200
    expect(@request_consult_books.return_code).to eq return_code
    puts return_code
  end
  
  When("I consult the number of books") do
    @request_consult_books.count_books($number_books)
  end
  
  Then("I get the total number of books") do
    puts "#{$number_books} books"
  end
  

  When("search the book {int}") do |id_book|
    @request_consult_books.search_specifc_book(id_book, $book_title,$book_id,$book_publishDate)
  end
  
  
  
  Then("I will have all the information from the book") do
    puts "Title: #{$book_title}"
    puts "ID Book: #{$book_id}"
  end