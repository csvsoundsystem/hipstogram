hipstamatic <- function(...){
  print('I want this to be a device that plots to png and then hipstamatizes')
}

hipstogram <- function(x,
  filename='hipstogram.png', width=1024, height=800,
  ...
) {
  png(filename='.histogram0.png', width=width, height=height)
  hist(x, col=2, ...)
  dev.off()

  # Pass through the Hipstomatic
  # https://github.com/paulasmuth/hipster_filters/blob/master/vintage_processor.rb
  options0 <- paste(
    '-compose over -gravity center',
    '-modulate 100,120',
    '-brightness-contrast 0x20',
    '-sepia-tone 80%',
    '-blur 0x2',
    '-radial-blur 3',
    '-virtual-pixel transparent',
    '-morphology Distance Euclidean:4,3!'
  )
  options1 <- paste(
    '-size',
    paste(width,height,sep='x'),
    'gradient:',
    '-rotate 90',
    "distort Polar '36.5,0,.5,.5' +repage",
    '-flop'
  )
  options2 <- paste(
    '-background white',
    '-channel B',
    '-combine'
  )
  options3 <- paste(
    '-compose blur',
    '-define compose:args=5x0+0+360',
    '-composite'
  )
  system(paste('convert','.histogram0.png',options0,'.histogram1.png'))
  system(paste('convert',options1, '.polar.png'))
  system(paste('convert','.polar.png',options2,'.blur.png'))
  system(paste('convert','.histogram1.png', '.blur.png', options3, filename))
}
