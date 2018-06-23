class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :business_name
      t.string :phone
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
