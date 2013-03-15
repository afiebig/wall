# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.frases = [
  {texto:"Estoy m&aacute;s tieso que la chucha", autor:"Mauro"},
  {texto:"Se la dej&eacute; puesta",autor:"Abraham a Jano"},
  {texto:"Es como un temblor, pero en ti", autor:"Victor (El dostor)"},
  {texto:"Pero lo bueno es que es chico", autor:"Rodrigo Ayala"},
  {texto:"Si quieres una wea sensible, entonces cons&iacute;guete una mina", autor:"Victor (El dostor)"},
  {texto:"Ma&ntilde;ana te lo traigo calientito",autor:"Ricardo Jara"},
  {texto:"Hay que mostrar los huevos",autor:"Ricardo Jara"},
  {texto:"S&aacute;calo todo", autor:"Jano a Jorge"},
  {texto:"P&aacute;sala no m&aacute;s... suavecita", autor:"Mauro"},
  {texto:"Mauro est&aacute; tampoco", autor:"Leo"},
  {texto:"Mis manos trabajan mucho m&aacute;s lento que tu boca", autor:"Jorge"},
  {texto:"Nooo, si la mia es cortita", autor:"Camilo a Rodrigo"},
  {texto:"&iquest;Que lado te gusta?", autor:"Abraham a Jano"},
  {texto:"Buena clav&aacute; ah?", autor:"Mauro a Jano"},
  {texto:"El Mauro es mi bestia negra", autor:"Jano"},
  {texto:"Oh, que es chiquitito!", autor:"Mar&iacute;a Jos&eacute; a Victor"},
  {texto:"Cuando me caliento... juego!", autor:"Rodrigo a Coto"},
  {texto:"Es que cuando cambias de mano, igual se para!", autor:"Rodrigo"},
  {texto:"Abraham prodr&iacute;a presentar la herramienta", autor:"Mauro"},
  {texto:"El Alter me caga, pero rico!", autor:"Mauro"},
  {texto:"Yo la probar&iacute;a...", autor:"Leo (a la herramienta de Abraham)"},
  {texto:"&iquest;Te lo presto?", autor:"Abraham a Rodrigo"},
  {texto:"&iexcl;En la ma&ntilde;ana entra todo!",autor:"Mauro a todos"},
  {texto:"A lo mejor, te pod&iacute;s comer uno entero", autor:"Victor (el dostor)"},
  {texto:"Mmm, igual es grande!", autor:"Camilo a Jose Alfredo"},
  {texto:"&iexcl;Te pis&eacute; pero brigido!", autor:"Mauro a Abraham"},
  {texto:"&iquest;Que apostamos?... Algo que no sea plata pos!", autor:"Ricardo"},
  {texto:"Si fueran de confianza...", autor:"Alter"},
  {texto:"Quiero que me mostris ese...", autor:"Camilo a Rodrigo"},
  {texto:"Ricardo, lo tuyo es chico", autor:"Mauro"},
  {texto:"Yo la puse ayer", autor:"Ricardo"},
  {texto:"Yo la tengo en el piso",autor:"Victor"},
  {texto:"Filho da puta", autor:"Thais"},
	{texto:"Ferrari, tienes minas? -Si- ¿Pestame una?", autor:"Ricardos a Cristian"},
  {texto:"Yo lo quiero completo",autor:"Edu"},
  {texto:"Te dej&oacute; paradito la pastilla ah?", autor:"Rodrigo a Abraham"},
  {texto:"Quiero probarlo", autor:"Edu"},
  {texto:"A mi me la cortaron", autor:"Mauro"},
  {texto:"&iexcl;Te amo!", autor:"Sven a Edu"},
  {texto:"&iexcl;Qued&eacute; en cuatro! ... A todos nos pasa alguna vez", autor:"Camilo"},
  {texto:"Ma&ntilde;ana me van a hacer bolsa entre todos", autor:"Rodrigo"},
  {texto:"En la ma&ntilde;ana estaba caliente", autor:"Rodrigo"},
  {texto:"En casos extremos, me la como adentro de la bolsa", autor:"Rodrigo"},
  {texto:"Te la como yo", autor:"Cristian"},
  {texto:"No tengo un palo pa' jugar", autor:"Miguel"},
  {texto:"Mira como le tirita la cuerda", autor:"Rodrigo al limpiador de vidrios"},
  {texto:"Siento que me quemo por dentro", autor:"Rodrigo"},
  {texto:"Me comer&iacute;a un pedazo de carne as&iacute;... no, me comer&iacute;a un caballo", autor:"Rodrigo"},
  {texto:"Despu&eacute;s me di cuenta que me gustaban los largos", autor:"Jorge Boss"},
  {texto:"Lo m&iacute;o es m&aacute;s corto", autor:"Ricardos"},
  {texto:"Es cortito pero nunca tanto", autor:"Abraham"},
  {texto:"Es dificil tocar una we&aacute; chica", autor:"Rodrigo"},
  {texto:"Yo me quedo con tu chuleta", autor:"Rodrigo"},
  {texto:"Yo soy el que hace que tu we&aacute; se mueva", autor:"Jorge a Cristian"},
  {texto:"Tu cachai que el Leo nos paga por su pedazo", autor:"Ricardo"},
  {texto:"Ya, ch&aacute;ntamelo como un chore", autor:"Rodrigo"},
  {texto:"A ti no te daban cuando chico?... No!", autor:"Rodrigo a Edu"},
  {texto:"Te la puse justo entremedio de la manga", autor:"Abraham a Mauro"},
  {texto:"Verdad, yo se las vi al Alter", autor:"Rodrigo"},
  {texto:"Lo tengo insertado...", autor:"Rodrigo"},
  {texto:"El mio quedó chico al lado del tuyo", autor:"Rodrigo"},
  {texto:"Igual se pega sus pajeos", autor:"Abraham"},
  {texto:"Me daba la paja a cada rato", autor:"Victor (el dostor)"}
]

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
      console.log('refresh')
      @refresh()
    else
      console.log('idle')
  refresh: ->
    frase = frases.siguiente()
    @update($('#frase_completa'), frase.texto)
    @update($('#frase_autor'), frase.autor)
    @forceRefreshOnNextFrame = false
    @lastRefreshTime = new Date().getTime()
  update: ($el, text) ->
    $el.fadeOut(500, -> $el.empty().append(text).fadeIn(500))

$(document).ready ->
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
