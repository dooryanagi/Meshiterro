class PostCommentsController < ApplicationController
  
  # コメントの保存
  def create
    # 親子関係のリンクを作成したことで、params[~]でPostImageのidを取得できるようになった
    post_image = PostImage.find(params[:post_image_id])
    # ↓の記述は省略した記述
    comment = current_user.post_comments.new(post_comment_params)
    # 省略しない場合
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id
    
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end
  
  
  # コメントのストロングパラメータを記述
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
