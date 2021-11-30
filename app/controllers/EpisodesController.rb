class EpisodesController < ApplicationController
  before_action :unique_podcasts
  
  def unique_podcasts
    @podcast_titles = Episode.all.map{ |e| [e.podcast_title, e.podcast_title]}.uniq.select{|e| e.any?}
  end
  
  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    @episode.podcast_title = get_podcast_title_from_parms
    if @episode.save
      # puts "Episode controller save method. Broadcasting for #{@episode.id}"
      ActionCable.server.broadcast( "episodes_channel" , { id: @episode.id})
      # puts "controller redirecting to episode page.."
      redirect_to @episode
    else
      render :new
    end
  end

  def edit
    @episode = Episode.find(params[:id])
  end

  def update
    @episode = Episode.find(params[:id])
    @episode.podcast_title = get_podcast_title_from_parms
    if @episode.update(episode_params)
      redirect_to @episode
    else
      render :edit
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    
    redirect_to root_path

  end

  private
    def episode_params
      params.require(:episode).permit(:title, :number, :episode_date, :podcast_title)

    end

    def get_podcast_title_from_parms
      params[:new_podcast_title] unless params[:new_podcast_title].empty?
    end

end