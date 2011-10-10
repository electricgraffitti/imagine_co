class PagesController < ApplicationController
  
  
  def index
    @account = Account.new
    @account.teachers.build
  end
  
  # def about
  #   
  # end

end
