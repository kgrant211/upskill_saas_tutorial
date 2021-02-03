class Quote < ActiveRecord::Base
    # Contact form validations
    validates :name, presence: true
    validates :email, presence: true
    validates :description, presence: true
end