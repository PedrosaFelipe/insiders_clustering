# variable
data=$(date +'%Y-%m-%dT%H:%M:%S')

#_ path 
path='/home/pedrosa/repositorio/insiders_clustering'
path_to_envs='/home/pedrosa/anaconda3/envs/programa_fidelidade/bin'

$path_to_envs/papermill $path/src/models/c9.0-fsp-deploy-cloud.ipynb $path/reports/c9.0-fsp-deploy-cloud-$data.ipynb
