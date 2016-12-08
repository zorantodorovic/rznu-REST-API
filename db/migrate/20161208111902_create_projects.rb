class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
    	t.timestamps
      t.string     :title
      t.text       :content
      t.integer    :user_id
      t.string     :category
      t.integer    :rating
    end
  end
end
