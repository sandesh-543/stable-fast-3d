echo "Starting offline installation for stable-fast-3d..."

echo "Installing system dependencies..."
sudo apt update
sudo apt install -y python3-pip python3-venv ninja-build

echo "Setting up Python virtual environment..."
python3 -m venv env
source env/bin/activate

echo "Installing dependencies from cached files..."
if ! pip install --no-index --find-links=./offline_installer/cached_packages -r ./offline_installer/requirements.txt; then
    echo "Error: Failed to install dependencies. Ensure cached_packages and requirements.txt are in the offline-installer directory."
    exit 1
fi

echo "Verifying Installation..."
python3 -c "import torch; print('PyTorch version:', torch.__version__)"

echo "Offline Installation completed successfully"
echo "Environment can be activated using: source env/bin/activate"

