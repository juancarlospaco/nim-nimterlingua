import nimterlingua
nimterlingua("/home/juan/code/nim-nimterlingua/example/translations.cfg")
###  $ nim e -d:ES_AR minimal.nims
###  $ nim e -d:ES_AR minimal.nims > python_translated.py
###  $ nim e -d:ES_AR minimal.nims > javascript_translated.js
echo [
  "Is this the real life?",
  "Is this just fantasy?",
  "Caught in a landslide",
  "No escape from reality",
  "Open your eyes",
  "Look up to the skies and see",
  "I'm just a poor boy, I need no sympathy",
  "Because I'm easy come, easy go",
  "A little high, little low",
  "Anyway the wind blows, doesn't really matter to me, to me",
  "Mama, just killed a man",
  "Put a gun against his head",
  "Pulled my trigger, now he's dead",
  "Mama, life had just begun",
  "But now I've gone and thrown it all away",
  """Mama, ooo, Didn't mean to make you cry""",        # This is a test Comment.
  """If I'm not back again this time tomorrow""",      # Triple Quoted Strings.
  """Carry on, carry on, as if nothing really matters""",
]
