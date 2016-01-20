class CreateEventStatuses < ActiveRecord::Migration
  def change
    create_table :event_statuses do |t|
      t.references :event, index: true, foreign_key: true
      t.references :parent, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
