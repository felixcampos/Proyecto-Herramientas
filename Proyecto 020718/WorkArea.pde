public class WorkArea
{
  ColBtns btns = new ColBtns();
  Data data = new Data();
  int waWidth = 700;
  int waHeight = 500;
  int locX = 20;
  int locY = 80;
  PImage bg;
  public void Init()
  {
    bg = loadImage("race2.jpg"); 
  }
    public void Execute()
  {
    fill(184,183,153);
    stroke(0);
    FormRects();
    DrawRectangles();
  }
  
  void CreateGrid()
  {
    for(int i = 0; i<20; i++)
    {
      line(50 * i, 0, 50*i, waHeight);
      line(0, 50*i, waWidth, 50*i);
    }
  }
  
    void FormRects(){
    for (int i = 0; i < 14; i++){
      for (int j = 0; j < 10; j++){
        rect( locX + (50 * i), locY + (50 * j), 50, 50);
      }
    }
  }
  
   void DrawRectangles()
  {
    for(int i = 0; i<data.coords.size(); i+=2)
    {
      fill(0, 255, 0);
      stroke(0);
      rect(data.coords.get(i), data.coords.get(i+1), 50, 50);
    }
  }
  void updateCoords(float x, float y)
  {
    data.coords.add(x);
    data.coords.add(y);
  }
  
  void drawData(){
    FormRects();
    
    for(int i = 0; i < data.points.size() ; i+=3){
      int x = data.points.get(i);
      int y = data.points.get(i+1);
      int num = data.points.get(i+2);
    }
  }

  void updateData(int x, int y)
  {
      data.points.add(x);
      data.points.add(y);
  }
  
  void saveData(){
    for(int i = 0; i< data.points.size();i++){
      if(i < data.points.size()){
        file.print(data.points.get(i));
        file.print("|");
      }
    }
    file.flush();
    
    println("archivo guardado");
  }
  
  void removeData(int x, int y){
    
    for(int i = 0; i < data.points.size(); i+=3){
      if(data.points.get(i) == x){
        if(data.points.get(i+1) == y){
          data.points.set(i,-1);
          data.points.set(i+1,-1);
          data.points.set(i+2,-1);
          println(data.points.get(i));
        }
      }
    }
    
  }
}
