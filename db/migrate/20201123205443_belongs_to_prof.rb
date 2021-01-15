class BelongsToProf < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :profiles, index: true
  end
end
