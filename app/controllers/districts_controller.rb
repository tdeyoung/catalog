class DistrictsController < ApplicationController
  before_action :set_district, only: [:show, :edit, :update, :destroy]
  before_action :contact_person, only: [:create]

  # GET /districts
  # GET /districts.json
  def index
    @districts = District.all
  end

  # GET /districts/1
  # GET /districts/1.json
  def show
  end

  # GET /districts/new
  def new
    @district = District.new
  end

  # GET /districts/1/edit
  def edit
  end

  # POST /districts
  # POST /districts.json
  def create
    @district = District.new(district_params)
    @district.contact_person = current_user.name
    @district.contact_email = current_user.email

    respond_to do |format|
      if @district.save
        format.html { redirect_to @district, notice: 'District was successfully created.' }
        format.json { render :show, status: :created, location: @district }
      else
        format.html { render :new }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /districts/1
  # PATCH/PUT /districts/1.json
  def update
    respond_to do |format|
      if @district.update(district_params)
        format.html { redirect_to @district, notice: 'District was successfully updated.' }
        format.json { render :show, status: :ok, location: @district }
      else
        format.html { render :edit }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /districts/1
  # DELETE /districts/1.json
  def destroy
    @district.destroy
    respond_to do |format|
      format.html { redirect_to districts_url, notice: 'District was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district
      @district = District.find(params[:id])
    end

    def contact_person
      current_user.name = contact_person
      current_user.email = contact_email
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def district_params
      params.require(:district).permit(:title, :contact_person, :contact_phone, :contact_email)
    end
end
