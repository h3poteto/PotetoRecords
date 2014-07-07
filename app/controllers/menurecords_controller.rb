# coding: utf-8
class MenurecordsController < ApplicationController
  prepend_before_filter :authenticate_with_basic
  before_action :set_menurecord, only: :show

  # GET /menurecords
  # GET /menurecords.json
  def index
    @menurecords = Menurecord.where(user_id: current_user).order("created_at DESC")
  end

  def show
  end

  # GET /menurecords/new
  def new
    @menurecord = Menurecord.new
  end

  # POST /menurecords
  # POST /menurecords.json
  def create

    datetime = Time.zone.parse(params[:menurecord][:date])

    # 親メニューの登録
    @menurecord = Menurecord.new(user_id: current_user.id, parent_id: -1, name: params[:menurecord][:name].first[1], color_tag: params[:menurecord][:color_tag], original_id: params[:menurecord][:original_id].to_i , date: datetime)

    respond_to do |format|
      if @menurecord.save
        # 子メニューの登録
        params[:menurecord][:name].each.with_index do |name,index|
          next if index == 0
          Menurecord.create(user_id: current_user.id, parent_id: @menurecord.id, name: name[1], color_tag: params[:menurecord][:color_tag], original_id: params[:menurecord][:original_id] ,date: datetime)
        end
        format.html { redirect_to @menurecord, notice: 'Menurecord was successfully created.' }
        format.json { render json: @menurecord, status: :created, location: @menurecord }
      else
        format.html { render :new }
        format.json { render json: @menurecord.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    p params[:original_id]
    @menurecord = Menurecord.where(user_id: current_user.id).where(original_id: params[:original_id].to_i)
    if @menurecord.present?
      @menurecord.destroy_all
      @response = {result: "delete success"}
      respond_to do |format|
        format.html { redirect_to menurecords_path, notice: "Menurecord deleted" }
        format.json { render json: @response}
      end
    else
      @response = {result: "record not found"}
      respond_to do |format|
        format.html { render menurecords_path }
        format.json { render json: @response }
      end
    end
  end

  private
    def set_menurecord
      @menurecord = Menurecord.find([:id])
    end

end
