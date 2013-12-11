

import org.gwoptics.graphics.graph2D.Graph2D;
import org.gwoptics.graphics.graph2D.traces.ILine2DEquation;
import org.gwoptics.graphics.graph2D.traces.RollingLine2DTrace;

 int ache = 1;
 double rand;
 int randomArrayPos = 0;
 int num = 0;
 int randomArrayPos2 = 0;
 int num2 = 0;
 
class eq implements ILine2DEquation{
	public double computePoint(double x,int pos) {

  
              //rand = Math.random() * 500 + 1;

		return ache += 1 + random(-5, 5); //rand;//1;//rand;//ache+=10;//mouseX;
	}		
}

class eq2 implements ILine2DEquation{
	public double computePoint(double x,int pos) {
  int[] arr = new int[];
                        
  randomArrayPos = (int)random(0, 80);
  num = arr[randomArrayPos];
		return  num;//mouseY;
	}		
}

class eq3 implements ILine2DEquation{
	public double computePoint(double x,int pos) {
		if(mousePressed)
			return 400;
		else
                {
                  int[] arr = new int[];
                        
  randomArrayPos2 = (int)random(0, 80);
  num2 = arr[randomArrayPos];
                 
			return num2;//0;
                }
	}		
}

RollingLine2DTrace r,r2,r3;
Graph2D g;
	
void setup(){
	size(600,300);
	
	r  = new RollingLine2DTrace(new eq() ,100,0.1f);
	r.setTraceColour(0, 255, 0);
        r.setLineWidth(5); 
	
	r2 = new RollingLine2DTrace(new eq2(),100,0.1f);
	r2.setTraceColour(255, 0, 0);
        r2.setLineWidth(5); 
	
	r3 = new RollingLine2DTrace(new eq3(),100,0.1f);
	r3.setTraceColour(0, 0, 255);
	r3.setLineWidth(5);

	g = new Graph2D(this, 400, 200, false);
	g.setYAxisMax(1000);
	g.addTrace(r);
	g.addTrace(r2);
	g.addTrace(r3);
	g.position.y = 50;
	g.position.x = 100;
	g.setXAxisTickSpacing(1);
	g.setYAxisTickSpacing(100);
	g.setXAxisMax(10f);

g.setXAxisLabel("Meters");
g.setYAxisLabel("Velocity");
g.setXAxisMinorTicks(4);  

}


  
void draw(){
	background(255);
	g.draw();

  if(mousePressed)
  {
    r.pause();
  }
  

}

  void mouseReleased()
  {
    r.unpause();
  }

