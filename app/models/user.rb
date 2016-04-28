class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an valid email")
    end
  end
end

class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments


  validates  :name,:email,:adres,:dob,:password,:password_confirmation, presence: {message:"This field should not be empty.."}
  validates  :email, email:true
end
