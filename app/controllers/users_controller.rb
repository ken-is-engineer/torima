class UsersController < ApplicationController
  
  def show
    friends_id = List.where(user_id: current_user.id).pluck(:followed_id)
    list_flags = Flag.where(user_id: friends_id).all
    self_flags = Flag.where(user_id: current_user.id).all
    @flags = [list_flags,self_flags].flatten! #荒技すぎるか？しかし使用上問題なさそう。


    @flag = Flag.new
    @status = Status.new
    @list = List.new
  end

  def date_show
    binding.pry
    friends_id = List.where(user_id: current_user.id).pluck(:followed_id)
    list_flags = Flag.where(user_id: friends_id).all
    self_flags = Flag.where(user_id: current_user.id).all
    @flags = [list_flags,self_flags].flatten! #荒技すぎるか？しかし使用上問題なさそう。
  end

  def destroy
    
  end
end
