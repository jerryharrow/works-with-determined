kubectl apply -f pipeline-secret.yaml 
pachctl create repo dogs-and-cats
pachctl create pipeline -f use-case/image-classification/training-pipeline.json

kubectl get svc | grep pachd


