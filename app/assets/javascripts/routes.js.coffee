window.Routes = Backbone.Router.extend

  routes:
    '' : 'index'
  
  index: ->
    todos = new TodoList()
    todos.fetch
      success: ->
        new IndexView collection: todos
      error: ->
        new Error message: 'Error loading documents.'

# Start the app when the DOM is loaded
$ ->
  new Routes()
  Backbone.history.start()