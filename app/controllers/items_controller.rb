class ItemsController < ApplicationController
  respond_to :html, :js

  before_action :set_ensembles
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :all_items, only: [:index, :create, :destroy, :update]
  before_action :required_user
  before_action :require_district
  before_action :require_same_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  

  def all_items
    @items = Item.all
  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.search do
      with :district_id, current_district.id
      order_by :sort_title, :asc
      paginate :page => params[:page], :per_page => 4
    end.results
  end

  #GET /items/search
  #GET /items/search.xml
  def search
    @items = Item.search do
      keywords params[:query]
      with :district_id, current_district.id
      order_by :sort_title, :asc
      paginate :page => params[:page], :per_page => 4
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @items }
    end
  end

  #GET /results
  def results
    if params[:search]
      @items = Item.search(params[:search]).order("title ASC").paginate(page: params[:page]).per_page(4)
    else
      @items = Item.all.order('title ASC')
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
     if params[:cancel] == "Cancel"
         respond_to do |format|
             format.js { render action: 'cancel'}
         end
     else
         @item = Item.new(item_params)
         @item.user_id = current_user.id
         @item.district_id = current_user.district_id
         if @item.save
          flash[:success] = "Item id number is: #{@item.id}, Item user #{@item.user_id} and item district #{@item.district_id}"
          @current_item = @item
         else
             respond_to do |format|
                 format.js { render action: 'new' }
              end 
          end
      end 
    end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if params[:cancel] == "Cancel"
      respond_to do |format|
        format.js {render action: 'cancel' }
      end
    else
        if !@item.update(item_params)
          respond_to do |format|
            format.js {render action: 'edit' }
          end
        end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json

  def destroy
    #binding pry
    @item.destroy!
    flash[:success] = "Item Deleted"
    redirect_to items_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def set_ensembles
      @ensembles = Item.ensembles
    end

    def require_same_user
      if current_user != @item.user and !current_user.admin?
        flash[:danger] = "You can only edit your own items"
        redirect_to items_path
      end
    end

    def admin_user
      redirect to items_path unless current_user.admin?
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :composer_name, :arranger, :publisher, :ensemble,
      :level, :location, :comments, :status, :user_id, :district_id)
    end
end

