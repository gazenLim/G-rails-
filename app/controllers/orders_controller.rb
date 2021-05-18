class OrdersController < ApplicationController
before_action :show_before,  only: [:show, :edit, :update, :destroy]
layout 'dealer'
    def index
        if params[:dealer_id]
            dealer_show          
              @orders = @dealer.orders
        else
        @orders = Order.all
        @dealers = Dealer.all
    end
end

    def show
        if params[:dealer_id]
            dealer_show
                 end
        end


    def new
       if params[:dealer_id]
        dealer_show
                @order = @dealer.orders.build
       else
            @order = Order.new
    end
end

    def create
        if params[:dealer_id]
            dealer_show
            @order = @dealer.orders.build(order_params)
        else
        @order = Order.new(order_params)
        end
        if @order.save
            if @dealer
                redirect_to dealer_order_path(@dealer, @order)
            else
            redirect_to @order
            end
        else
            render :new
        end
        end

        
        def edit
            
        end


def update
if @order.update(order_params)
    redirect_to orders_path
else
    render :edit
end
end

def destroy

    @order.destroy
    redirect_to orders_path
end

#----------------------
    private 
    def order_params
        params.require(:order).permit(:order_price, :order_date, :product_id, :dealer_id)
    end


    def show_before
        @order = Order.find(params[:id])
    end

    def dealer_show
        @dealer = Dealer.find_by_id(params[:dealer_id])
    end


   


end
