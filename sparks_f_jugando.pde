class Spark {
  float x;
  float y;
  float tam;
  int initialOpacity;
  int opacity;
  int startTime;
  int maxOpacityTime = 10; // Tiempo para alcanzar la opacidad máxima (1 segundo)
  int maxStayTime = 10;   // Tiempo en que el círculo permanece visible (2 segundos)
  PImage img;
  Spark(float x, float y, PImage img, float tam, int initialOpacity) {
    this.x = x;
    this.y = y;
    this.tam=tam;
    this.initialOpacity=initialOpacity;
    this.img = img;
    this.opacity = 0;
    this.startTime = frameCount;
  }

  void update() {
    int currentTime = frameCount - startTime;

    // Actualiza la opacidad
    if (currentTime < maxOpacityTime) {
      opacity = int(lerp(0, 100, float(currentTime) / maxOpacityTime));
    } else if (currentTime >= maxOpacityTime + maxStayTime) {
      opacity = int(lerp(100, 0, float(currentTime - maxOpacityTime - maxStayTime) / maxOpacityTime));
    }
  }

  void display() {
    pushStyle();
    tint (255, opacity);
    image(img, x, y, tam, tam);
    popStyle();
  }

  boolean isDone() {
    return opacity == 0;
  }
}
