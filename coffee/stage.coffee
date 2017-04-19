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

  @randomBool: ->
    return Math.random() > 0.5

  @randomInt: (max) ->
    return Math.floor(Math.random() * max)

  @randomColor: ->
    color_elem = [
      255,
      Util.randomInt(255),
      0,
    ]
    color_r_index = Util.randomInt(3)
    r_bin = Util.randomInt(2)
    color_g_index = (color_r_index + 1 +  r_bin) % 3
    color_b_index = (color_r_index + 1 + !r_bin) % 3
    # // openFrameworksの色構造体に色を格納
    # // color.set(red, green, blue);で色を作成できる
    # ofColor color;
    # color.set(color_elem[color_r_index], color_elem[color_g_index], color_elem[color_b_index]);
    return "rgb(#{color_elem[color_r_index]}, #{color_elem[color_g_index]}, #{color_elem[color_b_index]})"

  @sum: (array) ->
    sum = 0
    for val in array
      sum += val
    return sum



stageData = [
  [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]],
  [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ]
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ]
  ],
  [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ]
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ]
  ],
  [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ]
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ]
  ],
]

stage = null
class Stage
  # @width: stageData[0].length
  # @height: stageData.length
  constructor: () ->
    stage = @
    @current = 0
    @data = stageData[@current]

  selectNext: () ->
    @current += 1
    if @current >= stageData.length
      @current = 0
    console.log @current
    @data = stageData[@current]

  selectPrev: () ->
    @current -= 1
    if @current < 0
      @current = stageData.length - 1
    console.log @current
    @data = stageData[@current]

  draw: ->
    context = game.context
    unit = Game.unit
    start = Math.floor(game.pos.x / Game.unit)
    if start < 0
      start = 0
    end = start + 27
    if end >= @cols()
      end = @cols() - 1
    for row, yi in @data
      for xi in [start...end]
        val = row[xi]
        if val == 0
          context.fillStyle = '#7ecef4'
        else if val == 1
          context.fillStyle = '#7e6b5a'
          context.strokeStyle = 'black'
        x = xi * unit
        y = yi * unit
        x -= game.pos.x
        y -= game.pos.y
        context.fillRect x, y, unit, unit
        context.strokeRect x, y, unit, unit

  cols: ->
    @data[0].length

  rows: ->
    @data.length

  at: (x, y) ->
    if x.constructor == Point
      y = x.y
      x = x.x
    unit = Game.unit
    x = Math.floor(x / unit)
    y = Math.floor(y / unit)
    if x < 0 || x >= @data[0].length || y < 0 || y >= @data.length
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
    unit = Game.unit
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
    @pos = Point.atIndex(2, 2)
    @v = Point()
    @size = Point(Game.unit, Game.unit)
    @isJumping = true

    @right = false
    @left = false
    @up = false
    @prev_up = false
    @down = false

    @color = '#e64141'

    @max_x = 0
    @deadCounter = 0
    @isDead = false

  draw: ->
    context = game.context
    context.fillStyle = @color
    x = @pos.x - @size.x / 2
    y = @pos.y - @size.y / 2
    x -= game.pos.x
    y -= game.pos.y
    context.fillRect x, y, @size.x, @size.y

  update: ->
    if @pos.x > @max_x
      @max_x = @pos.x
      @deadCounter = 0
    else
      @deadCounter++

    if @deadCounter > 150
      @isDead = true

    if @pos.y > stage.rows() * Game.unit
      @isDead = true

    if @isDead
      return

    if @isJumping
      @v.y += Game.gravity

    if @right and @left
      @v.x = 0
    else if @right
      @v.x = Game.unit / 40
    else if @left
      @v.x = -Game.unit / 40
    else
      @v.x = 0

    if @up and !@isJumping
      @v.y = - Game.unit / 16
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
    @prev_up = @up


class GeneUnit
  constructor: (left, up, right) ->
    if this == window
      return new GeneUnit(left, up, right)
    @left = left
    @up = up
    @right = right

  copy: ->
    return GeneUnit(@left, @up, @right)


  @random: ->
    return GeneUnit(Util.randomBool(), Util.randomBool(), Util.randomBool())


class Gene
  # 遺伝子設計
  # 入力
  # 2 3 4
  # 1 x 5
  # 0   6
  # 
  # 7: 接地情報
  # 
  # 出力
  # left up rightの三桁 -> 0 - 7

  constructor: ->
    window.gene = @
    @data = (GeneUnit.random() for i in [0...Math.pow(2, 7)])
    @mario = new Mario()
    @mario.color = Util.randomColor()

  copy: ->
    gene = new Gene()
    gene.data = (unit.copy() for unit in @data)
    return gene

  getMap: ->
    pos = @mario.pos
    size = @mario.size

    leftBottom  = stage.at(pos.x - size.x, pos.y + size.y)
    leftCenter  = stage.at(pos.x - size.x, pos.y)
    leftTop     = stage.at(pos.x - size.x, pos.y - size.y)
    centerTop   = stage.at(pos.x, pos.y - size.y)
    rightTop    = stage.at(pos.x + size.x, pos.y - size.y)
    rightCenter = stage.at(pos.x + size.x, pos.y)
    rightBottom = stage.at(pos.x + size.x, pos.y + size.y)

    array = [leftBottom, leftCenter, leftTop, centerTop, rightTop, rightCenter, rightBottom]
    # console.log array
    sum = 0
    for val in array
      sum = sum * 2 + val
    return sum

  update: ->
    # console.log "map: #{@getMap()}"
    val = @getMap()
    # console.log(val)
    geneunit = @data[val]
    if not geneunit?
      console.log val
      console.log ('undefiend')
      return
    @mario.up = geneunit.up
    @mario.left = geneunit.left
    @mario.right = geneunit.right
    @mario.update()

  draw: ->
    @mario.draw()


