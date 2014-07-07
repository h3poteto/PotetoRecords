class FriendsController < ApplicationController
  prepend_before_filter :authenticate_with_basic

  # GET /friends
  # GET /friends.json
  def index
    @user = current_user
    @friends = @user.follow_users
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @user = User.find(params[:id])
    @follower = UserFollow.where(user_id: current_user).where(follow_user_id: @user.id)
    if @follower.present?
      @menurecords = @user.menurecords.where(parent_id: -1).order("date DESC")
    else
      @menurecords = nil
    end
  end

  # GET /firends/1/show_menu
  def show_menu
    @user = User.find(params[:id])
    @follower = UserFollow.where(user_id: current_user).where(follow_user_id: @user.id)
    if @follower.present? && params[:menu_id].present?
      @menu = Menurecord.search(:id_or_parent_id_eq => params[:menu_id].to_i).result.order(date: :desc)
    else
      @menu = nil
    end
  end

  # GET /friends/new
  def new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new()

    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update()
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
end
