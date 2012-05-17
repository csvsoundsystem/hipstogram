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


  P <- 1
  Q <- 0
  r <- function() rnorm(1, mean = 1, sd = 1/12)
  perspective_option <- paste(
    paste(0, ',', 0, ' ', round(width*Q*r()), ',', round(height*Q*r()), sep=''),
    paste(width, ',', 0, ' ', round(width*P*r()), ',', round(height*Q*r()), sep=''),
    paste(0, ',', height, ' ', round(width*Q*r()), ',', round(height*P*r()), sep=''),
    paste(width, ',', height, ' ', round(width*P*r()), ',', round(height*P*r()), sep='')
  )
  options0 <- paste(
    "-distort Perspective '", perspective_option, "'"
  )
  options1 <- paste(
    '-compose over -gravity center',
    '-modulate 100,120',
    '-brightness-contrast 0x20',
    '-sepia-tone 80%',
    '-blur 0x2',
    '-radial-blur 3'
#   '-virtual-pixel transparent',
#   '-morphology Distance Euclidean:4,3!'
  )
  options2 <- paste(
    '-size',
    paste(width,width,sep='x'),
    'gradient:',
    '-rotate 90',
    "distort Polar '",
    paste(width/2,0,.5,.5,sep=','),
    "' +repage",
    '-flop'
  )
  options3 <- paste(
    '-background white',
    '-channel B',
    '-combine'
  )
  options4 <- paste(
    '-compose blur',
    '-define compose:args=5x0+0+360',
    '-composite'
  )
  system(paste('convert','.histogram0.png',options0,'.histogram1.png'))
  system(paste('convert','.histogram1.png',options1,'.histogram2.png'))
  system(paste('convert',options2, '.polar.png'))
  system(paste('convert','.polar.png',options3,'.blur.png'))
  system(paste('convert','.histogram2.png', '.blur.png', options4, filename))
}
