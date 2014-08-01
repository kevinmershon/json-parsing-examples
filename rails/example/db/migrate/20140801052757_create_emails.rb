class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :to_field
      t.string :cc_field
      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
