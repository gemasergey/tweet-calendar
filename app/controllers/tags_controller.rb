class TagsController < ApplicationController
  before_action :set_tag, only: [:show]
  before_action :authenticate

  # GET /tags
  # GET /tags.json
  def index
    @tags = @current_user.tags.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @events = @tag.events.order("created_at desc")
  end

  # GET /tags/new

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

end
