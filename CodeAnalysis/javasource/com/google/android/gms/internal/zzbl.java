package com.google.android.gms.internal;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public abstract class zzbl
{
  private static MessageDigest zzsd = null;
  protected Object zzpc = new Object();
  
  public zzbl() {}
  
  protected MessageDigest zzcy()
  {
    for (;;)
    {
      MessageDigest localMessageDigest;
      int i;
      synchronized (zzpc)
      {
        if (zzsd != null)
        {
          localMessageDigest = zzsd;
          return localMessageDigest;
        }
        i = 0;
        if (i >= 2) {}
      }
      try
      {
        zzsd = MessageDigest.getInstance("MD5");
        i += 1;
        continue;
        localMessageDigest = zzsd;
        return localMessageDigest;
        localObject2 = finally;
        throw localObject2;
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        for (;;) {}
      }
    }
  }
  
  abstract byte[] zzz(String paramString);
}
