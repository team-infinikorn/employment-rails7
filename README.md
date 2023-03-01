## Getting Started

These instructions will get you a copy of the employment project in rails on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

#### Ruby

Ruby version for this project is ` 3.2.1`
rbenv is our recommened and preffered ruby version management software. If you don't have rbenv installed on your system. You can see the installation instructions [here.](https://github.com/rbenv/rbenv)
For installing the ruby version, type in the following command on your terminal `rbenv install 3.2.1`.

One can check the installed ruby version by the following command `ruby -v`.

The output should be something like this `ruby 3.2.1p0 `.

#### Psql

Database managing software is mypsql. If not installed, one can look into their official documentation.

#### Git

Make sure you have git installed on your system, if you haven't, just refer this [How to install Git.](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Cloning the Repository

For cloning the Github repository and goto the project follow the following commands

```
git clone git@github.com:team-infinikorn/employment-rails7.git
cd Employment
```

#### Project Dependencies

To setup the project, follow the below commands in the project directory.

```
$ bundle install
```

```
$ yarn
```

This will install all the required gems for the project on your system.


#### Create and Migrate db

For setting up the migrations on your system, run the following commands on your system:

```
rails db:create
rails db:migrate
```

If a project has a seed file in it, one needs to run the following command as well:

```
rails db:seed
```

### Starting the rails applications

```
$ bin/dev
```

Your application should be running on localhost:3000

### If you're facing any issue regarding javascript and turbo, run the following command and then start the server
```
$ yarn build
```
