class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "M I N I M A L"
  end
end
