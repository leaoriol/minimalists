class StaticPagesController < ApplicationController
  def learn_more #controller action
    #could do any call to the database that i want (list.all) - models are available - create the results of the model call as instances @list = List.all
    #instance variables are then available in the view
  end

  def contact
  end

  def landing
    @test = "hello"
    @list = List.new
    # then have a form on landing page - form for list variable which is a new list
    
  end

end
