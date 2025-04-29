-- Eliminado físico
-- ** Delete from table usuario where id = 1; **

-- Eliminado lógico
-- ** Update usuario set deleted_at = now() where id = 1; **

-- Campos de auditoria
-- ** 
-- status boolean - byte
-- created_at timestamp
-- updated_at timestamp
-- deleted_at timestamp
-- created_by int
-- updated_by int
-- deleted_by int
-- **