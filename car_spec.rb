require 'rspec'
require_relative 'rubycar'

describe 'Vehicle' do
  it 'should create the Vehicle class' do
    expect { Vehicle }.to_not raise_error
  end

  it 'should be able to create a new Vehicle' do
    expect { Vehicle.new(1990) }.to_not raise_error
  end

  it 'should tell which model year the vehicle is from' do
    a_car = Vehicle.new(1990)
    expect(a_car.year).to be_a Integer
  end

  it 'should get a year when it is initialize' do
    a_car = Vehicle.new(1990)
    expect(a_car.year).to eq(1990)
  end

  it 'should say if the lights are on or off' do
    a_car = Vehicle.new(1938)
    expect(a_car.lights_on?).to be false
  end

  it 'should turn on and off the lights on a given vehicle' do
    a_car = Vehicle.new(1990)
    a_car.lights_on = true
    expect(a_car.lights_on?).to be true
  end
end

describe 'Car' do
  it 'should create the car class' do
    expect { Car }.to_not raise_error
  end
  it 'should be able to create a new car' do
    expect { Car.new(1990) }.to_not raise_error
  end
  it 'has four wheels' do
    a_car = Car.new(1990)
    expect(a_car.wheels).to eq(4)
  end
  it 'has a speed' do
    a_car = Car.new(1990)
    expect(a_car.speed).to be_a Numeric
  end
  it 'can accelerate by an amount' do
    a_car = Car.new(1990)
    a_car.accelerate_by(5)
    expect(a_car.speed).to eq 5
  end
  it 'can brake by an amount' do
    a_car = Car.new(1990)
    a_car.accelerate_by(5)
    a_car.brake_by(3)
    expect(a_car.speed).to eq 5 - 3
  end
  it "can't brake below zero" do
    a_car = Car.new(1990)
    a_car.accelerate_by(2)
    a_car.brake_by(3)
    expect(a_car.speed).to eq 0
  end
  it 'has a generic honk' do
    a_car = Car.new(1963)
    expect(a_car.honk).to eq 'beeeeep'
  end
end

describe 'Tesla' do
  it 'should create a Tesla Car' do
    expect { Tesla.new(1990) }. to_not raise_error
  end
  it 'speeds up by 10 per acceleration' do
    a_tesla = Tesla.new(2005)
    a_tesla.accelerate
    expect(a_tesla.speed).to eq 10
  end
  it 'slows down by 7 per braking' do
    a_tesla = Tesla.new(2005)
    a_tesla.accelerate
    expect(a_tesla.speed).to eq 10
    a_tesla.brake
    expect(a_tesla.speed).to eq 10 - 7
  end
  it 'has a horn that goes beep beep' do
    a_tesla = Tesla.new(2005)
    expect(a_tesla.honk).to eq('beep beep')
  end
end

describe 'Tata' do
  it 'should create a Tata Car' do
    expect { Tata.new(1990) }.to_not raise_error
  end
  it 'speeds up by 2 per acceleration' do
    a_tata = Tata.new(2005)
    a_tata.accelerate
    expect(a_tata.speed).to eq 2
  end
  it 'slows down by 1.25 per braking' do
    a_tata = Tata.new(2005)
    a_tata.accelerate
    expect(a_tata.speed).to eq 2
    a_tata.brake
    expect(a_tata.speed).to eq 2 - 1.25
  end
end

describe 'Toyota' do
  it 'should create a Toyota' do
    expect { Toyota.new(1990) }.to_not raise_error
  end
  it 'speeds up by 7 per acceleration' do
    a_toyota = Toyota.new(2005)
    a_toyota.accelerate
    expect(a_toyota.speed).to eq 7
  end
  it 'slows down by 5 per braking' do
    a_toyota = Toyota.new(2005)
    a_toyota.accelerate
    expect(a_toyota.speed).to eq 7
    a_toyota.brake
    expect(a_toyota.speed).to eq 7 - 5
  end
  it 'has a horn that goes honk honk' do
    a_toyota = Toyota.new(2005)
    expect(a_toyota.honk).to eq 'honk honk'
  end
end

describe 'Collection' do
  it 'should create a new collection' do
    expect { Collection.new }.to_not raise_error
  end
  it 'should have an array to hold cars' do
    a_collection = Collection.new
    expect(a_collection.array).to be_a Array
  end
  it 'should put cars in the array' do
    a_collection = Collection.new
    a_car = Toyota.new(1990)
    a_collection.add_car(a_car)
    expect(a_collection.array.length).to eq 1
    expect(a_collection.array[a_collection.array.length - 1]).to be_a Toyota
  end
  it 'can fill the array with two of each vehicle from different years' do
    a_collection = Collection.new
    a_collection.fill
    expect(a_collection.array.length).to eq 6
    expect(a_collection.array.count { |car| car.class == Tesla }).to eq 2
    expect(a_collection.array.count { |car| car.class == Tata }).to eq 2
    expect(a_collection.array.count { |car| car.class == Toyota }).to eq 2
  end
  it 'can sort the cars by year' do
    a_collection = Collection.new
    a_collection.fill
    x = 0
    4.times do
      expect(a_collection.sort_by_year[x].year).to be <= a_collection.sort_by_year[x + 1].year
      x += 1
    end
  end
  it 'can sort the cars by model' do
    a_collection = Collection.new
    a_collection.fill
    x = 0
    4.times do
      expect(a_collection.sort_by_model[x].class.to_s).to be <= a_collection.sort_by_model[x + 1].class.to_s
      x += 1
    end
  end
  it 'can sort by model then year' do
    a_collection = Collection.new
    a_collection.fill
    x = 0
    4.times do
      expect(a_collection.sort_by_model_then_year[x].class.to_s + a_collection.sort_by_model_then_year[x].year.to_s).to be <= a_collection.sort_by_model_then_year[x + 1].class.to_s + a_collection.sort_by_model_then_year[x + 1].year.to_s
      x += 1
    end
  end
end
