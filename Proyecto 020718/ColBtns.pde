public class ColBtns
{
  int locX = 730;
  int locY = 80;
  //int cbH = 0;
  //int cbW = 500;
  PImage btnsq, btnt1, btnt2, btnt3, btnt4;
  ArrayList<PImage> buttons = new ArrayList<PImage>();
  int currentindex = 0;
  
  public void Init()
  {
    btnsq = loadImage("sq.png");
    btnsq.resize(100,100);
    buttons.add(btnsq);
    
    btnt1 = loadImage("tr1.png");
    btnt1.resize(100,100);
    buttons.add(btnt1);
    
    btnt2 = loadImage("tr2.png");
    btnt2.resize(100,100);
    buttons.add(btnt2);
    
    btnt3 = loadImage("tr3.png");
    btnt3.resize(100,100);
    buttons.add(btnt3);
    
    btnt4 = loadImage("tr4.png");
    btnt4.resize(100,100);
    buttons.add(btnt4);
  }
  public void Execute()
  {
    fill(244,244,244);
    rect(locX, locY, 250, 500);
    //image(btnsq, 800,100);
    VerifyTouchOn(810,120,0);
    VerifyTouchOn(870,250,1);
    VerifyTouchOn(870,370,2);
    VerifyTouchOn(750,370,3);
    VerifyTouchOn(750,250,4);
  }
  
   void VerifyTouchOn(int x , int y, int listNumber){

    image(buttons.get(listNumber),  x,  y , 100 , 100);

        if(mouseButton == LEFT)
        {
          if(overRect(x , y , 100, 100))
          {
            currentindex = listNumber;
               
          }
      
    }
  }

}
