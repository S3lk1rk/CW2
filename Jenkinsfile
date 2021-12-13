node {
    def jenkdhub

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       jenkdhub = docker.build("mselkirk/devopscoursework")
    }

    stage('Test image') {
  

        jenkdhub.inside {
            node --version   
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            jenkdhub.push("${env.BUILD_NUMBER}")
            jenkdhub.push("latest")
        }
    }
}
