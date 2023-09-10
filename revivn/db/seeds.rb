# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if !Org.exists?(1)
  org = Org.create(name: "Techstump", address: "1234 Emry St.", city: "Renton", state: "WA", zip: "98032")
end

if !User.exists?(1)
  User.create(first_name: "Bob", last_name: "Uldrich", org: org)
end

if !HardwareType.exists?(1)
  HardwareType.create(name: "Laptops/Desktops")
end
if !HardwareType.exists?(2)
  HardwareType.create(name: "Networking")
end
if !HardwareType.exists?(3)
  HardwareType.create(name: "Cables/Peripherals")
end
if !HardwareType.exists?(4)
  HardwareType.create(name: "Misc.")
end

status_length = PickupStatus.where(id: 1).or(PickupStatus.where(id: 2))
  .or(PickupStatus.where(id: 3))
  .or(PickupStatus.where(id: 4)).length

puts status_length

if status_length != 4
  PickupStatus.create([
    { name: "requested" },
    { name: "confirmed" },
    { name: "inprogress" },
    { name: "complete" },
  ])
end
