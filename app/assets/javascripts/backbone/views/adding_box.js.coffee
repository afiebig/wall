class Wall.Views.AddingBox extends Marionette.ItemView
  tagName: "article"

  id: "adding-box"

  template: "#adding-box-template"

  events:
    "ajax:success form#new_frase": "addFrase"

  addFrase: (e, data, status, xhr) =>
    console.log "sucess"
    @collection.add new Wall.Models.Frase(data)
    wallApp.wallappRouter.navigate("", true)

