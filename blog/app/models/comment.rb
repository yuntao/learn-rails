class Comment < ActiveRecord::Base
  belongs_to :article # an Active Record association
end
