class AddCurrencyToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :currency, :string
  end
end
