class SixArmRailsLocalitiesCreateCountries < ActiveRecord::Migration

  TABLE = 'countries'

  def self.up

    create_table TABLE, :force => true do |t|

      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :creator_id, :integer
      t.column :updator_id, :integer
      t.column :status, :integer

      t.column :name_en,            :string
      t.column :name_en_searchable, :string
      t.column :iso,                :string, :limit => 2  #ISO 3166-2 country code
      t.column :iso3,               :string, :limit => 3  #ISO 3-letter country code
      t.column :isonum,             :string, :limit => 3  #United Nations 3-character number code
      t.column :regional_id,        :integer
      t.column :continent_id,       :integer

    end

    add_index TABLE, :created_at
    add_index TABLE, :updated_at
    add_index TABLE, :creator_id
    add_index TABLE, :updator_id
    add_index TABLE, :status

    add_index TABLE, :name_en
    add_index TABLE, :name_en_searchable
    add_index TABLE, :iso
    add_index TABLE, :iso3
    add_index TABLE, :isonum
    add_index TABLE, :regional_id
    add_index TABLE, :continent_id

  end

  def self.down
    drop_table TABLE
  end

end

