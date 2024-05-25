int r = 125;
int g = 125;
int b = 125;
char locked = 'b';
int x = 0;
int y = 0;
int xpoint = 0;
int ypoint = 0;
int rTarget = int(random(255));
int gTarget = int(random(255));
int bTarget = int(random(255));

void setup() {
  size(640,360);
}

void draw() {
  stroke(0);
  fill(0);
  rect(width/2-5,height/2-5,10,10);
  if (locked == 'b') {
    for (int ii = 0; ii <= width; ii += 1) {
      for (int jj = 0; jj <= height; jj += 1) {
        stroke(r-width/2+ii,g-height/2+jj,b);
        point(ii,jj);
      }
    }
  } else if (locked == 'g') {
    for (int ii = 0; ii <= width; ii += 1) {
      for (int jj = 0; jj <= height; jj += 1) {
        stroke(r-height/2+jj,g,b-width/2+ii);
        point(ii,jj);
      }
    }
  } else if (locked == 'r') {
    for (int ii = 0; ii <= width; ii += 1) {
      for (int jj = 0; jj <= height; jj += 1) {
        stroke(r,g-width/2+ii,b-height/2+jj);
        point(ii,jj);
      }
    }
  }
  rectMode(CENTER);
  button(width-40,height-40,20,20,'r');
  button(width-70,height-40,20,20,'g');
  button(width-100,height-40,20,20,'b');
}

public void keyPressed() {
  if (key == 'd' || keyCode == RIGHT) {
    if (locked == 'b' && r <= 255) {
      r += 5;
    } else if (locked == 'g' && b <= 255) {
      b += 5;
    } else if (locked == 'r' && g <= 255) {
      g += 5;
    }
  } else if (key == 'a' || keyCode == LEFT) {
    if (locked == 'b' && r >= 0) {
      r -= 5;
    } else if (locked == 'g' && b >= 0) {
      b -= 5;
    } else if (locked == 'r' && g >= 0) {
      g -= 5;
    }
  } else if (key == 'a' || keyCode == UP) {
    if (locked == 'b' && g >= 0) {
      g -= 5;
    } else if (locked == 'g' && r >= 0) {
      r -= 5;
    } else if (locked == 'r' && b >= 0) {
      b -= 5;
    }
  } else if (key == 's' || keyCode == DOWN) {
    if (locked == 'b' && g <= 255) {
      g += 5;
    } else if (locked == 'g' && r <= 255) {
      r += 5;
    } else if (locked == 'r' && b <= 255) {
      b += 5;
    }
  }
}

void button(int x, int y, int w, int h, char c) {
 if (c == 'r') {
   stroke(0);
   fill(255,0,0);
 } else if (c == 'g') {
   stroke(0);
   fill(0,255,0);
 } else if (c == 'b') {
   stroke(0);
   fill(0,0,255);
 }
 rect(x,y,w,h);
 if(mousePressed){
  if(mouseX > x - 5 && mouseX < x + w + 5 && mouseY > y - 5 && mouseY < y + h + 5){
    locked = c;
    print(c);
  }
 }
}

/*void gameScreen() {
  if (locked == 'b') {
    for (int ii = r - 40; ii <= r + 40; ii += 1) {
      for (int jj = g - 40; jj <= g + 40; jj += 1) {
        stroke(r+ii,g+jj,b);
      }
    }
  }
}*/

/*void draw() {
  if (locked == 'b') {
    for (int ii = 0; ii <= width; ii += 1) {
      for (int jj = 0; jj <= height; jj += 1) {
        stroke(r/80,g/80,100);
        point(ii,jj);
      }
    }
  }
}
*/
