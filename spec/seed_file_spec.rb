require 'spec_helper'

class Car < ActiveRecord::Base
end

describe SeedFile do
  before :each do
    path = 'spec/seed_data.csv'
    model = Car
    @seedfile = SeedFile.new(path: path, model: model)
  end

  it 'takes a path and model' do
    expect(@seedfile.path).to eql 'spec/seed_data.csv'
    expect(@seedfile.model).to eql Car
  end

  it 'creates ActiveRecord objects' do
    expect(Car.all.length).to eql 0
    @seedfile.seed!
    expect(Car.find(1).brand).to eql 'BMW'
    expect(Car.find(1).model).to eql '3 Series'
    expect(Car.find(1).year).to eql 2014
    expect(Car.find(1).price.to_f).to eql 32750.0
    expect(Car.find(2).brand).to eql 'Mercedes-Benz'
    expect(Car.find(2).model).to eql 'CLA-Class'
    expect(Car.find(2).year).to eql 2014
    expect(Car.find(2).price.to_f).to eql 29990.0
    expect(Car.find(3).brand).to eql 'Audi'
    expect(Car.find(3).model).to eql 'A4'
    expect(Car.find(3).year).to eql 2014
    expect(Car.find(3).price.to_f).to eql 33800.0
  end

end
