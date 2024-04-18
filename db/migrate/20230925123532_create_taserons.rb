class CreateTaserons < ActiveRecord::Migration[6.0]
  def change
    create_table :taserons do |t|
      t.string :iş_türü
      t.decimal :anlaşma_miktari
      t.string :iş_süresi
      t.decimal :odenen_miktar
      t.string :parametre_5
      t.string :parametre_6
      t.string :parametre_7
      t.date :anlaşma_tarihi

      t.timestamps
    end
  end
end
