ArrayList<Mold> molds;
Mold newMold;
boolean is3D;

void setup() {
  fullScreen(P3D);
  molds = new ArrayList();
  is3D = false;
  newMold = new Mold();
}

void draw() {

  if (is3D) {
    lights();
    background(#333333);
    translate(width/2, height/2, 0);//図形の中心座標
    for (Mold mold : molds)
      mold.display3D();
    return;
  }

  if (mousePressed)
    newMold.addPoint(mouseX, mouseY);

  noLights();
  newMold.display2D();
  for (Mold mold : molds)
    mold.display2D();
}

void mouseReleased() {
  molds.add(newMold);
  newMold = new Mold();
}

void keyPressed() {
  is3D = !is3D;
  if (!is3D)background(#ffffff);
}
