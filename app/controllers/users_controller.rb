class UsersController < ApplicationController
  
  def show
    friends_code = List.where(user_id: current_user.id).pluck(:followed_id)
    friends_id = User.where(code: friends_code).all
    list_flags = Flag.where(user_id: friends_id).all
    self_flags = Flag.where(user_id: current_user.id).all
    @flags = [list_flags,self_flags].flatten! #荒技すぎるか？しかし使用上問題なさそう。


    @flag = Flag.new
    @status = Status.new
    @list = List.new
  end

  def date_show
    friends_id = List.where(user_id: current_user.id).pluck(:followed_id)
    list_flags = Flag.where(user_id: friends_id, start_time: params[:date]).all
    self_flags = Flag.where(user_id: current_user.id, start_time: params[:date]).all
    @flags = [list_flags,self_flags].flatten! #荒技すぎるか？しかし使用上問題なさそう。
    date = params[:date]
    @date = Date.parse(date).to_time
    #@date = params[:date].split("-").map{|n| n.to_i}
    #defaultにTime型へ変換したparams[:date]を入れてあげる作戦をやる。
  end

  def destroy
    
  end
end
