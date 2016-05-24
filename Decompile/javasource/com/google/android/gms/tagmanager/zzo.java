package com.google.android.gms.tagmanager;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.gms.common.api.Status;

class zzo
  implements ContainerHolder
{
  private Status zzQA;
  private final Looper zzYV;
  private Container zzaPa;
  private Container zzaPb;
  private zzb zzaPc;
  private zza zzaPd;
  private TagManager zzaPe;
  private boolean zzahz;
  
  public zzo(Status paramStatus)
  {
    zzQA = paramStatus;
    zzYV = null;
  }
  
  public zzo(TagManager paramTagManager, Looper paramLooper, Container paramContainer, zza paramZza)
  {
    zzaPe = paramTagManager;
    if (paramLooper != null) {}
    for (;;)
    {
      zzYV = paramLooper;
      zzaPa = paramContainer;
      zzaPd = paramZza;
      zzQA = Status.zzaaD;
      paramTagManager.zza(this);
      return;
      paramLooper = Looper.getMainLooper();
    }
  }
  
  /* Error */
  public Container getContainer()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 64	com/google/android/gms/tagmanager/zzo:zzahz	Z
    //   8: ifeq +12 -> 20
    //   11: ldc 66
    //   13: invokestatic 72	com/google/android/gms/tagmanager/zzbg:e	(Ljava/lang/String;)V
    //   16: aload_0
    //   17: monitorexit
    //   18: aload_1
    //   19: areturn
    //   20: aload_0
    //   21: getfield 74	com/google/android/gms/tagmanager/zzo:zzaPb	Lcom/google/android/gms/tagmanager/Container;
    //   24: ifnull +16 -> 40
    //   27: aload_0
    //   28: aload_0
    //   29: getfield 74	com/google/android/gms/tagmanager/zzo:zzaPb	Lcom/google/android/gms/tagmanager/Container;
    //   32: putfield 42	com/google/android/gms/tagmanager/zzo:zzaPa	Lcom/google/android/gms/tagmanager/Container;
    //   35: aload_0
    //   36: aconst_null
    //   37: putfield 74	com/google/android/gms/tagmanager/zzo:zzaPb	Lcom/google/android/gms/tagmanager/Container;
    //   40: aload_0
    //   41: getfield 42	com/google/android/gms/tagmanager/zzo:zzaPa	Lcom/google/android/gms/tagmanager/Container;
    //   44: astore_1
    //   45: goto -29 -> 16
    //   48: astore_1
    //   49: aload_0
    //   50: monitorexit
    //   51: aload_1
    //   52: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	53	0	this	zzo
    //   1	44	1	localContainer	Container
    //   48	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   4	16	48	finally
    //   20	40	48	finally
    //   40	45	48	finally
  }
  
  String getContainerId()
  {
    if (zzahz)
    {
      zzbg.e("getContainerId called on a released ContainerHolder.");
      return "";
    }
    return zzaPa.getContainerId();
  }
  
  public Status getStatus()
  {
    return zzQA;
  }
  
  /* Error */
  public void refresh()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 64	com/google/android/gms/tagmanager/zzo:zzahz	Z
    //   6: ifeq +11 -> 17
    //   9: ldc 89
    //   11: invokestatic 72	com/google/android/gms/tagmanager/zzbg:e	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: monitorexit
    //   16: return
    //   17: aload_0
    //   18: getfield 44	com/google/android/gms/tagmanager/zzo:zzaPd	Lcom/google/android/gms/tagmanager/zzo$zza;
    //   21: invokeinterface 92 1 0
    //   26: goto -12 -> 14
    //   29: astore_1
    //   30: aload_0
    //   31: monitorexit
    //   32: aload_1
    //   33: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	34	0	this	zzo
    //   29	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	14	29	finally
    //   17	26	29	finally
  }
  
  /* Error */
  public void release()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 64	com/google/android/gms/tagmanager/zzo:zzahz	Z
    //   6: ifeq +11 -> 17
    //   9: ldc 95
    //   11: invokestatic 72	com/google/android/gms/tagmanager/zzbg:e	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: monitorexit
    //   16: return
    //   17: aload_0
    //   18: iconst_1
    //   19: putfield 64	com/google/android/gms/tagmanager/zzo:zzahz	Z
    //   22: aload_0
    //   23: getfield 40	com/google/android/gms/tagmanager/zzo:zzaPe	Lcom/google/android/gms/tagmanager/TagManager;
    //   26: aload_0
    //   27: invokevirtual 98	com/google/android/gms/tagmanager/TagManager:zzb	(Lcom/google/android/gms/tagmanager/zzo;)Z
    //   30: pop
    //   31: aload_0
    //   32: getfield 42	com/google/android/gms/tagmanager/zzo:zzaPa	Lcom/google/android/gms/tagmanager/Container;
    //   35: invokevirtual 100	com/google/android/gms/tagmanager/Container:release	()V
    //   38: aload_0
    //   39: aconst_null
    //   40: putfield 42	com/google/android/gms/tagmanager/zzo:zzaPa	Lcom/google/android/gms/tagmanager/Container;
    //   43: aload_0
    //   44: aconst_null
    //   45: putfield 74	com/google/android/gms/tagmanager/zzo:zzaPb	Lcom/google/android/gms/tagmanager/Container;
    //   48: aload_0
    //   49: aconst_null
    //   50: putfield 44	com/google/android/gms/tagmanager/zzo:zzaPd	Lcom/google/android/gms/tagmanager/zzo$zza;
    //   53: aload_0
    //   54: aconst_null
    //   55: putfield 102	com/google/android/gms/tagmanager/zzo:zzaPc	Lcom/google/android/gms/tagmanager/zzo$zzb;
    //   58: goto -44 -> 14
    //   61: astore_1
    //   62: aload_0
    //   63: monitorexit
    //   64: aload_1
    //   65: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	66	0	this	zzo
    //   61	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	14	61	finally
    //   17	58	61	finally
  }
  
  /* Error */
  public void zzew(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 64	com/google/android/gms/tagmanager/zzo:zzahz	Z
    //   6: istore_2
    //   7: iload_2
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: getfield 42	com/google/android/gms/tagmanager/zzo:zzaPa	Lcom/google/android/gms/tagmanager/Container;
    //   18: aload_1
    //   19: invokevirtual 105	com/google/android/gms/tagmanager/Container:zzew	(Ljava/lang/String;)V
    //   22: goto -11 -> 11
    //   25: astore_1
    //   26: aload_0
    //   27: monitorexit
    //   28: aload_1
    //   29: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	30	0	this	zzo
    //   0	30	1	paramString	String
    //   6	2	2	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	7	25	finally
    //   14	22	25	finally
  }
  
  void zzey(String paramString)
  {
    if (zzahz)
    {
      zzbg.e("setCtfeUrlPathAndQuery called on a released ContainerHolder.");
      return;
    }
    zzaPd.zzey(paramString);
  }
  
  String zzzE()
  {
    if (zzahz)
    {
      zzbg.e("setCtfeUrlPathAndQuery called on a released ContainerHolder.");
      return "";
    }
    return zzaPd.zzzE();
  }
  
  public static abstract interface zza
  {
    public abstract void zzey(String paramString);
    
    public abstract String zzzE();
    
    public abstract void zzzG();
  }
  
  private class zzb
    extends Handler
  {
    private final ContainerHolder.ContainerAvailableListener zzaPf;
    
    public void handleMessage(Message paramMessage)
    {
      switch (what)
      {
      default: 
        zzbg.e("Don't know how to handle this message.");
        return;
      }
      zzeA((String)obj);
    }
    
    protected void zzeA(String paramString)
    {
      zzaPf.onContainerAvailable(zzaPg, paramString);
    }
  }
}
