class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :ip_value

      t.timestamps
    end
  end
end
