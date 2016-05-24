package com.google.android.gms.common;

import android.content.Intent;

public class GooglePlayServicesRepairableException
  extends UserRecoverableException
{
  private final int zzQK;
  
  GooglePlayServicesRepairableException(int paramInt, String paramString, Intent paramIntent)
  {
    super(paramString, paramIntent);
    zzQK = paramInt;
  }
  
  public int getConnectionStatusCode()
  {
    return zzQK;
  }
}
