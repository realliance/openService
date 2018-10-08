<h1 align="center">openService</h1>
<p align="center">
<a href="https://www.ruby-lang.org/en/">
    <img src="https://img.shields.io/badge/Ruby-v2.4.1-green.svg" alt="ruby version"/>
 </a>
 <a href="http://rubyonrails.org/">
    <img src="https://img.shields.io/badge/Rails-v5.0.6-brightgreen.svg" alt="rails version"/>
  </a>
  <a href="https://codebeat.co/projects/github-com-realliance-openservice-develop">
    <img src="https://codebeat.co/badges/e4499065-623e-4cb6-943f-732b1cd7ebd0" alt="codebeat"/>
  </a>
   <a href="https://quay.io/repository/realliance/openservice">
    <img src="https://quay.io/repository/realliance/openservice/status" alt="quay io container"/>
  </a>
 <br/>
A platform for community service.
</p>
  

## What is openService?

openService is a dedicated platform for managing community service clubs that utilize limitied slot events for their members. Organization leaders can manage membership, track hours per user, and give members the power to manage their own contributions within their community.

## Getting Started

### Deployment using Container (Recommended)
#### Prerequisites
- [Docker](https://docs.docker.com/)
- MySQL Server, [MariaDB](https://mariadb.org/) is recommended

A docker container is available on the project's [quay.io](https://quay.io/repository/realliance/openservice) repository. For deployment, environment variables must be set.
### Environment Variables
`SECRET_KEY_BASE` Secret required for secure cookies and tokens for Users.

`MYSQL_DATABASE` Database name.

`MYSQL_USERNAME` MySQL username for the user that can access the given database.

`MYSQL_PASSWORD` Password for the MYSQL user.

### Development Environment
#### Prerequisites
-  [Ruby](https://www.ruby-lang.org/en/): [rvm](https://rvm.io/) is recommended in order to be able to install the version of ruby listed on the tag above.
- [Bundler](https://rubygems.org/gems/bundler/versions/1.11.2)
- [wkhtmltopdf](https://wkhtmltopdf.org/) for pdf generation.

#### Setup
1. Make sure all the prerequisites are installed.
2. `git clone https://github.com/realliance/openService.git`
Note: If your are setting up a development environment for a fork of the repository, use instead `https://github.com/<your-username>/openService.git`
3. `cd openService`
4. `bundle install`
5. `rails db:migrate`
6. Use `rails s` to start the web server.

### Testing
Unit tests are automated using [Rspec](http://rspec.info/). New features should be covered with additional tests. The project uses the standard rspec structure, using [FactoryBot](https://devhints.io/factory_bot) for standardized model generation. Style is kept standard using [Rubocop](https://rubocop.readthedocs.io/en/latest/). 
```
rspec # Will run RSpec unit tests
rubocop # Will run rubocop style tests
```

