class SectionsController < ApplicationController

  layout 'admin'

  before_action :find_category

  def index
    @sections = @category.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:category_id => @category.id)
  end

  def create
    # Instantiate a new object using form parameters
    @section = Section.new(section_params)
    @section.category = @category
    # Save the object
    if @section.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Sub Category created successfully."
      redirect_to(sections_path(:category_id => @category.id))
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end    
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @section = Section.find(params[:id])
    # Update the object
    if @section.update_attributes(section_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = "Sub Category updated successfully."
      redirect_to(section_path(@section, :category_id => @category.id))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Sub Category '#{@section.name}' destroyed successfully."
    redirect_to(sections_path(:category_id => @category.id))
  end

private

  def section_params
    params.require(:section).permit(:category_id, :name, :visible)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

end
