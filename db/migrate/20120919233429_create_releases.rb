class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :commit_id
      t.string :release_tag
      t.string :release_message
      t.string :package_file_name
      t.boolean :enabled
      
      t.timestamps
    end
  end
end
