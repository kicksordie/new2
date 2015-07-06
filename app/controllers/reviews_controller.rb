class ReviewsController < ApplicationController
	before_action :set_professor
	before_action :set_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!

  def new
  end

  def create
    @review = @professor.reviews.create(review_params)
    @review.user_id = current_user.id
    if @review.save
    	redirect_to @professor
    else
    	render 'new'
    end
  end

  def edit
  end

  def update
  	if @review.update(review_params)
  		redirect_to @professor
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@review.destroy
  	redirect_to @professor
  end
 
  private

  	def set_review
  		@review = Review.find(params[:id])
  	end

  	def set_professor
  		@professor = Professor.find(params[:professor_id])
  	end

    def review_params
      params.require(:review).permit(:rating, :classname, :comment)
    end
end
