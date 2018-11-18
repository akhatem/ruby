class CategoriesController < ApplicationController
  def index
  	@categories = Category.all.order(created_at: 'desc')
  end

  def show
  	@category = Category.find(params[:id])
    @posts = @category.posts.order(created_at: 'desc')
  end

  def new
  	@category = Category.new(params[:category])
	if @category.save
		redirect_to categories_path, success: "Category Created!"
	else
		render "new"
	end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def create
  	@category = Category.new(params[:category])
	if @category.save
		redirect_to categories_path, success: "Category Created!"
	else
		render "new"
	end
  end

  def update
  	@category = Category.find(params[:id])
	if @category.update_attributes(params[:category])
		redirect_to post_path, success: "Category Updated!"
	else
		render "edit"
	end
  end

  def destroy
  	@category = Category.find(params[:id])
	@category.destroy
	redirect_to cateogries_path, warning: "Category Deleted!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
