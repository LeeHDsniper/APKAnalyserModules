package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class zzqn
{
  private final List<zzqi> zzaTH = new ArrayList();
  
  public zzqn() {}
  
  public String getId()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = zzaTH.iterator();
    int i = 1;
    if (localIterator.hasNext())
    {
      zzqi localZzqi = (zzqi)localIterator.next();
      if (i != 0) {
        i = 0;
      }
      for (;;)
      {
        localStringBuilder.append(localZzqi.getContainerId());
        break;
        localStringBuilder.append("#");
      }
    }
    return localStringBuilder.toString();
  }
  
  public List<zzqi> zzBv()
  {
    return zzaTH;
  }
  
  public zzqn zzb(zzqi paramZzqi)
    throws IllegalArgumentException
  {
    zzx.zzv(paramZzqi);
    Iterator localIterator = zzaTH.iterator();
    while (localIterator.hasNext()) {
      if (((zzqi)localIterator.next()).getContainerId().equals(paramZzqi.getContainerId())) {
        throw new IllegalArgumentException("The container is already being requested. " + paramZzqi.getContainerId());
      }
    }
    zzaTH.add(paramZzqi);
    return this;
  }
}
