class SessionsController < ApplicationController
  def new
    #登入頁面使用
  end

  def create
    #尋找使用者
    user = User.find_by(name: params[:name])   
    #驗證使用者，若成功，就建立一個 session，把 user_id 放入 session hash
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    #登出畫面使用，刪除 session hash 裡面的 user_id
    session[:user_id] = nil
    redirect_to root_path
  end
end