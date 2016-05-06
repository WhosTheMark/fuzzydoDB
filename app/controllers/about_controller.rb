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
    @members = Member.where(_type: "Member")
    @developers = Developer.all
  end

  def member
    @member = Member.where(member_id: params[:id])[0]
    @developer = Developer.where(developer_id: params[:id])[0]
  end

end
