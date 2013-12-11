

 
import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.AttractionBehavior;

import java.awt.FileDialog;

import toxi.geom.*;
//import toxi.geom.Vec3D;

// squared snap distance for mouse selection
float SNAP_DIST = 20 * 20;

// define a HashMap to provide a table centric view of the competitors' data
// http://mindprod.com/jgloss/hashmap.html
// http://download.oracle.com/javase/6/docs/api/java/util/HashMap.html
HashMap<Integer, ArrayList<String>> tables=new HashMap<Integer, ArrayList<String>>();

VerletPhysics2D physics;
VerletParticle2D selectedParticle;

String[] meets = new String[] {"Champ Meet", "Mt. SAC", "Penn Relays", "West Coast Classic", "West Coast Relays", "Golden West", "Sunkist Meet", "Pac-12 Champs"};


void setup() {
  size(640,480);
  //println(loadStrings("data/test.txt"));
  //String[] data = loadStrings("test.txt");
  
  String fileName=null;
  /*fileName=FileUtils.showFileDialog(
    frame,
    "Choose a text file...",
    dataPath(""),
    new String[]{".csv",".txt",".rtf",".xml",".txt.gz"},
    FileDialog.LOAD
  ); */
  fileName = "/Users/antonyr/Desktop/Processing_Charts/CompetitorClusters/data/competitors.csv";
  parseData(fileName);
  initPhysics();
  textFont(createFont("SansSerif",10));
  
     
}

void draw() {
  // 1st update
  physics.update();
  // then drawing
  background(255);
  // draw springs
  stroke(255,0,255);
  for(VerletSpring2D s : physics.springs) {
    line(s.a.x, s.a.y, s.b.x, s.b.y);
  }
  // then all particles
  noStroke();
  for(VerletParticle2D p : physics.particles) {
    fill(0);
    ellipse(p.x, p.y, 5, 5);
    // also draw label if needed
    if (p instanceof LabeledParticle) {
      LabeledParticle lp=(LabeledParticle)p;
      fill(0, 0, 128);
      text(lp.label, p.x, p.y-4);
    }
  }
  // highlight selected particle (if there is one currently)
  if (selectedParticle!=null) {
    fill(255, 0, 255);
    ellipse(selectedParticle.x, selectedParticle.y, 20, 20);
  }
}

void mousePressed() {
  // find particle under mouse
  Vec2D mousePos=new Vec2D(mouseX,mouseY);
  for(int i=1; i<physics.particles.size(); i++) {
    VerletParticle2D p=physics.particles.get(i);
    if (mousePos.distanceToSquared(p)<SNAP_DIST) {
      selectedParticle=p.lock();
      break;
    }
  }
}

void mouseDragged() {
  if (selectedParticle!=null) {
    // move selected particle to new mouse pos
    selectedParticle.set(mouseX,mouseY);
  }
}

void mouseReleased() {
  // unlock the selected particle
  if (selectedParticle!=null) {
    selectedParticle.unlock();
    selectedParticle=null;
  }
}

void keyPressed() {
  if (key=='r') {
    initPhysics();
  }
}


void parseData(String path) {
  String[] lines=loadStrings(path);
  // iterate over all lines loaded
  for(String l : lines) {
    // skip empty lines
    if (l.length()>0) {
      // split line into 2 values
      String[] items=split(l,",");
      // get table ID
      int id=int(items[1]);
      // get() will return a null if still unknown
      ArrayList<String> names=tables.get(id);
      if (names==null) {
        // if ID still unknown, create a new (empty) list for names
        names=new ArrayList<String>();
        // associated the list with the table ID
        tables.put(id,names);
      }
      // add the name to the list
      names.add(items[0]);
    }
  }
}

void initPhysics() {
  physics=new VerletPhysics2D();
  physics.setDrag(0.05);
  // set screen bounds as bounds for physics sim
  physics.setWorldBounds(new Rect(0,0,width,height));
  // create a fixed root particle to connect all clusters to
  VerletParticle2D root=new VerletParticle2D(width/2,height/2).lock();
  physics.addParticle(root);
  // add a repulsive force around the root particle to force all
  // name particles to align themselves away from the centre
  physics.addBehavior(new AttractionBehavior(root,250,-1));

  for(int tableID : tables.keySet()) {
    // create a particle for the cluster centre
    VerletParticle2D p=new LabeledParticle(random(width),random(height), meets[tableID]);  //    VerletParticle2D p=new LabeledParticle(random(width),random(height),"table #"+tableID);
    physics.addParticle(p);
    // add repulsive force to space out clusters
    physics.addBehavior(new AttractionBehavior(p,100,-1));
    // connect to locked root particle
    physics.addSpring(new VerletSpring2D(p,root,100,1));
    // now process all names associated with the current table
    for(String name : tables.get(tableID)) {
      // create particle for each name
      VerletParticle2D n=new LabeledParticle(random(width),random(height),name);
      physics.addParticle(n);
      // create weak repulsion for spacing
      physics.addBehavior(new AttractionBehavior(n,50,-0.5));
      // connect to cluster centre (table particle)
      physics.addSpring(new VerletSpring2D(n,p,60,0.01));
    }
  }
}


class LabeledParticle extends VerletParticle2D {
  
  String label;
  
  LabeledParticle(float x, float y, String label) {
    super(x,y);
    this.label=label;
  }
}
