class ProfilesController < ApplicationController
   before_action :authenticate_user!
   before_action :only_current_user
  
   
   
   #GET to /users/:user_id/profile/new
   def new
       # Render blank profile details form
       @profile = Profile.new
   end
   
   
   #POST to /users/:user_id/profile
   def create
       # Ensure we have the user who is filling out the form
      @user = User.find( params[:user_id] ) 
      # Create profile linked to this specific user
      @profile = @user.build_profile( profile_params )
        zip_codes.each do |zip|
        @profile.locations << Location.find_or_initialize_by(zip_code: zip)
    end
    #   @profile.locations.build
      if @profile.save
          flash[:success] = "Profile saved!"
          redirect_to user_path( params[:user_id] )
      else
          flash[:danger] = "Profile not saved!"
          render action: :new
      end
   end
   
   #GET to /users/:user_id/profile/edit
   def edit
       @user = User.find( params[:user_id] )
       @profile = @user.profile
   end
   
   #PUT to /users/:user_id/profile
    def update
      # Retrieve user from the database
      @user = User.find( params[:user_id] )
      @profile = @user.profile
      # we wrap this in a rescue block in case the transaction fails
      begin
        Profile.transaction do 
          @profile.profile_locations.destroy_all  #get rid of all of them
          zip_codes.each do |zip|
           @profile.locations << Location.find_or_initialize_by(zip_code: zip) #build the new locations
          end
          @profile.assign_attributes(profile_params)
          @profile.save #saving the profile saves the locations we built
          flash[:success] = "Profile updated!"
          redirect_to user_path(id: params[:user_id])
        end  
      rescue  #if the transaction fails it will roll back the destroy_all
        render action: :edit
      end
    end
   
   private
    def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description, :services_offered, :long_term, :short_term)
    end
    
    def zip_codes
    params[:profile][:zip_codes].scan(/\d{5}/)
    #replaces the string '99019, 98057, 06850' with the array ['99019', '98057', '06850']
    end
    
    def only_current_user
       @user = User.find( params[:user_id] )
       redirect_to(root_url) unless @user == current_user
    end
end