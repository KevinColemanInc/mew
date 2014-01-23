class CreatePatientGroups < ActiveRecord::Migration
  def change
    create_table :patient_groups, id: :uuid do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :case_managers_patient_groups, id: false do |t|
      t.uuid :case_manager_id
      t.uuid :patient_group_id
    end

    create_table :patients_patient_groups, id: false do |t|
      t.uuid :patient_id
      t.uuid :patient_group_id
    end
  end
end
