class FlagsController < ApplicationController
  before_action :authenticate_user!

  def show
    binding.pry
    @flags = Flag.where(start_time: )
  end

  def create
    @flag = Flag.new(flag_param)
    if @flag.save
      redirect_to user_path(current_user.id), notice:"新しい予定の登録に成功しました"
    else
      redirect_to user_path(current_user.id), notice:"新しい予定の登録に失敗しました"
    end
  end

  def destroy
    @flag = Flag.find(params[:id])
    @flag.destroy
    redirect_to flags_path, notice:"削除しました"
  end

  def edit
    @flag = Flag.find(params[:id])
  end

  def update
    @flag = Flag.find(params[:id])
    if @flag.update(flag_param)
      redirect_to flags_path, notice: "編集しました"
    else
      render :edit
    end
  end

  private

  def flag_param
    params.require(:flag).permit(:status, :start_time).merge(user_id: current_user.id)
  end
end
