public class DrawCanvas
{
  PGraphics tilesmap, header, footer, collision;
  color c = color(255, 255, 255);
  boolean[][] rects;
  int tilesmapHeight, tilesmapWidth;
  PImage bg, dt1, dt2, dt3, dt4;
  Data data = new Data();
  ColBtns btnCamvas = new ColBtns();
  int indexImage;
  ArrayList<PImage> images = new ArrayList<PImage>();
  
  public DrawCanvas()
  {
    tilesmap = createGraphics(700, 500);
    header = createGraphics(960,50);
    footer = createGraphics(960, 40);
    collision = createGraphics(250,500);
  }
  
  void setup()
  {
    fill(0);
    noStroke();
    bg = loadImage("race2.jpg");
    
    dt1 = loadImage("dt1.png");
    images.add(dt1);
    dt2 = loadImage("dt2.png");
    images.add(dt2);
    dt3 = loadImage("dt3.png");
    images.add(dt3);
    dt4 = loadImage("dt4.png");
    images.add(dt4);
    
  }
  void draw()
  { 
    println(btnCamvas.currentindex);
    tilesmapHeight = tilesmap.height;
    tilesmapWidth = tilesmap.width;

    //HEADER
    header.beginDraw();
    header.background(255, 0, 0);

    header.endDraw();
    image(header, 20, 20);
      println(btns.currentindex);

 /*   
    //COLLISION
    collision.beginDraw();
    collision.background(255, 255, 0);
    //collision.rect(80,20,100,100);
    //collision.triangle(50, 50, 50, 0, 100, 50);
    //collision.triangle(140, 240, 240, 140, 140, 140);
    //collision.triangle(140, 300, 240, 300, 140, 200);
    //collision.triangle(140, 300, 240, 300, 240, 200);
   
    collision.endDraw();
    image(collision, 730, 80);
  */    
   
    
    //TILESMAP
    tilesmap.beginDraw(); //INICIO
    if (bg != null) tilesmap.background(BackLoad());
    //if(is)tilesmap.background(BackLoad());
    CreateGrid();
    DrawRectangles();
    tilesmap.endDraw(); //FIN
    image(tilesmap, 20, 80);
   
    //FOOTER
    footer.beginDraw();
    footer.background(0, 255, 0);
    footer.endDraw();
    image(footer, 20, 590);
  }
  
  void CreateGrid()
  {
    for(int i = 0; i<20; i++)
    {
      tilesmap.line(50 * i, 0, 50*i, tilesmapHeight);
      tilesmap.line(0, 50*i, tilesmapWidth, 50*i);
    }
  }

  void ChangeColor()
  {
    c = color(random(255), random(255), random(255));
  }
  
  void CreateOn(int x , int y, int listNumber)
  {

    image(images.get(listNumber),  x,  y , 50 , 50);
  }
  
  void DrawRectangles()
  {
    for(int i = 0; i<data.coords.size(); i+=2)
    {
      tilesmap.fill(255, 11, 76, 150);
      stroke(0);
     tilesmap.rect(data.coords.get(i), data.coords.get(i+1), 50, 50);
     //if(btns.currentindex==0) 
     //{
       //tilesmap.rect(data.coords.get(i), data.coords.get(i+1), 50, 50);
       //tilesmap.line(data.coords.get(i), data.coords.get(i+1), 50, 50);
       //CreateOn(500, 500,0);
     //}
    //if(btns.currentindex==1) tilesmap.image(dt1, data.coords.get(i), data.coords.get(i+1));
     //if(btns.currentindex==2) tilesmap.image(dt2, data.coords.get(i), data.coords.get(i+1));
     //if(btns.currentindex==3) tilesmap.image(dt3, data.coords.get(i), data.coords.get(i+1));
     //if(btns.currentindex==4)tilesmap.image(dt4, data.coords.get(i), data.coords.get(i+1));
     //if(btns.currentindex == 0)tilesmap.rect(data.coords.get(i), data.coords.get(i+1), 50, 50);
     //else tilesmap.rect(data.coords.get(i), data.coords.get(i+1), 50, 50);
     //if(btns.currentindex == 1)triangle(data.coords.get(i), data.coords.get(i+1), 20, 30, 10, 20);
     //if(btns.currentindex == 2)triangle(mouseX, mouseY, mouseX, mouseY+40, mouseX+40, mouseY);
     //if(btns.currentindex == 3)triangle(mouseX, mouseY, mouseX, mouseY+40, mouseX-40, mouseY);
     //if(btns.currentindex == 4)triangle(mouseX, mouseY, mouseX, mouseY-40, mouseX-40, mouseY);
    }
  }
  void updateCoords(float x, float y)
  {
    data.coords.add(x);
    data.coords.add(y);
    data.triangles.add(0,dt1);
  }
  PImage LoadImage()
  {
    tilesmap.beginDraw();
    backgroundImage = loadImage("race.jpg"); 
    backgroundImage.resize(700, 500);
    tilesmap.image(backgroundImage, 20, 80);
    tilesmap.background(backgroundImage);
    tilesmap.endDraw();
    return backgroundImage;
  }  
}
