#!/bin/sh
pip install lektor && \
git clone https://gitlab.com/rhysmoyne/school-website.git && \
cd school-website && \
git submodule init && \
git submodule update && \
git status