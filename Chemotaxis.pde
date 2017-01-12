Vector screen = new Vector(300,300);
//declare bacteria variables here:
Bacteria[] bacteria;
 void setup()   
 {     
   size((int)screen.x,(int)screen.y);
   
   //initialize bacteria variables here:
   bacteria = new Bacteria[100];
   for(int i = 0; i < bacteria.length; i++){
     bacteria[i] = new Bacteria(new Vector(Math.random()*screen.x,Math.random()*screen.y));
   }
 }   
 void draw()   
 {
   fill(100,100,100,20);
   rect(0,0,(float)screen.x,(float)screen.y);
   fill(255);
   noStroke();
   for(int i = 0; i < bacteria.length; i++){
      bacteria[i].tick();
      bacteria[i].render();
   }
 }  
 class Bacteria    
 {
   Vector pos;
   public Bacteria(Vector pos){
     this.pos = pos;
   }
   private Vector dirToMouse(){
     return new Vector(mouseX,mouseY).minus(this.pos).normalize();
   }
   public void tick(){
     Vector v = dirToMouse();
     Vector rnd = new Vector(Math.random()*3-1.5,Math.random()*3-1.5);
     
     if(mousePressed){
       double mag = 1-0.01*this.pos.distance(new Vector(mouseX,mouseY));
       if(mag < 0)mag = 0;
       println("mag: " + mag);
       this.pos = this.pos.minus(v.setMagnitude(mag));
     }else{
       this.pos = this.pos.plus(v);
     }
     this.pos = this.pos.plus(rnd);
   }
   public void render(){
     ellipse((float)this.pos.x,(float)this.pos.y,5,5);
   }
 }    
 
class Vector{
  double x;
  double y;
  public Vector(double x, double y, double m){
    Vector v = new Vector(x, y).normalize();
    this.x = v.x*m;
    this.y = v.y*m;
  }
  public Vector(Vector v){
    this.x = v.x;
    this.y = v.y;
  }
  public Vector(double x, double y){
    this.x = x;
    this.y = y;
  }
  public Vector(){
    this.x = 0;
    this.y = 0;
  }
  public Vector plus(Vector v){
    return new Vector(this.x+v.x,this.y+v.y);
  }
  public Vector plus(float v){
    return new Vector(this.x+v,this.y+v);
  }
  public Vector minus(Vector v){
    return new Vector(this.x-v.x,this.y-v.y);
  }
  public Vector minus(float v){
    return new Vector(this.x-v,this.y-v);
  }
  public Vector times(Vector v){
    return new Vector(this.x*v.x,this.y*v.y);
  }
  public Vector times(float v){
    return new Vector(this.x*v,this.y*v);
  }
  public Vector times(double v){
    return new Vector(this.x*v,this.y*v);
  }
  public Vector dividedBy(Vector v){
    return new Vector(this.x/v.x,this.y/v.y);
  }
  public Vector dividedBy(float v){
    return new Vector(this.x/v,this.y/v);
  }
  public Vector normalize(){
    double mag = magnitude();
    return new Vector(this.x/mag,this.y/mag);
  }
  public double distance(Vector v){
    Vector w = new Vector(this.x-v.x,this.y-v.y);
    return w.magnitude();
  }
  public double magnitude(){
    double mag = Math.sqrt((this.x*this.x)+(this.y*this.y));    
    return mag;
  }
  public Vector setMagnitude(double mag){
    return this.normalize().times(mag);
  }
}
