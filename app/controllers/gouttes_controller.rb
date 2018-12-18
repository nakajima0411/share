class GouttesController < ApplicationController
  before_action :authenticate_user!

  def create
    #binding.pry
    #comment = Comment.find(params[:comment_id])
    #goutte = current_user.gouttes.new(goutte_params)
    #goutte.comment_id = comment.id

    comment = Comment.find_by(post_id: params[:post_id], id:params[:comment_id])
    goutte = current_user.gouttes.new(comment_id: comment.id)
    goutte.save
    redirect_to post_path(comment.post)
  end
  def destroy
     comment = Comment.find_by(post_id: params[:post_id], id:params[:comment_id])
     goutte = Goutte.find_by(comment_id: comment.id)
     #binding.pry
     if goutte.destroy
       redirect_to post_path(comment.post)
     end
  end

  private
    def goutte_params
      params.require(:goutte).permit(:user_id, :comment_id)
    end
end
