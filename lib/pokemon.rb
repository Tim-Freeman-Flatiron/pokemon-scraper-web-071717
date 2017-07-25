class Pokemon

	attr_accessor :id, :name, :type, :db, :hp

	def initialize(attributes, hp=nil)
		attributes.each {|key, value| self.send(("#{key}="), value)}
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name,type)
	end

	def self.find(id, db)
		attributes = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
		Pokemon.new(id: attributes[0], name: attributes[1], type: attributes[2], hp: attributes[3], db: db)
	end

	def alter_hp(hp, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp, self.id)
	end
		
end
