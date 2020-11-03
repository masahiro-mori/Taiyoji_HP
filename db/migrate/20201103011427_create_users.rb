class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      
      t.date    :book_date
      t.string  :name_first_kanji
      t.string  :name_last_kanji
      t.string  :name_first_kana
      t.string  :name_last_kana
      t.date    :birthday
      t.string  :phonenumber
      t.string  :mailaddress
      
      
      t.timestamps
    end
  end
end
