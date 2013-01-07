class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id]) # pega o id pela url
      @comment = @post.comments.build(params[:comment]) # pega o post e joga na variavel
      flash[:alert] = 'Fail to receive the comment. Double check the fields.' unless @comment.save
      redirect_to @post #redireciona para o post
    end
end
