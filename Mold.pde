//vector：描いた点の集合
//thick：線の厚さ
//breadth：線の幅

class Mold {
  ArrayList<PVector> points;

  Mold() {
    points = new ArrayList();
  }

  void display2D() {

    pushMatrix();

    stroke(0);
    strokeWeight(10);

    for (int i = 0; i < points.size()-1; i++) 
      line(points.get(i).x, points.get(i).y, points.get(i+1).x, points.get(i+1).y);

    popMatrix();
  }

  void display3D() {
    noStroke();
    createMold(points, 25, 50);
  }

  void addPoint(float x, float y) {
    points.add(new PVector(x, y));
  }

  void createMold(ArrayList<PVector> vector, int thick, int bredth) {

    pushMatrix();
    translate(-width/2, -height/2, 0);

    //正面（赤）
    fill(255, 0, 0);

    beginShape(TRIANGLE_STRIP);

    for (int i=1; i<vector.size(); i++) {

      PVector inside_line = PVector.sub(vector.get(i), vector.get(i-1));

      inside_line.setMag(bredth);
      inside_line.rotate(HALF_PI);

      vertex(vector.get(i).x, vector.get(i).y, 0);
      vertex(inside_line.x+vector.get(i).x, inside_line.y+vector.get(i).y, 0);
    }

    endShape();


    //後ろの面（青）
    fill(0, 0, 255);
    beginShape(TRIANGLE_STRIP);

    for (int i=1; i<vector.size(); i++) {

      PVector inside_line = PVector.sub(vector.get(i), vector.get(i-1));

      inside_line.setMag(bredth);
      inside_line.rotate(HALF_PI);

      vertex(vector.get(i).x, vector.get(i).y, thick);
      vertex(inside_line.x+vector.get(i).x, inside_line.y+vector.get(i).y, thick);
    }
    endShape();


    //上の面（緑）
    fill(0, 255, 0);

    beginShape(TRIANGLE_STRIP);

    for (int i=1; i<vector.size(); i++) {

      PVector inside_line = PVector.sub(vector.get(i), vector.get(i-1));

      inside_line.setMag(bredth);
      inside_line.rotate(HALF_PI);


      vertex(vector.get(i).x, vector.get(i).y, 0);
      vertex(vector.get(i).x, vector.get(i).y, thick);
    }

    endShape();


    //下の面（黄色）
    fill(255, 255, 0);

    beginShape(TRIANGLE_STRIP);

    for (int i=1; i<vector.size(); i++) {

      PVector inside_line = PVector.sub(vector.get(i), vector.get(i-1));

      inside_line.setMag(bredth);
      inside_line.rotate(HALF_PI);

      vertex(inside_line.x + vector.get(i).x, inside_line.y + vector.get(i).y, 0);
      vertex(inside_line.x + vector.get(i).x, inside_line.y + vector.get(i).y, thick);
    }

    endShape();

    popMatrix();
  }
}
