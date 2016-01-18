class AddStripeSubcriptionIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripesubscriptionid, :string
  end
end
