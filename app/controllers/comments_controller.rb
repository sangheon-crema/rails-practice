def article_href(article)
    return "/articles/#{article.id}"
  end

class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:id])
        @comment = @article.comments.create(comment_params)

        redirect_to article_href(@article)
    end

    def destroy
        @comment = Comment.find(params[:id])
        @article = @comment.article

        @comment.destroy
        redirect_to article_href(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end
end
