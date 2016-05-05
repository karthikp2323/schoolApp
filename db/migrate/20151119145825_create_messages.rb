class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message_text
      t.references :parent, index: true, foreign_key: true
      t.references :school_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
