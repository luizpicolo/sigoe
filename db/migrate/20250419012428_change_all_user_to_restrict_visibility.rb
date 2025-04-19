class ChangeAllUserToRestrictVisibility < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      dir.up do
        Permission.update_all(can_read_restricted: true)
      end

      dir.down do
        Permission.update_all(can_read_restricted: false)
      end
    end
  end
end