package com.adobe.creativesdk.aviary.internal.headless.moa;

import android.annotation.SuppressLint;
import com.adobe.creativesdk.aviary.internal.headless.filters.MoaJavaToolStrokeResult;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeToolFilter.BrushMode;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MoaStrokeParameter
  extends MoaParameter<MoaPointParameter>
{
  private static final long serialVersionUID = 8921806317265715686L;
  private NativeToolFilter.BrushMode brushmode;
  private MoaJavaToolStrokeResult initParams;
  private List<MoaPointParameter> mList = new LinkedList();
  private final Object mLock = new Object();
  private double radius;
  
  public MoaStrokeParameter(NativeToolFilter.BrushMode paramBrushMode, double paramDouble)
  {
    brushmode = paramBrushMode;
    radius = paramDouble;
  }
  
  public void addPoint(float paramFloat1, float paramFloat2)
  {
    synchronized (mLock)
    {
      mList.add(new MoaPointParameter(paramFloat1, paramFloat2));
      return;
    }
  }
  
  public void addPoint(MoaPointParameter paramMoaPointParameter)
  {
    synchronized (mLock)
    {
      mList.add(paramMoaPointParameter);
      return;
    }
  }
  
  public void addPoint(float[] paramArrayOfFloat)
  {
    synchronized (mLock)
    {
      mList.add(new MoaPointParameter(paramArrayOfFloat[0], paramArrayOfFloat[1]));
      return;
    }
  }
  
  public Object clone()
  {
    MoaStrokeParameter localMoaStrokeParameter = new MoaStrokeParameter(brushmode, radius);
    synchronized (mLock)
    {
      Iterator localIterator = mList.iterator();
      if (localIterator.hasNext()) {
        localMoaStrokeParameter.addPoint((MoaPointParameter)((MoaPointParameter)localIterator.next()).clone());
      }
    }
    return localObject2;
  }
  
  @SuppressLint({"DefaultLocale"})
  public Object encode()
  {
    JSONObject localJSONObject = new JSONObject();
    do
    {
      try
      {
        localJSONObject.accumulate("brushmode", brushmode.name().toLowerCase());
        localJSONObject.accumulate("radius", Double.valueOf(radius));
        JSONArray localJSONArray = new JSONArray();
        synchronized (mLock)
        {
          Iterator localIterator = mList.iterator();
          if (localIterator.hasNext()) {
            localJSONArray.put(((MoaPointParameter)localIterator.next()).encode());
          }
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return localJSONObject;
      }
      localJSONObject.accumulate("pointlist", localObject2);
    } while (initParams == null);
    localJSONObject.put("initparams", initParams.encode());
    return localJSONObject;
  }
  
  public void setInitParams(MoaJavaToolStrokeResult paramMoaJavaToolStrokeResult)
  {
    try
    {
      initParams = ((MoaJavaToolStrokeResult)paramMoaJavaToolStrokeResult.clone());
      return;
    }
    catch (CloneNotSupportedException paramMoaJavaToolStrokeResult)
    {
      paramMoaJavaToolStrokeResult.printStackTrace();
    }
  }
}
