class PagesController < ApplicationController
  def home
    @top = Pet.limit(10)
  end

  def vote
    @pet = Pet.order("RANDOM()").first()
  end
end
