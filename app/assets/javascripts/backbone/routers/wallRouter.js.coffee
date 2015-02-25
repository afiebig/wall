class Wall.Routers.WallAppRouter extends Backbone.Marionette.AppRouter
  appRoutes:
    ""            : "frasesIndex"
    "frases/new"  : "showAddingBox"
    "search"      : "searchBox"
    "comment"     : "commentsBox"