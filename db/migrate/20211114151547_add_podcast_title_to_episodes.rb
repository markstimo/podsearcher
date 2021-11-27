class AddPodcastTitleToEpisodes < ActiveRecord::Migration[6.1]
  def change
    add_column :episodes, :podcast_title, :string
  end
end
