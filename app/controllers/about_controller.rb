class AboutController < ApplicationController

  def index
    @title = "about-us-introduction.title"
    @content = "about-us-introduction.content"

    render "about_us_plain"
  end

  def history
    @title = "about-us-history.title"
    @content = "about-us-history.content"

    render "about_us_plain"
  end

  def members
    #TODO: Move this to a model. Perhaps we might want to mix both arrays
    @team_members = [ "Rosseline Rodríguez",
                      "Leonid Tineo",
                      "Soraya Carrasquel",
                      "David Coronado",
                      "José Cadenas",
                      "Josué Ramírez",
                      "Ricardo Monascal",
                      "Darwin Rocha"]
    @team_photos = ["rosseline",
                    "darwin",
                    "darwin",
                    "darwin",
                    "darwin",
                    "darwin",
                    "darwin",
                    "darwin"]
  end
end
