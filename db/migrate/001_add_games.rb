class AddGames < ActiveRecord::Migration
  def self.up
      create_table :users do |t|
          t.column :name, :string
      end

      create_table :games do |t|
          t.column :away_id, :integer
          t.column :away_team, :string
          t.column :away_score, :integer
          t.column :home_id, :integer
          t.column :home_team, :string
          t.column :home_score, :integer
          t.column :played_on, :date
          t.column :updated_on, :date
      end
  end

  def self.down
      drop_table :games
      drop_table :users
  end
end
