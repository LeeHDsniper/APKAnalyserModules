package com.google.android.gms.analytics.internal;

import android.text.TextUtils;
import com.google.android.gms.common.internal.zzd;
import com.google.android.gms.common.internal.zzx;
import java.util.HashSet;
import java.util.Set;

public class zzr
{
  private final zzf zzKa;
  private volatile Boolean zzMN;
  private String zzMO;
  private Set<Integer> zzMP;
  
  protected zzr(zzf paramZzf)
  {
    zzx.zzv(paramZzf);
    zzKa = paramZzf;
  }
  
  public String zzjA()
  {
    return (String)zzy.zzNq.get();
  }
  
  public String zzjB()
  {
    return (String)zzy.zzNr.get();
  }
  
  public zzm zzjC()
  {
    return zzm.zzbh((String)zzy.zzNt.get());
  }
  
  public zzo zzjD()
  {
    return zzo.zzbi((String)zzy.zzNu.get());
  }
  
  public Set<Integer> zzjE()
  {
    String str1 = (String)zzy.zzNz.get();
    String[] arrayOfString;
    HashSet localHashSet;
    int j;
    int i;
    if ((zzMP == null) || (zzMO == null) || (!zzMO.equals(str1)))
    {
      arrayOfString = TextUtils.split(str1, ",");
      localHashSet = new HashSet();
      j = arrayOfString.length;
      i = 0;
    }
    for (;;)
    {
      String str2;
      if (i < j) {
        str2 = arrayOfString[i];
      }
      try
      {
        localHashSet.add(Integer.valueOf(Integer.parseInt(str2)));
        i += 1;
        continue;
        zzMO = str1;
        zzMP = localHashSet;
        return zzMP;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        for (;;) {}
      }
    }
  }
  
  public long zzjF()
  {
    return ((Long)zzy.zzNI.get()).longValue();
  }
  
  public long zzjG()
  {
    return ((Long)zzy.zzNJ.get()).longValue();
  }
  
  public long zzjH()
  {
    return ((Long)zzy.zzNM.get()).longValue();
  }
  
  public int zzjI()
  {
    return ((Integer)zzy.zzNd.get()).intValue();
  }
  
  public int zzjJ()
  {
    return ((Integer)zzy.zzNf.get()).intValue();
  }
  
  public String zzjK()
  {
    return "google_analytics_v4.db";
  }
  
  public String zzjL()
  {
    return "google_analytics2_v4.db";
  }
  
  public long zzjM()
  {
    return 86400000L;
  }
  
  public int zzjN()
  {
    return ((Integer)zzy.zzNC.get()).intValue();
  }
  
  public int zzjO()
  {
    return ((Integer)zzy.zzND.get()).intValue();
  }
  
  public long zzjP()
  {
    return ((Long)zzy.zzNE.get()).longValue();
  }
  
  public long zzjQ()
  {
    return ((Long)zzy.zzNN.get()).longValue();
  }
  
  public boolean zzjk()
  {
    return zzd.zzacF;
  }
  
