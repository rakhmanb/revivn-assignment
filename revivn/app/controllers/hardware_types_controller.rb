class HardwareTypesController < ApplicationController
  before_action :set_hardware_type, only: %i[ show update destroy ]

  # GET /hardware_types
  def index
    @hardware_types = HardwareType.all

    render json: @hardware_types
  end

  # GET /hardware_types/1
  def show
    render json: @hardware_type
  end

  # POST /hardware_types
  def create
    @hardware_type = HardwareType.new(hardware_type_params)

    if @hardware_type.save
      render json: @hardware_type, status: :created, location: @hardware_type
    else
      render json: @hardware_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hardware_types/1
  def update
    if @hardware_type.update(hardware_type_params)
      render json: @hardware_type
    else
      render json: @hardware_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hardware_types/1
  def destroy
    @hardware_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hardware_type
      @hardware_type = HardwareType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hardware_type_params
      params.require(:hardware_type).permit(:name)
    end
end
