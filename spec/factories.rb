Factory.define :line_item do |f|
  f.description Faker::Company.catch_phrase
  f.price 10.00
  f.quantity 1.0
  f.association :statement, :factory => :statement
end

Factory.define :recipient do |f|
  f.name Faker::Name.name
end

Factory.define :statement do |f|
  f.number(1..99999).to_a.random_element
end

