require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/base'
require 'sass/plugin/rack'
require './config'
require './helper'
require "active_support/core_ext"

class ProductService < Sinatra::Base

get '/products' do
  hostname = "sleepy-retreat-2061.herokuapp.com"
  if params[:category] == "watches"
    (1..6).collect do |index|
      {
      	url:"http://#{hostname}/img/watches-#{index}.png",
       	price: "Rs. #{1000 + 100*index}",
       	title: "Timex AZ-P#{index}"
      }
    end.to_json
  elsif params[:category] == "shades"
    (1..8).collect do |index|
        {
          url:"http://#{hostname}/img/shades-#{index}.png",
          price: "Rs #{400 + 20*index}",
          title: "Fastrack F#{index}"
        }
  	end.to_json
  elseif params[:category] == 'shoes'
    (1..8).collect do |index|
        {
          url:"http://localhost:36061/images/shoes-#{index}.png",
          price: "Rs #{600 + 20*index}",
          title: "Puma PM#{index}"
        }
        end.to_json
  end
end

end
