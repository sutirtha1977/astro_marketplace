class ListingsController < ApplicationController
  layout 'admin'

  before_action :find_section

  def index
    @listings = @section.listings.sorted
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new(:section_id => @section.id)
  end

  def create
    # Instantiate a new object using form parameters
    @listing = Listing.new(listing_params)
    @listing.section = @section
    # Save the object
    if @listing.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Listing created successfully."
      redirect_to(listings_path(:section_id => @section.id))
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end 
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @listing = Listing.find(params[:id])
    # Update the object
    if @listing.update_attributes(listing_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = "Listing updated successfully."
      redirect_to(listing_path(@listing, :section_id => @section.id))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @listing = Listing.find(params[:id])
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = "Listing '#{@listing.name}' destroyed successfully."
    redirect_to(listings_path(:section_id => @section.id))    
  end

private

  def listing_params
    params.require(:listing).permit(:section_id, :name, :visible, :description, :price)
  end

  def find_section
    @section = Section.find(params[:section_id])
  end

end
