#language: en

@create_book
@complete_flow
Feature: Create Books
    As a user, 
    would like to consult the books available in the library

    Background: Library API Access
        Given That I have access to the library API

    Scenario: Create a new book  
        When I enter the new book information
        Then the book will be created successfully