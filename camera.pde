Camera camera = Camera.getInstance();

static class Camera {
    static Camera instance;
    PVector pos = new PVector(0, 0);
    float zoom = 0.0001;

    private Camera() {}

    static Camera getInstance() {
        if (instance == null) {
            instance = new Camera();
        }

        return instance;
    }

    void translate(float x, float y) {
        // println(zoom, x, y, x/zoom, y/zoom, pos);
        pos.add(x / zoom, y / zoom);
    }

    void zoom(float amount) {
        zoom *= amount;
    }
}