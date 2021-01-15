class UsersController < ApplicationController
   
   def index
      @users = User.includes(:profile, :locations)

      if params[:search]
         @users = User.includes(:profile).search(params[:search]).order("users.created_at DESC")
      else
         @users = User.all.order('users.created_at DESC')
      end
   end
   
   # GET request made to /users/:id
   def show
    @user = User.find( params[:id] )
   end
end