class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  # GET /properties.json
  def index
    @property = Property.all
  end

  def show
  end

  def new
      @property = Property.new
    2.times  {@property.stations.build}
  end
  # GET /properties/1/edit
  def edit
    @property.stations.build
  end

  def create
  @property = Property.create(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: '物件情報を登録しました' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: '物件情報を更新しました' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: '物件情報を削除しました' }
      format.json { head :no_content }
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])# @station = Station.find(params[:id])
  end
  
  def property_params
    params.require(:property).permit(
      :name,
      :rent,
      :age,
      :address,
      :note,
      stations_attributes: [:id, :name_station, :name_station_line, :walk_minutes]
    )
  end
end
  # Never trust parameters from the scary internet, only allow the white list through.