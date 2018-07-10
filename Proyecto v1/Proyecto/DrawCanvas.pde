public class DrawCanvas
{
  PGraphics tilesmap, header, footer, collision;
  color c = color(255, 255, 255);
  boolean[][] rects;
  int tilesmapHeight, tilesmapWidth;
  PImage bg, dt0, dt1, dt2, dt3, dt4;
  Data data = new Data();
  ColBtns btnCanvas = new ColBtns();
  int indexImage = 0;
  ArrayList<PImage> images = new ArrayList<PImage>();
  PImage nuevo;
  
  public DrawCanvas()
  {
    tilesmap = createGraphics(700, 500);
    header = createGraphics(960, 50);
    footer = createGraphics(960, 40);
    collision = createGraphics(250,500);
  }
  
  void setup()
  {
    fill(0);
    noStroke();
    bg = loadImage("race2.jpg");
    
    dt0 = loadImage("dt0.png");
    images.add(dt0);
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
    tilesmapHeight = tilesmap.height;
    tilesmapWidth = tilesmap.width;

    //HEADER
    header.beginDraw();
    header.background(255, 0, 0);

    header.endDraw();
    image(header, 20, 1);
    //println("Index: "+ indexImage);


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
    //if (bg != null) tilesmap.background(BackLoad());
    //tilesmap.background(255);
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
    for(int i = 0; i<14; i++)
    {
      tilesmap.line(50 * i, 0, 50*i, tilesmapHeight);
      tilesmap.line(0, 50*i, tilesmapWidth, 50*i);
    }
  }
  

  void ChangeColor()
  {
    c = color(random(255), random(255), random(255));
  }
  
  void DrawRectangles()
  {
    for(int i = 0; i<data.coords.size(); i+=3)
    {
      tilesmap.fill(255, 11, 76, 150);
      stroke(0);
     if(btns.currentindex == 0)
     {
       indexImage = 0;
       if(indexImage == 0)
       tilesmap.image(images.get(int(data.coords.get(i+2))), 
                      data.coords.get(i), 
                      data.coords.get(i+1));
       //println("i "+ images.get(int(data.coords.get(i+2))));
     } 
     if(btns.currentindex == 1)
     {
       indexImage = 1;
       if(indexImage == 1)
       tilesmap.image(images.get(int(data.coords.get(i+2))), 
                      data.coords.get(i), 
                      data.coords.get(i+1));
       //println("i "+ images.get(int(data.coords.get(i+2))));
     } 
     if(btns.currentindex == 2)
     {
       indexImage = 2;
       if(indexImage == 2)
       tilesmap.image(images.get(int(data.coords.get(i+2))), 
                      data.coords.get(i), 
                      data.coords.get(i+1));
       //println("i "+ images.get(int(data.coords.get(i+2))));
     }
     if(btns.currentindex == 3)
     {
       indexImage = 3;
       if(indexImage == 3)
       tilesmap.image(images.get(int(data.coords.get(i+2))), 
                      data.coords.get(i), 
                      data.coords.get(i+1));
       //println("i "+ images.get(int(data.coords.get(i+2))));
     }     
     if(btns.currentindex == 4)
     {
       indexImage = 4;
       if(indexImage == 4)
       tilesmap.image(images.get(int(data.coords.get(i+2))), 
                      data.coords.get(i), 
                      data.coords.get(i+1));
       //println("i "+ images.get(int(data.coords.get(i+2))));
     }
     //println("Index: "+ btns.currentindex);
    }
  }
  void updateCoords(float x, float y, float img)
  {
    data.coords.add(x);
    data.coords.add(y);
    data.coords.add(img);
  }
  
    /*
    void removeData(int x, int y){
    
    for(int i = 0; i < data.coords.size(); i+=3){
      if(data.coords.get(i) == x){
        if(data.coords.get(i+1) == y){
          data.coords.remove(i);
          data.coords.remove(i+1);
          data.coords.remove(i+2);
        }
      }
    }
    
  }*/
  
  
}
