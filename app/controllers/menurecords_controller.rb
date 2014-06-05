class MenurecordsController < ApplicationController
  prepend_before_filter :authenticate_with_basic
  before_action :set_menurecord, only: [:show, :edit, :update, :destroy]

  # GET /menurecords
  # GET /menurecords.json
  def index
    @menurecords = Menurecord.where(user_id: current_user).order("created_at DESC")
  end

  # GET /menurecords/1
  # GET /menurecords/1.json
  def show
  end

  # GET /menurecords/new
  def new
    @menurecord = Menurecord.new
  end

  # GET /menurecords/1/edit
  def edit
  end

  # POST /menurecords
  # POST /menurecords.json
  def create
    @menurecord = Menurecord.new(menurecord_params)

    respond_to do |format|
      if @menurecord.save
        format.html { redirect_to @menurecord, notice: 'Menurecord was successfully created.' }
        format.json { render :show, status: :created, location: @menurecord }
      else
        format.html { render :new }
        format.json { render json: @menurecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menurecords/1
  # PATCH/PUT /menurecords/1.json
  def update
    respond_to do |format|
      if @menurecord.update(menurecord_params)
        format.html { redirect_to @menurecord, notice: 'Menurecord was successfully updated.' }
        format.json { render :show, status: :ok, location: @menurecord }
      else
        format.html { render :edit }
        format.json { render json: @menurecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menurecords/1
  # DELETE /menurecords/1.json
  def destroy
    @menurecord.destroy
    respond_to do |format|
      format.html { redirect_to menurecords_url, notice: 'Menurecord was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menurecord
      @menurecord = Menurecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menurecord_params
      params.require(:menurecord).permit(:parent_id, :name, :color_tag, :date)
    end
end
