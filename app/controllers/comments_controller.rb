class CommentsController < InheritedResources::Base

	def create
		@comment = Comment.create(comment_params)
	end

  private

    def comment_params
      params.require(:comment).permit(:name, :body, :post_id)
    end
end

