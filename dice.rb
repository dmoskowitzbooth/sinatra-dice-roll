# /dice.rb
require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
erb(:elephant)
end

get '/zebra' do
  "Need a route for each path we want to support"
end

get '/pup' do
  "Better not have had to restart for this to pop up"
end

get("/dice/2/6") do
  first_die=rand(1..6)
  second_die=rand(1..6)
  sum=first_die+second_die
  @outcome="You rolled a #{first_die} on the first die and a #{second_die} on the second die for a total of #{sum}"

  erb(:two_six)
end

get("/dice/2/10") do
  @first_die=rand(1..10)
  @second_die=rand(1..10)
  @sum=first_die+second_die
  @outcome="You rolled a #{@first_die} on the first die and a #{@second_die} on the second die for a total of #{@sum}"
 erb(:two_ten)
end

get("/dice/1/20") do
  @die=rand(1..20)
  @outcome="You rolled a #{@die}."
 erb(:two_twenty)
end

get("/dice/5/4") do
  first_die=rand(1..4)
  second_die=rand(1..4)
  third_die=rand(1..4)
  fourth_die=rand(1..4)
  fifth_die=rand(1..4)
  sum=first_die+second_die+third_die+fourth_die+fifth_die
  @outcome="You rolled a #{first_die} on the first die, a #{second_die} on the second die, a #{third_die} on the third die, a #{fourth_die} on the fourth die, and a #{fifth_die} on the fifth die for a total of #{sum}"
 erb(:five_four)
end
