SeedFile
=========

Create ActiveRecord objects using a CSV file.

### Usage

As an example, let's use the following CSV file and `Car` class to seed the database. The first row of the CSV file must be the attribute names.

data.csv
```
Brand,Model,Year,Price
BMW,3 Series,2014,32750
Mercedes-Benz,CLA-Class,2014,29990
Audi,A4,2014,33800
```

car.rb
```rb
class Car < ActiveRecord::Base
end
```

Nothing in the database.
```rb
>> Car.all
=> #<ActiveRecord::Relation []>
```

Create a new SeedFile instance. Pass in the path to the CSV and the model.
```rb
>> data = SeedFile.new(path: 'data.csv', model: Car)
```

`seed!` it.
```
>> data.seed!
```

Database is populated with data from the file.
```rb
>> Car.all
=> #<ActiveRecord::Relation [#<Car id: 1, brand: "BMW", model: "3 Series", year: 2014, price: 32750>, #<Car id: 2, brand: "Mercedes-Benz", model: "CLA-Class", year: 2014, price: 29990>, #<Car id: 3, brand: "Audi", model: "A4", year: 2014, price: 33800>]>
```
