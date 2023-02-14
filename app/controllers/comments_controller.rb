class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:id])
        @comment = @article.comments.create(comment_params)

        redirect_to "/articles/#{@article.id}"
    end

    def destroy
        @comment = Comment.find(params[:id])
        @article = @comment.article

        @comment.destroy
        redirect_to "/articles/#{@article.id}"
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end
end
