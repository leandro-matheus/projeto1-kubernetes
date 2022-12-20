echo "Criando as imagens..."

docker build -t leandro-matheus/projeto-backend:1.0 backend/.
docker build -t leandro-matheus/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."

docker push leandro-matheus/projeto-backend:1.0
docker push leandro-matheus/projeto-database:1.0

echo "Criando Serviços no cluster kubernetes...."

kubectl apply -f ./services.yml

echo "Criando os deployments...."

kubectl apply -f ./deployment.yml

