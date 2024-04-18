class CreateDaires < ActiveRecord::Migration[7.0]
  def change
    create_table :daires do |t|
      t.string :isim_soyisim
      t.string :telefon_numarasi
      t.date :anlasma_tarihi
      t.decimal :anlasma_miktari
      t.decimal :on_odeme
      t.date :taksit_tarihi
      t.decimal :taksit_miktari
      t.date :tapu_tarihi
      t.date :teslim_tarihi

      t.timestamps
    end
  end
end
