/* Starry Night */
  
/*
** Copyright by Kesson Dalef (Giovanni Muzio)
** Creative Commons: Attribution Non-Commercial license
**
** mail: kessoning@gmail.com
** YouTube: http://www.youtube.com/user/complexPolimorphic
** Vimeo: http://vimeo.com/kessondalef
** Behance: http://www.behance.com/kessondalef
** web: www.kessondalef.com
** Github: https://github.com/KessonDalef
*/
  
// release date: February 2015

// Inspired by Starry Night by Vincent Van Gogh
// Based on Flow Field example by Daniel Shiffman in Nature Of Code book

// Via Reynolds: http://www.red3d.com/cwr/steer/FlowFollow.html


PGraphics pg;

// Flowfield object
FlowField flowfield;
// An ArrayList of brushes
ArrayList<PaintBrush> brushes;

int maxparticles = 40000;

void setup() {
  size(1024, 768, OPENGL);

  // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(50);
  brushes = new ArrayList<PaintBrush>();
  
  background(#00031A);
}

void draw() {
  for (int i = 0; i < brushes.size (); i++) {
    PaintBrush v = brushes.get(i);
    v.follow(flowfield);
    v.run();
    if (v.isDead()) {
      brushes.remove(i);
    }
  }
  addBrushes();
}

void addBrushes() {
  if (brushes.size() < maxparticles) {
    for (int k = 0; k < 50; k++) {
      brushes.add(new PaintBrush(new PVector(random(-200, width+200), random(-200, height+200)), random(2, 5), random(0.1, 0.5)));
    }
  }
}
