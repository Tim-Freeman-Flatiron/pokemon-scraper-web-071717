class Pokemon

	attr_accessor :id, :name, :type, :db, :hp

	def initialize(attributes, hp=nil)
		attributes.each {|key, value| self.send(("#{key}="), value)}
		@hp = hp
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name,type)
	end

	def self.find(id, db)
		name = db.execute("SELECT name FROM pokemon WHERE id = (?)", id).flatten[0]
		type = db.execute("SELECT type FROM pokemon WHERE pokemon.id = (?)", id).flatten[0]

		Pokemon.new(id: id, name: name, type: type, hp: 60)
		#attributes = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
		#Pokemon.new(id: attributes[0], name: attributes[1], type: attributes[2])
	end

		
end
