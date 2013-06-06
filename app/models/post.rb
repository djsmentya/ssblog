class Post < ActiveRecord::Base
  attr_accessible :description, :title, :short_text, :tag_list

  validates :title, :description, :short_text, presence: {message: 'Field cannot be blank.'}

  acts_as_taggable

end
