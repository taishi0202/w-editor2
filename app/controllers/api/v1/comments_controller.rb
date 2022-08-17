module Api::V1
  class CommentsController < BaseApiController
    before_action :authenticate_user!, only: [:create, :update, :destroy]

    def index
      article = Article.published.find(params[:article_id])
      comments = article.comments
      render json: comments, each_serializer: Api::V1::CommentSerializer
    end

    def show
      article = Article.published.find(params[:article_id])
      comment = article.comments.find(params[:comment_id])
      render json: comment, serializer: Api::V1::CommentSerializer
    end

    def create
      article = Article.published.find(params[:article_id])
      comment = article.comments.create!(comment_params)
      render json: comment, serializer: Api::V1::CommentSerializer
    end

    def update
      article = Article.published.find(params[:article_id])
      comment = article.comments.find(params[:comment_id])
      comment.update!(comment_params)
      render json: comment, serializer: Api::V1::CommentSerializer
    end

    def destroy
      article = Article.published.find(params[:article_id])
      comment = article.comments.find(params[:comment_id])
      comment.destroy!
      render json: {}, status: :no_content
    end

    private

      def comment_params
        params.require(:comment).permit(:content).merge(user_id: current_user.id)
      end
  end
end
