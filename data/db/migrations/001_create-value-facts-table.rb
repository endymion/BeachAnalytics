Sequel.migration do
  change do

    create_table(:dim_sources) do
      primary_key :id
      String :name, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    create_table(:dim_dates) do
      primary_key :id
      String :name, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    create_table(:dim_series_groups) do
      primary_key :id
      String :name, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    create_table(:dim_series) do
      primary_key :id
      String :name, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    create_table(:dim_metrics) do
      primary_key :id
      String :name, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    create_table(:fact_values) do
      primary_key :id
      Integer :dim_source_id, null:false
      Integer :dim_date_id, null:false
      Integer :dim_series_group_id, null:false
      Integer :dim_series_id, null:false
      Integer :dim_metric_id, null:false
      String :raw, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end
