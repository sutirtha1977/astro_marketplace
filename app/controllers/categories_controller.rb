class CategoriesController < ApplicationController
  def index
    @categories = Category.sorted
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    # Instantiate a new object using form parameters
    @category = Category.new(category_params)
    # Save the object
    if @category.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Category created successfully."
      redirect_to(categories_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @category = Category.find(params[:id])
    # Update the object
    if @category.update_attributes(category_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = "Category updated successfully."
      redirect_to(category_path(@category))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category '#{@category.name}' destroyed successfully."
    redirect_to(categories_path)
  end

private

  def category_params
    params.require(:category).permit(:name, :category, :visible)
  end
end
