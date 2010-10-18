class SixArmRailsLocalitiesCreateRegionals < ActiveRecord::Migration

  TABLE = 'regionals'

  def self.up

    create_table TABLE, :force => true do |t|

      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :creator_id, :integer
      t.column :updator_id, :integer
      t.column :status, :integer

      t.column :latitude,            :decimal, :precision => 15, :scale => 10
      t.column :latitude_inner_min,  :decimal, :precision => 15, :scale => 10
      t.column :latitude_inner_max,  :decimal, :precision => 15, :scale => 10
      t.column :latitude_outer_min,  :decimal, :precision => 15, :scale => 10
      t.column :latitude_outer_max,  :decimal, :precision => 15, :scale => 10
      t.column :longitude,           :decimal, :precision => 15, :scale => 10
      t.column :longitude_inner_min, :decimal, :precision => 15, :scale => 10
      t.column :longitude_inner_max, :decimal, :precision => 15, :scale => 10
      t.column :longitude_outer_min, :decimal, :precision => 15, :scale => 10
      t.column :longitude_outer_max, :decimal, :precision => 15, :scale => 10

      t.column :population, :integer, :limit => 8
      t.column :area,       :integer, :limit => 8
      t.column :area_land,  :integer, :limit => 8
      t.column :area_water, :integer, :limit => 8

    end

    add_index TABLE, :created_at
    add_index TABLE, :updated_at
    add_index TABLE, :creator_id
    add_index TABLE, :updator_id
    add_index TABLE, :status

    add_index TABLE, :latitude
    add_index TABLE, :latitude_inner_min
    add_index TABLE, :latitude_inner_max
    add_index TABLE, :latitude_outer_min
    add_index TABLE, :latitude_outer_max
    add_index TABLE, :longitude
    add_index TABLE, :longitude_inner_min
    add_index TABLE, :longitude_inner_max
    add_index TABLE, :longitude_outer_min
    add_index TABLE, :longitude_outer_max

    add_index TABLE, :population
    add_index TABLE, :area
    add_index TABLE, :area_land
    add_index TABLE, :area_water

  end

  def self.drop
    drop_table TABLE
  end

end
