 pipeline {
    agent any

    stages {
        stage('Run SQL on VENTAS2017') {
            steps {
                echo "Ejecutando query en la base Sistema_incidencias..."
                // Ejecución de archivo .sql en Git
                bat '''
                sqlcmd -S localhost -U sa -P Luis_1407 -d Sistema_Incidencias -C -i scripts/query.sql
                '''
            }
        }
    }

    post {
        success {
            mail to: 'yeseniaroapaz@gmail.com, jcgalvezvega@gmail.com',
                 subject: "Pipeline exitoso",
                 body: "La consulta SQL se ejecutó correctamente."
        }
        failure {
            mail to: 'yeseniaroapaz@gmail.com, jcgalvezvega@gmail.com',
                 subject: "Pipeline fallido",
                 body: "Hubo un error al ejecutar la consulta SQL."
        }
    }
}
