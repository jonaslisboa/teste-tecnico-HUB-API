#####################################################################################
# Name:           Create Books Steps - default structure
# Description:    Methods used to create new books in steps
# Project:        Teste tecnico | HUB/Inmetrics
# Author:         Jonas Lisboa Silva | jonasbrasil016@gmail.com
# Date:           27/08/21 
#####################################################################################
When("I enter the new book information") do
    @create = BookAPI.new
    @create.create_book($response_body)
  end
  
  Then("the book will be created successfully") do
    
    puts "Success #{@create.return_code}"
    puts "Body #{$response_body}"
  end