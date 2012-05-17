hipstamatic <- function(...){
  print('I want this to be a device that plots to png and then hipstamatizes')
}

hipstogram <- function(x,
  filename='hipstogram.png', width=1024, height=800,
  ...
) {
  png(filename='.histogram.png', width=width, height=height)
  hist(x, ...)
  dev.off()

  # Pass through the Hipstomatic
  # https://github.com/paulasmuth/hipster_filters/blob/master/vintage_processor.rb
  outputoptions <- '-compose over -gravity center -modulate 100,120 -brightness-contrast 0x20 -sepia-tone 80%'
  system(paste('convert','.histogram.png',outputoptions,filename))
}
