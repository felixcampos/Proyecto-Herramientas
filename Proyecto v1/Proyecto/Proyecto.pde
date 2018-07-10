 import controlP5.*;
ColBtns btns = new ColBtns();
//WorkArea area = new WorkArea();
//STATES
enum ToolState
{
  NONE,
  DRAWING
}
ToolState state = ToolState.NONE;
//DATA
Data data = new Data();
//ARCHIVO
String filePath = null;
boolean overRect;

//ESTADOS

DrawCanvas myCanvas;
ControlP5 ui;
PImage backgroundImage, bg2, srcImage;


void setup()
{
  size(1000, 650);

  ui = new ControlP5(this);
  myCanvas = new DrawCanvas();
  btns.Init();
  backgroundImage = loadImage("race3.jpg"); 
  bg2 = loadImage("racetest.png"); 
  myCanvas.setup();
  
  //Main Buttons
  ui.addButton("SaveSource").setPosition(30, 10) //595
    .setSize(100, 30).setLabel("Save");
    
  ui.addButton("OpenSource").setPosition(140, 10)
    .setSize(100, 30).setLabel("Load");
  
  ui.addButton("Reset").setPosition(250, 10)
    .setSize(100, 30).setLabel("New");
    
  ui.addButton("LoadImage").setPosition(360, 10)
    .setSize(100, 30).setLabel("Load Background");
  
  ui.addButton("ChangeColor").setPosition(470, 10)
    .setSize(100, 30).setLabel("Change Color");
}
void draw()
{ 
  background(143, 143, 143);
  myCanvas.draw();
  drawHints();
  btns.Execute();
}
void LoadImage()
{
  selectInput("Select a file to process:", "fileSelected");
  println("Cargando...");
}
  void fileSelected(File imgSelected) {
  if (imgSelected == null) {
    println("Window was closed or the user hit cancel.");
    } else {
    println("User selected " + imgSelected.getAbsolutePath());
     if( imgSelected.exists() )
      {
       srcImage = loadImage( imgSelected.getAbsolutePath() ); 
       println("Image loaded");
       ChargeNewImage();
      }
    }
  }

void ChangeColor()
{
  myCanvas.ChangeColor();
}

void ChargeNewImage()
{
   srcImage.resize(700, 500);
   myCanvas.tilesmap.background(srcImage);
}

void Reset()
{
  setup();
}

void drawHints()
{
  switch(state)
  {
    case NONE:
    {
      cursor(HAND);
      fill(0, 255, 0);  
      noStroke();
       if(btns.currentindex == 0)
       rect(mouseX, mouseY, 40, 40);
       if(btns.currentindex == 1)
       triangle(mouseX, mouseY, mouseX, mouseY-40, mouseX+40, mouseY);
       if(btns.currentindex == 2)
       triangle(mouseX, mouseY, mouseX, mouseY+40, mouseX+40, mouseY);
       if(btns.currentindex == 3)
       triangle(mouseX, mouseY, mouseX, mouseY+40, mouseX-40, mouseY);
       if(btns.currentindex == 4)
       triangle(mouseX, mouseY, mouseX, mouseY-40, mouseX-40, mouseY);
      break;
    }
    case DRAWING:
    {
      cursor(HAND);
      break;
    }
    
  }
}

void SaveSource()
{
  selectOutput("Seleccione una ruta", "onFileSelectedSave");
}
void OpenSource()
{
  selectInput("Seleccione un archivo", "onFileSelectedOpen");
}

 void mousePressed()
 {
    if (mouseButton == LEFT)
    {
    float x = 50 * int((mouseX-20)/50);
    float y = 50 * int((mouseY-80)/50);
    if(mouseX<700 && mouseY<500)
    myCanvas.updateCoords(x,y,myCanvas.indexImage);
    //println("x= " + x + " " + "y= " + y);
    }
  }

void onFileSelectedOpen(File selection)
{
  filePath = selection.getAbsolutePath();
  String[] datalines = loadStrings(filePath);
  myCanvas.data.coords = new ArrayList<Float>(); 
  String entire = join(datalines, " ");
  datalines = split(entire, " ");
  
  for(int i = 0; i<datalines.length; i++)
  {
    myCanvas.data.coords.add(float(datalines[i]));
  }
  ChargeNewImage();
}

void onFileSelectedSave(File selection)
{
  PrintWriter fileWritter = createWriter(selection.getAbsolutePath());
  //fileWritter.println("smash32322");
  
  for (int i = 0; i < myCanvas.data.coords.size(); i++)
  {
    fileWritter.println(myCanvas.data.coords.get(i));  
  }
  fileWritter.flush();
  fileWritter.close();
  ChargeNewImage();
}

boolean overRect(int x, int y, int width , int height)  {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height)
    {
      return true;
    } else 
      {
      return false;
      }  
  }
