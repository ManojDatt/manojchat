class Post < ActiveRecord::Base
	attr_accessor :content
	belongs_to :user

	has_many :comments
end
