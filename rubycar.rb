# # defines vehicle class
class Vehicle
  def initialize(year)
    @year = year
    @lights_on = false
    @speed = 0
  end

  def year
    @year
  end

  def lights_on=(input)
    @lights_on = input
  end

  def lights_on?
    @lights_on
  end
end

# Car class for vehicle
class Car < Vehicle
  def wheels
    4
  end

  def speed
    @speed
  end

  def accelerate_by(amount)
    @speed += amount
  end

  def brake_by(amount)
    if @speed >= amount
      @speed -= amount
    else
      @speed = 0
    end
  end

  def honk
    'beeeeep'
  end
end

# Tesla car class
class Tesla < Car
  def accelerate
    accelerate_by 10
  end

  def brake
    brake_by 7
  end

  def honk
    'beep beep'
  end
end

# Tata car class
class Tata < Car
  def accelerate
    accelerate_by 2
  end

  def brake
    brake_by 1.25
  end
end

# Toyota car class
class Toyota < Car
  def accelerate
    accelerate_by 7
  end

  def brake
    brake_by 5
  end

  def honk
    'honk honk'
  end
end

# Collection class for array
class Collection
  def initialize
    @array = []
  end

  def array
    @array
  end

  def add_car(new_car)
    @array.push(new_car)
  end

  def fill
    add_car(Toyota.new(1990))
    add_car(Tata.new(2002))
    add_car(Tesla.new(1999))
    add_car(Tesla.new(2000))
    add_car(Tata.new(1972))
    add_car(Toyota.new(2004))
  end

  def sort_by_year
    @array.sort_by { |e| e.year }
  end

  def sort_by_model
    @array.sort_by { |e| e.class.to_s }
  end

  def sort_by_model_then_year
    @array.sort_by { |e| e.year }.sort_by { |e| e.class.to_s }
  end
end
