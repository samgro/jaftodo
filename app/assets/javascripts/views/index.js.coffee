# Create a new todo list
window.Todos = new TodoList

# Todo item view
window.TodoView = Backbone.View.extend
  
  tagName: 'li'
  
  template: _.template($('#item-template').html())
  
  events:
    'click .check'            : 'toggleDone'
    'dblclick div.todo-text'  : 'edit'
    #'click span.todo-destroy' : 'clear'
    #'keypress .todo-input'    : 'updateOnEnter'
  
  initialize: ->
    this.model.bind 'change', this.render, this
    this.model.bind 'destroy', this.remove, this
  
  render: ->
    $(this.el).html(this.template(this.model.toJSON()))
    this.setText()
    this
  
  setText: ->
    text = this.model.get 'text'
    this.$('.todo-text').text(text)
    # this.input = this.$('.todo-input')
    # this.input.bind('blur', _.bind(this.close, this)).val(text)
  
  toggleDone: ->
    this.model.toggle()
  
  edit: ->
    $(this.el).addClass('editing')
    this.input.focus()
  

window.IndexView = Backbone.View.extend
  
  el: $('#todoapp')
  
  statsTemplate: _.template($('#stats-template').html())
  
  events:
    'keypress #new-todo'  : 'createOnEnter'
  
  initialize: ->
    this.input = this.$('#new-todo')
    window.Todos = this.options.collection
    Todos.bind('add',   this.addOne, this)
    Todos.bind('reset', this.addAll, this)
    Todos.bind('all',   this.render, this)
    
    this.render()
    # Todos.fetch()
  
  render: ->
    this.$('#todo-stats').html this.statsTemplate
      total:      Todos.length
      done:       Todos.done().length
      remaining:  Todos.remaining().length
  
  addOne: (todo)->
    view = new TodoView(model: todo)
    this.$('#todo-list').append(view.render().el)
  
  addAll: ->
    Todos.each(this.addOne)
  
  createOnEnter: (e)->
    text = this.input.val()
    if (text? and e.keyCode is 13)
      Todos.create text: text
      this.input.val('')
