class News < ActiveRecord::Base
  default_scope :order => 'date DESC'
  attr_accessible :title, :date, :content, :of_company, :special, :comment
end
