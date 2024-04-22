class Tag < ApplicationRecord
  has_and_belongs_to_many :articles, join_table: "posts_tags", foreign_key: "tag_id", association_foreign_key: "post_id"
end
