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
  elsif params[:category] == 'shoes'
    (1..6).collect do |index|
        {
          url:"http://#{hostname}/img/shoes-#{index}.png",
          price: "Rs #{600 + 20*index}",
          title: "Puma PM#{index}"
        }
        end.to_json
  elsif params[:category] == 'jewelry'
    (1..3).collect do |index|
        {
          url:"http://#{hostname}/img/jewel-#{index}.png",
          price: "Rs #{60000 + 2000*index}",
          title: "Naksatra Necklace #{index}"
        }
        end.to_json
      elsif params[:category] == 'tshirt'
    (1..4).collect do |index|
        {
          url:"http://#{hostname}/img/tshirt-#{index}.png",
          price: "Rs #{500 + 20*index}",
          title: "Polo P#{index}"
        }
        end.to_json
       
  end
end

end
