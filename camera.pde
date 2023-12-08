Camera camera = Camera.getInstance();

// A singleton for the camera position and zoom
static class Camera {
    static Camera instance;
    PVector pos = new PVector(0, 0);
    float zoom = 0.00001;

    private Camera() {}

    // make sure this is only instantiated once
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