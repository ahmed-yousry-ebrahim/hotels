# Hotels application
## Desciption
### This application consists of two parts
- A rails API app with solr integration and postgresql database handling Hotel CRUD operations
- A web rails applicaion consuming the APIs defined in the other app as the backend for the same Hotel CRUD operations with an autocomplete search box consuming solr indexs

## How to run localy
### The API application

- cd hotels_api
- run _bundle install_
- run _rake db:create_
- run _rake db:migrate_
- run _rake db:seed_
- run _foreman start -f Procfile.dev_

### The web application

- cd hotels
- run _rails s_

**The problem**

implement a simple REST API that:

- takes care of the basic CRUD operations on a hypothetical Hotel model, allowing to
manipulate its basic attributes (id, name, address, star_rating, and accomodation_type)

- provides a method that allows searching for a hotel by typing part of its name or address
Then use Ruby on Rails to build a simple web application that consumes the aforementioned API in
all its CRUD operations, and build a simple autocomplete search box to look for a given hotel using

- Although they work with the same data set (the catalog of hotels), the API and the web
application should be developed and deployed as two independent systems