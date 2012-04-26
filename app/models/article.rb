class Article < ActiveRecord::Base
  attr_accessible :title, :subtitle, :content, :see_also
end
