class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags, join_table: "posts_tags", foreign_key: "post_id", association_foreign_key: "tag_id"
  attr_accessor :tag_list

end
