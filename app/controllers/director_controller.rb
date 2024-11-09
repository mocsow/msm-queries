class DirectorController < ApplicationController
  def index
    render({:template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id})

    @the_director = matching_records.at(0)

    render({:template => "director_templates/details"})
  end

  def youngest
    @youngest_director = Director.order(dob: :desc).first
    render({:template => "director_templates/youngest"})
  end

  def eldest
    @eldest_director = Director.order(:dob).first
    render({:template => "director_templates/youngest"})
  end
end
