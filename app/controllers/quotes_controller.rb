class QuotesController < ApplicationController

    # GET request to quote
    # Show new quote form
    def new
      respond_to do |format|
        format.html
        format.js
      end
    end



    # POST request /quotes
    
    def create
      # Mass assignment of form fields into Quote object
      @quote = Quote.new(quote_params)
      @user = User.find( params[:id] )
      # Save the quote object to the database
      if @quote.save
        # Store form fields via parameters, into variables
        name = params[:quote][:name]
        email = params[:quote][:email]
        description = params[:quote][:description]
        # user = params[:quote][:user]
        # Plug vaiables into Contact Mailer 
        # email method and send email
        QuoteMailer.quote_email(name, email, description, @user).deliver
        # Store success message in flash hash
        # and redirect to the new action
        flash[:success] = "Message sent."
        redirect_to(:back)
      else
        # If Contact object doesn't save,
        # store errors in flash hash,
        # and redirect to the new action
        flash[:danger] = @quote.errors.full_messages.join(", ")
        redirect_to(:back)
      end
    end
    private
      # To collect data from form,
      # we need to use strong parameters
      # and whitelist the form fields
      def quote_params
        params.require(:quote).permit(:name, :email, :description, :user)
      end
end