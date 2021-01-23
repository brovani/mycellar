class ProducersController < ApplicationController

    def index
    @producers = Producer.all
    end

    def show
    set_producer
    end

    def new
    @producer = Producer.new
    end

    def create
    @producer = Producer.new(producer_params)
    if @producer.save
        redirect_to producers_path
    else
        render :new
    end
    end

    def edit
    set_producer
    end

    def update
    set_producer
    if @producer.update(producer_params)
    flash.alert = 'Producer updated successfully'
    redirect_to producers_path
    else
    flash.alert = 'There was an error updating producer'
    render :edit
    end
    end

    def destroy
    set_producer
    if @producer.destroy
    flash.notice = 'Producer deleted successfully'
    redirect_to producers_path
    else
    flash.notice = 'There was an error deleting this producer'
    end
    end

    private

    def set_producer
    @producer = Producer.find(params[:id])
    end
    
    def producer_params
        params.require(:producer).permit(
          :name)
    end

end
