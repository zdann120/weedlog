class CreateStrainEffects < ActiveRecord::Migration[5.2]
  def change
    create_table :strain_effects do |t|
      t.references :strain, foreign_key: true
      t.references :effect, foreign_key: true

      t.timestamps
    end
  end
end
