class Question < ActiveRecord::Base
  attr_accessible :name, :email, :message
end