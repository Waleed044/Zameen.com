# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: %i[search new_search]
  # before_action :authorize_user, except: %i[index show]

  # GET /properties or /properties.json
  def index
    @q = Property.ransack(params[:q])
    @properties = @q.result.all
    # debugger
    # @properties = Property.all
    # @search_property = Property.searched(params[:search]) if params[:search].present?
    # authorize @properties
  end

  # GET /properties/1 or /properties/1.json
  def show
    @property = Property.find(params[:id])
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
  end

  # POST /properties or /properties.json
  def create
    @property = current_user.properties.new(property_params)
    authorize @property
    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
        UserMailer.welcome_email(current_user).deliver
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    authorize @property
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    authorize @property
    @property = Property.find(params[:id])
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def self.search(search)
    joins(:category).where(
      ['categories.name like ? OR title LIKE ? OR description LIKE ?',
       search, search, search]
    )
  end

  private

  def authorize_user
    #   property = @property || Property
    #   authorize property
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    # params.fetch(:property, {})
    params.require(:property).permit(:user_id, :address, :owner, :price, :size, :property_type, :category,
                                     :floors, :year_built, :image)
  end
end
