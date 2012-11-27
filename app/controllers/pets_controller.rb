class PetsController < ApplicationController
  before_filter :authenticate_user!

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pets }
    end
  end

  def vote_for
    @pet = Pet.find(params[:id])
    
    current_user.vote_exclusively_for(@pet) #if params[:pettable] == "yes"
    show_next()
  end

  def vote_against
    @pet = Pet.find(params[:id])

    current_user.vote_exclusively_against(@pet)
    show_next()
  end

  def show_next
    @pet = Pet.order("RANDOM()").first()

    respond_to do |format|
      format.json { render :json => @pet.to_json(:methods => [:photo_thumb_url, :photo_medium_url, :photo_large_url]) }
    end
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @pet = Pet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @pet.to_json(:methods => [:photo_thumb_url, :photo_medium_url, :photo_large_url]) }
    end
  end

  # GET /pets/new
  # GET /pets/new.json
  def new
    @pet = Pet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet }
    end
  end

  # GET /pets/1/edit
  def edit
    @pet = Pet.find(params[:id])
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(params[:pet])

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render json: @pet, status: :created, location: @pet }
      else
        format.html { render action: "new" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pets/1
  # PUT /pets/1.json
  def update
    @pet = Pet.find(params[:id])

    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url }
      format.json { head :no_content }
    end
  end
end
