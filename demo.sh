#!/bin/bash

Rscript -e "source('hipstogram.r'); hipstogram(rnorm(42), width=400, height=400)"
feh hipstogram.png
