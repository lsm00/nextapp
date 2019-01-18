class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.belongs_to :member
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
