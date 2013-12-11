


class node {
  
  private float x, y, width, height, inputX, inputY, outputX, outputY, textX, textY, clickedX, clickedY = 0;
  private String text = "";
  private ArrayList inputs;
  private ArrayList outputs;
  private boolean move = false;
  
  
  
  // Contructor
  //ix = inital x position
  //iy = inital y position
  //iText = name of this node
  node(float ix, float iy, String iText) {
    x = iy;
    y = ix;
    text = iText;
    
    inputs = new ArrayList();
    outputs = new ArrayList();

    textFont(fontA); 
    text(text, x, y); 
    
    width = textWidth(text) + 2 * border;
    height =  -1 * (boxHeight + 2 * border);
    setXY();
  }
  
  
  
  public void addInput(String input)
  {
    inputs.add(input);
  }
  
  
  
  
  public void addOutput(String output)
  {
    outputs.add(output);
  }
  
  
  
  
    public void update() {
    if(move) 
    {
      x = mouseX + clickedX;
      y = mouseY + clickedY;
    } else {
      float newX = 0;
      float newY = 0;
      int count = 1;
      
      if(inputs != null) 
      {
        for(int i =0; i < inputs.size(); i++)
        {
          float[] newXY = moveVector((String)inputs.get(i), false);
          
          newX += newXY[0];
          newY += newXY[1];
          count++;
        }
      }
      
      if(outputs != null)
      {
        for(int i =0; i < outputs.size(); i++)
        {
          float[] newXY = moveVector((String)outputs.get(i), true);
          
          newX += newXY[0];
          newY += newXY[1];
          count++;
        }
      }
      
      //keep nodes from each other
      Iterator i = graph.entrySet().iterator();  // Get an iterator
      while (i.hasNext()) {
        Map.Entry me = (Map.Entry)i.next();
        node nextNode = (node)me.getValue();
        
        float diffX = nextNode.getX() - x;
        float diffY = nextNode.getY() - y;
        
        float distance = sqrt(sq(diffX) + sq(diffY));
        
        if(distance > 0 && distance < bubble * 2)
        {
          newX -= speed * 10* (diffX * bubble / sq(distance));
          newY -= speed * 10 * (diffY * bubble / sq(distance));
        }
      }
      
      //average vector
      newX /= count;
      newY /= count;
      
      //move towards centroid:
      x += (newX*speed / 100);
      y += (newY*speed / 100);
    }
    
     setXY();
  }
  
 
  
  public void draw() {
   drawBox();
   drawText();
   drawCurves();
  }
  
  
  public boolean pressed() 
  { 
    if (over()) { 
      move = true; 
      clickedX = x-mouseX;
      clickedY = y - mouseY;
      return true;
    } else { 
      move = false; 
    }  
    return false;
  } 



  public void released() 
  { 
    move = false; 
  } 
  
  
  
  
  
  
  private float[] moveVector(String nodeId, boolean nodeIsOutput)
  {
     node n = (node)graph.get(nodeId);
     
     float nodeX = 0;
     float nodeY = 0;
     float myX = 0;
     float myY = 0;
     
     if(nodeIsOutput)
     {
       myX = outputX;
       myY = outputY;
       nodeX = n.getInX();
       nodeY = n.getInY();
     } else {
       myX = inputX;
       myY = inputY;
        nodeX = n.getOutX();
        nodeY = n.getOutY();
     }
     
     float diffX = nodeX - myX;
     float diffY = nodeY - myY;
      
      
      float distance = sqrt(sq(diffX) + sq(diffY));
      float direction = log(distance / bubble);
      
     float[] r = new float[]{diffX * direction, diffY* direction};
     return r;
  }
  
  
  
  private void drawBox()
  {
    if(over()) 
    {
      fill(hoverColor);
    } else {
      fill(boxColor);
    }
    stroke(lineColor);
    rect(round(x), round(y), width, height);
    //rect(x, y, width, height);
  }
  
  private void drawText()
  {
    fill(textColor);
    textFont(fontA); 
    text(text, textX, textY); 
  }
  
  
  private void drawCurves()
  {
    noFill();
    stroke(lineColor);
    if(outputs != null)
    {
      for(int i = 0; i < outputs.size(); i++)
      {
        node inNode = (node)graph.get(outputs.get(i));
        float inX = inNode.getInX();
        float inY = inNode.getInY();
        bezier(outputX, outputY, outputX + curveSize, outputY, inX - curveSize, inY, inX, inY);
      }
    }
  }
  
  
  // Test to see if mouse is over node
  private boolean over() 
  {
    if(mouseX > x && mouseX < x+width) 
    {
      if(mouseY < y && mouseY > y + height) 
      {
        return true;
      }
    }
    return false;
  }
  
  
  //set all the xy values from the current xy value
  private void setXY()
  {
    if(x < 0) x = 0;
    if(x + width > stageSize) x = stageSize - width;
    if(y + height < 0) y = - height;
    if(y > stageSize) y = stageSize;
    textX = x+border;
    textY = y-border;
    inputX = x;
    inputY = y + height / 2;
    outputX = x+width;
    outputY = y + height / 2;
  }
 
  
  
  
  
  
  
  /*GETS*/
  
  public float getX()
  {
    return x;
  }
  
  public float getY()
  {
    return y;
  }
  
  public float getInX()
  {
    return inputX;
  }
  
  public float getInY()
  {
    return inputY;
  }
  
  public float getOutX()
  {
    return outputX;
  }
  
  public float getOutY()
  {
    return outputY;
  }
}


