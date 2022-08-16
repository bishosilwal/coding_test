class CreateEmployments < ActiveRecord::Migration[7.0]
  def change
    create_table :employments do |t|
      t.references :person, null: false, foreign_key: true
      t.date :date_started
      t.date :employment_date_ended

      t.timestamps
    end
  end
end
