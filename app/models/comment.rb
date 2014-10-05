class Comment < ActiveRecord::Base
  # belongs_to :article
  belongs_to :commentable, polymorphic: true

end
