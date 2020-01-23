class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int digitNumber;
  int loopNum;
  boolean end;
  int j;
  
  Animation(String imagePrefix, int count, int numOfLoops) {
    imageCount = count;
    loopNum = numOfLoops;
    if (imageCount < 10){
      digitNumber = 1;
    }
    else {
      digitNumber = 2;
    }
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into one digit
      String filename = imagePrefix + nf(i, digitNumber) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, float gifWidth, float gifHeight) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos, gifWidth, gifHeight);
    if (frame == imageCount - 1){
      j += 1;
      if (j >= loopNum + 1){
        end = true;
      }
    }
  }
  
  int getWidth() {
    return images[0].width;
  }
}
