require 'sinatra'
require_relative '../config/environment'

get '/' do
  @users = User.all
  @users.each.reduce("") do |string, user|
    string += user.username
  end
end