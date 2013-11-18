class CreateHaikus < ActiveRecord::Migration
  def change
    create_table :haikus do |t|
      t.references :user
      t.text       :poem

      t.timestamps
    end
  end
end
