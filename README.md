# Nimterlingua

- Internationalization and localization at Compile Time for Nim.
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

nimterlingua()
echo "cat"
echo "dog"
echo ":crown:"
```

**Compile:**
```
nim c -r -d:ES_AR -d:iniFile="translations.cfg" yourfile.nim
```

or

```
nim c -r -d:PT_BR -d:iniFile="translations.cfg" yourfile.nim
```


**NimScript:**

```nim
import nimterlingua

nimterlingua()
echo "cat"
echo "dog"
echo ":crown:"
```


**Run:**
```
nim e -d:ES_AR -d:iniFile="translations.cfg" yourfile.nims
```

or

```
nim e -d:PT_BR -d:iniFile="translations.cfg" yourfile.nims
```


**NodeJS:**

```nim
import nimterlingua

nimterlingua()
echo "cat"
echo "dog"
echo ":crown:"
```

**Compile:**
```
nim js -d:nodejs -d:ES_AR -d:iniFile="translations.cfg" yourfile.nim
```

or

```
nim js -d:nodejs -d:PT_BR -d:iniFile="translations.cfg" yourfile.nim
```


# Example

```nim
$ cd example
$ nim c -r -d:ES_AR -d:iniFile="translations.cfg" bohemian_rhapsody.nim

bohemian_rhapsody.nim(5, 11) Hint: ES_AR0("Is this the real life?") --> '"Es la vida real?"' [Pattern]
bohemian_rhapsody.nim(6, 11) Hint: ES_AR1("Is this just fantasy?") --> '"Es sólo fantasía?"' [Pattern]
bohemian_rhapsody.nim(7, 11) Hint: ES_AR2("Caught in a landslide") --> '"Atrapado en un derrumbe"' [Pattern]
bohemian_rhapsody.nim(13, 9) Hint: ES_AR3("No escape from reality") --> '"Sin escape de la realidad"' [Pattern]
bohemian_rhapsody.nim(14, 9) Hint: ES_AR4("Open your eyes") --> '"Abre tus ojos"' [Pattern]
bohemian_rhapsody.nim(15, 11) Hint: ES_AR5("Look up to the skies and see") --> '"Mira a los cielos y observa"' [Pattern]
bohemian_rhapsody.nim(21, 7) Hint: ES_AR6("I\'m just a poor boy, I need no sympathy") --> '"Sólo soy un chico pobre, no necesito simpatía"' [Pattern]
bohemian_rhapsody.nim(22, 7) Hint: ES_AR7("Because I\'m easy come, easy go") --> '"Porque fácil vengo, fácil me voy"' [Pattern]
bohemian_rhapsody.nim(23, 7) Hint: ES_AR8("A little high, little low") --> '"Un poco alto, un poco bajo"' [Pattern]
bohemian_rhapsody.nim(28, 6) Hint: ES_AR9("Anyway the wind blows, doesn\'t really matter to me, to me") --> '"De todos modos el viento sopla, realmente no me importa, a mi"' [Pattern]
bohemian_rhapsody.nim(29, 11) Hint: ES_AR10("Mama, just killed a man") --> '"Mamá, maté a un hombre"' [Pattern]
bohemian_rhapsody.nim(32, 3) Hint: ES_AR11("Put a gun against his head") --> '"Puse una pistola en su cabeza"' [Pattern]
bohemian_rhapsody.nim(36, 3) Hint: ES_AR12("Pulled my trigger, now he\'s dead") --> '"Jalé el gatillo, ya está muerto"' [Pattern]
bohemian_rhapsody.nim(42, 9) Hint: ES_AR15("Mama, ooo, Didn\'t mean to make you cry") --> '"Mamá, ooo, No quise hacerte llorar"' [Pattern]
bohemian_rhapsody.nim(44, 6) Hint: ES_AR16("If I\'m not back again this time tomorrow") --> '"Si no regreso mañana a esta hora"' [Pattern]
bohemian_rhapsody.nim(45, 6) Hint: ES_AR17("Carry on, carry on, as if nothing really matters") --> '"Continúa, continúa, como si nada realmente importara"' [Pattern]


