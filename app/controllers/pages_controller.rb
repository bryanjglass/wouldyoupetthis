class PagesController < ApplicationController
  def home
    @top = Pet.plusminus_tally.order("plusminus_tally DESC").limit(10)
  end

  def vote
    @pet = Pet.order("RANDOM()").first()
  end
end
