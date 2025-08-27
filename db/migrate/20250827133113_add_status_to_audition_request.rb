class AddStatusToAuditionRequest < ActiveRecord::Migration[8.0]
  def change
    add_column :audition_requests, :status, :integer, default: 0
  end
end
