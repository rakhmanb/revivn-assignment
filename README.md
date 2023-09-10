# revivn-assignment

Breakdown:

The app consists of three parts, the postgres db, the backend rails app and the frontend react app

The backend consists of 6 tables to mostly get this logically working

Org - main org with information related to location of org
User - simple id and associated with which org
Pickup - pickup object that consists of 0 to N pickup items and a pickup time as well as the pickup status
PickupItem - contains the hardware classification type and quantity of that hardware type
PickupStatus - different statuses of the pickup 
HardwareType - different hardware types to select from

Running With Docker/Docker Compose

1. Make sure Docker is installed on your system
2. Pull down repo
3. Run `docker-compose up`
4. Main React app will be running on `localhost:3001`

Running Locally

1. Pull down repo
2. Make sure you have npm/node installed
3. Run `bundle install`
4. Make sure postgres db is running or alternatively modify this docker compose file to run the postgres db exclusively
5. You will need to set the host name of the postgres db in the environment variable `export REVIVN_POSTGRES_HOST=localhost` (with unix based systems)
6. Navigate to the `revivn` folder
7. Run `rails db:setup` to create the db
8. Run `rails server` to start the rails server
9. Navigate to the `revivn-frontend` folder
10. Run `npm start` to start the frontend server
11. go to `localhost:3000` to see the app

Running Tests

1. Navigate to `revivn` folder
2. Run `bundle install` to install rspec
3. Run `rspec` to run tests
