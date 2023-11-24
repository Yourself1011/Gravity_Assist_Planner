void mouseDragged() {
    camera.translate(pmouseX - mouseX, pmouseY - mouseY);
}

void mouseWheel(MouseEvent e) {
    float count = e.getCount();

    if (count < 0) {
        camera.zoom *= 1.1;
    } else if (count > 0) {
        camera.zoom /= 1.1;
    }

    // cameraZoom = clamp(cameraZoom, 0.1, 100);
}