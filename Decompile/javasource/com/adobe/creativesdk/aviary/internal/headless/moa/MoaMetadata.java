package com.adobe.creativesdk.aviary.internal.headless.moa;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class MoaMetadata
{
  private int[] cellsize = { -1, -1 };
  private int[] grid = { 0, 0 };
  private int[] imagesize = { 1, 1 };
  private int inplace = 0;
  
  public MoaMetadata() {}
  
  public int cellHeight()
  {
    return cellsize[1];
  }
  
  public int cellWidth()
  {
    return cellsize[0];
  }
  
  public int cols()
  {
    return grid[0];
  }
  
  public JSONObject encode()
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    JSONArray localJSONArray = new JSONArray();
    localJSONArray.put(imagesize[0]);
    localJSONArray.put(imagesize[1]);
    localJSONObject.put("imageorigsize", localJSONArray);
    localJSONObject.put("cellWidth", cellWidth());
    localJSONObject.put("cellHeight", cellHeight());
    localJSONObject.put("cols", cols());
    localJSONObject.put("rows", rows());
    localJSONObject.put("inplace", inplace);
    localJSONObject.put("version", "2.1.2");
    return localJSONObject;
  }
  
  public int rows()
  {
    return grid[1];
  }
  
  public void setImageSize(int paramInt1, int paramInt2)
  {
    imagesize[0] = paramInt1;
    imagesize[1] = paramInt2;
  }
}
