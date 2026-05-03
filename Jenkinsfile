pipeline {
    agent any

    stages {
        stage('Run SQL on BDTAREA') {
            steps {
                echo "Ejecutando query en la base BDTAREA..."
                // Ejecutar consulta inline
                bat '''
                sqlcmd -S luis-rivera -U sa -P Luis_1407 -d BDTAREA -C -Q "SELECT TOP 10 * FROM dbo.Cliente;"
                '''
                // O ejecutar un archivo .sql versionado en Git
                bat '''
                sqlcmd -S luis-rivera -U sa -P Luis_1407 -d BDTAREA -C -i scripts/query.sql
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
