require_relative('../db/sql_runner')

class House

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'].capitalize
  end

  def save()
    sql = "INSERT INTO houses
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def students()
    sql = "SELECT * from students WHERE students.house_id = $1"
    values =[@id]
    result = SqlRunner.run(sql, values)
    students = result.map { |student| Student.new(student) }
  end

  def self.find(id)
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    house = House.new(result)
    return house
  end

  def self.all()
    sql = "SELECT * FROM houses"
    house_data = SqlRunner.run(sql)
    houses = map_items(house_data)
    return houses
  end

  def self.map_items(house_data)
    return house_data.map { |house| House.new(house) }
  end

end
