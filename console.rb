require_relative('./models/pet')
require_relative('./models/pet_store')

require( 'pry-byebug' )

pet_central = PetStore.new( {'name' => "Pet Central", 'address' => "21 Hayway Road, Glasgow", 'stock_type' => "exotic"} )

pet_central.save

pet1 = Pet.new( {'name' => 'Jack', 'type' => 'Snake', 'pet_store_id' => pet_central.id} )
pet1.save


binding.pry
nil