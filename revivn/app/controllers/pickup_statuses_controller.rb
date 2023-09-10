class PickupStatusesController < ApplicationController
  before_action :set_pickup_status, only: %i[ show update destroy ]

  # GET /pickup_statuses
  def index
    @pickup_statuses = PickupStatus.all

    render json: @pickup_statuses
  end

  # GET /pickup_statuses/1
  def show
    render json: @pickup_status
  end

  # POST /pickup_statuses
  def create
    @pickup_status = PickupStatus.new(pickup_status_params)

    if @pickup_status.save
      render json: @pickup_status, status: :created, location: @pickup_status
    else
      render json: @pickup_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pickup_statuses/1
  def update
    if @pickup_status.update(pickup_status_params)
      render json: @pickup_status
    else
      render json: @pickup_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pickup_statuses/1
  def destroy
    @pickup_status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup_status
      @pickup_status = PickupStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pickup_status_params
      params.require(:pickup_status).permit(:name)
    end
end
