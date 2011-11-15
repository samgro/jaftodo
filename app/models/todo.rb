class Todo
  include Mongoid::Document
  
  field :text,  type: String
  field :order, type: Integer
  field :done,  type: Boolean
  
  def as_json(options = {})
    super options.merge(only: [:_id, :text, :done, :order])
  end
end