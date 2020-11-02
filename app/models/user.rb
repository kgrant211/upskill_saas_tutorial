class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :plan
  has_one :profile 
  
  attr_accessor :stripe_card_token
  # If Pro user passes validations (email,pwd,etc),
  # then call Stripe and tell Stripe to set up a subscription
  # upon charging the customer's card.
  # Stripe responds back with the customer data. 
  # Store customer.id as the customer token and save the user.
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
   
   def self.search(search)
   @user = User.joins(:profile)
            .where('users.email LIKE ? OR profiles.last_name LIKE ?', "%#{search}%","%#{search}%")
   end
   
end
