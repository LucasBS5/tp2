class Enemigo {
  FCircle enemigo;
  float minY;
  float maxY;
  float velocidadMovimiento;
  float direccion;
  boolean moverHaciaArriba;

  Enemigo(float posX, float posY, float tam, String nombre, PImage cual) {
    enemigo = new FCircle(tam);
    enemigo.setPosition(posX, posY);
    enemigo.setName(nombre);
    enemigo.setGrabbable(false);
    zombie1.resize(120, 120);
    zombie2.resize(120, 120);
    enemigo.attachImage(cual);
    enemigo.setRestitution(0.05);
    //enemigo.setSensor(true);
    mundo.add(enemigo);

    this.minY = minY;
    this.maxY = maxY;
    moverHaciaArriba = true;
  }

  void cambiardireccion() {
    moverHaciaArriba = !moverHaciaArriba; // Invierte la dirección
  }

  void mover() {
    if (moverHaciaArriba) {
      velocidadMovimiento=-50;
    } else if (!moverHaciaArriba) {
      velocidadMovimiento=50;
    }
    // Verifica los límites en el eje Y
    enemigo.setVelocity(0,velocidadMovimiento);
  }
}
