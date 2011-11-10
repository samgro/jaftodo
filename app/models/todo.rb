class Todo
  include Mongoid::Document
  
  field :text, type: String
  
  def to_json(options = {})
    super options.merge(only: [:id, :ti])
  end
end