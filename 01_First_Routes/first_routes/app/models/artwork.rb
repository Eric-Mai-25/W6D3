# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :artist_id}
    validates :image_url, presence: true, uniqueness: true

    has_many :shares,
        class_name: :ArtworkShare,
        foreign_key: :artwork_id

    belongs_to :artist,
        class_name: :User,
        foreign_key: :artist_id

    has_many :shared_viewers,
        through: :shares,
        source: :viewer
end
