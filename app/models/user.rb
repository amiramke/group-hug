class User < ActiveRecord::Base
  attr_accessible :id_number, :site_version
  has_many :confessions
end
