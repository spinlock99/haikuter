class CreateHaikus < ActiveRecord::Migration
  def change
    create_table :haiku do |t|
      t.belongs_to :user, index: true
      t.text       :poem

      t.timestamps
    end
  end
end
