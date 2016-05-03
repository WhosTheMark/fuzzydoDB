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

    @team_photos = ["rosseline",
                    "darwin",
                    "darwin",
                    "darwin",
                    "darwin",
                    "darwin",
                    "darwin",
                    "darwin"]

    @team_links = [url_for(controller: controller_name, action: "member", id: "rodriguez"),
                   url_for(controller: controller_name, action: "member", id: "tineo"),
                   url_for(controller: controller_name, action: "member", id: "carrasquel"),
                   url_for(controller: controller_name, action: "member", id: "coronado"),
                   url_for(controller: controller_name, action: "member", id: "cadenas"),
                   url_for(controller: controller_name, action: "member", id: "ramirez"),
                   url_for(controller: controller_name, action: "member", id: "monascal"),
                   url_for(controller: controller_name, action: "member", id: "rocha")]
  end

  def member
    @member = params[:id]
    case @member
      when "rodriguez"
        @title = "Rosseline Rodríguez"
        @content = "foo"
        @photo = "rosseline"
      when "tineo"
        @title = "Leonid Tineo"
        @content = "foo"
        @photo = "darwin"
      when "carrasquel"
        @title = "Soraya Carrasquel"
        @content = "foo"
        @photo = "darwin"
      when "coronado"
        @title = "David Coronado"
        @content = "foo"
        @photo = "darwin"
      when "cadenas"
        @title = "José Cadenas"
        @content = "foo"
        @photo = "darwin"
      when "ramirez"
        @title = "Josué Ramírez"
        @content = "foo"
        @photo = "darwin"
      when "monascal"
        @title = "Ricardo Monascal"
        @content = "foo"
        @photo = "darwin"
      when "rocha"
        @title = "Darwin Rocha"
        @content = "foo"
        @photo = "darwin"
      else
    end

    render 'member', locals: {}

  end
end
