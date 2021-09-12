class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.belongs_to :student
      t.belongs_to :tutor
      t.string :title
      t.string :content
      t.integer :likes

      t.timestamps
    end
  end
end
