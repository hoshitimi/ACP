class PointsController < ApplicationController
  before_action :set_point, only: %i[ show edit update destroy ]

  # GET /points or /points.json
  def index
    @points = Point.where(user_id: session[:login_id])
  end

  # GET /points/1 or /points/1.json
  def show
  end

  # GET /points/new
  def new
    @point = Point.new(user_id: params[:user_id])
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points or /points.json
  def create
    @point = Point.new(point_params)
    @user = User.find_by(user_id: @point.user_id)

    respond_to do |format|
      if @point.save
        # ユーザーデータの更新
        @user_point = @user.point + @point.fluctuation
        @user.update(point: @user_point)
        session[:login_user_point] = @user_point
        format.html { redirect_to @point, notice: "ポイントが追加されました" }
        format.json { render :show, status: :created, location: @point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points/1 or /points/1.json
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to @point, notice: "ポイントの変更を更新しました" }
        format.json { render :show, status: :ok, location: @point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1 or /points/1.json
  def destroy
    @point.destroy
    respond_to do |format|
      format.html { redirect_to points_url, notice: "ポイントが削除されました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_params
      params.require(:point).permit(:user_id, :fluctuation, :summary)
    end
end
