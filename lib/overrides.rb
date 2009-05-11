module DataMapper
  module Model

    def delete(id)
      model = self.find_by_id(id)
      model.destroy if model
    end
    
  end
end
