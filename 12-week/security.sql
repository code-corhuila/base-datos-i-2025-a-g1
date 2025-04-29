-- Eliminado físico
-- ** Delete from table usuario where id = 1; **

-- Eliminado lógico
-- ** Update usuario set deleted_at = now() where id = 1; **

-- Campos de auditoria
-- ** status, created_at, updated_at, deleted_at, created_by, updated_by, deleted_by **