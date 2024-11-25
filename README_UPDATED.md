# **Stable-Fast-3D Offline One-Click Installer**

This installer includes the following components:
- **Python dependencies**: All necessary `.whl` files for the project’s dependencies.
- **Installer script**: A bash script to automate the installation and setup process.
- **Documentation**: Instructions for using the installer and troubleshooting.

---

## Steps:

### 1.1 Cloning the Repository
The first step was to clone the `stable-fast-3d` repository from GitHub:
```bash
git clone https://github.com/Stability-AI/stable-fast-3d
cd stable-fast-3d

### 1.2 Setting Up Offline Installer
Created the offline_installer/ directory to store all cached files in local. 
1) cached_packages/: Folder containing all .whl files of required dependencies.
2) Created install_stable_fast_3d.sh file for running files when all cached files are stored and internet connection is not available.
 install_stable_fast_3d_1.sh file if internet connection is available.


Downloaded the required Python packages and PyTorch dependencies (matching the CUDA version 11.8) using pip download:

pip download -r requirements.txt -d offline_installer/cached_packages
pip download torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2+ --index-url https://download.pytorch.org/whl/cu118 -d offline_installer/cached_packages


### 1.3 Creating the Installer Script
Developed install_stable_fast_3d.sh to automate:
	1. Installing system dependencies(python3-pip, python3-venv, ninja-build)
	2. Crate and activate a Python virtual environment.
	3. Install dependencies from /cached_packages

## Challenges Faced:
1) CUDA Version Mismatch: I had CUDA 12.2 installed, but there was no pre compiled PyTorch
   available for 12.2, so i had to downgrade to CUDA 11.8 and install the respective PyTorch version.
2) Installed Ninja, which made the build process much faster.
3) Network Issues: There were also some network issues while downloading dependencies.

## Key Lessons Learned:

1) Importance of Offline Installers: This project highlighted the importance of offline installers, especially in environments with limited or no internet connectivity. It ensures the setup process is streamlined and that dependencies can be installed without any external resources.
2) Pre-Downloading Dependencies: Pre-downloading dependencies greatly reduces setup time and ensures consistency across different machines. This is especially useful when dealing with large dependencies like PyTorch.
3) Script Verification: It was critical to include error handling in the installer script to ensure that all dependencies were correctly installed. This prevents errors later in the setup process and ensures a smooth installation experience.

## Optimizations made:

1) Caching Dependencies: To ensure that all dependencies could be installed offline, I cached all necessary .whl files in the offline_installer/cached_packages/ directory. This made the setup process independent of external resources.
2) Improved Script Verification: I added detailed verification steps in the script to check if the dependencies were successfully installed. This reduces the chances of missing packages and ensures everything is set up correctly before the user proceeds.
3) Better Error Handling: The script was enhanced to exit early if any dependency installation fails. This ensures that the user is informed immediately about any issues, preventing incomplete installations.

## How to use offline installer:

1) Download the zip file.
2) Extract the zip file.
	unzip stable-fast-3d-offline-installer.zip
	cd offline_installer/scripts
3) Make the installer script executable.
	chmod +x install_stable_fast_3d.sh
4) Run the script.
	./install_stable_fast_3d.sh
