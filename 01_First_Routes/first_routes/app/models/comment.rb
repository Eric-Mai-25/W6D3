# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :bigint           not null
#  artwork_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    # def self.comments_for_user_id(id)
    #     Comment.joins(:author).where(author_id: id)
    # end
    # def self.comments_for_artwork_id(id)
    #     Comment.joins(:artwork).where(artwork_id: id)
    # end
end
