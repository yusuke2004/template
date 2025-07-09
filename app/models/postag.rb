class Postag < ApplicationRecord
    #postagsテーブルから中間テーブルに対する関連付け
  has_many :postag_tag_relations, dependent: :destroy
  #postagsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :postag_tag_relations, dependent: :destroy
end
