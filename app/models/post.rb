class Post < ActiveRecord::Base
  attr_accessible :description, :title, :short_text

  validates :title, :description, :short_text, presence: {message: 'Field cannot be blank.'}


end
