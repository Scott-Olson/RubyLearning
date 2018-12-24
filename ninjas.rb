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
		puts target.hp
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
	def attack(multiplier)
		return rand(11)*multiplier
	end
end

class Sword < Weapon
	def attack
		super attack(0.75)
	end
end

class Chucks < Weapon
	def attack
		super attack(0.5)
	end
end

class Staff < Weapon
	def attack
		super attack(0.60)
	end
end

class Sai < Weapon
	def attack
		super attack(0.55)
	end
end




ninja_one = Ninja.new('Raphael', 100, Sai.new)
ninja_two = Ninja.new('Michelangelo', 125, Chucks.new)
ninja_three = Ninja.new('Donatello', 140, Staff.new)
ninja_four = Ninja.new('Leonardo', 110, Sword.new)

ninja_one.attack(ninja_two)


ninja_one.ninja_list