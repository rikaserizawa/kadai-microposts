class CreateFavorites < ActiveRecord::Migration[5.0]

def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :micropost, foreign_key: true
      
      t.timestamps 
    
    t.index [:user_id, :micropost_id], unique: true
    #add_index :favorites, :user_id
    #add_index :favorites, :micropost_id
    #add_index :favorites, [:user_id, :micropost_id], unique: true
end
end
end