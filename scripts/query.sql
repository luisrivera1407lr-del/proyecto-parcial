USE [Sistema_Incidencias];
GO

IF OBJECT_ID('dbo.sp_IncidenciasPorComercio', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_IncidenciasPorComercio;
GO

CREATE PROCEDURE dbo.sp_IncidenciasPorComercio
    @id_comercio INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        I.id_incidencia,
        C.nombre_comercial,
        T.nombre AS Tipo_Incidencia,
        P.nombre AS Prioridad,
        I.impacto_financiero,
        I.fecha_creacion
    FROM INCIDENCIA I
    INNER JOIN COMERCIO C
        ON I.id_comercio = C.id_comercio
    INNER JOIN TIPOINCIDENCIA T
        ON I.id_tipo = T.id_tipo
    INNER JOIN PRIORIDAD P
        ON I.id_prioridad = P.id_prioridad
    WHERE I.id_comercio = @id_comercio
    ORDER BY I.fecha_creacion DESC;
END;
GO

EXEC dbo.sp_IncidenciasPorComercio @id_comercio = 1

CREATE PROCEDURE sp_LineaXtiempoXincidencia
    @id_incidencia INT
AS
BEGIN
    -- Validamos si la incidencia existe antes de consultar
    IF NOT EXISTS (SELECT 1 FROM INCIDENCIA WHERE id_incidencia = @id_incidencia)
    BEGIN
       PRINT 'La incidencia especificada no existe.';
       RETURN;
    END
    -- Consulta principal para la línea de tiempo
    SELECT 
       I.Ticket_Incidencia AS Ticket,
       DI.fecha_creacion AS Fecha_Hora,
       E.nombre AS Estado_Alcanzado,
       U.nombres + ' ' + U.apellidos AS Responsable,
       DI.comentario AS Accion_Realizada,
     -- Calculamos cuánto tiempo pasó desde el registro anterior
       LAG(DI.fecha_creacion) OVER (ORDER BY DI.fecha_creacion) AS Fecha_Anterior
    FROM DETALLE_INCIDENCIA DI
    INNER JOIN INCIDENCIA I ON DI.id_incidencia = I.id_incidencia
    INNER JOIN ESTADOINCIDENCIA E ON DI.id_estado_incidencia = E.id_estado
    INNER JOIN USUARIO U ON DI.id_usuario = U.id_usuario
    WHERE DI.id_incidencia = @id_incidencia
    ORDER BY DI.fecha_creacion ASC; -- De lo más antiguo a lo más reciente
END
GO


EXEC sp_LineaXtiempoXincidencia @id_incidencia = 7
