node {
    def jenkdhub

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       jenkdhub = docker.build("mselkirk/devopscoursework")
    }

    stage('Test image') {
  
        jenkdhub.run()
        jenkdhub.inside {
            sh 'echo "Tests passed"'
                        }
                        }

    stage('Push image')  {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            jenkdhub.push("latest")
            jenkdhub.push("${env.BUILD_NUMBER}")
                                                              }
       	
    stage('Deploying App to kubernetes') { 
        script {
          kubernetesDeploy(configs: "works.yml" , kubeconfigId: "kubernetes")
	    }
                   
                                         }
}
}
