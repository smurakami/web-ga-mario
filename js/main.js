// Generated by CoffeeScript 1.12.2
(function() {
  var Game, Mario, Point, Stage, Util, game, stage, stageData;

  Util = (function() {
    function Util() {}

    Util.getRatio = function(canvas) {
      var backingStoreRatio, context, devicePixelRatio, ratio;
      context = canvas.getContext('2d');
      devicePixelRatio = window.devicePixelRatio || 1;
      backingStoreRatio = context.webkitBackingStorePixelRatio || context.mozBackingStorePixelRatio || context.msBackingStorePixelRatio || context.oBackingStorePixelRatio || context.backingStorePixelRatio || 1;
      ratio = devicePixelRatio / backingStoreRatio;
      return ratio;
    };

    return Util;

  })();

  stageData = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]];

  stage = null;

  Stage = (function() {
    Stage.width = 20;

    Stage.height = 10;

    function Stage() {
      stage = this;
      this.data = stageData;
    }

    Stage.prototype.draw = function() {
      var context, i, len, ref, results, row, unit, val, x, y;
      context = game.context;
      unit = Game.unit;
      ref = this.data;
      results = [];
      for (y = i = 0, len = ref.length; i < len; y = ++i) {
        row = ref[y];
        results.push((function() {
          var j, len1, results1;
          results1 = [];
          for (x = j = 0, len1 = row.length; j < len1; x = ++j) {
            val = row[x];
            if (val === 0) {
              context.fillStyle = '#7ecef4';
            } else if (val === 1) {
              context.fillStyle = '#7e6b5a';
              context.strokeStyle = 'black';
            }
            context.fillRect(x * unit, y * unit, unit, unit);
            results1.push(context.strokeRect(x * unit, y * unit, unit, unit));
          }
          return results1;
        })());
      }
      return results;
    };

    Stage.prototype.at = function(x, y) {
      var unit;
      if (x.constructor === Point) {
        y = x.y;
        x = x.x;
      }
      unit = Game.unit;
      x = Math.floor(x / unit);
      y = Math.floor(y / unit);
      if (x < 0 || x >= Stage.width || y < 0 || y >= Stage.height) {
        return 0;
      }
      return this.data[y][x];
    };

    return Stage;

  })();

  Number.prototype.isField = function() {
    return this == 1;
  };

  Point = (function() {
    function Point(x, y) {
      if (x == null) {
        x = 0;
      }
      if (y == null) {
        y = 0;
      }
      if (this === window) {
        return new Point(x, y);
      }
      this.x = x;
      this.y = y;
    }

    Point.atIndex = function(x, y) {
      var unit;
      unit = Game.unit;
      return Point(x * unit + unit / 2, y * unit + unit / 2);
    };

    Point.prototype.toIndex = function() {
      var x, y;
      x = Math.floor(this.x / unit);
      y = Math.floor(this.y / unit);
      return Point(x, y);
    };

    Point.prototype.addi = function(other) {
      this.x += other.x;
      return this.y += other.y;
    };

    Point.prototype.add = function(other) {
      return Point(this.x + other.x, this.y + other.y);
    };

    return Point;

  })();

  Mario = (function() {
    function Mario() {
      this.pos = Point.atIndex(0, 0);
      this.v = Point();
      this.size = Point(Game.unit, Game.unit);
      this.isJumping = true;
      this.right = false;
      this.left = false;
      this.up = false;
      this.down = false;
    }

    Mario.prototype.draw = function() {
      var context, x, y;
      context = game.context;
      context.fillStyle = '#e64141';
      x = this.pos.x - this.size.x / 2;
      y = this.pos.y - this.size.y / 2;
      return context.fillRect(x, y, this.size.x, this.size.y);
    };

    Mario.prototype.update = function() {
      var centerBottom, leftBottom, next, rightBottom;
      if (this.isJumping) {
        this.v.y += Game.gravity;
      }
      if (this.right && this.left) {
        this.v.x = 0;
      } else if (this.right) {
        this.v.x = 2;
      } else if (this.left) {
        this.v.x = -2;
      } else {
        this.v.x = 0;
      }
      if (this.up && !this.isJumping) {
        this.v.y = -5;
        this.isJumping = true;
      }
      next = this.pos.add(this.v);
      if (stage.at(next.x + this.size.x / 2, next.y).isField()) {
        this.v.x = 0;
        next.x = Math.floor(next.x / Game.unit) * Game.unit + this.size.x / 2;
      }
      leftBottom = next.add(Point(-this.size.x / 2, this.size.y));
      rightBottom = next.add(Point(this.size.x / 2, this.size.y));
      centerBottom = next.add(Point(0, this.size.y));
      if (stage.at(next.x - this.size.x / 2, next.y).isField()) {
        this.v.x = 0;
        next.x = Math.floor(next.x / Game.unit + 1) * Game.unit - this.size.x / 2;
      }
      leftBottom = next.add(Point(-this.size.x / 2 + 1, this.size.y / 2));
      rightBottom = next.add(Point(this.size.x / 2 - 1, this.size.y / 2));
      centerBottom = next.add(Point(0, this.size.y / 2));
      if (stage.at(leftBottom).isField() || stage.at(rightBottom).isField() || stage.at(centerBottom).isField()) {
        this.v.y = 0;
        next.y = Math.floor(next.y / Game.unit) * Game.unit + this.size.y / 2;
        this.isJumping = false;
      }
      if (!stage.at(leftBottom).isField() && !stage.at(rightBottom).isField() && !stage.at(centerBottom).isField()) {
        this.isJumping = true;
      }
      return this.pos = next;
    };

    return Mario;

  })();

  game = null;

  Game = (function() {
    Game.unit = 40;

    Game.width = 1000;

    Game.height = 400;

    Game.gravity = 0.03;

    function Game() {
      game = this;
      this.initCanvas();
      this.stage = new Stage();
      this.mario = new Mario();
      setInterval((function(_this) {
        return function() {
          _this.update();
          return _this.draw();
        };
      })(this));
    }

    Game.prototype.initCanvas = function() {
      var $canvas, ratio;
      $canvas = $('<canvas></canvas>');
      $('#main').append($canvas);
      this.canvas = $canvas.get(0);
      ratio = Util.getRatio(this.canvas);
      this.canvas.width = Game.width * ratio;
      this.canvas.height = Game.height * ratio;
      this.canvas.style.width = Game.width + 'px';
      this.canvas.style.height = Game.height + 'px';
      Game.unit *= ratio;
      Game.width *= ratio;
      Game.gravity *= ratio;
      return this.context = this.canvas.getContext('2d');
    };

    Game.prototype.update = function() {
      return this.mario.update();
    };

    Game.prototype.draw = function() {
      this.context.clearRect(0, 0, Game.width, Game.height);
      this.stage.draw();
      return this.mario.draw();
    };

    Game.prototype.onLeft = function() {
      return this.mario.left = true;
    };

    Game.prototype.onRight = function() {
      return this.mario.right = true;
    };

    Game.prototype.onUp = function() {
      return this.mario.up = true;
    };

    Game.prototype.onDown = function() {
      return this.mario.down = true;
    };

    Game.prototype.offLeft = function() {
      return this.mario.left = false;
    };

    Game.prototype.offRight = function() {
      return this.mario.right = false;
    };

    Game.prototype.offUp = function() {
      return this.mario.up = false;
    };

    Game.prototype.offDown = function() {
      return this.mario.down = false;
    };

    return Game;

  })();

  $(function() {
    new Game();
    $(window).keydown(function(e) {
      var key;
      key = e.keyCode;
      if (key === 38) {
        game.onUp();
      }
      if (key === 40) {
        game.onDown();
      }
      if (key === 37) {
        game.onLeft();
      }
      if (key === 39) {
        return game.onRight();
      }
    });
    return $(window).keyup(function(e) {
      var key;
      key = e.keyCode;
      if (key === 38) {
        game.offUp();
      }
      if (key === 40) {
        game.offDown();
      }
      if (key === 37) {
        game.offLeft();
      }
      if (key === 39) {
        return game.offRight();
      }
    });
  });

}).call(this);
