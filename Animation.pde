class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  boolean end;
  int j;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into one digit
      String filename = imagePrefix + nf(i, 1) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, float gifWidth, float gifHeight) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos, gifWidth, gifHeight);
    if (frame == 3){
      j += 1;
      if (j >= 1){
        end = true;
      }
    }
  }
  
  int getWidth() {
    return images[0].width;
  }
}
