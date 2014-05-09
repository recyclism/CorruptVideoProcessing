/*
Corrupt.video Processing version by Recyclism aka Benjamin Gaulon
Paris. May 2014.
Fill free to use / hack / modify this code

*/

import processing.video.*;
import java.awt.*;

Capture video;

PImage photo;
PImage faceSave;

void setup() {
  background(0);
  //  size(1280, 480);
  size(640, 480);

  video = new Capture(this, width, height);
  video.start();
}

void draw() {
  scale(1);
  image(video, 0, 0 );

  // save frame as jpg
  saveFrame("partialSave.jpg");

// load binary of "partialSav"
  byte b[] = loadBytes("partialSave.jpg");

  // glitch faces

    byte bCopy[] = new byte[b.length];
  arrayCopy(b, bCopy);
  // load binary of file

  int scrambleStart = 10;
  // scramble start excludes 10 bytes///

  int scrambleEnd = b.length;
  // scramble end ///

  int nbOfReplacements = int (random(1, 10));
  // Number of Replacements - Go easy with this as too much will just kill the file ///

  // Swap bits ///
  for (int g = 0; g < nbOfReplacements; g++)

  {
    int PosA = int(random (scrambleStart, scrambleEnd));

    int PosB = int(random (scrambleStart, scrambleEnd));

    byte tmp = bCopy[PosA];

    bCopy[PosA] = bCopy[PosB];

    bCopy[PosB] = tmp;

    // Save the file  in "corrupted" folder ///
    saveBytes("partialSave.jpg", bCopy);
  }

  // load glitched frame
  photo = loadImage("partialSave.jpg");
  image(photo, 0, 0, width, height );
}


void captureEvent(Capture c) {
  c.read();
}


