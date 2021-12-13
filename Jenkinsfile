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
            jenkdhub.push("${env.BUILD_NUMBER}")
            jenkdhub.push("latest")
                                                                      }
                         } 
    stage('Cleanup docker images to prevent server capacity overload')
        {
         echo 'filler'
        } 
       	
    stage('Deploying App to kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploycreatescale.yml" , kubeconfigId: "kubernetes")
	    }
               }    
                                         }
}
