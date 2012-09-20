class CreateSystemConfigs < ActiveRecord::Migration
  def change
    create_table :system_configs do |t|
      t.string :repo_name
      t.string :repo_dir
      t.string :repo_branch
      t.string :package_dir

      t.timestamps
    end
  end
end
