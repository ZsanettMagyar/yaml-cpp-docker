node {
    stage('Docker build') {
        try {
          checkout scm
          withDockerRegistry([url: "", credentialsId: "dockerhub-cred"]){
            sh "pwd"
            sh "ls -l"
            echo "$WORKSPACE"
            sh "docker build --rm --no-cache -t yaml-cpp-builder:0.1 -f ${WORKSPACE}/Dockerfile ."
          }
        }
        catch (exc) {
            echo 'Something failed'
            throw exc
        }
    }
}
