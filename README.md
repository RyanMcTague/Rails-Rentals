# Rails Rentals
## Information:
- **Description:** Rails Rentals is a fake website application where clients can 
order DVD rentals that are delivered to their door. The clients,
after returning the rental, can then rate the movie.
- **Framework:** *rails 6.1.4* with *ruby 2.6.6*
- **Database:** sqlite in development and test, postgresql in production
- **External Libaries:** 
  1) **faker:** Generates fake data 
  2) **stripe:** Payment processing
  3) **dotenv-rails:** Parsing .env files
## Installation:
1) Clone the main project branch
2) Create a .env file in the root folder with the following values replacing **xxx** with your keys for stripe
<pre>
STRIPE_PUBLISHABLE_KEY=xxx
STRIPE_SECRET_KEY=xxx
RENTAL_DURATION_IN_DAYS=1
CONDITION_INCREASE=0.25
FIRST_DAY_FINE=1.25
RECURRING_FINE=0.25
RENTAL_COST_PER_PERIOD=5.50
ADMIN_EMAIL=xxx
ADMIN_PASSWORD=xxx
</pre>
3) Run the following commands in the command line:
> rails db:create 
> 
> rails db:migrate
>
> rails db:seed

## Running the website:
- Run the following command and go to localhost:3000 in a web browser
> rails s 


