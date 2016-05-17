package com.tencent.beacon.event;

import android.content.Context;
import com.tencent.beacon.a.f;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class c
  extends com.tencent.beacon.upload.a
{
  private Context f = null;
  private Long[] g = null;
  private List<Long> h = null;
  private byte[] i = null;
  private boolean j = false;
  
  public c(Context paramContext)
  {
    super(paramContext, 1, 4);
    f = paramContext;
  }
  
  private com.tencent.beacon.b.a.a a(List<k> paramList)
  {
    int m = 1;
    if ((paramList == null) || (paramList.size() <= 0)) {
      return null;
    }
    Object localObject1 = new ArrayList(5);
    ArrayList localArrayList1 = new ArrayList(5);
    ArrayList localArrayList2 = new ArrayList(5);
    Object localObject2 = new ArrayList();
    int n = paramList.size();
    h = new ArrayList();
    int k = 0;
    k localK;
    Object localObject3;
    if (k < n) {
      try
      {
        localK = (k)paramList.get(k);
        localObject3 = localK.e();
        com.tencent.beacon.d.a.a(" bean.getTP: " + localK.b(), new Object[0]);
        if (localObject3 != null) {
          if ("IP".equals(localK.b()))
          {
            localObject3 = b.b(localK);
            if (localObject3 != null) {
              ((ArrayList)localObject1).add(localObject3);
            } else {
              h.add(Long.valueOf(localK.a()));
            }
          }
        }
      }
      catch (Throwable paramList)
      {
        com.tencent.beacon.d.a.a(paramList);
        com.tencent.beacon.d.a.d(" CommonRecordUploadDatas.encode2MixPackage() error1", new Object[0]);
      }
    }
    for (;;)
    {
      try
      {
        paramList = new com.tencent.beacon.b.d.c();
        k = m;
        if (localArrayList2.size() > 0)
        {
          c = localArrayList2;
          k = 0;
        }
        if (localArrayList1.size() > 0)
        {
          b = localArrayList1;
          k = 0;
        }
        if (((ArrayList)localObject1).size() <= 0) {
          break label747;
        }
        a = ((ArrayList)localObject1);
        k = 0;
      }
      catch (Exception paramList)
      {
        label266:
        com.tencent.beacon.d.a.a(paramList);
        com.tencent.beacon.d.a.d(" CommonRecordUploadDatas.encode2MixPackage() error2", new Object[0]);
        b();
        return null;
      }
      if (((ArrayList)localObject2).size() > 0)
      {
        localObject1 = new com.tencent.beacon.b.b.b();
        a = ((ArrayList)localObject2);
        if ((paramList == null) && (localObject1 == null))
        {
          return null;
          if ("DN".equals(localK.b()))
          {
            localObject3 = b.c(localK);
            if (localObject3 != null) {
              localArrayList1.add(localObject3);
            } else {
              h.add(Long.valueOf(localK.a()));
            }
          }
          else if ("HO".equals(localK.b()))
          {
            localObject3 = b.d(localK);
            if (localObject3 != null) {
              localArrayList2.add(localObject3);
            } else {
              h.add(Long.valueOf(localK.a()));
            }
          }
          else if ("UA".equals(localK.b()))
          {
            com.tencent.beacon.d.a.f(" Pack2Upload eventName:}%s ", new Object[] { localK.d() });
            localObject3 = b.e(localK);
            if (localObject3 != null)
            {
              ((ArrayList)localObject2).add(localObject3);
            }
            else
            {
              h.add(Long.valueOf(localK.a()));
              break label740;
              if (h.size() > 0) {
                f.a(f, (Long[])h.toArray(new Long[h.size()]));
              }
              com.tencent.beacon.d.a.b(" up hmList:" + localArrayList2.size(), new Object[0]);
              com.tencent.beacon.d.a.b(" up dmList:" + localArrayList1.size(), new Object[0]);
              com.tencent.beacon.d.a.b(" up ipList:" + ((ArrayList)localObject1).size(), new Object[0]);
              com.tencent.beacon.d.a.b(" up erList:" + ((ArrayList)localObject2).size(), new Object[0]);
            }
          }
        }
        else
        {
          localObject2 = new HashMap();
          if (paramList != null) {
            ((Map)localObject2).put(Integer.valueOf(3), paramList.a());
          }
          if (localObject1 != null) {
            ((Map)localObject2).put(Integer.valueOf(1), ((com.tencent.beacon.b.b.b)localObject1).a());
          }
          paramList = new com.tencent.beacon.b.a.a();
          a = ((Map)localObject2);
          return paramList;
        }
      }
      else
      {
        localObject1 = null;
        continue;
      }
      label740:
      label747:
      do
      {
        break label266;
        k += 1;
        break;
      } while (k == 0);
      paramList = null;
    }
  }
  
  private boolean g()
  {
    try
    {
      boolean bool = j;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final com.tencent.beacon.b.a.b a()
  {
    Object localObject9 = null;
    int m = 0;
    Object localObject6;
    try
    {
      Object localObject1 = o.d();
      if ((localObject1 == null) || (!((o)localObject1).g()))
      {
        com.tencent.beacon.d.a.c(" imposiable! ua not ready!", new Object[0]);
        localObject1 = localObject9;
      }
      for (;;)
      {
        return localObject1;
        localObject6 = ((o)localObject1).i();
        if (localObject6 == null)
        {
          com.tencent.beacon.d.a.c(" imposiable! ua S not ready!", new Object[0]);
          localObject1 = localObject9;
        }
        else
        {
          try
          {
            if (g())
            {
              localObject7 = com.tencent.beacon.a.a.a.a(f);
              if ((localObject7 != null) && (((List)localObject7).size() > 0))
              {
                localObject3 = (byte[])((List)localObject7).get(3);
                d = String.valueOf(((List)localObject7).get(1));
                e = ((Integer)((List)localObject7).get(4)).intValue();
                if (localObject3 != null)
                {
                  localObject6 = c;
                  localObject3 = a(a, (byte[])localObject3);
                  continue;
                }
                n = ((g)localObject6).e();
                k = n;
                if (!f.s(f)) {
                  k = n / 2;
                }
                if (k >= 0)
                {
                  localObject6 = f.a(f, k);
                  if ((localObject6 == null) || (((List)localObject6).size() <= 0))
                  {
                    com.tencent.beacon.d.a.h(" no up datas", new Object[0]);
                    localObject3 = localObject9;
                  }
                }
              }
            }
          }
          catch (Throwable localThrowable)
          {
            com.tencent.beacon.d.a.a(localThrowable);
            com.tencent.beacon.d.a.d(" get req datas error: %s", new Object[] { localThrowable.toString() });
            localObject4 = localObject9;
          }
        }
      }
    }
    finally {}
    for (;;)
    {
      Object localObject7;
      Object localObject3;
      int n;
      break;
      int k = ((List)localObject6).size();
      com.tencent.beacon.d.a.h(" size:%d", new Object[] { Integer.valueOf(k) });
      e = k;
      Object localObject8;
      try
      {
        localObject7 = a((List)localObject6);
        g = new Long[k];
        k = m;
        while (k < g.length)
        {
          g[k] = Long.valueOf(((k)((List)localObject6).get(k)).a());
          k += 1;
        }
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          b();
          localObject8 = null;
        }
        ((List)localObject6).clear();
        if (localObject8 == null) {
          break label482;
        }
      }
      Object localObject4 = localObject8.a();
      label482:
      for (;;)
      {
        i = new byte[localObject4.length];
        System.arraycopy(localObject4, 0, i, 0, localObject4.length);
        d = f.b(c, 4);
        com.tencent.beacon.d.a.a("comm rid:%s", new Object[] { d });
        try
        {
          localObject6 = c;
          localObject4 = a(a, (byte[])localObject4);
        }
        catch (Exception localException1)
        {
          for (;;)
          {
            b();
            localObject5 = null;
          }
        }
      }
      localObject6 = null;
      continue;
      Object localObject5 = null;
    }
  }
  
  public final void a(boolean paramBoolean)
  {
    try
    {
      j = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void b()
  {
    try
    {
      com.tencent.beacon.d.a.c(" encode failed, clear db data", new Object[0]);
      if ((g != null) && (g.length > 0))
      {
        int k = f.a(f, g);
        com.tencent.beacon.d.a.b(" remove num :" + k, new Object[0]);
        g = null;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public final void b(boolean paramBoolean)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_2
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 24	com/tencent/beacon/event/c:g	[Ljava/lang/Long;
    //   8: ifnull +9 -> 17
    //   11: aload_0
    //   12: getfield 24	com/tencent/beacon/event/c:g	[Ljava/lang/Long;
    //   15: arraylength
    //   16: istore_2
    //   17: iload_2
    //   18: ifle +39 -> 57
    //   21: aload_0
    //   22: getfield 22	com/tencent/beacon/event/c:f	Landroid/content/Context;
    //   25: aload_0
    //   26: getfield 24	com/tencent/beacon/event/c:g	[Ljava/lang/Long;
    //   29: invokestatic 167	com/tencent/beacon/a/f:a	(Landroid/content/Context;[Ljava/lang/Long;)I
    //   32: istore_3
    //   33: new 63	java/lang/StringBuilder
    //   36: dup
    //   37: ldc_w 298
    //   40: invokespecial 68	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   43: iload_3
    //   44: invokevirtual 172	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   47: invokevirtual 79	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   50: iconst_0
    //   51: anewarray 81	java/lang/Object
    //   54: invokestatic 174	com/tencent/beacon/d/a:b	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   57: aload_0
    //   58: aconst_null
    //   59: putfield 24	com/tencent/beacon/event/c:g	[Ljava/lang/Long;
    //   62: iload_1
    //   63: ifeq +30 -> 93
    //   66: aload_0
    //   67: invokespecial 229	com/tencent/beacon/event/c:g	()Z
    //   70: ifeq +23 -> 93
    //   73: aload_0
    //   74: getfield 22	com/tencent/beacon/event/c:f	Landroid/content/Context;
    //   77: aload_0
    //   78: getfield 241	com/tencent/beacon/event/c:d	Ljava/lang/String;
    //   81: invokestatic 301	com/tencent/beacon/a/a/a:a	(Landroid/content/Context;Ljava/lang/String;)Z
    //   84: pop
    //   85: aload_0
    //   86: aconst_null
    //   87: putfield 28	com/tencent/beacon/event/c:i	[B
    //   90: aload_0
    //   91: monitorexit
    //   92: return
    //   93: iload_1
    //   94: ifne -9 -> 85
    //   97: aload_0
    //   98: getfield 28	com/tencent/beacon/event/c:i	[B
    //   101: ifnull -16 -> 85
    //   104: ldc_w 303
    //   107: iconst_1
    //   108: anewarray 81	java/lang/Object
    //   111: dup
    //   112: iconst_0
    //   113: aload_0
    //   114: getfield 241	com/tencent/beacon/event/c:d	Ljava/lang/String;
    //   117: aastore
    //   118: invokestatic 86	com/tencent/beacon/d/a:a	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   121: aload_0
    //   122: getfield 22	com/tencent/beacon/event/c:f	Landroid/content/Context;
    //   125: aload_0
    //   126: getfield 28	com/tencent/beacon/event/c:i	[B
    //   129: aload_0
    //   130: getfield 241	com/tencent/beacon/event/c:d	Ljava/lang/String;
    //   133: iload_2
    //   134: invokestatic 306	com/tencent/beacon/a/a/a:a	(Landroid/content/Context;[BLjava/lang/String;I)Z
    //   137: pop
    //   138: goto -53 -> 85
    //   141: astore 4
    //   143: aload_0
    //   144: monitorexit
    //   145: aload 4
    //   147: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	148	0	this	c
    //   0	148	1	paramBoolean	boolean
    //   1	133	2	k	int
    //   32	12	3	m	int
    //   141	5	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   4	17	141	finally
    //   21	57	141	finally
    //   57	62	141	finally
    //   66	85	141	finally
    //   85	90	141	finally
    //   97	138	141	finally
  }
}
