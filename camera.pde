Camera camera = Camera.getInstance();

static class Camera {
    static Camera instance;
    PVector pos = new PVector(0, 0);
    float zoom = 1;

    private Camera() {}

    static Camera getInstance() {
        if (instance == null) {
            instance = new Camera();
        }

        return instance;
    }

    void translate(float x, float y) {
        pos.add(x, y);
    }

    void zoom(float amount) {
        zoom *= amount;
    }
}