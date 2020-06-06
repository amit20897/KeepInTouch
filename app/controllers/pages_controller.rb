require_relative "../models/base_db_model"

class PagesController < ApplicationController
  def home
	  puts "Honey, I'm home!"
	  @greeting = "Home action says: Hello world!"
	  test=BaseDBModel.new()
	  p test.find(:Users, {'name' => 'Amit'})
  end
end
