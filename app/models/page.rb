class Page < ActiveRecord::Base
  validates_presence_of :title, :body
  validates_length_of :title, :within => 3..255
  validates_length_of :body, :maximum => 10000
  
  before_create :create_permalink
  before_update :create_permalink #does not seem to work 12/13/12
  
  def create_permalink
    @attributes['permalink'] =
    title.downcase.gsub(/\s+/, '_').gsub(/[^a-zA-Z0-9_]+/, '')
  end
  
  def to_param
    "#{id}-#{permalink}"
  end
end
