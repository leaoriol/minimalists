class StaticPagesController < ApplicationController
  #before_action :authenticate_user!, only: [:contact]

  def learn_more #controller action
    #could do any call to the database that i want (list.all) - models are available - create the results of the model call as instances @list = List.all
    #instance variables are then available in the view
  end

  def contact

  end

  def landing
    # NO NEED FOR ANY VARIABLE - controller action for just showing the "create list" button 
  end

end
