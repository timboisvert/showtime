class CreateAuditions < ActiveRecord::Migration[8.0]
  def change
    create_table :auditions do |t|
      t.references :audition_session, null: false, foreign_key: true
      t.references :audition_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
