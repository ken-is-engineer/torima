class StatusesController < ApplicationController
  def create
    @status = Status.new(status_param)
    if @status.save
      redirect_to user_path(current_user.id), notice:"フラッグの新規作成に成功しました"
    else
      redirect_to user_path(current_user.id), notice:"フラッグの新規作成に失敗しました"
    end
  end

  private
  def status_param
    params.require(:status).permit(:name).merge(user_id: current_user.id)
  end
end