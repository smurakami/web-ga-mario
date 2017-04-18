class Util
  @getRatio: (canvas) ->
    context = canvas.getContext('2d')

    devicePixelRatio = window.devicePixelRatio || 1
    backingStoreRatio = context.webkitBackingStorePixelRatio ||
                        context.mozBackingStorePixelRatio ||
                        context.msBackingStorePixelRatio ||
                        context.oBackingStorePixelRatio ||
                        context.backingStorePixelRatio || 1

    ratio = devicePixelRatio / backingStoreRatio;

    return ratio


stageData = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,],
]

stage = null
class Stage
  @width: 20
  @height: 10
  constructor: () ->
    stage = @
    @data = stageData

  draw: ->
    context = game.context
    unit = Game.unit
    for row, y in @data
      for val, x in row
        if val == 0
          context.fillStyle = '#7ecef4'
        else if val == 1
          context.fillStyle = '#7e6b5a'
          context.strokeStyle = 'black'
        context.fillRect x * unit, y * unit, unit, unit
        context.strokeRect x * unit, y * unit, unit, unit

  at: (x, y) ->
    if x.constructor == Point
      y = x.y
      x = x.x
    unit = Game.unit
    x = Math.floor(x / unit)
    y = Math.floor(y / unit)
    if x < 0 || x >= Stage.width || y < 0 || y >= Stage.height
      return 0
    return @data[y][x]

Number.prototype.isField = ->
  return `this == 1`


class Point
  constructor: (x=0, y=0) ->
    if @ == window
      return new Point(x, y)
    @x = x
    @y = y

  @atIndex: (x, y) ->
    unit = Game.unit
    return Point(x * unit + unit/2, y * unit + unit/2)

  toIndex: ->
    x = Math.floor(@x / unit)
    y = Math.floor(@y / unit)
    return Point(x, y)

  addi: (other) ->
    @x += other.x
    @y += other.y

  add: (other) ->
    return Point(@x + other.x, @y + other.y)


class Mario
  constructor: ->
    @pos = Point.atIndex(0, 0)
    @v = Point()
    @size = Point(Game.unit, Game.unit)
    @isJumping = true

    @right = false
    @left = false
    @up = false
    @down = false

  draw: ->
    context = game.context
    context.fillStyle = '#e64141'
    x = @pos.x - @size.x / 2
    y = @pos.y - @size.y / 2
    context.fillRect x, y, @size.x, @size.y

  update: ->
    if @isJumping
      @v.y += Game.gravity

    if @right and @left
      @v.x = 0
    else if @right
      @v.x = 2
    else if @left
      @v.x = -2
    else
      @v.x = 0

    if @up and !@isJumping
      @v.y = -5
      @isJumping = true

    next = @pos.add(@v)

    leftTop = next.add(Point(-@size.x/2 + 1, -@size.y/2))
    rightTop = next.add(Point(@size.x/2 - 1, -@size.y/2))
    centerTop = next.add(Point(0, -@size.y/2))
    leftBottom = next.add(Point(-@size.x/2 + 1, @size.y/2))
    rightBottom = next.add(Point(@size.x/2 - 1, @size.y/2))
    centerBottom = next.add(Point(0, @size.y/2))

    # 左衝突判定
    if stage.at(next.x + @size.x/2, next.y).isField()
      @v.x = 0
      next.x = Math.floor(next.x / Game.unit) * Game.unit + this.size.x/2

    # 右衝突判定
    if stage.at(next.x - @size.x/2, next.y).isField()
      @v.x = 0
      next.x = Math.floor(next.x / Game.unit + 1) * Game.unit - this.size.x/2
      
    leftTop = next.add(Point(-@size.x/2 + 1, -@size.y/2))
    rightTop = next.add(Point(@size.x/2 - 1, -@size.y/2))
    centerTop = next.add(Point(0, -@size.y/2))
    leftBottom = next.add(Point(-@size.x/2 + 1, @size.y/2))
    rightBottom = next.add(Point(@size.x/2 - 1, @size.y/2))
    centerBottom = next.add(Point(0, @size.y/2))

    # 上衝突判定
    if stage.at(centerTop).isField()
      @v.y = 0
      next.y = Math.floor(next.y / Game.unit) * Game.unit + this.size.y/2

    # 下衝突判定
    if stage.at(leftBottom).isField() or stage.at(rightBottom).isField() or stage.at(centerBottom).isField()
      @v.y = 0
      next.y = Math.floor(next.y / Game.unit) * Game.unit + this.size.y/2
      @isJumping = false

    if !stage.at(leftBottom).isField() and !stage.at(rightBottom).isField() and !stage.at(centerBottom).isField()
      @isJumping = true

    @pos = next


game = null
class Game
  @unit: 40
  @width: 1000
  @height: 400
  @gravity: 0.03

  constructor: ->
    game = @
    @initCanvas()
    @stage = new Stage()
    @mario = new Mario()

    setInterval =>
      @update()
      @draw()

  initCanvas: ->
    $canvas = $('<canvas></canvas>')
    $('#main').append($canvas)
    @canvas = $canvas.get(0)
    ratio = Util.getRatio(@canvas)

    @canvas.width = Game.width * ratio
    @canvas.height = Game.height * ratio

    @canvas.style.width = Game.width + 'px'
    @canvas.style.height = Game.height + 'px'

    Game.unit *= ratio
    Game.width *= ratio
    Game.gravity *= ratio

    @context = @canvas.getContext('2d')

  update: ->
    @mario.update()

  draw: ->
    @context.clearRect(0, 0, Game.width, Game.height)
    @stage.draw()
    @mario.draw()

  onLeft: -> @mario.left = true
  onRight: -> @mario.right = true
  onUp: -> @mario.up = true
  onDown: -> @mario.down = true
  offLeft: -> @mario.left = false
  offRight: -> @mario.right = false
  offUp: -> @mario.up = false
  offDown: -> @mario.down = false


$ ->
  new Game()

  $(window).keydown (e) ->
    key = e.keyCode
    if key == 38
      game.onUp()
    if key == 40
      game.onDown()
    if key == 37
      game.onLeft()
    if key == 39
      game.onRight()

  $(window).keyup (e) ->
    key = e.keyCode
    if key == 38
      game.offUp()
    if key == 40
      game.offDown()
    if key == 37
      game.offLeft()
    if key == 39
      game.offRight()

