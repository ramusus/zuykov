# -*- coding: utf-8 -*-
class Trademark < ActiveRecord::Base
  attr_accessible :title, :research, :research_limit, :registration_limit, :service, :mktu, :comments, :name, :requisites, :email, :phone, :contact, :title_image, :title_mixed, :requisites_file

  validates :registration_limit, :presence => true
  validates :service, :presence => true
  validates :name, :presence => true
  validates :requisites, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true
  validates :contact, :presence => true

  has_attached_file :title_image
  has_attached_file :title_mixed
  has_attached_file :requisites_file

end