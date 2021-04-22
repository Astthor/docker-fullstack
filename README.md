# docker-fullstack (Stormrider)

Deploying a client-server application to docker.

# Instructions:
Using docker, follow the 3 .txt guides in the following order:

1: setup-docker-network.txt

2: backend-stormrider-docker-instructions.txt

3: docker-frontend-instructions-stormrider.txt

Using database files to set up the database:

stormrider_insert_values_script_20201211.sql & stormrider_schema_script_20201211.sql 

NOTE: Docker instructions don't include persisting data in any way, the same commands can be used to persist data by adding a volume to the database. 


# About:

The application:
A school project for a real client that needed an ecommmerce site that supported multiple languages for his business; selling riding equipment. 
Client opted for a different solution due to time constraints and upon our recommendations concerning security for the site. 

Current state of the application:

Database: (MySQL)
Design is far along, we expect future iterations to reveal some minor changes along the way, but we don't expect any major changes to be needed.

Currently supports multiple languages and is designed to be scalable both in terms of easily adding new languages and possible future products that the customer might start selling. 

Backend: 
(Java / Spring Boot)
Design and implementation is not far along.
Read only Rest API's for Category, Subcategory and Productgroup. 
Language selection support. 

Frontend: (React)
Fetches data from the backend using Ajax and displays categories, subcategories and product groups dynamically based on data passed from the API's.