class GA
  constructor: ->
    @size = 128
    @current = (new Gene for i in [0...@size])
    @counter = 0

  update: ->
    max = Math.min(@counter, @size-1)

    for gene in @current[0..max]
      gene.update()

    finished = true
    sum = 0
    for gene in @current
      sum += gene.mario.isDead
      if !gene.mario.isDead
        finished = false

    if finished
      @nextGenerateion()
      return

    @counter++

  draw: ->
    max = Math.min(@counter, @size-1)
    for gene in @current[0...max]
      gene.draw()


  getScore: (gene) ->
    score = gene.mario.pos.x
    if score < 0
      score = 0
    return score * score

  nextGenerateion: ->
    scores = (@getScore(gene) for gene in @current)
    next = []
    for i in [0...@size]
      dice = Util.randomInt(100)
      if dice < 70
        child = @cross(@roulette(scores), @roulette(scores))
      else if dice < 96
        child = @copy(@roulette(scores))
      else
        child = @mutate(@roulette(scores))
      next.push(child)

    @current = next
    @counter = 0

  roulette: (scores) ->
    min = Math.min.apply(Math, scores)
    scores = (score - min for score in scores)
    sum = Util.sum(scores)
    dice = Math.random() * sum

    current = 0

    for score, index in scores
      current += score
      if current > dice
        return @current[index]
    console.log 'ルーレットミス'
    return ksdfa

  mutate: (gene) ->
    a = Util.randomInt(gene.data.length)
    b = Util.randomInt(gene.data.length)
    begin = Math.min(a, b)
    end = Math.max(a, b) + 1

    child = new Gene()

    for i in [begin..end]
      child.data[i] = GeneUnit.random()

    return child

  cross: (a, b) ->
    x = Util.randomInt(gene.data.length)

    child = new Gene()
    for i in [0...x]
      child.data[i] = a.data[i].copy()
    for i in [x...child.data.length]
      child.data[i] = b.data[i].copy()
    return child

  copy: (gene) ->
    return gene.copy()


game = null
class Game
  @unit: 40
  @width: 1000
  @height: 400
  @gravity: 0.03
  @playerEnabled: false
  @ratio: 1

  constructor: ->
    game = @
    @initCanvas()
    @stage = new Stage()
    if Game.playerEnabled
      @mario = new Mario()
    # @gene = new Gene()
    # @ga = new GA()

    @pos = Point()

    @left = false
    @right = false

    setInterval =>
      @update()
      @draw()

  initCanvas: ->
    $canvas = $('<canvas></canvas>')
    $('#main').append($canvas)
    @canvas = $canvas.get(0)
    ratio = Util.getRatio(@canvas)

    Game.ratio = ratio

    @canvas.width = Game.width * ratio
    @canvas.height = Game.height * ratio

    @canvas.style.width = Game.width + 'px'
    @canvas.style.height = Game.height + 'px'

    Game.unit *= ratio
    Game.width *= ratio
    Game.gravity *= ratio

    @context = @canvas.getContext('2d')

  update: ->
    if Game.playerEnabled
      @mario.update()

    if @left
      @pos.x -= Game.unit / 20

    if @right
      @pos.x += Game.unit / 20

    # @ga.update()

  draw: ->
    @context.clearRect(0, 0, Game.width * 2, Game.height * 2)
    @stage.draw()
    if Game.playerEnabled
      @mario.draw()
    # @gene.draw()
    # @ga.draw()

  onLeft: ->
    @left = true
    if Game.playerEnabled
      @mario.left = true
  onRight: ->
    @right = true
    if Game.playerEnabled
      @mario.right = true
  onUp: ->
    if Game.playerEnabled
      @mario.up = true
    else
      stage.selectPrev()
  onDown: ->
    if Game.playerEnabled
      @mario.down = true
    else
      stage.selectNext()
  offLeft: ->
    @left = false
    if Game.playerEnabled
      @mario.left = false
  offRight: ->
    @right = false
    if Game.playerEnabled
      @mario.right = false
  offUp: ->
    if Game.playerEnabled
      @mario.up = false
  offDown: ->
    if Game.playerEnabled
      @mario.down = false



$ ->
  new Game()

  down = false
  $('#main').mousedown (e) ->
    console.log e
    down = true
    draw(e)

  $('#main').mouseup (e) ->
    console.log e
    down = false

  $('#main').mousemove (e) ->
    if down
      draw(e)

  mode = 1

  draw = (e) ->
    x = e.offsetX * Game.ratio + game.pos.x
    y = e.offsetY * Game.ratio + game.pos.y
    p = Point(x, y)
    pi = p.toIndex()

    console.log pi

    stage.data[pi.y][pi.x] = mode

    $('.stage_json').val JSON.stringify(stage.data)

  $('.button').click ->
    window.location = '/?stage=' + encodeURI(JSON.stringify(stage.data))


  $(window).keydown (e) ->
    if e.key == 'ArrowUp'
      game.onUp()
    if e.key == 'ArrowDown'
      game.onDown()
    if e.key == 'ArrowLeft'
      game.onLeft()
    if e.key == 'ArrowRight'
      game.onRight()

    if e.key == 'g'
      game.ga.nextGenerateion()

    if e.key == '1' or e.key == 'd'
      mode = 1

    if e.key == '0' or e.key == 'e'
      mode = 0

  $(window).keyup (e) ->
    if e.key == 'ArrowUp'
      game.offUp()
    if e.key == 'ArrowDown'
      game.offDown()
    if e.key == 'ArrowLeft'
      game.offLeft()
    if e.key == 'ArrowRight'
      game.offRight()


