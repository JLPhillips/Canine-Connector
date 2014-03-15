class AddDogSearchesView < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute <<-SQL
      CREATE OR REPLACE VIEW dog_searches AS

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.name AS terms
        FROM dogs

        UNION

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.responds_to AS terms
        FROM dogs

        UNION

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.age AS terms
        FROM dogs

        UNION

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.breed AS terms
        FROM dogs

        UNION

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.features AS terms
        FROM dogs

        UNION

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.unique_features AS terms
        FROM dogs

        UNION

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.main_color AS terms
        FROM dogs

        UNION

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.secondary_colors AS terms
        FROM dogs

        UNION

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.location AS terms
        FROM dogs

        UNION

        SELECT dogs.id AS searchable_id,
        "dogs" AS searchable_type,
        dogs.gender AS terms
        FROM dogs
    SQL
  end


  def down
    ActiveRecord::Base.connection.execute <<-SQL
    DROP VIEW dog_searches;
    SQL
  end
end
