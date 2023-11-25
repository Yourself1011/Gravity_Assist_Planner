void mouseDragged() {
    camera.translate(pmouseX - mouseX, pmouseY - mouseY);
}

void mouseWheel(MouseEvent e) {
    float count = e.getCount();

    PVector mouseVector = new PVector(mouseX, mouseY);
    if (count < 0) {
        camera.zoom *= 1.1;
        mouseVector.mult(0.1);
    } else if (count > 0) {
        camera.zoom /= 1.1;
        mouseVector.mult(-0.1);
    } else {
        mouseVector.setMag(0);
    }

    camera.translate(mouseVector.x, mouseVector.y);


    // cameraZoom = clamp(cameraZoom, 0.1, 100);
}