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
