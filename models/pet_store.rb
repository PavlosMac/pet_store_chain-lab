require_relative( '../db/sql_runner' )

 

class PetStore

  attr_reader :id, :name, :address, :stock_type

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']

  end

  def save
    sql = "INSERT INTO pet_stores (name, address, stock_type) VALUES ('#{@name}', '#{@address}', '#{@stock_type}') RETURNING * "
    pet_store = SqlRunner.run(sql).first
    @id = pet_store['id']
  end

  def pets
    sql = "SELECT * FROM pets WHERE pet_store_id = #{@id}"
    pets = SqlRunner.run(sql)
    return pets.map { |pet| Pet.new(pet) }
  end

end