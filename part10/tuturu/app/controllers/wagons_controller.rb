class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :destroy, :update]

  def index
    @train = Train.find(params[:train_id])
    @wagons = Wagon.all
  end

  def edit
    @train = Train.find(params[:train_id])
  end

  def show
    @train = Train.find(params[:train_id])
  end

  def new
    @train = Train.find(params[:train_id])
    @wagon = @train.wagons.new
  end

  def create
    @train = Train.find(params[:train_id])
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to train_wagon_path(@train, @wagon)
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to @wagon
    else
      render :new
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_path
  end

  private
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:train_id, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :regular_seats)
  end

end
