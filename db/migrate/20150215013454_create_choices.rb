class CreateChoices < ActiveRecord::Migration

  create_table :choices do |t|
    t.integer :wiki_id
    t.integer :collaborator_id
    t.timestamps
  end
 
     add_index :wikis, :id, unique: true
     add_index :collaborators, :id, unique: true
     add_index :choices, :id, unique: true
     add_index :choices, :wiki_id
     add_index :choices, :collaborator_id
end
