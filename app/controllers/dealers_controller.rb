class DealersController < ApplicationController
    before_action :set_dealer, only: [:show, :edit, :update, :destroy]

    
    layout 'dealer'

def index 
    @dealers = Dealer.all
    @order = Order.last_order
end
def show
end

def new
    @dealer = Dealer.new
end


 def create
    @dealer = Dealer.new(dealer_params)
    if @dealer.save
        
        redirect_to dealer_path(@dealer)

    else
        render :new
    end
end


def edit
    if !@dealer
        redirect_to dealers_path
end
end


def update
    if @dealer
        @dealer.update(dealer_params)
        if @dealer.errors.any? 
            render :edit
        else
            redirect_to @dealer
        end
    else
        render :edit
    end
end


def destroy
@dealer.destroy
redirect_to dealers_path

end

private

def dealer_params
    params.require(:dealer).permit(:dealer_name)
end

def set_dealer
    @dealer = Dealer.find(params[:id])

end

end
