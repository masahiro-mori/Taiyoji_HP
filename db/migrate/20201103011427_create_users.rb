class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer   :date
      t.string    :name_kanji
      t.string    :name_kana
      t.integer   :birth
      t.integer   :phonenumber
      t.string    :mailaddress
      
      
      t.timestamps
    end
  end
end
