class InitialSchema < ActiveRecord::Migration
  def self.up

    create_table :line_items do |t|
      t.float   :cost
      t.text    :description
      t.float   :quantity
      t.float   :price
      t.integer :statement_id

      t.timestamps
    end

    create_table :recipients do |t|
      t.string :address
      t.string :addl_address
      t.string :city
      t.string :contact
      t.string :name
      t.string :state
      t.string :zip

      t.timestamps
    end

    create_table :statements do |t|
      t.date    :end_date
      t.date    :issue_date
      t.integer :number
      t.integer :recipient_id
      t.date    :start_date
      t.float   :total_cost, :default => 0.0

      t.timestamps
    end
  end

  def self.down
    drop_table :recipients
    drop_table :statements
  end
end
