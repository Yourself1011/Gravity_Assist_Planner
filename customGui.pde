// A class to make logarithmic sliders
class LogSlider extends GSlider {
    public LogSlider(PApplet theApplet, float p0, float p1, float p2, float p3, float tr_width) {
        super(theApplet, p0, p1, p2, p3, tr_width);
    }

    @Override
    protected String getNumericDisplayString(float number) {
      return String.valueOf(pow(10, number));
    }

    @Override
	public void addEventHandler(Object obj, String methodName) {
		try {
			eventHandlerObject = obj;
			eventHandlerMethodName = methodName;
			eventHandlerMethod = obj.getClass().getMethod(methodName, new Class<?>[] { GSlider.class, GEvent.class });
		} catch (Exception e) {
            e.printStackTrace();
			eventHandlerObject = null;
			eventHandlerMethodName = "";
		}
	}

    // public void slider2_change1(LogSlider ogslider, GEvent event) { slider2_change1(ogslider, event); }
}