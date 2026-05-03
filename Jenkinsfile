pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Compilando...'
                bat '''
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Probando...'
                bat '''
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Desplegando...'
                bat '''
                '''
            }
        }
    }

    post {
        success {
            mail to: 'xxxxxxxx@gmail.com',
                 subject: 'Proyecto Parcial Exitoso',
                 body: 'El pipeline se ejecutó correctamente.'
        }
        failure {
            mail to: 'xxxxxxxx@gmail.com',
                 subject: 'Error en Proyecto Parcial',
                 body: 'El pipeline falló. Revisar Jenkins.'
        }
    }
}
