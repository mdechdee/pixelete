class pos
{
  int x;
  int y;
  int dist;
  pos(int _y, int _x)
  {
    y=_y;
    x=_x;
    dist = 0;
  }
}

float colorDist(color argb, color brgb){
  float[] a = new float[3];
  float[] b = new float[3];
  a = rgbToLab(int(red(argb)),int(green(argb)),int(blue(argb)));
  b = rgbToLab(int(red(brgb)),int(green(brgb)),int(blue(brgb)));
  //println(sqrt((a[0]-b[0])*(a[0]-b[0])+(a[1]-b[1])*(a[1]-b[1])+(a[2]-b[2])*(a[2]-b[2])));
  return sqrt((a[0]-b[0])*(a[0]-b[0])+(a[1]-b[1])*(a[1]-b[1])+(a[2]-b[2])*(a[2]-b[2]));
  /*float ra = red(argb);
  float ga = green(argb);
  float ba = blue(argb);
  float rb = red(brgb);
  float gb = green(brgb);
  float bb = blue(brgb);
  //println("a:",sqrt(2*(ra-rb)*(ra-rb)+2*(ga-gb)*(ga-gb)+3*(ba-bb)*(ba-bb)));
  //println("b:",sqrt(3*(ra-rb)*(ra-rb)+4*(ga-gb)*(ga-gb)+2*(ba-bb)*(ba-bb)));
  //println(color_threshold);
  if((ra+rb)/2 < 128)
    return sqrt(2*(ra-rb)*(ra-rb)+2*(ga-gb)*(ga-gb)+3*(ba-bb)*(ba-bb));
  else
    return sqrt(3*(ra-rb)*(ra-rb)+4*(ga-gb)*(ga-gb)+2*(ba-bb)*(ba-bb));*/
  
}

color colorAvg(color a, color b){
  float ra = red(a);
  float ga = green(a);
  float ba = blue(a);
  float rb = red(b);
  float gb = green(b);
  float bb = blue(b);
  //println("s",2*(ra-rb)*(ra-rb));
  return color((ra+rb)/2,(ga+gb)/2,(ba+bb)/2);
}

public float[] rgbToLab(int R, int G, int B) {

    float r, g, b, X, Y, Z, xr, yr, zr;

    // D65/2°
    float Xr = 95.047;  
    float Yr = 100.0;
    float Zr = 108.883;


    // --------- RGB to XYZ ---------//

    r = R/255.0;
    g = G/255.0;
    b = B/255.0;

    if (r > 0.04045)
        r = (float) Math.pow((r+0.055)/1.055,2.4);
    else
        r = r/12.92;

    if (g > 0.04045)
        g = (float) Math.pow((g+0.055)/1.055,2.4);
    else
        g = g/12.92;

    if (b > 0.04045)
        b = (float) Math.pow((b+0.055)/1.055,2.4);
    else
        b = b/12.92 ;

    r*=100;
    g*=100;
    b*=100;

    X =  0.4124*r + 0.3576*g + 0.1805*b;
    Y =  0.2126*r + 0.7152*g + 0.0722*b;
    Z =  0.0193*r + 0.1192*g + 0.9505*b;


    // --------- XYZ to Lab --------- //

    xr = X/Xr;
    yr = Y/Yr;
    zr = Z/Zr;

    if ( xr > 0.008856 )
        xr =  (float) Math.pow(xr, 1/3.);
    else
        xr = (float) ((7.787 * xr) + 16 / 116.0);

    if ( yr > 0.008856 )
        yr =  (float) Math.pow(yr, 1/3.);
    else
        yr = (float) ((7.787 * yr) + 16 / 116.0);

    if ( zr > 0.008856 )
        zr =  (float) Math.pow(zr, 1/3.);
    else
        zr = (float) ((7.787 * zr) + 16 / 116.0);


    float [] lab = new float[3];

    lab[0] = (116*yr)-16;
    lab[1] = 500*(xr-yr); 
    lab[2] = 200*(yr-zr); 

    return lab;

}
