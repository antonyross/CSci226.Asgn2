public class ParticleEngine 
{
  // alist to keep track of particles
  private ArrayList particles;
  private ArrayList springs;
  
  //the class constructor
  public ParticleEngine() {
    //create the list
    particles = new ArrayList();
    springs = new ArrayList();
  }
  
  public void addParticle(Particle particle) {
    //public function to add a particle
    particle.setEngine(this);
    particles.add(particle);
  }
  
  public void addSpring(Spring spring) {
    //public function to add a particle
    spring.setEngine(this);
    springs.add(spring);
  }
  
  //update function to update all springs and particles
  public void update() {
    //use a while loop to check all springs
    int i = 0;
    while (i<springs.size()) {
      //update it
      Spring s = (Spring) springs.get(i);
      s.update();
      if (!s.destroyed) {
        i++;
      } else {
        //if the particle is not remove it from the list
        springs.remove(i);
      }
    }
    
    i = 0;
    while (i<particles.size()) {
      //update it
      Particle p = (Particle) particles.get(i);
      p.update();
      if (!p.destroyed) {
        i++;
      } else {
        particles.remove(i);
      }
    }    
  }
  
  //draw all particles
  public void draw() {
    for (int i=0; i<springs.size(); i++) {
      Spring s = (Spring) springs.get(i);
      s.draw();
    }
    for (int i=0; i<particles.size(); i++) {
      Particle p = (Particle) particles.get(i);
      p.draw();
    }
  }
  
  public Particle particleAt(float x, float y) {
    int i = particles.size();
    while(i>0) {
      i--;
      Particle p = (Particle) particles.get(i);
      float dx = p.x - x;
      float dy = p.y - y;
      if (dx * dx + dy * dy < p.size * p.size) {
        return p;
      }
    }
    return null;
  }
  
  public Particle findParticle(String label) {
    for(int i = 0; i < particles.size(); i++) {
      Particle p = (Particle) particles.get(i);
      println(p.getLabel());
      if(label.equals(p.getLabel())) {
        println("Found");
        return p;
      }
    }
    return null;
  }
  
  public void connectParticles(String label1, String label2) {
    Particle particle1 = findParticle(label1);
    if(particle1 == null) println("null");
    Particle particle2 = findParticle(label2);
    if(particle2 == null) println("null");
    if (particle1 != null && particle2 != null) {
      Spring s = new Spring(particle1, particle2, 350, 0.02);
      s.setColor(particle1.getColor());
      addSpring(s);
    }
  }
}
