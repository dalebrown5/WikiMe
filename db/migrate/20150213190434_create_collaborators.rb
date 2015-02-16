class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.references :user, index: true
      t.references :wiki, index: true
      t.integer :user_id
      t.integer :wiki_id

      t.timestamps null: false
    end
    add_foreign_key :collaborators, :wikis
    add_foreign_key :collaborators, :users
  end

     add_index :wikis, :id, unique: true
     add_index :users, :id, unique: true
     add_index :collaborators, :id, unique: true
     add_index :collaborators, :wiki_id
     add_index :collaborators, :user_id
end
