package com.adobe.creativesdk.aviary.internal.headless.moa;

import android.graphics.Matrix;
import org.json.JSONArray;
import org.json.JSONException;

public class MoaMatrixParameter
  extends MoaParameter<Matrix>
{
  private static final long serialVersionUID = -4976445821898979991L;
  private Matrix matrix;
  
  public MoaMatrixParameter(Matrix paramMatrix)
  {
    type = "matrix";
    matrix = paramMatrix;
  }
  
  public Object clone()
  {
    return new MoaMatrixParameter(new Matrix(matrix));
  }
  
  public Object encode()
  {
    JSONArray localJSONArray = new JSONArray();
    float[] arrayOfFloat = new float[9];
    matrix.getValues(arrayOfFloat);
    int i = 0;
    for (;;)
    {
      if (i < 9) {
        try
        {
          localJSONArray.put(arrayOfFloat[i]);
          i += 1;
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            localJSONException.printStackTrace();
          }
        }
      }
    }
    return localJSONArray;
  }
}
