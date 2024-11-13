class ReviewsController < ApplicationController
  def new
    # We need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # je récupère le restaurant lié à l'id
    @restaurant = Restaurant.find(params[:restaurant_id])
    # je créé une nouvelle review avec les params récupérés
    @review = Review.new(review_params)
     # le restaurant lié à la review créée sera celui identifié avant
    @review.restaurant = @restaurant
    
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
