Feature: view all raffle orders

  As a site administrator
  So that I can keep track of all raffle orders so far
  I want to be able to view all existing raffle orders

Background: orders exist in the database
  Given the following basic order details exist:
  |first_name   | last_name | phone     | quantity  | orderable_id	| orderable_type			|
  |Joe          | Smith     |1234567890 | 2         | 1				| ElectronicRaffleOrder		|
  |Foo          | Bar       |2233121122 | 1         | 2				| ElectronicRaffleOrder		|

  And the following electronic raffle orders exist:
  | id	| email        			| address1		| address2	|
  | 1	| joe.smith@gmail.com	| 23 pueblo		| apt 2		|
  | 2	| foo@bar.com			| 61 michigan	|			|
  
Scenario: viewing all orders as an admin
	Given I am logged in as an administrator
  	When I visit the view raffle orders page
  	Then I can see the order for Joe
  	And I can see the order for Foo
  	And I can see all electronic raffle orders
  	