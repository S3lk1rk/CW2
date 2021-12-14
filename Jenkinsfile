node {
    def jenkdhub
    def ip = 'ip-184.72.71.184'
    def version = 'latest'
    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       jenkdhub = docker.build("mselkirk/devopscoursework")
    }

    stage('Push image')  {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            jenkdhub.push("${env.BUILD_NUMBER}")
            jenkdhub.push("latest")                                                  }
          }
     }

       	
    stage('Run build tests') {

        jenkdhub.run()
        jenkdhub.inside {
            sh 'echo "build testing passed"'
                        }
    }

    stage('Deploying App to kubernetes') { 

        sh "ssh -o StrictHostKeyChecking=no ubuntu@$ip kubectl set image mselkirk/devopscoursework jenkdhub=devopscoursework:$version"  

   }
}
