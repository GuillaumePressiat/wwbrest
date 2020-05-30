

library(magick)

setwd('~/Pictures/wwbrest/wwbrest/images/')
dir.create('c')
files <- list.files(pattern = "jpg|JPG")
i <- files[1]
compression <- function(i){
  # image_read(i, density = NULL, depth = NULL, strip = FALSE) %>% 
  #   image_write(path = paste0('c/', i), format = "jpeg", quality = 15)
  
  im <- image_read(i, density = NULL, depth = NULL, strip = FALSE)
  w <- im %>% image_info() %>% .$width / 7.5
  
  im %>% 
    image_scale(geometry = w) %>% 
     image_write(path = paste0('c/', i), format = "jpeg", quality = 100)
}

files %>% purrr::map(compression)
