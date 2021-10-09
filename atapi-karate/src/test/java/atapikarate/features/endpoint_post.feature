@enpoint_post 
Feature: EndPoint Post for Post data, Get List data, and Get List Comment 
  Background:
    * url 'https://jsonplaceholder.typicode.com'

#POST
@test1
  Scenario: Create a new post and get post comments based on id
    Given path 'posts'     
    And request read('file:src/test/java/atapikarate/request/endpoint_post.json')
    When method post
    Then status 201
    And match response == read('file:src/test/java/atapikarate/response/response_1.json')
     * string jsonShemaExpected = read('file:src/test/java/atapikarate/schema/schema_1.json')
     * string jsonData = response
     * def SchemaUtils = Java.type('scrolltest.JSONSchemaUtil')
     * assert SchemaUtils.isValid(jsonData, jsonShemaExpected)
     * def id = response.userId
     * print 'created id is: ', id


# GET post
  @test2
  Scenario: Get all posts and verify several response
    Given path 'posts'
     When method get
     Then status 200
     And match response == read('file:src/test/java/atapikarate/response/response_2.json')
     * string jsonShemaExpected = read('file:src/test/java/atapikarate/schema/schema_2.json')
     * string jsonData = response
     * def SchemaUtils = Java.type('scrolltest.JSONSchemaUtil')
     * assert SchemaUtils.isValid(jsonData, jsonShemaExpected)


#GET post comment
  Scenario: Get all posts comment based on response userid previously added 
    Given path 'posts'     
    And request read('file:src/test/java/atapikarate/request/endpoint_post.json')
    When method post
    Then status 201
     * def id = response.userId
    Given path '/posts/' + id + '/comments'
    When method get
    Then status 200
    And match response == read('file:src/test/java/atapikarate/response/response_3.json')
     * string jsonShemaExpected = read('file:src/test/java/atapikarate/schema/schema_3.json')
     * string jsonData = response
     * def SchemaUtils = Java.type('scrolltest.JSONSchemaUtil')
     * assert SchemaUtils.isValid(jsonData, jsonShemaExpected)
