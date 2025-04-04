1. produccion: 
   1. id
   - título, 
   - tipo_produccion
   - fecha_inicio
   - fecha_estreno_estimada
   - genero
   - presupuesto
   - estado (preproducción, rodaje, postproducción, estrenada, cancelada).

- Peronsona 
  - id
  - nombre
  - edad
  - correo
  - direccion
  - genero


- Rol
  - id
  - codigo
  - nombre {actores, directores, guionistas, camarógrafos, editores, técnicos de sonido}
  - descripcion

- PersonaRol
  - id
  - personaId
  - rolId

- contrato
  - id
  - fecha_inicio
  - fecha_fin
  - salario
  - tipo_contratio{temporal, fijo, freelance}
  - estado {activo, finalizado, rescindido}
  
- localizacion
  - id
  - fecha_rodaje
  - descripcion
  - permiso
  - coste

- filmar
  - id
  - codigo_escena
  - numero_escena
  - duracion
  - fecha
  
- detalle_actor
  - id
  - filmar_id
  - persona_id -- desde back se debe filtrar solo rol actor
  - localizacion_id

- evento
  - id
  - descripcion
  - fecha
  - persona_id
  - produccion_id