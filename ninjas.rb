class Ninja
	@@ninjas = []
	attr_reader :name
	attr_accessor :hp, :weapon
	def initialize(name, hp = 100, weapon)
		@name = name
		@hp = hp
		@weapon = weapon
		puts "Welcome #{@name} to the arena."
		@@ninjas.push(name)
	end

	def attack(target)
		damage = @weapon.attack
		target.hp = target.hp - damage
		puts "#{@name} attacks #{target.name} for #{damage}."
		puts "#{target.name}'s reduced to #{target.hp}."
	end

	def ninja_list
		puts "Ninjas in the arena are: #{@@ninjas}"
	end
end

class Weapon
	def initialize(modifier)
		@modifier = modifier
	end

	def attack
		return rand(5) + @modifier
	end
end

class Sword < Weapon
	def initialize
		super(4)
	end
end

class Chucks < Weapon
	def initialize
		super(3)
	end
end

class Staff < Weapon
	def initialize
		super(2)
	end
end

class Sai < Weapon
	def initialize
		super(1)
	end
end

# instantiate new ninjas
ninja_one = Ninja.new('Raphael', 50, Sai.new)
ninja_two = Ninja.new('Michelangelo', 55, Chucks.new)
ninja_three = Ninja.new('Donatello', 60, Staff.new)
ninja_four = Ninja.new('Leonardo', 55, Sword.new)

# see active ninjas list
ninja_one.ninja_list

# Select two ninjas to duel
player_one = ninja_one
player_two = ninja_two

# arena showdown loop - to the death
while player_one.hp > 0 && player_two.hp > 0 
	player_one.attack(player_two)
	player_two.attack(player_one)

	if ninja_one.hp < 0 
		puts "#{player_two.name} won the duel"
	else
		puts "#{player_one.name} won the duel"
	end
end



