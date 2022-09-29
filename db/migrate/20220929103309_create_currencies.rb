class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :source
      t.string :currencies

      t.timestamps
    end
  end
end
