class AboutController < ApplicationController

  def index
    @title = "about-us-introduction.title"
    @content = "about-us-introduction.content"
    @active_item = "introduction"

    render "about_us_plain"
  end

  def history
    @title = "about-us-history.title"
    @content = "about-us-history.content"
    @active_item = "history"

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

    @team_photos = ["rosseline.png",
                    "darwin.png",
                    "darwin.png",
                    "darwin.png",
                    "darwin.png",
                    "darwin.png",
                    "darwin.png",
                    "darwin.png"]

    @team_ids = [ "rodriguez",
                  "tineo",
                  "carrasquel",
                  "coronado",
                  "cadenas",
                  "ramirez",
                  "monascal",
                  "rocha"]
  end

  def member
    @member = params[:id]
    case @member
      when "rodriguez"
        @title = "Rosseline Rodríguez"
        @content = "foo"
        @photo = "rosseline.png"
      when "tineo"
        @title = "Leonid Tineo"
        @content = "foo"
        @photo = "darwin.png"
      when "carrasquel"
        @title = "Soraya Carrasquel"
        @content = "foo"
        @photo = "darwin.png"
      when "coronado"
        @title = "David Coronado"
        @content = "foo"
        @photo = "darwin.png"
      when "cadenas"
        @title = "José Cadenas"
        @content = "foo"
        @photo = "darwin.png"
      when "ramirez"
        @title = "Josué Ramírez"
        @content = "foo"
        @photo = "darwin.png"
      when "monascal"
        @title = "Ricardo Monascal"
        @content = "foo"
        @photo = "darwin.png"
      when "rocha"
        @title = "Darwin Rocha"
        @content = "foo"
        @photo = "darwin.png"
      else
    end

  end
end
