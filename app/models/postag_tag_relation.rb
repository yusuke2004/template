class PostagTagRelation < ApplicationRecord
  belongs_to :postag
  belongs_to :tag
end
