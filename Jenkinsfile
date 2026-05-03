 pipeline {
    agent any

    stages {
        stage('Run SQL on VENTAS2017') {
            steps {
                echo "Ejecutando query en la base Sistema_incidencias..."
                // O ejecutar un archivo .sql versionado en Git
                bat '''
                sqlcmd -S localhost -U sa -P Luis_1407 -d Sistema_Incidencias -C -i scripts/query.sql
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
