class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :verify_logged_in
  before_action :correct_user, only: [:show]

  # GET /lists
  # GET /lists.json
  def index
    @lists = current_user.lists
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
    # page that you go to to update the list
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.create(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to list_path(@list), notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
        # debugger
      else
        format.html { render :new }
        format.json { render json: list_path(@list).errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update

    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render json: { status: 200 } }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def update_item
      respond_to do |format|
        format.html
        format.js
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:user_id, :name, :goal).merge(user_id: current_user.id)
    end

    def correct_user 
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to root_path if @list.nil?
    end


end
