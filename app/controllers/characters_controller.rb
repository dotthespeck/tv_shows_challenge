class CharactersController < ApplicationController

  def index
    @character = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
    @tvshow = TelevisionShow.find(params[:television_show_id])
  end

  def create
    @tvshow = TelevisionShow.find(params[:television_show_id])
    @character = Character.new(character_params)
    @character.television_show_id = @television_show.id

    if @character.save
      flash[:notice] = "Success!"
      redirect_to '/television_show_character_path'
    else
      flash.now[:notice] = "Your character couldn't be saved."
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :actor, :description, :television_show_id)
  end
end
