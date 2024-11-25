echo "Starting the installation process for stable-fast-3d..."

if !command -v python3 &> /dev/null; then
	echo "Python3 is not installed. Kindly install it and rerun this file."
	exit 1
fi

if !command -v pip &> /dev/null; then
	echo "pip is not installed. Installing pip..."
	sudo apt install -y python3-pip
fi

if !command -v ninja &>/dev/null; then
	echo "ninja-build is not installed. Installing ninja-build for faster build..."
	sudo apt install -y ninja-build
fi

echo "Setting up a Python virtual environment..."
python3 -m venv env
source env/bin/activate

echo "Installing PyTorch and project dependencies..."
pip install --upgrade pip
pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2+cu118 --index-url https://download.pytorch.org/whl/cu118
pip install -r requirements.txt

echo "Downloading dependencies for offline use..."
mkdir -p cached_packages
pip download -r requirements.txt -d cached_packages

echo "Setting up environment variables..."
export CUDA_HOME=/usr/local/cuda-11.8
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

echo "Verifying installation..."
python3 -c "import torch; print('PyTorch Version:', torch.__version__)"

echo "Installation completed successfully!"
echo "Environment can be activated using: source env/bin/activate"
