# Todo model
window.Todo = Backbone.Model.extend
  
  url: ->
    base = 'todos'
    return base if this.isNew()
    base + (if base.charAt(base.length - 1) is '/' then '' else '/') + this.id
  
  defaults: ->
    done:   false
    order:  Todos.nextOrder()
  
  toggle: ->
    this.save(done: !this.get('done'))
  