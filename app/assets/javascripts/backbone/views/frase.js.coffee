class Wall.Views.Frase extends Marionette.ItemView
  template: "#frase-template"

  initialize: (options)->
    @model = @collection.last()
    @model ?= new Wall.Models.Frase(texto: "", autor: "")
    @collection.on "reset", @renderNextModel

  renderNextModel: =>
    @model = @collection.siguiente()
    @render()

  onRender: =>
    @$('#frase_completa').hide()
    @$('#frase_autor').hide()
    @update @$('#frase_completa'), @model.get("texto")
    @update @$('#frase_autor'), @model.get("autor")

  update: ($el, text) ->
    $el.fadeOut(500, -> $el.empty().append(text).fadeIn(500))


class Wall.Views.FrasesSliderRegion extends Marionette.Region
  el: "#frase"

  lastRefreshTime: 0
  forceRefreshOnNextFrame: false
  refreshIntervalPerCharacter: 200

  refreshInterval: ->
    if @collection.ultima then @collection.ultima.get("texto").length * @refreshIntervalPerCharacter else 0

  elapsedTimeGreaterThanRefreshInterval: ->
    (new Date().getTime() - @lastRefreshTime) > @refreshInterval()

  frame: ->
    if @forceRefreshOnNextFrame || @elapsedTimeGreaterThanRefreshInterval()
      @refresh()

  refresh: ->
    @currentFraseView.renderNextModel()
    @forceRefreshOnNextFrame = false
    @lastRefreshTime = new Date().getTime()

  startPresentation: =>
    @currentFraseView = new Wall.Views.Frase(collection: @collection)
    @show @currentFraseView
    this_region = @
    setInterval (-> this_region.frame()), 200


