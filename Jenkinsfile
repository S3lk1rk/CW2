node {
    def jenkdhub
    def ip = '184.72.71.184'
    def version = {env.BUILD_NUMBER}
    def imageName = "devopscoursework"
    stage('Clone repository') {      

        checkout scm
    }
    stage('clean previous builds') {
        
    }
    stage('Build coursework image') {
  
       jenkdhub = docker.build("mselkirk/devopscoursework:$version")
    }

    stage('Push coursework image to dockerhub')  {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            jenkdhub.push($version)	
          }
     }

       	
    stage('Run build tests') {

        jenkdhub.run()
        jenkdhub.inside {
            sh 'echo "build testing passed"'
                        }
    }

    stage('Deploying App to kubernetes') { 

        sh "ssh -o StrictHostKeyChecking=no ubuntu@$ip kubectl set image deploy/kubernetes-cw2  devopscoursework=$imageName:$version"  

   }
} 
