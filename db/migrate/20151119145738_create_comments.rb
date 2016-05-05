class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.references :activity, index: true, foreign_key: true
      t.references :parent, index: true, foreign_key: true
      t.references :school_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
