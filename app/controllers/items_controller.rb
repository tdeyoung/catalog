class ItemsController < ApplicationController
  respond_to :html, :js

  before_action :set_ensembles
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :all_items, only: [:index, :create, :destroy, :update]

def all_items
  @items = Item.all
end

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
      if params[:search]
        @items = Item.search(params[:search]).order("created_at DESC")
      else
        @items = Item.all.order('created_at DESC')
      end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    # user = User.find(item_params[:user_id])
    # @item.build_user(:id => user.id)
    @item.save!
    @current_item = @item
  end

   # def create
   #   if params[:cancel] == "Cancel"
   #       respond_to do |format|
   #           format.js { render action: 'cancel'}
   #       end
   #   else
   #       @item = Item.new(item_params)
   #       user = User.find(item_params[:user_id])
   #       @item.build_user(:id  => user.id)
   #       if @item.save
   #           @current_item = @item
   #       else
   #           respond_to do |format|
   #               format.js { render action: 'new' }
   #            end 
   #        end
   #    end 
   #  end

  # def create
  #   @item = Item.new(item_params)
  #   # user = User.find(item_params[:user_id])
  #   # @item.build_user(:id => user.id)

  #   respond_to do |format|
  #     if @item.save
  #       format.html { redirect_to @item, notice: 'Item was successfully created.' }
  #       format.json { render :show, status: :created, location: @item }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @item.update!(item_params)
  end

  # def update
  #   respond_to do |format|
  #     if @item.update(item_params)
  #       format.html { redirect_to @item, notice: 'Item was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @item }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /items/1
  # DELETE /items/1.json

  def destroy
    @item.destroy!
  end
  
  # def destroy
  #   @item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def set_ensembles
      @ensembles = Item.ensembles
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :composer_fname, :composer_lname, :arranger, :publisher, :ensemble, :level, :location, :comments, :user_id)
    end
end
