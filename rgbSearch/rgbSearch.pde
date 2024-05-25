// rgb search or gradient search
// by bug creates
// create date: may 2024
// date last modified: may 2024

// variables
int gameScreen = 0;
int r = 125;
int g = 125;
int b = 125;
char locked = 'b';
int rTarget = floor(int(random(255))/5)*5;
int gTarget = floor(int(random(255))/5)*5;
int bTarget = floor(int(random(255))/5)*5;
int last = 0;
int miliseconds = 0;

// sound variables
import processing.sound.*;
Sound s;
SinOsc tri1 = new SinOsc(this);
SinOsc tri2 = new SinOsc(this);
SinOsc tri3 = new SinOsc(this);

void setup() {
  size(640,360);
}

void draw() {
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    winScreen();
  } else if (gameScreen == 4) {
    quitScreen();
  }
  
  // adjust freq by center rgb values
  tri1.freq(r+120);
  tri2.freq(g+120);
  tri3.freq(b+120);
  tri1.play();
  tri2.play();
  tri3.play();
}

void initScreen() {
    for (int ii = 0; ii <= width; ii += 1) {
      for (int jj = 0; jj <= height; jj += 1) {
        stroke(r-width/2+ii,g-height/2+jj,b);
        point(ii,jj);
      }
    }
    
    textAlign(CENTER);
    fill(0);
    text("gradient search: a game by bug creates",width*3/4,height*3/4);
}

void gameScreen() {
  if (r == rTarget && g == gTarget && b == bTarget) {
    winGame();
  }
  
  // gradient logic
  stroke(0);
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
  
  // middle square color logic
  strokeWeight(2);
  if (locked == 'b' && r == rTarget && g == gTarget) {
    stroke(255);
    miliseconds = millis();
  } else if (locked == 'b' && abs(r - rTarget) < 20 && abs(g - gTarget) < 20) {
    stroke(150);
  } else if (locked == 'b' && abs(r - rTarget) < 50 && abs(g - gTarget) < 50) {
    stroke(100);
  } else if (locked == 'b' && abs(r - rTarget) < 80 && abs(g - gTarget) < 80) {
    stroke(50);
  } else if (locked == 'g' && r == rTarget && b == bTarget) {
    stroke(255);
  } else if (locked == 'g' && abs(r - rTarget) < 20 && abs(b - bTarget) < 20) {
    stroke(150);
  } else if (locked == 'g' && abs(r - rTarget) < 50 && abs(b - bTarget) < 50) {
    stroke(100);
  } else if (locked == 'g' && abs(r - rTarget) < 80 && abs(b - bTarget) < 80) {
    stroke(50);
  } else if (locked == 'r' && g == gTarget &&  b == bTarget) {
    stroke(255);
  } else if (locked == 'r' && abs(g - gTarget) < 20 && abs(b - bTarget) < 20) {
    stroke(150);
  } else if (locked == 'r' && abs(g - gTarget) < 50 && abs(b - bTarget) < 50) {
    stroke(100);
  } else if (locked == 'r' && abs(g - gTarget) < 80 && abs(b - bTarget) < 80) {
    stroke(50);
  } else {
    stroke(0);
  }
  
  println(r + " " + rTarget);
  println(g + " " + gTarget);
  println(b + " " + bTarget);
  
  noFill();
  rect(width/2-5,height/2-5,10,10);
  
  // 'color warp' buttons
  stroke(0);
  strokeWeight(1);
  rectMode(CENTER);
  button(width-40,height-40,20,20,'r');
  button(width-70,height-40,20,20,'g');
  button(width-100,height-40,20,20,'b');
  
  // target
  strokeWeight(2);
  stroke(0);
  rectMode(CORNER);
  fill(rTarget, gTarget, bTarget);
  rect(10,10,50,50);
}

