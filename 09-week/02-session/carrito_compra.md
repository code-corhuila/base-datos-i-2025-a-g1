persona
    - id
    - nombre
    - apellido
    - fecha_nacimiento
    - correo
    - direccion
    - telefono

cliente 
    - id
    - codigo
    - fecha_vinculacion
    - persona_id
  
empleado
    - id
    - codigo
    - fecha_vinculacion
    - salario
    - tipo_contrato
    - persona_id

categoria
    - id
    - nombre
    - descripcion

metodo_pago
    - id
    - nombre
    - descripcion

producto
    - id
    - codigo
    - nombre
    - descripcion
    - categoria_id

inventario
    - id
    - nombre
    - fecha
    - precio
    - stock
    - fecha_lote 
    - fecha_vencimiento
    - producto_id

factura
    - id
    - codigo
    - fecha
    - valor_bruto
    - valor_descuento
    - valor_incremento
    - valor_neto
    - cliente_id
    - medio_pago_id

detalle_factura
    - id 
    - cantidad
    - porcentaje_descuento
    - porcentaje_incremento
    - subtotal
    - producto_id
    - factura_id