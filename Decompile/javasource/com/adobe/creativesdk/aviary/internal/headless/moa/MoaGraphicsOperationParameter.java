package com.adobe.creativesdk.aviary.internal.headless.moa;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MoaGraphicsOperationParameter
  extends MoaParameter<Object>
{
  private static final long serialVersionUID = 8086039986793586089L;
  int mBlurSize;
  int mColor;
  List<MoaGraphicsCommandParameter> mCommands = new LinkedList();
  int mErase;
  final Object mLock = new Object();
  float mRadius;
  
  public MoaGraphicsOperationParameter(int paramInt1, float paramFloat, int paramInt2, int paramInt3)
  {
    mBlurSize = paramInt1;
    mRadius = paramFloat;
    mColor = paramInt2;
    mErase = paramInt3;
  }
  
  public void addCommand(MoaGraphicsCommandParameter paramMoaGraphicsCommandParameter)
  {
    synchronized (mLock)
    {
      mCommands.add(paramMoaGraphicsCommandParameter);
      return;
    }
  }
  
  public Object clone()
  {
    MoaGraphicsOperationParameter localMoaGraphicsOperationParameter = new MoaGraphicsOperationParameter(mBlurSize, mRadius, mColor, mErase);
    synchronized (mLock)
    {
      Iterator localIterator = mCommands.iterator();
      while (localIterator.hasNext())
      {
        Object localObject3 = ((MoaGraphicsCommandParameter)localIterator.next()).clone();
        if (localObject3 != null) {
          localMoaGraphicsOperationParameter.addCommand((MoaGraphicsCommandParameter)((MoaGraphicsCommandParameter)localObject3).clone());
        }
      }
    }
    return localObject2;
  }
  
  public Object encode()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.accumulate("blursize", Integer.valueOf(mBlurSize));
      localJSONObject.accumulate("radius", Float.valueOf(mRadius));
      localJSONObject.accumulate("color", "0x" + StringUtils.rightPad(Integer.toHexString(mColor), 8, '0'));
      localJSONObject.accumulate("erase", Integer.valueOf(mErase));
      JSONArray localJSONArray = new JSONArray();
      synchronized (mLock)
      {
        Iterator localIterator = mCommands.iterator();
        if (localIterator.hasNext()) {
          localJSONArray.put(((MoaGraphicsCommandParameter)localIterator.next()).encode());
        }
      }
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      return localJSONObject;
    }
    localJSONObject.accumulate("commands", localObject2);
    return localJSONObject;
  }
  
  public MoaGraphicsCommandParameter getLastCommand()
  {
    synchronized (mLock)
    {
      if (mCommands.size() > 0)
      {
        MoaGraphicsCommandParameter localMoaGraphicsCommandParameter = (MoaGraphicsCommandParameter)mCommands.get(mCommands.size() - 1);
        return localMoaGraphicsCommandParameter;
      }
      return null;
    }
  }
}
