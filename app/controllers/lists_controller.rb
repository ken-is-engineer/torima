class ListsController < ApplicationController

  def create
    @list = List.new(list_param)
    if User.where(id: @list.followed_id).exists?
      if @list.save
        redirect_to user_path(current_user.id), notice:"#{User.find(current_user.lists.last.followed_id).name}が仲間になった！"
      else
        redirect_to user_path(current_user.id), notice:"#{User.find(current_user.lists.last.followed_id).name}が仲間にならなかった・・。"
      end
    else
      redirect_to user_path(current_user.id), notice:"Friend code:#{@list.followed_id}は存在しません"
    end
  end

  private
  def list_param
    params.require(:list).permit(:followed_id).merge(user_id: current_user.id)
  end
end
