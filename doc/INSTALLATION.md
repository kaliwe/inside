# Installation guide
## How to deploy on production
### Prepare production environment
Guide would be placed here

## Development environment
First of all install latest version of rails `gem install -v 5.0.0.beta4`.
### How to install rails of newer version 5+
`rails _5.0.0.beta4_ new app_name`.
### How to contribute into existed project
Ensure that your ruby version not lower then 2.2.2, it is required for rails 5+

Clone git repository on development machine `git clone
https://github.com/euclio/vim-markdown-composer`.

Go to project directory and install all required gems `bundle install`.

Install and configure `postgressql` database, that is depends on you system.
Create user `postgres` with password `pswd` and databases `inside-dev` and
`inside-test`. Otherwise configure `database.yml` as you wish.
