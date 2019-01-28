import macros, strutils

const tI18i = """
when defined($1):
  template $1$4{("$3"){texts}}(texts: string{lit, noalias}): string =
    ## Compile with -d:$1 to auto translate at compile time to $1 Lang ISO code.
    when texts == "$3": "$2" else: "$3"

"""


macro nimterlingua*(iniFile: string, splitter="="): typed =
  ## Macro to replace strings in-place at compile time with 0 cost at runtime.
  assert iniFile.strVal.len > 5, "iniFile must not be empty string (INI or CFG)"
  var i: int
  var source, section: string
  for line in iniFile.strVal.staticRead.strip.splitLines:
      if unlikely(line.strip.len == 0 or line.strip[0] in {'#', ';'}): continue
      if line.strip[0] == '[' and line.strip[line.strip.len-1] == ']':
        section = line.strip[1..line.strip.len - 2].strip  # [SomeWord]
      else:
        var l = line.split(splitter.strVal) # LANG_ISOCODE = SomeWord Translated
        if l.len != 2: error("Invalid INI format, value splitter not found.")
        source &= tI18i.format(l[0].strip.toUpperAscii, l[1].strip, section, i)
        inc i
  if source.len == 0: error("Invalid INI format or parse error or unkown error")
  # when not defined(release): echo source
  result = parseStmt(source)


when isMainModule:
  nimterlingua("translations.cfg", splitter="=")
  echo "cat"
  echo "dog"
  echo ":crown:"
