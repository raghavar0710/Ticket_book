class TrainsController < ApplicationController
    before_action :current_user, only: [:show, :edit, :update, :destroy]

    def index
        @metro_service = MetroService.find_by(id: params[:metro_service_id])
      if @metro_service
        @trains = @metro_service.trains.where(source: @metro_service.source,destination: @metro_service.destination)
      else
        # Handle the case when @metro_service is nil
        # You might want to render an error message or redirect to another page.
        # redirect_to : metro_service ke create pr send kr do
      end
    end
  
    def new
      @train = Train.new
    end
  
    def show
    end
  
    def edit
    end
  
    def create
      @train = @metro_service.trains.new(train_params) 
  
      if @train.save!
        redirect_to train_path(@train), notice: "Train was successfuly created."
      else
        render :new, notice: "Fill all field properly"
      end
    end
  
    def update
     if @train.update(train_params)     
      redirect_to train_path, notice: "Train was successfully Updated."
     else
      render :edit
     end
    end
  
    def destroy
      @train.destroy
      redirect_to trains_path, notice: "Train was successfully deleted."
    end
  
  
    private
  
    def current_train
      @train = Train.find_by(id: params[:id])
    end
  
    def train_params
      params.require(:train).permit(:name, :train_number, :source, :destination)
    end
    
end