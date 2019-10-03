node {
  def artifact="yaml-cpp-builder:0.1"
  def docker_credential="dockerhub-cred"
  try{
    stage('Prepare'){
      checkout scm
    }
    stage('Docker build'){
      withDockerRegistry([url: "", credentialsId: docker_credential]){
        sh "docker build --rm --no-cache -t ${artifact} -f ${WORKSPACE}/Dockerfile ."
      }
    }
    stage('Docker push'){
      withDockerRegistry([url: "", credentialsId: docker_credential]){
        sh "docker push zsanettmagyar/${artifact}"
      }
    }
  } catch(Exception ex) {
      throw ex
  }
}
