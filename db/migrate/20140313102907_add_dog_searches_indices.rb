class AddDogSearchesIndices < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute <<-SQL
      CREATE INDEX index_dogs_on_name ON dogs USING gin(to_tsvector('english', name));
      CREATE INDEX index_dogs_on_responds_to ON dogs USING gin(to_tsvector('english', responds_to));
      CREATE INDEX index_dogs_on_age ON dogs USING gin(to_tsvector('english', age));
      CREATE INDEX index_dogs_on_breed ON dogs USING gin(to_tsvector('english', breed));
      CREATE INDEX index_dogs_on_features ON dogs USING gin(to_tsvector('english', features));
      CREATE INDEX index_dogs_on_unique_features ON dogs USING gin(to_tsvector('english', unique_features));
      CREATE INDEX index_dogs_on_main_color ON dogs USING gin(to_tsvector('english', main_color));
      CREATE INDEX index_dogs_on_secondary_colors ON dogs USING gin(to_tsvector('english', secondary_colors));
      CREATE INDEX index_dogs_on_location ON dogs USING gin(to_tsvector('english', location));
      CREATE INDEX index_dogs_on_gender ON dogs USING gin(to_tsvector('english', gender));
    SQL
  end

  def down
    ActiveRecord::Base.connection.execute <<-SQL
      DROP INDEX index_dogs_on_name;
      DROP INDEX index_dogs_on_responds_to;
      DROP INDEX index_dogs_on_age;
      DROP INDEX index_dogs_on_breed;
      DROP INDEX index_dogs_on_features;
      DROP INDEX index_dogs_on_unique_features;
      DROP INDEX index_dogs_on_main_color;
      DROP INDEX index_dogs_on_secondary_colors;
      DROP INDEX index_dogs_on_location;
      DROP INDEX index_dogs_on_gender;
    SQL
  end
end
