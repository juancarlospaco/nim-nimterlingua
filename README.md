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

# Example

```nim
$ nim c -r example/bohemian_rhapsody.nim

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
