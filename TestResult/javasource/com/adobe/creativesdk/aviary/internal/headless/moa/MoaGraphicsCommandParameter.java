package com.adobe.creativesdk.aviary.internal.headless.moa;

import android.graphics.PointF;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MoaGraphicsCommandParameter
  extends MoaParameter<float[]>
{
  static final DecimalFormat FORMATTER = new DecimalFormat("##.#####", SYMBOLS);
  static final DecimalFormatSymbols SYMBOLS = new DecimalFormatSymbols();
  private static final long serialVersionUID = 1272515580429772062L;
  private int commandType;
  
  static
  {
    SYMBOLS.setDecimalSeparator('.');
  }
  
  public MoaGraphicsCommandParameter(int paramInt)
  {
    init(paramInt);
  }
  
  public MoaGraphicsCommandParameter(int paramInt, float paramFloat1, float paramFloat2)
  {
    init(paramInt);
    setPoint(paramFloat1, paramFloat2);
  }
  
  public MoaGraphicsCommandParameter(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    init(paramInt);
    setPoint(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  private void init(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      throw new IllegalArgumentException("Unsupported type");
    case 0: 
    case 1: 
      value = new float[2];
    }
    for (;;)
    {
      commandType = paramInt;
      return;
      value = new float[4];
      continue;
      value = new float[6];
    }
  }
  
  public Object clone()
  {
    MoaGraphicsCommandParameter localMoaGraphicsCommandParameter = new MoaGraphicsCommandParameter(commandType);
    System.arraycopy(value, 0, value, 0, ((float[])value).length);
    return localMoaGraphicsCommandParameter;
  }
  
  public Object encode()
  {
    JSONObject localJSONObject = new JSONObject();
    JSONArray localJSONArray = new JSONArray();
    try
    {
      localJSONObject.put("c", commandType);
      int i = 0;
      while (i < ((float[])value).length)
      {
        localJSONArray.put(FORMATTER.format(((float[])value)[i]));
        i += 1;
      }
      localJSONObject.put("p", localJSONArray);
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
    return localJSONObject;
  }
  
  public PointF getPoint()
  {
    return new PointF(((float[])value)[0], ((float[])value)[1]);
  }
  
  public void setPoint(float paramFloat1, float paramFloat2)
  {
    ((float[])value)[0] = paramFloat1;
    ((float[])value)[1] = paramFloat2;
  }
  
  public void setPoint(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    ((float[])value)[0] = paramFloat1;
    ((float[])value)[1] = paramFloat2;
    ((float[])value)[2] = paramFloat3;
    ((float[])value)[3] = paramFloat4;
  }
}
