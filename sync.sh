rsync -avz -e "ssh -p 22 -i ~/.ssh/vinh.zalora" ~/Works/vinhlh/image-compression-benchmark ubuntu@54.255.241.252:/home/ubuntu \
  --exclude outputs \
  --exclude .git \
  --exclude venv
