class ItemToCategoriesController < ApplicationController
  before_action :set_item_to_category, only: [:show, :edit, :update, :destroy]

  # GET /item_to_categories
  # GET /item_to_categories.json
  def index
    @item_to_categories = ItemToCategory.all
  end

  # GET /item_to_categories/1
  # GET /item_to_categories/1.json
  def show
  end

  # GET /item_to_categories/new
  def new
    @item_to_category = ItemToCategory.new
  end

  # GET /item_to_categories/1/edit
  def edit
  end

  # POST /item_to_categories
  # POST /item_to_categories.json
  def create
    @item_to_category = ItemToCategory.new(item_to_category_params)

    respond_to do |format|
      if @item_to_category.save
        format.html { redirect_to @item_to_category, notice: 'Item to category was successfully created.' }
        format.json { render :show, status: :created, location: @item_to_category }
      else
        format.html { render :new }
        format.json { render json: @item_to_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_to_categories/1
  # PATCH/PUT /item_to_categories/1.json
  def update
    respond_to do |format|
      if @item_to_category.update(item_to_category_params)
        format.html { redirect_to @item_to_category, notice: 'Item to category was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_to_category }
      else
        format.html { render :edit }
        format.json { render json: @item_to_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_to_categories/1
  # DELETE /item_to_categories/1.json
  def destroy
    @item_to_category.destroy
    respond_to do |format|
      format.html { redirect_to item_to_categories_url, notice: 'Item to category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_to_category
      @item_to_category = ItemToCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_to_category_params
      params.require(:item_to_category).permit(:item_id, :category_id)
    end
end
