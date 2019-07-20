mkdir tensorflow
cd tensorflow
pip3 install virtualenv
virtualenv coral
WD=$(pwd)
alias coralvenv=source $WD/coral/
coralvenv
pip install tensorflow-gpu
sudo apt-get install protobuf-compiler python-pil python-lxml python-tk
pip install pillow
pip install contextlib2
pip install jupyter
pip install matplotlib
git clone https://github.com/cocodataset/cocoapi.git
git clone https://github.com/tensorflow/models.git
cd cocoapi/PythonAPI
make
cp -r pycocotools $WD/models/research/
cd $WD/models/research/
protoc object_detection/protos/*.proto --python_out=.
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
python object_detection/builders/model_builder_test.py
