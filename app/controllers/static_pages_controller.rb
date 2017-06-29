class StaticPagesController < ApplicationController
  #before_action :authenticate_user!, only: [:contact]

  def learn_more #controller action
    #could do any call to the database that i want (list.all) - models are available - create the results of the model call as instances @list = List.all
    #instance variables are then available in the view
  end

  def contact

  end

  def landing
    # NO NEED FOR ANY VARIABLE
    # @test = "hello"
    # @user = current_user
    # @list = @user.list.create!
    # @item = Item.create(list_id: @list.id, name: "test", category: "test", 
    # # then have a form on landing page - form for list variable which is a new list
    
  end

end
