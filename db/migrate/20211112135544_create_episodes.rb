class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.integer :number
      t.string :title
      t.date :episode_date

      t.timestamps
    end
  end
end
