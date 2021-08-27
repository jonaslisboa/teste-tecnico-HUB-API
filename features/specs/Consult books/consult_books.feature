#language: en

@consult_a_book
@complete_flow
Feature: Consult Books
    As a user, 
    would like to consult the books available in the library

    Background: Library API Access
        Given That I have access to the library API

    Scenario: Finding all books in the library  
        When I consult the number of books
        Then I get the total number of books
@consult_book_specific
    Scenario Outline: Finding a newly created book in the library
        When search the book <id_book>
        Then I will have all the information from the book
        Examples: 
        |id_book|
        |  200  |
        |  150  |
        |  80   |