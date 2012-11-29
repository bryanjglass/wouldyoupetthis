class PagesController < ApplicationController
  def home
    @top_overall = Pet.plusminus_tally.order("plusminus_tally DESC").limit(10)

    @tags = Pet.tag_counts.order("count DESC").limit(5)

    @top_by_tag = @tags.map do |tag|
      {:name=>tag.name, :pets=> Pet.tagged_with(tag.name).plusminus_tally.limit(10)}
    end
  end

  def vote
    @pet = Pet.order("RANDOM()").first()
  end

  def about
  
  end

  def most
    
  end
end
