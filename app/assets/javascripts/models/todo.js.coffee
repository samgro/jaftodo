# Todo model
window.Todo = Backbone.Model.extend
  
  # Rails as_json returns _id for mongo by default - should probably fix this
  # on the server eventually
  initialize: ->
    this.set id: this.get('_id')
  
  url: ->
    base = 'todos'
    return base if this.isNew()
    base + (if base.charAt(base.length - 1) is '/' then '' else '/') + this.id
  
  defaults: ->
    done:   false
    order:  Todos.nextOrder()
  
  toggle: ->
    this.save(done: !this.get('done'))
  