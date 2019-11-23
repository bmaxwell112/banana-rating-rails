class RateroomController < ApplicationController    

    def index
        @bananas = Banana.where(flagged: false).order(total: :desc)
    end
end
