package com.adobe.creativesdk.aviary.internal.headless.moa;

import android.graphics.RectF;
import org.json.JSONArray;
import org.json.JSONException;

public class MoaRectParameter
  extends MoaParameter<double[]>
{
  private static final long serialVersionUID = 1L;
  
  public MoaRectParameter()
  {
    init();
    setValue(0.0F, 0.0F, 0.0F, 0.0F);
  }
  
  public MoaRectParameter(double paramDouble1, double paramDouble2, double paramDouble3, double paramDouble4)
  {
    init();
    setValue(paramDouble1, paramDouble2, paramDouble3, paramDouble4);
  }
  
  public MoaRectParameter(RectF paramRectF)
  {
    init();
    setValue(left, top, right, bottom);
  }
  
  private void init()
  {
    value = new double[4];
    type = "rect";
  }
  
  public Object clone()
  {
    return new MoaRectParameter(((double[])value)[0], ((double[])value)[1], ((double[])value)[2], ((double[])value)[3]);
  }
  
  public Object encode()
  {
    JSONArray localJSONArray = new JSONArray();
    try
    {
      localJSONArray.put(((double[])value)[0]);
      localJSONArray.put(((double[])value)[1]);
      localJSONArray.put(((double[])value)[2]);
      localJSONArray.put(((double[])value)[3]);
      return localJSONArray;
    }
    catch (JSONException localJSONException) {}
    return localJSONArray;
  }
  
  public void setValue(double paramDouble1, double paramDouble2, double paramDouble3, double paramDouble4)
  {
    ((double[])value)[0] = paramDouble1;
    ((double[])value)[1] = paramDouble2;
    ((double[])value)[2] = paramDouble3;
    ((double[])value)[3] = paramDouble4;
  }
  
  public void setValue(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    ((double[])value)[0] = paramFloat1;
    ((double[])value)[1] = paramFloat2;
    ((double[])value)[2] = paramFloat3;
    ((double[])value)[3] = paramFloat4;
  }
}