  /* Error */
  public boolean zzjl()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 178	com/google/android/gms/analytics/internal/zzr:zzMN	Ljava/lang/Boolean;
    //   4: ifnonnull +129 -> 133
    //   7: aload_0
    //   8: monitorenter
    //   9: aload_0
    //   10: getfield 178	com/google/android/gms/analytics/internal/zzr:zzMN	Ljava/lang/Boolean;
    //   13: ifnonnull +118 -> 131
    //   16: aload_0
    //   17: getfield 26	com/google/android/gms/analytics/internal/zzr:zzKa	Lcom/google/android/gms/analytics/internal/zzf;
    //   20: invokevirtual 184	com/google/android/gms/analytics/internal/zzf:getContext	()Landroid/content/Context;
    //   23: invokevirtual 190	android/content/Context:getApplicationInfo	()Landroid/content/pm/ApplicationInfo;
    //   26: astore_3
    //   27: aload_0
    //   28: getfield 26	com/google/android/gms/analytics/internal/zzr:zzKa	Lcom/google/android/gms/analytics/internal/zzf;
    //   31: invokevirtual 184	com/google/android/gms/analytics/internal/zzf:getContext	()Landroid/content/Context;
    //   34: invokestatic 195	android/os/Process:myPid	()I
    //   37: invokestatic 201	com/google/android/gms/internal/zzlw:zzj	(Landroid/content/Context;I)Ljava/lang/String;
    //   40: astore_2
    //   41: aload_3
    //   42: ifnull +30 -> 72
    //   45: aload_3
    //   46: getfield 206	android/content/pm/ApplicationInfo:processName	Ljava/lang/String;
    //   49: astore_3
    //   50: aload_3
    //   51: ifnull +90 -> 141
    //   54: aload_3
    //   55: aload_2
    //   56: invokevirtual 84	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   59: ifeq +82 -> 141
    //   62: iconst_1
    //   63: istore_1
    //   64: aload_0
    //   65: iload_1
    //   66: invokestatic 211	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   69: putfield 178	com/google/android/gms/analytics/internal/zzr:zzMN	Ljava/lang/Boolean;
    //   72: aload_0
    //   73: getfield 178	com/google/android/gms/analytics/internal/zzr:zzMN	Ljava/lang/Boolean;
    //   76: ifnull +13 -> 89
    //   79: aload_0
    //   80: getfield 178	com/google/android/gms/analytics/internal/zzr:zzMN	Ljava/lang/Boolean;
    //   83: invokevirtual 214	java/lang/Boolean:booleanValue	()Z
    //   86: ifne +19 -> 105
    //   89: ldc -40
    //   91: aload_2
    //   92: invokevirtual 84	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   95: ifeq +10 -> 105
    //   98: aload_0
    //   99: getstatic 219	java/lang/Boolean:TRUE	Ljava/lang/Boolean;
    //   102: putfield 178	com/google/android/gms/analytics/internal/zzr:zzMN	Ljava/lang/Boolean;
    //   105: aload_0
    //   106: getfield 178	com/google/android/gms/analytics/internal/zzr:zzMN	Ljava/lang/Boolean;
    //   109: ifnonnull +22 -> 131
    //   112: aload_0
    //   113: getstatic 219	java/lang/Boolean:TRUE	Ljava/lang/Boolean;
    //   116: putfield 178	com/google/android/gms/analytics/internal/zzr:zzMN	Ljava/lang/Boolean;
    //   119: aload_0
    //   120: getfield 26	com/google/android/gms/analytics/internal/zzr:zzKa	Lcom/google/android/gms/analytics/internal/zzf;
    //   123: invokevirtual 223	com/google/android/gms/analytics/internal/zzf:zzie	()Lcom/google/android/gms/analytics/internal/zzaf;
    //   126: ldc -31
    //   128: invokevirtual 231	com/google/android/gms/analytics/internal/zzaf:zzbc	(Ljava/lang/String;)V
    //   131: aload_0
    //   132: monitorexit
    //   133: aload_0
    //   134: getfield 178	com/google/android/gms/analytics/internal/zzr:zzMN	Ljava/lang/Boolean;
    //   137: invokevirtual 214	java/lang/Boolean:booleanValue	()Z
    //   140: ireturn
    //   141: iconst_0
    //   142: istore_1
    //   143: goto -79 -> 64
    //   146: astore_2
    //   147: aload_0
    //   148: monitorexit
    //   149: aload_2
    //   150: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	151	0	this	zzr
    //   63	80	1	bool	boolean
    //   40	52	2	str	String
    //   146	4	2	localObject1	Object
    //   26	29	3	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   9	41	146	finally
    //   45	50	146	finally
    //   54	62	146	finally
    //   64	72	146	finally
    //   72	89	146	finally
    //   89	105	146	finally
    //   105	131	146	finally
    //   131	133	146	finally
    //   147	149	146	finally
  }
  
  public boolean zzjm()
  {
    return ((Boolean)zzy.zzMZ.get()).booleanValue();
  }
  
  public int zzjn()
  {
    return ((Integer)zzy.zzNs.get()).intValue();
  }
  
  public int zzjo()
  {
    return ((Integer)zzy.zzNw.get()).intValue();
  }
  
  public int zzjp()
  {
    return ((Integer)zzy.zzNx.get()).intValue();
  }
  
  public int zzjq()
  {
    return ((Integer)zzy.zzNy.get()).intValue();
  }
  
  public long zzjr()
  {
    return ((Long)zzy.zzNh.get()).longValue();
  }
  
  public long zzjs()
  {
    return ((Long)zzy.zzNg.get()).longValue();
  }
  
  public long zzjt()
  {
    return ((Long)zzy.zzNk.get()).longValue();
  }
  
  public long zzju()
  {
    return ((Long)zzy.zzNl.get()).longValue();
  }
  
  public int zzjv()
  {
    return ((Integer)zzy.zzNm.get()).intValue();
  }
  
  public int zzjw()
  {
    return ((Integer)zzy.zzNn.get()).intValue();
  }
  
  public long zzjx()
  {
    return ((Integer)zzy.zzNA.get()).intValue();
  }
  
  public String zzjy()
  {
    return (String)zzy.zzNp.get();
  }
  
  public String zzjz()
  {
    return (String)zzy.zzNo.get();
  }
}
