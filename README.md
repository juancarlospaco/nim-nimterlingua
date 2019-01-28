# Nimterlingua

- Internationalization at Compile Time for Nim.
- 1 Macro to replace strings in-place at compile time with 0 cost at runtime.
- Translate unmodified code from 1 INI file. Replace Emojis and Unicode in-place.
- High performance with low resources, everything is done compile-time only!.


# Use

**translations.cfg:**
```ini
# This is a comment.
[cat]
ES_AR = gato
PT_BR = minino



[dog]
ES_AR = perro
PT_BR = cão

; You can replace Emojis. This is a comment.
[:crown:]
ES_AR = 👑
PT_BR = 👑


```

**Nim:**

```nim
import nimterlingua

nimterlingua("translations.cfg")
echo "cat"
echo "dog"
echo ":crown:"
```

**Compile:**
```
nim c -r -d:ES_AR yourfile.nim
```

or

```
nim c -r -d:PT_BR yourfile.nim
```


**NimScript:**

```nim
import nimterlingua

nimterlingua("translations.cfg")
echo "cat"
echo "dog"
echo ":crown:"
```


**Run:**
```
nim e -d:ES_AR yourfile.nims
```

or

```
nim e -d:PT_BR yourfile.nims
```

**Example Output:**

```nim
nim c -r -d:ES_AR example.nim  

example.nim(33, 8) Hint: ES_AR0("cat") --> '"gato"' [Pattern]
example.nim(34, 8) Hint: ES_AR2("dog") --> '"perro"' [Pattern]
example.nim(35, 8) Hint: ES_AR4(":crown:") --> '"👑"' [Pattern]

gato
perro
👑
```
