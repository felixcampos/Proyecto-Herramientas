import controlP5.*;
ColBtns btns = new ColBtns();
WorkArea area = new WorkArea();
//STATES
enum ToolState
{
  NONE,
  DRAWING,
  ERASING,
}
ToolState state = ToolState.NONE;
//DATA
Data data = new Data();
//ARCHIVO
PrintWriter file = null;
String filePath = null;
String dataS = "";
boolean overRect;
boolean is;

//ESTADOS
int currentColor = 1;
int typeButton = 1;

DrawCanvas myCanvas;
ControlP5 ui;
PImage backgroundImage, bg2;

void setup()
{
  size(1000, 650);

  ui = new ControlP5(this);
  myCanvas = new DrawCanvas();
  btns.Init();
  backgroundImage = loadImage("race3.jpg"); 
  bg2 = loadImage("racetest.png"); 
  area.Init();
  myCanvas.setup();
  
  //Main Buttons
  ui.addButton("SaveSource").setPosition(30, 30)
    .setSize(100, 30).setLabel("Save");
  
  ui.addButton("4").setPosition(140, 30)
    .setSize(100, 30).setLabel("New");
    
  ui.addButton("OpenSource").setPosition(250, 30)
    .setSize(100, 30).setLabel("Load");
    
  ui.addButton("LoadImage").setPosition(360, 30)
    .setSize(100, 30).setLabel("BackLoad");
  
  ui.addButton("ChangeColor").setPosition(470, 30)
    .setSize(100, 30).setLabel("Change Color");
}
void draw()
{ 
  //background(143, 143, 143);
  background(0);
  myCanvas.draw();

  drawHints();
  //area.Execute();
  btns.Execute();
}
  public PImage BackLoad()
  {
    bg2 = loadImage("racetest.png"); 
    myCanvas.tilesmap.background(bg2);
    is = true;
    return bg2;
  }  
void ChangeColor()
{
  myCanvas.ChangeColor();
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
       if(btns.currentindex == 0)rect(mouseX, mouseY, 40, 40);
       if(btns.currentindex == 1)triangle(mouseX, mouseY, mouseX, mouseY-40, mouseX+40, mouseY);
       if(btns.currentindex == 2)triangle(mouseX, mouseY, mouseX, mouseY+40, mouseX+40, mouseY);
       if(btns.currentindex == 3)triangle(mouseX, mouseY, mouseX, mouseY+40, mouseX-40, mouseY);
       if(btns.currentindex == 4)triangle(mouseX, mouseY, mouseX, mouseY-40, mouseX-40, mouseY);
      break;
    }
    case DRAWING:
    {
      cursor(HAND);
      break;
    }
    case ERASING:
    {
    cursor(CROSS);
    }
    
  }
}
void LoadImage()
{
  myCanvas.LoadImage();
}
void Type1()
{
  typeButton = 1;
}
void Type2()
{
  typeButton = 2;
}
void Type3()
{
  typeButton = 3;
}
void Type4()
{
  typeButton = 4;
}

  void mousePressed()
  {
    if (mouseButton == LEFT)
    {
    float x = 50 * int((mouseX-20)/50);
    float y = 50 * int((mouseY-80)/50);
    //myCanvas.data.coords.add(x);
    //myCanvas.data.coords.add(y);
    //updateData(x,y);
    myCanvas.updateCoords(x,y);
    println("x= " + x + " " + "y= " + y);
    }
  }
 void OpenSource()
 {
   selectInput("Seleccione un archivo", "onFileSelectedOpen");
 } 
 void SaveSource()
 {
    if (filePath == null)
    {
      selectOutput("Seleccione una ruta", "onFileSelectedSave");
    }
    else
    {
      saveFile();
    }
   
 }
void keyPressed()
{
  if (key == 'o')//open
  {
  //selectInput("Seleccione un archivo", "onFileSelectedOpen");
  } 
  if (key == 's') // guardar
  {
    if (filePath == null)
    //if (file != null)
    {
      //saveData();
      //selectOutput("Seleccione una ruta", "onFileSelectedSave");
    }
    else
    {
      //selectOutput("Seleccione una ruta","onOutputSelected");
      saveFile();
    }
  }
}
   void onOutputSelected(File path){
    file = createWriter(path);
    saveData();
  }

  void saveData(){
    for(int i = 0; i< myCanvas.data.coords.size();i++){
      if(i < myCanvas.data.coords.size()){
        file.print(data.coords.get(i));
        file.print("|");
      }
    }
    file.flush(); 
  }

void onFileSelectedOpen(File selection)
{
  filePath = selection.getAbsolutePath();
  //String[] dataLines = loadStrings(filePath);
  //selection.setText(dataLines[0]);
  //myCanvas.data.coords = new ArrayList<Float>(); 
  String[] datalines = loadStrings(filePath);
  myCanvas.data.coords = new ArrayList<Float>(); 
  String entire = join(datalines, " ");
  datalines = split(entire, " ");
  //print(entire);
  //println(datalines[0]);
  //println(datalines[1]);
  
  for(int i = 0; i<datalines.length; i++)
  {
    myCanvas.data.coords.add(float(datalines[i]));
    //rect(datalines.get(i), data.coords.get(i+1), 50, 50);
  }
  
  //rect(datalines[0], datalines[1], 50, 50);
  
  for(int i = 0; i< datalines.length; i+= 2)
  {
    //println(datalines[i]);
  }
  /*
  if (temp[0].length() > 0);
  {
  String split[] = split(temp[0], " ");
  
    for (int i = 0; i < split.length; i++)
    {
    myCanvas.data.coords.add(float(split[i]));
    }
  }*/
}

void onFileSelectedSave(File selection)
{
  PrintWriter fileWritter = createWriter(selection.getAbsolutePath());
  //fileWritter.println("smash32322");
  
  for (int i = 0; i < myCanvas.data.coords.size(); i++)
  {
    fileWritter.println(myCanvas.data.coords.get(i));  
  }
  //println("data " + myCanvas.data.coords.size());
  fileWritter.flush();
  fileWritter.close();
}


void saveFile()
{
  PrintWriter fileWritter = createWriter(filePath);  
  fileWritter.flush();
  fileWritter.close();
}

void openFile(File path)
{
  filePath = path.getAbsolutePath();
  myCanvas.data.coords = new ArrayList<Float>();
  
 /* String temp[] = loadStrings(path);
  
  if (temp[0].length() > 0);
  {
  String split[] = split(temp[0], "\n");
  
    for (int i = 0; i < split.length; i++)
    {
    canvas.data.coords.add(float(split[i]));
    }
  }*/
    String[] dataLines = loadStrings(filePath);
}

boolean overRect(int x, int y, int width , int height)  {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
