class Chunk < ActiveRecord::Base
  attr_accessible :title, :code, :content, :visible
end
