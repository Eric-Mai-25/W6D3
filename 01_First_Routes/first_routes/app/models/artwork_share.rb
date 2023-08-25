# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    # validates :artwork_id, presence: true
    validates :viewer_id, uniqueness: {scope: :artwork_id}

    belongs_to :viewer,
        class_name: :User,
        foreign_key: :viewer_id,
        inverse_of: :artwork_shares

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id,
        inverse_of: :artwork_shares

end
