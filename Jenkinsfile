 pipeline {
    agent any

    stages {
        stage('Run SQL on VENTAS2017') {
            steps {
                echo "Ejecutando query en la base VENTAS2017..."
                // Ejecutar consulta inline: TOP 3 por mayor importe
                bat '''
                sqlcmd -S localhost -U sa -P Luis_1407 -d VENTAS2017 -C -Q "SELECT TOP 3 NUM_BOLETA, ID_PRODUCTO, CANTIDAD, IMPORTE FROM DETALLEBOLETA ORDER BY IMPORTE DESC;"
                '''
                // O ejecutar un archivo .sql versionado en Git
                bat '''
                sqlcmd -S localhost -U sa -P Luis_1407 -d VENTAS2017 -C -i scripts/query.sql
                '''
            }
        }
    }

    post {
        success {
            mail to: 'destinatario@gmail.com',
                 subject: "Pipeline exitoso",
                 body: "La consulta SQL en BDTAREA se ejecutó correctamente."
        }
        failure {
            mail to: 'destinatario@gmail.com',
                 subject: "Pipeline fallido",
                 body: "Hubo un error al ejecutar la consulta SQL en BDTAREA."
        }
    }
}
