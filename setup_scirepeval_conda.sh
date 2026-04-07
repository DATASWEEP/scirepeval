#!/usr/bin/env bash
set -euo pipefail

INSTALLER="Miniconda3-latest-Linux-x86_64.sh"

curl -O "https://repo.anaconda.com/miniconda/${INSTALLER}"

if command -v conda >/dev/null 2>&1; then
  eval "$(conda shell.bash hook)"
else
  bash "${INSTALLER}" -b -p "${HOME}/miniconda3"
  # shellcheck source=/dev/null
  source "${HOME}/miniconda3/etc/profile.d/conda.sh"
fi

conda create -n scirepeval python=3.10.20 pip=26.0.1 -y
conda activate scirepeval
pip install -r requirements_new_models.txt
