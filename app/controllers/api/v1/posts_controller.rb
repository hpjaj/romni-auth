module API
  module V1
    class PostsController < ApiController
      def index
        render json: Post.all
      end

      def create
        post = current_user.posts.create(post_params)

        render json: post
      end

    private

      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
    end
  end
end
