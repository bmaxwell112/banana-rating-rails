class BananaController < ApplicationController
    before_action :require_user
    
    def index
        @bananas = current_user.bananas.order(created_at: :desc)
    end

    def new
             
    end 

    def show
        bananas = Banana.where(flagged: false).order("created_at DESC")
        new_bananas = []
        bananas.each do |banana|
            if !banana.rated(current_user.id)
                new_bananas << banana
            end
        end
        @banana = new_bananas.any? ? new_bananas.last : []
    end

    def ripe
        @banana = Banana.find(params[:id])
        @rating = Rating.where(banana_id: params[:id]).find_or_create_by(user_id: current_user.id)
        @rating.ripe = true;
        @rating.save
        ripe = 0
        notripe = 0
        @banana.ratings.each do |rate|
            if rate.ripe 
                ripe += 1
            else
                notripe += 1
            end
        end
        @banana.ripe = ripe
        @banana.notripe = notripe
        @banana.total = ripe - notripe
        @banana.save
        redirect_to request.referrer
    end

    def notripe
        @banana = Banana.find(params[:id])
        @rating = Rating.where(banana_id: params[:id]).find_or_create_by(user_id: current_user.id)
        @rating.ripe = false;
        @rating.save
        ripe = 0
        notripe = 0
        @banana.ratings.each do |rate|
            if rate.ripe 
                ripe += 1
            else
                notripe += 1
            end
        end
        @banana.ripe = ripe
        @banana.notripe = notripe
        @banana.total = ripe - notripe
        @banana.save
        redirect_to request.referrer
    end

    def flag
        @banana = Banana.find(params[:id])
        @banana.flagged = true
        @banana.save
        redirect_to request.referrer
    end
    
    def create
        @banana = Banana.new(banana_params)
        @banana.user = current_user
        if @banana.save!
            flash[:success] = "You have submitted your banana"
            redirect_to mybananas_path
        else
            flash[:error] = "Something went wrong try again"
            redirect_to banana_new_path
        end   
    end

    def destroy
        @banana = Banana.find(params[:id])
        if @banana.user == current_user
            @banana.destroy
        end
        redirect_to request.referrer
    end
    
    private
    def banana_params
        params.require(:banana).permit(:image)
    end
end
