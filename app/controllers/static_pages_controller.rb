class StaticPagesController < ApplicationController
  #before_action :authenticate_user!, only: [:contact]

  def learn_more #controller action
  end

  def contact

  end

  def landing
    render layout: 'landing'
  end

end
