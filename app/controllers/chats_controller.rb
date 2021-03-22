class ChatsController < ApplicationController

  def index
    @flag = Flag.find(params[:flag_id])
    @chat = Chat.new
    @chats = @flag.chats.includes(:user)
  end

  def create
    @flag = Flag.find(params[:flag_id])
    @chat = @flag.chats.new(chat_param)
    if @chat.save
      redirect_to flag_chats_path(@flag), notice:"メッセージを送信しました"
    else
      redirect_to flag_chats_path(@flag), notice:"メッセージの送信に失敗しました"
    end
  end

  private

  def chat_param
    params.require(:chat).permit(:message).merge(user_id: current_user.id, flag_id: params[:id])
  end
end