void winScreen() {
  for (int ii = 0; ii <= width; ii += 1) {
      for (int jj = 0; jj <= height; jj += 1) {
        stroke(r-width/2+ii,g-height/2+jj,b);
        point(ii,jj);
      }
    }
    
    textAlign(CENTER);
    fill(0);
    text("you win!",width*3/4,height*3/4);
    text(nfc((miliseconds - last)/1000) + " seconds",width*3/4,height*3/4+30);
}

void quitScreen() {
  for (int ii = 0; ii <= width; ii += 1) {
      for (int jj = 0; jj <= height; jj += 1) {
        stroke(r-width/2+ii,g-height/2+jj,b);
        point(ii,jj);
      }
    }
    
  stroke(0);
  line(width/2,0,width/2,height);
  
  textAlign(CENTER);
  fill(0);
  text("quit",width/3,height/2);
  text("restart",width*2/3,height/2);
}

// inputs
public void keyPressed() {
  if (key == 'd' || keyCode == RIGHT) {
    if (locked == 'b' && r < 255) {
      r += 5;
    } else if (locked == 'g' && b < 255) {
      b += 5;
    } else if (locked == 'r' && g < 255) {
      g += 5;
    }
  } else if (key == 'a' || keyCode == LEFT) {
    if (locked == 'b' && r > 0) {
      r -= 5;
    } else if (locked == 'g' && b > 0) {
      b -= 5;
    } else if (locked == 'r' && g > 0) {
      g -= 5;
    }
  } else if (key == 'a' || keyCode == UP) {
    if (locked == 'b' && g > 0) {
      g -= 5;
    } else if (locked == 'g' && r > 0) {
      r -= 5;
    } else if (locked == 'r' && b > 0) {
      b -= 5;
    }
  } else if (key == 's' || keyCode == DOWN) {
    if (locked == 'b' && g < 255) {
      g += 5;
    } else if (locked == 'g' && r < 255) {
      r += 5;
    } else if (locked == 'r' && b < 255) {
      b += 5;
    }
  }
  
  if (keyCode == ESC || key == 'q') {
    quitGame();
  }
  
  if (keyCode == ENTER || keyCode == RETURN) {
    if (gameScreen == 0 || gameScreen == 2 || gameScreen == 3) {
      startGame();
    }
  }
}

public void mouseReleased() {
  if (gameScreen == 0 || gameScreen == 2 || gameScreen == 3) {
    startGame();
  } else if (gameScreen == 4) {
    if (mouseX < width/2) {
      exit();
    } else {
      startGame();
    }
  }
}

// functions
void button(int x, int y, int w, int h, char c) {
 if (c == 'r') {
   if (locked == 'r') {
     strokeWeight(5);
     stroke(255);
   } else {
     strokeWeight(1);
     stroke(0);
   }
   fill(r,0,0);
 } else if (c == 'g') {
   if (locked == 'g') {
     strokeWeight(5);
     stroke(255);
   } else {
     strokeWeight(1);
     stroke(0);
   }
   fill(0,g,0);
 } else if (c == 'b') {
   if (locked == 'b') {
     strokeWeight(5);
     stroke(255);
   } else {
     strokeWeight(1);
     stroke(0);
   }
   fill(0,0,b);
 }
 rect(x,y,w,h);
 if(mousePressed){
  if(mouseX > x - 5 && mouseX < x + w + 5 && mouseY > y - 5 && mouseY < y + h + 5){
    locked = c;
    print(c);
  }
 }
}

void startGame() {
  r = 125;
  g = 125;
  b = 125;
  locked = 'b';
  rTarget = floor(int(random(255))/5)*5;
  gTarget = floor(int(random(255))/5)*5;
  bTarget = floor(int(random(255))/5)*5;
  
  last = millis();
  
  gameScreen=1;
}

void winGame() {
  gameScreen=2;
}

void quitGame() {
  gameScreen=4;
}

void loadTitle() {
  gameScreen=0;
}
