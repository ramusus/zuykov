class Page < ActiveRecord::Base
  attr_accessible :title, :slug, :content
end