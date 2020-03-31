#!/bin/bash
# Bash script to download the PASCAL VOC 2012 dataset.

# Exit immediately if a command exits with a non-zero status.
set -e

CURRENT_DIR=$(pwd)
WORK_DIR="./pascal_voc_seg"
mkdir -p "${WORK_DIR}"
cd "${WORK_DIR}"

# Helper function to download and unpack VOC 2012 dataset.
download_and_uncompress() {
  local BASE_URL=${1}
  local FILENAME=${2}

  if [ ! -f "${FILENAME}" ]; then
    echo "Downloading ${FILENAME} to ${WORK_DIR}"
    wget -nd -c "${BASE_URL}/${FILENAME}"
  fi
  echo "Uncompressing ${FILENAME}"
  tar -xf "${FILENAME}"
}

# Download the images.
BASE_URL="http://host.robots.ox.ac.uk/pascal/VOC/voc2012/"
FILENAME="VOCtrainval_11-May-2012.tar"

download_and_uncompress "${BASE_URL}" "${FILENAME}"

# Downloading the augmented annotations
AUGMENTED_ANNOTATIONS_URL="https://www.dropbox.com/s/oeu149j8qtbs1x0/SegmentationClassAug.zip?dl=1"
wget "$AUGMENTED_ANNOTATIONS_URL"