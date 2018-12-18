#!/usr/bin/env bash
echo "Running setup"

# GPU Settings
# install cudnn
CUDA_INSTALL_PATH=/usr/local
aws s3 --endpoint-url https://blob.mr3.simcloud.apple.com cp s3://turi/bolt/cudnn-9.0-linux-x64-v7.1.tgz .
tar zxvf cudnn-9.0-linux-x64-v7.1.tgz -C ${CUDA_INSTALL_PATH}
chmod a+r ${CUDA_INSTALL_PATH}/cuda/include/cudnn.h ${CUDA_INSTALL_PATH}/cuda/lib64/libcudnn*
# install tensorflow
pip install -U tensorflow-gpu

# non GPU Settings -- include tensorflow in requirments.txt , if using GPU remove tensorflow form requirements.txt
pip install -r requirements.txt --index https://pypi.apple.com/simple
echo "Done running setup"
