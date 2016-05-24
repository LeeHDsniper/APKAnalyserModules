package com.adobe.creativesdk.aviary.internal.headless.moa;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONArray;

public class MoaGraphicsCommandListParameter
  extends MoaParameter<MoaGraphicsCommandParameter>
{
  private static final long serialVersionUID = 7071816776190464049L;
  List<MoaGraphicsCommandParameter> mList = new LinkedList();
  final Object mLock = new Object();
  
  public MoaGraphicsCommandListParameter() {}
  
  public void addCommand(MoaGraphicsCommandParameter paramMoaGraphicsCommandParameter)
  {
    synchronized (mLock)
    {
      mList.add(paramMoaGraphicsCommandParameter);
      return;
    }
  }
  
  public Object clone()
  {
    MoaGraphicsCommandListParameter localMoaGraphicsCommandListParameter = new MoaGraphicsCommandListParameter();
    synchronized (mLock)
    {
      Iterator localIterator = mList.iterator();
      if (localIterator.hasNext()) {
        localMoaGraphicsCommandListParameter.addCommand((MoaGraphicsCommandParameter)((MoaGraphicsCommandParameter)localIterator.next()).clone());
      }
    }
    return localObject2;
  }
  
  public Object encode()
  {
    JSONArray localJSONArray = new JSONArray();
    synchronized (mLock)
    {
      Iterator localIterator = mList.iterator();
      if (localIterator.hasNext()) {
        localJSONArray.put(((MoaGraphicsCommandParameter)localIterator.next()).encode());
      }
    }
    return localObject2;
  }
}
