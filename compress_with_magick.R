

library(magick)

setwd('~/Pictures/wwbrest/wwbrest/images/')
dir.create('c')
files <- list.files('f', pattern = "jpg|JPG|jpeg")

i <- files[1]
compression <- function(i){
  # image_read(i, density = NULL, depth = NULL, strip = FALSE) %>% 
  #   image_write(path = paste0('c/', i), format = "jpeg", quality = 15)
  
  im <- image_read(paste0('f/', i), density = NULL, depth = NULL, strip = FALSE)
  w <- im %>% image_info() %>% .$width / 13
  
  im %>% 
    image_scale(geometry = w) %>% 
     image_write(path = paste0('c/', i), format = "jpeg", quality = 100)
}

files %>% purrr::map(compression)

compression_light <- function(i){
  # image_read(i, density = NULL, depth = NULL, strip = FALSE) %>% 
  #   image_write(path = paste0('c/', i), format = "jpeg", quality = 15)
  
  im <- image_read(paste0('f/', i), density = NULL, depth = NULL, strip = FALSE)
  w <- im %>% image_info() %>% .$width / 4
  
  im %>% 
    image_scale(geometry = w) %>% 
    image_write(path = i, format = "jpeg", quality = 100)
}

files %>% purrr::map(compression_light)
