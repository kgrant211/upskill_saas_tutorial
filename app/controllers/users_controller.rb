class UsersController < ApplicationController
   
   def index
       
   end
   
   # GET request made to /users/:id
   def show
    @user = User.find( params[:id] )
   end
end