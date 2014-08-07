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
  if params[:category] == "watches"
    (1..6).collect do |index|
      {
      	url:"http://localhost:36061/images/watches-#{index}.png",
       	price: "Rs. #{1000 + 100*index}",
       	title: "Timex AZ-P#{index}"
      }
    end.to_json
  end
end

end