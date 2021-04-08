class StatusesController < ApplicationController
  def create
    @status = Status.new(status_param)
    if @status.save
      redirect_to user_path(current_user.id), notice:"クエスト定型文を登録しました"
    else
      redirect_to user_path(current_user.id), notice:"クエスト定型文の登録に失敗しました"
    end
  end

  private
  def status_param
    params.require(:status).permit(:name).merge(user_id: current_user.id)
  end

end