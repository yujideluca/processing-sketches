// Drachenkurve (Heighway-Drache): jeder Faltschritt wird ein Stück röter.
// Schritt 1 = zartes Pastellrosa, letzter Schritt = kräftiges Rot.
// Tasten: R = neu starten, S = Bild speichern.

final int MAX_ITER = 11;          // 2^11 = 2048 Segmente im letzten Schritt
final int FRAMES_PER_ITER = 40;   // wie lange jeder Schritt sichtbar aufgebaut wird
final int MARGIN = 50;

PVector[][] levels;               // levels[n] = Punkte nach n Faltungen, Start (0,0) und Ende (1,0)
float fit, cx, cy;
int shown = 0;
boolean saved = false;

void settings() {
  size(1000, 800);
  smooth(8);
}

void setup() {
  noiseSeed(7);
  buildLevels();
  fitToWindow();
  restart();
}

void restart() {
  background(26, 17, 24);
  shown = 0;
  saved = false;
  frameCount = 0;
}

// +1 = links, -1 = rechts: k-te Abbiegung der Papierfaltfolge
int turn(int k) {
  while ((k & 1) == 0) k >>= 1;
  return ((k >> 1) & 1) == 0 ? 1 : -1;
}

void buildLevels() {
  levels = new PVector[MAX_ITER + 1][];
  for (int n = 1; n <= MAX_ITER; n++) {
    int count = 1 << n;
    PVector[] p = new PVector[count + 1];
    p[0] = new PVector(0, 0);
    PVector dir = new PVector(1, 0);
    p[1] = dir.copy();
    for (int k = 1; k < count; k++) {
      dir = new PVector(-dir.y * turn(k), dir.x * turn(k));
      p[k + 1] = PVector.add(p[k], dir);
    }
    // Drehen und Skalieren, damit Anfang und Ende in jedem Schritt gleich liegen
    PVector e = p[count];
    float d = e.x * e.x + e.y * e.y;
    for (PVector q : p) {
      float x = (q.x * e.x + q.y * e.y) / d;
      float y = (q.y * e.x - q.x * e.y) / d;
      q.set(x, y);
    }
    levels[n] = p;
  }
}

void fitToWindow() {
  float x0 = 1e9, x1 = -1e9, y0 = 1e9, y1 = -1e9;
  for (PVector q : levels[MAX_ITER]) {
    x0 = min(x0, q.x); x1 = max(x1, q.x);
    y0 = min(y0, q.y); y1 = max(y1, q.y);
  }
  fit = min((width - 2 * MARGIN) / (x1 - x0), (height - 2 * MARGIN) / (y1 - y0));
  cx = (x0 + x1) / 2;
  cy = (y0 + y1) / 2;
}

// Rosa-Pastell -> Rot; t = 0 (erster Schritt) bis 1 (letzter Schritt)
color tone(float t, float jitter) {
  float e = pow(t, 1.3);
  float hue = lerp(340, 360, e) + jitter * 9;
  float sat = lerp(22, 92, e) + jitter * 14;
  float bri = lerp(100, 88, e) + jitter * 6;
  colorMode(HSB, 360, 100, 100, 255);
  color c = color((hue + 360) % 360, constrain(sat, 0, 100), constrain(bri, 0, 100), lerp(200, 255, t));
  colorMode(RGB, 255);
  return c;
}

void drawLevel(int n) {
  PVector[] p = levels[n];
  float t = (n - 1) / (float) (MAX_ITER - 1);
  strokeWeight(lerp(7, 1.3, pow(t, 0.9)));
  strokeCap(ROUND);
  for (int i = 0; i < p.length - 1; i++) {
    float jitter = noise(i * 0.004, n * 10.0) - 0.5;   // sanfte, prozedurale Variation entlang der Kurve
    stroke(tone(t, jitter));
    line((p[i].x - cx) * fit + width / 2, (p[i].y - cy) * fit + height / 2,
         (p[i + 1].x - cx) * fit + width / 2, (p[i + 1].y - cy) * fit + height / 2);
  }
}

void draw() {
  if (shown < MAX_ITER && frameCount % FRAMES_PER_ITER == 1) {
    drawLevel(++shown);
    surface.setTitle("Drachenfraktal – Schritt " + shown + " / " + MAX_ITER);
  } else if (shown == MAX_ITER && !saved && frameCount % FRAMES_PER_ITER == 5) {
    save(sketchPath("drachenfraktal.png"));
    saved = true;
    if (System.getenv("DRACHEN_EXIT") != null) exit();
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') restart();
  if (key == 's' || key == 'S') save(sketchPath("drachenfraktal.png"));
}
