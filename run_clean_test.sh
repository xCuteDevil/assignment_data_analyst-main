#!/bin/bash

set -e

REPO_URL="https://github.com/xCuteDevil/assignment_data_analyst-main.git"
FOLDER="test-run"

echo "========================================"
echo " STEP 1/5: Cleaning old directory"
echo "========================================"
if [ -d "$FOLDER" ]; then
    echo "⚠️ Folder exists. Trying to remove..."
    rm -rf "$FOLDER" 2>/dev/null || {
        echo "❌ Cannot remove $FOLDER (probably in use). Please close Jupyter and retry."
        exit 1
    }
fi

echo "========================================"
echo " STEP 2/5: Cloning repository"
echo "========================================"
git clone $REPO_URL $FOLDER

cd $FOLDER

echo "========================================"
echo " STEP 3/5: Creating virtual environment"
echo "========================================"
python3 -m venv .venv

echo "========================================"
echo " STEP 4/5: Activating environment"
echo "========================================"

if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
elif [ -f ".venv/Scripts/activate" ]; then
    source .venv/Scripts/activate
else
    echo " Activation script not found"
    exit 1
fi

echo "========================================"
echo " STEP 5/5: Installing dependencies"
echo "   (this may take 1–3 minutes...)"
echo "========================================"

python -m pip install -U pip
python -m pip install -r requirements.txt

echo "========================================"
echo " Launching Jupyter Lab..."
echo "========================================"

python -m jupyter lab