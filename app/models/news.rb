class News < ActiveRecord::Base
  default_scope :order => 'date DESC'
  attr_accessible :title, :date, :content, :of_company, :special, :comment, :see_also

  def has_comment
    self.comment and self.comment.strip.length > 0
  end
  def has_see_also
    self.see_also and self.see_also.strip.length > 0
  end
end