class IdGenerator
    @@id = 0
  
    def self.generate_id
      @@id += 1
    end
  end
  