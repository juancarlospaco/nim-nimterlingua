import nimterlingua

nimterlingua("/home/juan/code/nim-nimterlingua/example/translations.cfg")

var foo = "Is this the real life?"
var bar = "Is this just fantasy?"
var baz = "Caught in a landslide"
echo foo
echo bar
echo baz

let
  one = "No escape from reality"
  two = "Open your eyes"
  three = "Look up to the skies and see"
echo one
echo two
echo three

var
  a = "I'm just a poor boy, I need no sympathy"
  b = "Because I'm easy come, easy go"
  c = "A little high, little low"
echo a
echo b
echo c

echo "Anyway the wind blows, doesn't really matter to me, to me"
debugEcho "Mama, just killed a man"

proc zzz(): string =
  "Put a gun against his head"
echo zzz()

func xxx(): string =
  "Pulled my trigger, now he's dead"
echo xxx()

assert "Mama, life had just begun".len > 0
doAssert "But now I've gone and thrown it all away".len > 0

discard "Mama, ooo, Didn't mean to make you cry"

echo "If I'm not back again this time tomorrow"
echo "Carry on, carry on, as if nothing really matters"
