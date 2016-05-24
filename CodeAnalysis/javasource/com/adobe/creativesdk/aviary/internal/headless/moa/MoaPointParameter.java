package com.adobe.creativesdk.aviary.internal.headless.moa;

import org.json.JSONArray;
import org.json.JSONException;

public class MoaPointParameter
  extends MoaParameter<double[]>
{
  private static final long serialVersionUID = 7278240276951854968L;
  
  public MoaPointParameter()
  {
    init();
    setValue(0.0F, 0.0F);
  }
  
  public MoaPointParameter(double paramDouble1, double paramDouble2)
  {
    init();
    setValue(paramDouble1, paramDouble2);
  }
  
  public MoaPointParameter(float paramFloat1, float paramFloat2)
  {
    init();
    setValue(paramFloat1, paramFloat2);
  }
  
  public static Object encode(float paramFloat1, float paramFloat2)
  {
    JSONArray localJSONArray = new JSONArray();
    double d = paramFloat1;
    try
    {
      localJSONArray.put(d);
      localJSONArray.put(paramFloat2);
      return localJSONArray;
    }
    catch (JSONException localJSONException) {}
    return localJSONArray;
  }
  
  private void init()
  {
    value = new double[2];
    type = "point";
  }
  
  public Object clone()
  {
    return new MoaPointParameter(((double[])value)[0], ((double[])value)[1]);
  }
  
  public Object encode()
  {
    JSONArray localJSONArray = new JSONArray();
    try
    {
      localJSONArray.put(((double[])value)[0]);
      localJSONArray.put(((double[])value)[1]);
      return localJSONArray;
    }
    catch (JSONException localJSONException) {}
    return localJSONArray;
  }
  
  public void setValue(double paramDouble1, double paramDouble2)
  {
    ((double[])value)[0] = paramDouble1;
    ((double[])value)[1] = paramDouble2;
  }
  
  public void setValue(float paramFloat1, float paramFloat2)
  {
    ((double[])value)[0] = paramFloat1;
    ((double[])value)[1] = paramFloat2;
  }
}
