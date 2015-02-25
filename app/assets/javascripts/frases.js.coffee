# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.frases = []

window.frases.ultima = null

window.frases.siguiente = ->
  f = @[Math.floor(Math.random() * @length)]
  if f != @ultima then @ultima = f else @siguiente()

window.renderer =
  lastRefreshTime: 0
  forceRefreshOnNextFrame: false
  refreshIntervalPerCharacter: 200
  refreshInterval: ->
    if frases.ultima then frases.ultima.texto.length * @refreshIntervalPerCharacter else 0
  elapsedTimeGreaterThanRefreshInterval: ->
    (new Date().getTime() - @lastRefreshTime) > @refreshInterval()
  frame: ->
    if @forceRefreshOnNextFrame || @elapsedTimeGreaterThanRefreshInterval()
      @refresh()
  refresh: ->
    frase = frases.siguiente()
    @update($('#frase_completa'), frase.texto)
    @update($('#frase_autor'), frase.autor)
    @forceRefreshOnNextFrame = false
    @lastRefreshTime = new Date().getTime()
  update: ($el, text) ->
    $el.fadeOut(500, -> $el.empty().append(text).fadeIn(500))

$(document).ready ->
  $.get '/frases.json', (fs) ->
    frases.push(f) for f in fs
    setInterval (-> renderer.frame()), 200
  $(".someClass").tipTip()
  hideElements = ->
    $('#search-box').fadeOut('200')
    $('#adding-box').fadeOut('200')
    $('#comments-box').fadeOut('200')
  $('.buscar').click ->
    hide_elements();
    $('#search-box').fadeIn('slow')
  $('.agregar').click ->
    hide_elements();
    $('#adding-box').fadeIn('slow')
  $('.comentar').click ->
    hide_elements();
    $('#comments-box').fadeIn('slow')
  $('.otrafrase').click ->
    hideElements()
    renderer.forceRefreshOnNextFrame = true
    renderer.refreshIntervalPerCharacter *= .75
    false
