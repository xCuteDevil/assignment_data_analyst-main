#!/bin/bash

set -e  # stop při chybě

REPO_URL="https://github.com/xCuteDevil/assignment_data_analyst-main.git"
FOLDER="test-run"

echo "🧹 Mazání staré složky..."
rm -rf $FOLDER

echo "Klonování repozitáře..."
git clone $REPO_URL $FOLDER

cd $FOLDER

echo "Vytváření virtuálního prostředí..."
python3 -m venv .venv

echo "⚡ Aktivace prostředí..."
source .venv/bin/activate

echo "Instalace závislostí..."
pip install -U pip
pip install -r requirements.txt

echo "Spouštím Jupyter Lab..."
python3 -m jupyter lab