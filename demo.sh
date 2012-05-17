#!/bin/bash

Rscript -e "source('hipstogram.r'); hipstogram(rnorm(42), width=800, height=600)"
feh hipstogram.png
