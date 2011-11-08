# Collection of Todos
window.TodoList = Backbone.Collection.extend
  model:  Todo  
  url:    '/todos'
      
  done: ->
    this.filter (todo)-> todo.get('done')
  
  remaining: ->
    this.without.apply(this, this.done())
  
  nextOrder: ->
    return 1 if !this.length
    return this.last().get('order') + 1
  
  comparator: (todo)->
    todo.get('order')

