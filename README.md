# Hotels application
## Desciption
### This application consists of two parts
- A rails API app with solr integration and postgresql database handling Hotel CRUD operations
- A web rails applicaion consuming the APIs defined in the other app as the backend for the same Hotel CRUD operations with an autocomplete search box consuming solr indexs

## How to run localy
### The API application

- _cd hotelsapi_
- run _bundle install_
- run _rake db:create_
- run _rake db:migrate_
- run _rake db:seed_
- run _foreman start -f Procfile.dev_

### The web application

- cd hotels
- run _rails s_