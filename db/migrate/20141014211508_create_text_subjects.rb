class CreateTextSubjects < ActiveRecord::Migration
  def change
    create_table :text_subjects do |t|
      t.text :body

      t.timestamps
    end
  end
end
