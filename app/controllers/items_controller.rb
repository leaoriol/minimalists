class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  #before_action :correct_list, only [:destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find params[:id]
  end

  # GET /items/new
  def new
    # no need for new because no item is created in the list URL
  end

  # GET /items/1/edit
  def edit
    @item = Item.find params[:id] 
    @list = @item.list
    puts @item.id
    # debugger
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /items
  # POST /items.json
  def create

    @list = List.find params[:list_id]
    @item = @list.items.create item_params
    #puts @item.errors.full_messages
    redirect_to list_path(@list)
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to list_path(@item.list), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to list_path(@item.list), notice: 'Item was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # def list_params
    #   params.require(:list).permit(:user_id)
    # end
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :quantity, :action, :list_id, :category)
    end
end
