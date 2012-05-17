#!/bin/bash

Rscript -e "source('hipstogram.r'); hipstogram(rnorm(42))"
feh hipstogram.png
