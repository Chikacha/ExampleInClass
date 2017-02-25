class CommentsController < ApplicationController
  def create
    # 找相關連的訂單
    @order = Order.find(params[:order_id])
    # build 與 new 的意思一樣
    @comment = @order.comments.build(params.require(:comment).permit(:comment))
    # 綁定現在登入的使用者
    @comment.user = current_user

    if @comment.save
      redirect_to order_path(@order)
    else
      render 'orders/show'
    end
  end
end