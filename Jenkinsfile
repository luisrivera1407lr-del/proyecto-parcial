pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Compilando...'
            }
        }
        stage('Test') {
            steps {
                echo 'Probando...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Desplegando...'
            }
        }
    }

    post {
        success {
            mail to: 'tu_correo@gmail.com',
                 subject: 'Pipeline Exitoso',
                 body: 'El pipeline se ejecutó correctamente.'
        }
        failure {
            mail to: 'tu_correo@gmail.com',
                 subject: 'Error en Pipeline',
                 body: 'El pipeline falló. Revisar Jenkins.'
        }
    }
}
