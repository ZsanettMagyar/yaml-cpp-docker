node {
    stage('Docker build') {
        try {
          withDockerRegistry([url: "", credentialsId: "dockerhub-cred"]){
            sh "docker build --rm --no-cache -t yaml-cpp-builder:0.1 -f Dockerfile ."
          }
        }
        catch (exc) {
            echo 'Something failed'
            throw exc
        }
    }
}
