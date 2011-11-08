# Todo model
window.Todo = Backbone.Model.extend
  
  defaults: ->
    done:   false
    order:  Todos.nextOrder()
  
  toggle: ->
    this.save(done: !this.get('done'))
  