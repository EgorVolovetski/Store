class AddConfirmableToManufactures < ActiveRecord::Migration[7.1]
  def change
    add_column :manufactures, :confirmation_token, :string
    add_column :manufactures, :confirmed_at, :datetime
    add_column :manufactures, :confirmation_sent_at, :datetime
    add_column :manufactures, :unconfirmed_email, :string
    add_index :manufactures, :confirmation_token, unique: true
  end
end
