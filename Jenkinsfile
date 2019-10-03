node {
    stage('Docker build') {
        try {
          withDockerRegistry([url: "https://hub.docker.com", credentialsId: dockerhub-cred]){
            sh "docker build --rm --no-cache -t yaml-cpp-builder:0.1 -f Dockerfile ."
          }
        }
        catch (exc) {
            echo 'Something failed'
            throw
        }
    }
}