Es la vida real?
Es sólo fantasía?
Atrapado en un derrumbe
Sin escape de la realidad
Abre tus ojos
Mira a los cielos y observa
Sólo soy un chico pobre, no necesito simpatía
Porque fácil vengo, fácil me voy
Un poco alto, un poco bajo
De todos modos el viento sopla, realmente no me importa, a mi
Mamá, maté a un hombre
Puse una pistola en su cabeza
Jalé el gatillo, ya está muerto
Si no regreso mañana a esta hora
Continúa, continúa, como si nada realmente importara

```


### under the hood

<details>
  <summary>How does it works internally?.</summary>

```nim
# expandMacros:

when defined(ES_AR):
  template ES_AR0{("cat"){texts}}(texts: string{lit, noalias}): string =
    ## Compile with -d:ES_AR to auto translate at compile time to ES_AR Lang ISO code.
    when texts == "cat": "gato" else: "cat"

when defined(PT_BR):
  template PT_BR1{("cat"){texts}}(texts: string{lit, noalias}): string =
    ## Compile with -d:PT_BR to auto translate at compile time to PT_BR Lang ISO code.
    when texts == "cat": "minino" else: "cat"

```

</details>


# Nimterlingua Vs GetText

| Nimterlingua                         | GetText                               |
|--------------------------------------|---------------------------------------|
| No `*.po` files                      | You need to write   `*.po` files      |
| No `*.pot` files                     | You need to extract `*.pot` files     |
| No `*.mo` files                      | You need to compile `*.mo` files      |
| No `*.gmo` files                     | You need to compile `*.gmo` files     |
| Only `nim`                           | `xgettext`, `msginit`, `msgfmt`, etc  |
| Any editor, `*.INI` format           | Requires `poedit` for fluent workflow |
| Unmodified code can be translated    | Requires refactor adding gettext functions |
| `"cat"`                              | `gettext("cat")` or `_("cat")`        |
| No GetText dependency                | GetText libs as dependency            |
| 0 cost at runtime performance        | [Slows runtime performance (even on C)](https://stackoverflow.com/questions/18268608/performance-overhead-of-the-gettext-internationalization-system-in-c-c)     |
| `*.INI` is easy to delegate to people | `*.po` format complex for non-tech people |
| Chill Lazy Dev                       | Time consuming beyond translation itself   |

**GetText**
```pot
#. TRANSLATORS: Thank you for contributing to this project.
#: src/name.c:36
msgid "cat"
msgstr "gato"

```

**Nimterlingua**
```ini
[cat]
ES_AR = gato
```

# Beyond Translation

Its designed for translation, but it does not force anything on you,
you can be creative and explore other possible uses.

It replaces in-place any arbitrary `string` with any arbitrary `string` you want at compile time with 0 cost at runtime without touching the code.

_Let us know if you built something cool with it!._


# FAQ

- Its not possible to have different languages in 1 Nim program?.

Use a period (dot), exclamation, space, emoji or something, the string will not match anymore.

```ini
[cat]
ES_AR = gato
```

```nim
if useSpanish: "cat" else: "cat."
```

`"cat"` get translated to Spanish, `"cat."` remains English, because of period.

You choose languages with `if` or `case` or similar on your code.

Or use NimScript or NodeJS to get a JSON or CSV or similar format and get the data from there.


- I get `nimterlingua.nim(17, 29) Error: cannot open file: translations.cfg` ?

compile with `-d:iniFile="path to your translations.cfg"`

- Is there a Minimal Basic example?.

https://github.com/juancarlospaco/nim-nimterlingua/blob/master/example/minimal.nims

- How do you use this with Python or NodeJS or JavaScript?.

https://github.com/juancarlospaco/nim-nimterlingua/blob/master/example/minimal.nims

- This works with NodeJS and JavaScript?.

Yes.

- My Translated text contains `=` will make it fail?.

Use `splitter=":"`, then use it as splitter separator.

```ini
[cat]
ES_AR : gato
```

- How to make an INI for a lot of languages?.

```ini
[cat]
ES_AR = gato
PT_BR = minino
RU    = kot
FR    = chat
# A lot of languages here...
```

- This is not the same as Search&Replace of any Editor?.

No.
Because it actually fully understands the code,
typical Search&Replace of Editor can break comments, names, variables, etc.


# Stars

![](https://starchart.cc/juancarlospaco/nim-nimterlingua.svg)
