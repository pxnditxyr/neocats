# 🎯 Guía de Ejemplos - Nuevas Funcionalidades de NeoCats

## 📋 Tabla de Contenidos
1. [Options Mejoradas](#options-mejoradas)
2. [Flash.nvim - Navegación Rápida](#flashnvim---navegación-rápida)
3. [Persistence - Sesiones](#persistence---sesiones)
4. [Which-key - Ayuda de Keymaps](#which-key---ayuda-de-keymaps)
5. [LazyDev - Autocompletado Lua](#lazydev---autocompletado-lua)
6. [Autocommands Útiles](#autocommands-útiles)
7. [LSP - Format y Code Actions](#lsp---format-y-code-actions)

---

## 1. Options Mejoradas

### 🔹 `timeoutlen = 300`
**Qué hace:** Reduce el tiempo de espera para secuencias de teclas.

**Ejemplo:**
```
1. Presiona <leader>f rápidamente
2. Ahora solo espera 300ms (antes 1000ms) antes de activar
```

### 🔹 `pumheight = 10`
**Qué hace:** Limita la altura del menú de completado a 10 líneas.

**Ejemplo:**
```
1. Abre un archivo .lua
2. Presiona <C-x><C-o> en modo insert
3. El menú de completado no ocupará toda la pantalla
```

### 🔹 `scrolloff = 8`
**Qué hace:** Mantiene 8 líneas de contexto al hacer scroll.

**Ejemplo:**
```
1. Abre cualquier archivo largo
2. Navega con j/k
3. El cursor nunca estará en la primera o última línea (a menos que sea el inicio/fin del archivo)
```

### 🔹 `conceallevel = 2` y `concealcursor = ""`
**Qué hace:** Oculta sintaxis de markdown excepto en la línea del cursor.

**Ejemplo - Crea un archivo markdown:**
```bash
nvim ~/test.md
```

**Escribe esto:**
```markdown
# Título

Este texto tiene **negrita** y *cursiva* y [un link](https://github.com)

- Lista item 1
- Lista item 2

`código inline`
```

**Observa:**
- Cuando el cursor NO está en una línea: verás texto limpio (sin **, [], etc.)
- Cuando el cursor ESTÁ en una línea: verás la sintaxis completa
- Mueve el cursor arriba/abajo para ver la diferencia

### 🔹 `virtualedit = "block"`
**Qué hace:** Permite mover el cursor más allá del final de línea en modo visual-block.

**Ejemplo - Crea un archivo de prueba:**
```javascript
function hello() {
  console.log("hola")
}

const x = 1
const longVariable = 2
```

**Prueba:**
```
1. Coloca el cursor en la línea "const x = 1"
2. Presiona <C-v> (visual block)
3. Mueve hacia abajo con j
4. Mueve hacia la derecha con $ y sigue con l/l/l
5. ¡Puedes ir más allá del final de la línea corta!
6. Presiona I y escribe "// " para comentar todo
```

---

## 2. Flash.nvim - Navegación Rápida

### 🔹 Salto Básico con `s`
**Ejemplo:**
```
1. Abre este mismo archivo
2. Presiona 's' en modo normal
3. Escribe 'ej' (o cualquier palabra que veas)
4. Aparecerán etiquetas en todas las coincidencias
5. Presiona la letra de la etiqueta para saltar
```

### 🔹 Treesitter Jump con `S`
**Ejemplo - Archivo JavaScript:**
```javascript
function calcular(a, b) {
  const resultado = a + b;
  if (resultado > 10) {
    return resultado * 2;
  }
  return resultado;
}

const datos = {
  nombre: "Juan",
  edad: 25
};
```

**Prueba:**
```
1. Coloca el cursor en cualquier parte de la función
2. Presiona 'S' (shift+s)
3. Verás etiquetas en:
   - La función completa
   - El bloque if
   - Los strings
   - Los objetos
4. Presiona una etiqueta para seleccionar ese nodo
```

### 🔹 Remote Operations con `r`
**Ejemplo - Copiar desde lejos:**
```
1. Abre un archivo con varias funciones
2. Presiona 'y' (yank/copiar)
3. Presiona 'r' (remote)
4. Aparecerán etiquetas en pantalla
5. Presiona una etiqueta para mover el cursor ahí
6. Presiona 'iw' (inner word) o cualquier motion
7. ¡Se copiará sin moverte del lugar original!
```

### 🔹 Búsqueda con `/` + Flash
**Ejemplo:**
```
1. Presiona '/' para buscar
2. Escribe 'function'
3. Presiona <C-s> para activar flash
4. Aparecerán etiquetas en las coincidencias
5. Presiona una etiqueta para saltar
```

---

## 3. Persistence - Sesiones

### 🔹 Guardar y Restaurar Sesión
**Ejemplo:**
```bash
# 1. Abre varios archivos en un proyecto
cd ~/workspace/neocats
nvim lua/pxndxs/options.lua lua/pxndxs/keymaps.lua

# 2. Trabaja un poco, abre splits, etc.
:split lua/pxndxs/completion.lua
:vsplit lua/custom/plugins/flash.lua

# 3. Sal de Neovim
:qa

# 4. Vuelve al mismo directorio
cd ~/workspace/neocats
nvim

# 5. Restaura la sesión
<leader>qs
# ¡Todos tus archivos y ventanas están de vuelta!
```

### 🔹 Sesiones por Branch de Git
**Ejemplo:**
```bash
cd ~/workspace/neocats

# Branch main
git checkout main
nvim
# Abre algunos archivos, luego sal

# Branch feature
git checkout -b feature/nueva-funcion
nvim
# Abre otros archivos diferentes, luego sal

# Vuelve a main
git checkout main
nvim
<leader>qs
# ¡Se restaura la sesión de main!

# Vuelve a feature
git checkout feature/nueva-funcion
nvim
<leader>qs
# ¡Se restaura la sesión de feature!
```

### 🔹 Seleccionar Sesión Específica
**Ejemplo:**
```
1. Presiona <leader>qS (shift+s)
2. Te mostrará lista de sesiones guardadas
3. Selecciona una con <Enter>
```

### 🔹 No Guardar Sesión al Salir
**Ejemplo:**
```
1. Estás probando algo temporal
2. No quieres guardar esta sesión
3. Presiona <leader>qd
4. Sal con :qa
5. La sesión NO se guardará
```

---

## 4. Which-key - Ayuda de Keymaps

### 🔹 Ver Ayuda de Leader Keys
**Ejemplo:**
```
1. Presiona <leader> (espacio)
2. Espera 1 segundo
3. ¡Aparece un popup con todos los keymaps disponibles!
4. Puedes presionar una tecla para continuar o <Esc> para cancelar
```

### 🔹 Ver Keymaps por Grupo
**Ejemplo:**
```
1. Presiona <leader>f (find)
2. Espera 1 segundo
3. Verás todos los keymaps de búsqueda:
   - <leader>ff : Smart Picker
   - <leader>fb : Buffers
   - <leader>fg : Grep
   - etc.
```

### 🔹 Ver Keymaps Locales del Buffer
**Ejemplo:**
```
1. Abre un archivo con LSP activo (ej: .lua, .js)
2. Presiona <leader>?
3. Verás keymaps específicos de ese buffer
```

### 🔹 Navegación con [ y ]
**Ejemplo:**
```
1. Presiona '['
2. Espera 1 segundo
3. Verás opciones:
   - [d : Previous diagnostic
   - [q : Previous quickfix
   - [l : Previous location
```

---

## 5. LazyDev - Autocompletado Lua

### 🔹 Autocompletado de API de Neovim
**Ejemplo - Crea un archivo de prueba:**
```bash
nvim ~/test-lua.lua
```

**En modo INSERT, escribe:**
```lua
vim.
-- Aparecerá autocompletado con:
-- vim.api, vim.lsp, vim.fn, vim.opt, etc.

vim.api.nvim_
-- Autocompletado de todas las funciones nvim_*

vim.lsp.buf.
-- Autocompletado de funciones LSP
```

**Más ejemplos:**
```lua
-- Prueba escribir estas líneas y ver el autocompletado
vim.keymap.set()
vim.diagnostic.config()
vim.treesitter.get_parser()
require("telescope")
```

**Nota:** ¡El autocompletado incluye documentación y firma de funciones!

---

## 6. Autocommands Útiles

### 🔹 Highlight al Copiar (Yank)
**Ejemplo:**
```
1. Abre cualquier archivo
2. Presiona 'yy' para copiar una línea
3. ¡La línea se ilumina brevemente!
4. Prueba con 'yiw' (copiar palabra)
5. Prueba con 'y$' (copiar hasta el final)
```

### 🔹 Cerrar Ventanas con 'q'
**Ejemplo:**
```
# Help
:help telescope

# Ahora solo presiona 'q' (no :q) y se cierra

# Quickfix
:copen

# Presiona 'q' para cerrar

# LSP Info
:LspInfo

# Presiona 'q' para cerrar

# Checkhealth
:checkhealth

# Presiona 'q' para cerrar
```

### 🔹 Volver al Último Lugar Conocido
**Ejemplo:**
```bash
# 1. Abre un archivo
nvim ~/test.txt

# 2. Ve a la línea 50
:50

# 3. Sal
:q

# 4. Vuelve a abrir
nvim ~/test.txt

# ¡El cursor está en la línea 50!
```

### 🔹 Auto Crear Directorios
**Ejemplo:**
```bash
# 1. Intenta guardar en un directorio que no existe
nvim ~/nueva/carpeta/que/no/existe/archivo.txt

# 2. Escribe algo en el archivo
i
Hola mundo
<Esc>

# 3. Guarda con :w
:w

# ¡El directorio se crea automáticamente!
# Verifica:
```

```bash
ls -la ~/nueva/carpeta/que/no/existe/
# archivo.txt existe!
```

---

## 7. LSP - Format y Code Actions

### 🔹 Format con `<leader>f`
**Ejemplo - Archivo JavaScript desordenado:**
```javascript
// Crea este archivo mal formateado
nvim ~/test-format.js
```

**Escribe esto (mal formateado):**
```javascript
function test(  ) {
const x=1;
  const y    =     2;
      return x+y;
}

const obj={name:"test",age:25,city:"Madrid"};
```

**Ahora formatea:**
```
1. En modo normal, presiona <leader>f
2. ¡El código se formatea automáticamente! (si tienes un LSP con formatter)
```

### 🔹 Code Actions con `<leader>ca`
**Ejemplo - Archivo con error:**
```javascript
// Crea un archivo con un error
nvim ~/test-actions.js
```

**Escribe:**
```javascript
const mensaje = "Hola";
console.log(mesaje); // Error: mesaje no existe (falta 'n')
```

**Ahora usa code action:**
```
1. Coloca el cursor en "mesaje" (la palabra con error)
2. Presiona <leader>ca
3. Aparecerán opciones como:
   - Rename to 'mensaje'
   - Add missing import
   - etc.
4. Selecciona una opción
```

**Otro ejemplo - Imports no usados:**
```javascript
import React from 'react';
import { useState, useEffect } from 'react';

function App() {
  return <div>Hello</div>;
}
// useState y useEffect no se usan
```

```
1. Presiona <leader>ca en cualquier import
2. Verás opción: "Remove unused imports"
3. Selecciónala
```

---

## 🎮 Práctica Combinada

### Escenario 1: Edición Rápida
```
1. Abre un archivo grande con <leader>ff
2. Usa 's' + palabra para saltar rápido a una función
3. Usa <leader>ca para hacer una refactorización
4. Usa <leader>f para formatear
5. Copia algo con 'y' y observa el highlight
6. Sal con :w
```

### Escenario 2: Trabajo con Sesiones
```
1. cd ~/proyecto
2. nvim (abre varios archivos)
3. Trabaja un rato
4. :qa
5. Vuelve: nvim + <leader>qs
6. ¡Todo restaurado!
```

### Escenario 3: Navegación Profesional
```
1. Abre un archivo de código
2. Presiona 'S' para ver estructura Treesitter
3. Presiona <leader> y espera para ver keymaps
4. Usa [d y ]d para navegar diagnósticos
5. Usa <leader>fd para ver todos los problemas
```

---

## 🐛 Troubleshooting

### Flash no funciona
```lua
-- Verifica que esté instalado
:Lazy

-- Busca "flash.nvim"
-- Si no está, ejecuta:
:Lazy sync
```

### Which-key aparece muy rápido
```lua
-- Edita lua/custom/plugins/which-key.lua
-- Cambia delay a un valor mayor (ej: 2000 = 2 segundos)
opts = {
  delay = 2000,  -- Aumenta este valor
}
```

### LazyDev no autocompleta
```lua
-- Verifica que esté en un archivo .lua
-- Y que estés escribiendo en la configuración de Neovim
-- Solo funciona para APIs de Neovim (vim.*, require("telescope"), etc.)
```

### Format no funciona
```
-- Verifica que tu LSP tenga formatting
:LspInfo

-- Busca "Formatting: true"
-- Si dice "false", ese LSP no soporta formatting
```

---

## 🎓 Siguiente Nivel

### Combos Avanzados con Flash
```
# Eliminar hasta una palabra visible
d + s + palabra + etiqueta

# Cambiar una función completa
c + S + etiqueta-de-funcion

# Copiar desde lejos sin mover cursor
y + r + etiqueta + iw
```

### Workflow con Sesiones
```
# Sesión por feature
git checkout feature/nueva-ui
nvim  # Trabaja en UI files
:qa

git checkout feature/backend-api
nvim  # Trabaja en backend files
:qa

# Cada sesión es independiente
# Vuelve a cualquiera y presiona <leader>qs
```

---

## 📚 Recursos Adicionales

- Flash.nvim: https://github.com/folke/flash.nvim
- Persistence.nvim: https://github.com/folke/persistence.nvim
- Which-key.nvim: https://github.com/folke/which-key.nvim
- LazyDev: https://github.com/folke/lazydev.nvim

---

**¡Disfruta tus nuevas súper poderes en Neovim! 🚀**
