rsync -avz -e "ssh -2" ~/Works/vinhlh/image-compression-benchmark ec2:/home/ubuntu \
  --exclude outputs \
  --exclude .git \
  --exclude venv
