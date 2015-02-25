#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Wall =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

class Wall.App extends Backbone.Marionette.Application

  initModels: =>
    @frases = new Wall.Collections.Frases()
    @frase.collection = @frases
    @frases.fetch()

  initViews: =>
    @actions = new Wall.Views.ActionsView()

  frasesIndex: =>
    @closeAll()
    @frase.startPresentation()

  showAddingBox: =>
    @closeAll()
    @addingBox = new Wall.Views.AddingBox(collection: @frases)
    @hiddenSections.show @addingBox

  searchBox: =>
    @closeAll()
    @searchBoxView = new Wall.Views.SearchBox(collection: @frases)
    @hiddenSections.show @searchBoxView

  commentsBox: =>
    @closeAll()
    @commentsBoxView = new Wall.Views.CommentsBox()
    @hiddenSections.show @commentsBoxView

  closeAll: =>
    @frase.close()
    @hiddenSections.close()


window.wallApp = wallApp = new Wall.App()

wallApp.addInitializer (options) ->
  wallApp.addRegions
    frase: Wall.Views.FrasesSliderRegion
    hiddenSections: "#hidden-sections"

  wallApp.initModels()
  wallApp.initViews()

wallApp.addInitializer (options) ->
  @wallappRouter = new Wall.Routers.WallAppRouter
    controller: wallApp

  Backbone.history.start()


$(document).on "ready", ->
  wallApp.start()
  $(".someClass").tipTip()