class TopicsController < ApplicationController
	def create
		@episode = Episode.find(params[:episode_id])
		@topic = @episode.topics.create(topic_params)
		redirect_to episode_path(@episode)
	end

	def destroy
		@episode = Episode.find(params[:episode_id])
		@topic = @episode.topics.find(params[:id])
		@topic.destroy
		logger.debug "my params #{params}"
		redirect_to episode_path(@episode)
	end

	private
		def topic_params
			params.require(:topic).permit(:name, :timecode, :description)
		end


end
