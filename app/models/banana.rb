class Banana < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :ratings

    def rated(id)
        if self.ratings.where(user_id: id).any?
            return true
        end
        return false
    end
    def ratedRipeByUser(id)
        ripe = self.ratings.where(user_id: id).first
        if defined? ripe
            return ripe.ripe
        end
    end
end
