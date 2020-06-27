require 'sequel'

Sequel::Model.plugin :validation_helpers
Sequel::Model.plugin :timestamps, update_on_create: true

module DB

  def self.filename
    'db/values.sqlite3'
  end
  def self.connection
    # Change this based on an environment variable if necessary.
    Sequel.sqlite(self.filename)
  end

  def self.check
    unless self.connection.table_exists?(:dim_metrics)
      puts ' ERROR: No fact_values table '.on_light_red
      puts 'Please run: ' + 'ruby worker.rb db migrate'.on_light_cyan
      exit
    end
  end

  class Sequel::Model
    def self.record(name:nil)
      # find...
      self.where(name:name).first or
        # or create
        self.new(name:name).save
    end
  end

  if self.connection.table_exists?(:dim_sources)
    class DimSource < Sequel::Model
      one_to_many :fact_values
      def validate
        super
        validates_unique :name
      end
    end
  end

  if self.connection.table_exists?(:dim_series_groups)
    class DimSeriesGroup < Sequel::Model
      one_to_many :fact_values
      def validate
        super
        validates_unique :name
      end
    end
  end

  if self.connection.table_exists?(:dim_series)
    class DimSeries < Sequel::Model
      one_to_many :fact_values
      def validate
        super
        validates_unique :name
      end
    end
  end

  if self.connection.table_exists?(:dim_dates)
    class DimDate < Sequel::Model
      one_to_many :fact_values
      def validate
        super
        validates_unique :name
      end
    end
  end

  if self.connection.table_exists?(:dim_metrics)
    class DimMetric < Sequel::Model
      one_to_many :fact_values
      def validate
        super
        validates_unique :name
      end
    end
  end

  if self.connection.table_exists?(:fact_values)
    class FactValue < Sequel::Model
      many_to_one :dim_source
      many_to_one :dim_series_group
      many_to_one :dim_series
      many_to_one :dim_date
      many_to_one :dim_metric

      # Look up (or create) dimension keys and then write the fact record.
      def self.write(
          source:       ,
          series_group: ,
          series:       ,
          date:         ,
          metric:       ,
          raw:
        )
        self.new(
          dim_source:       DB::DimSource.record(name:source),
          dim_series_group: DB::DimSeriesGroup.record(name:series_group),
          dim_series:       DB::DimSeries.record(name:series),
          dim_date:         DB::DimDate.record(name:date),
          dim_metric:       DB::DimMetric.record(name:metric),
          raw:              raw
        ).save
      end

      def inspect
        {
          dim_source:       dim_source.name,
          dim_series_group: dim_series_group.name,
          dim_series:       dim_series.name,
          dim_date:         dim_date.name,
          dim_metric:       dim_metric.name,
          raw:              raw
        }
      end

    end

  end

end
