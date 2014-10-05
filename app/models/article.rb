class Article < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable
  scope :published, -> { where(published: true) }

  def publish!
    published = true
    save!
  end
end
