package com.google.android.gms.tagmanager;

import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Result;

public abstract interface ContainerHolder
  extends Releasable, Result
{
  public abstract Container getContainer();
  
  public static abstract interface ContainerAvailableListener
  {
    public abstract void onContainerAvailable(ContainerHolder paramContainerHolder, String paramString);
  }
}
