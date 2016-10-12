require_relative('../db/sql_runner')

class Pet

 attr_reader :name, :type, :id


  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @pet_store_id = options['pet_store_id'].to_i
  end

  def save
    sql = "INSERT INTO pets (name, type) VALUES ('#{@name}', '#{@type}') RETURNING *"
    pet = SqlRunner.run(sql).first
    @id = pet['id']
  end

  def pet_store
    sql = "SELECT * FROM pet_stores WHERE id = #{@pet_store_id}"
    pets = SqlRunner.run(sql).first
    return PetStore.new(pets)
  end

end