class Wall.Models.Frase extends Backbone.Model
  idAttribute: "_id"
  url: "/frases"

class Wall.Collections.Frases extends Backbone.Collection
  model: Wall.Models.Frase
  url: "/frases"

  initialize: (options) ->
    @ultima = null

  siguiente: =>
    f = @at(Math.floor(Math.random() * @length))
    if f != undefined
      if f != @ultima then @ultima = f else @siguiente()
    else
      new Wall.Models.Frase(texto: "", autor: "")