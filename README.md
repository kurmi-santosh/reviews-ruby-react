# Building Rails app with React 

## Setup
* rails new <app-name> --webpack=react --database=postgresql -T
* bundle install will fail, fetching pg
* brew install pg and update the paths as suggested.
* Again try bundle install

## postgresql setup
* brew install postgresql@15
* Append the installation directory (export PATH=$PATH:/opt/homebrew/opt/postgresql@15/bin) to .zshrc file
* check the postgresql service - brew services list
* Uncomment line port = 5432 in postgresql.conf 

```sh
    brew link postgresql@15 --force
    cd /opt/homebrew/var/postgresql@15
    sudo nano postgresql.conf 

    brew services restart postgresql

```

* There are two database creations - check in conf/database.yml
```sh
    bin/rails db:create
    rails db:migrate
```
* To UNDO/REDO migrations
```sh
    rails db:migrate:up VERSION=<timestamp>
    rails db:migrate:down VERSION=<timestamp>
```
* After adding seed data, you can run rails db:seed

* To develop API, we can use gem fast_jsonapi from netflix. It gives us serializers inside app
```sh
    rails g serializer Movie name image_url slug
    rails g serializer Review title description score movie_id
```

##  Application details 
Movie(name, image_url, slug)
Review(title, description, score:integer, airline:belongs_to)
```sh
    rails g model Movie name:string image_url:string slug:string
    rails g model Review title description score:integer airline:belongs_to
```


