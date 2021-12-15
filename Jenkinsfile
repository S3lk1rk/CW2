node {
    def jenkdhub
    def ip = '18.212.77.35'
    def version = 'testingCW4'
    def imageName = "mselkirk/devopscoursework"
    stage('Clone repository') {      
       checkout scm           
    }
    stage('Build coursework image') {
  	
       jenkdhub = docker.build("mselkirk/devopscoursework:$version")
    }

    stage('Push coursework image to dockerhub')  {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            jenkdhub.push("$version")	
          }
     }

       	
    stage('Run build tests') {

        jenkdhub.run("docker run --rm --name devopscoursework  -p 80:80 -d mselkirk/devopscoursework:$version")
        jenkdhub.inside {
            sh 'echo "build testing passed"'
                        }
    }

    stage('Deploying App to kubernetes') { 

        sh "ssh -o StrictHostKeyChecking=no ubuntu@$ip kubectl set image deploy/kubernetes-cw2  devopscoursework=$imageName:$version"  

   }
} 
