class AddSocialsToPeople < ActiveRecord::Migration[8.0]
  def change
    add_column :people, :socials, :string
  end
end
