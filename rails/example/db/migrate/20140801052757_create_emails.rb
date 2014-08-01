class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :to
      t.string :cc
      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
