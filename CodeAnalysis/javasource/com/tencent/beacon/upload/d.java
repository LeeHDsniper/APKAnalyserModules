package com.tencent.beacon.upload;

import android.content.Context;
import com.tencent.beacon.a.f;
import com.tencent.beacon.a.j;

public final class d
  extends a
{
  private Context f = null;
  private com.tencent.beacon.b.a.b g = null;
  
  public d(Context paramContext)
  {
    super(paramContext, 0, 102);
    f = paramContext;
  }
  
  public final com.tencent.beacon.b.a.b a()
  {
    com.tencent.beacon.d.a.b("QIMEIUploadDatas.getUploadRequestPackage() start", new Object[0]);
    if (g != null) {
      return g;
    }
    j localJ;
    try
    {
      localJ = j.a(f);
      if (localJ != null) {
        break label56;
      }
      com.tencent.beacon.d.a.c("QIMEIInfo instance is null, return", new Object[0]);
      return null;
    }
    catch (Throwable localThrowable)
    {
      com.tencent.beacon.d.a.a(localThrowable);
    }
    return g;
    label56:
    if (localJ == null) {}
    Object localObject2;
    for (Object localObject1 = null;; localObject1 = localObject2)
    {
      localObject2 = com.tencent.beacon.a.b.b.a(c).e();
      int i = 3;
      int j = 2;
      if (localObject2 != null)
      {
        i = ((com.tencent.beacon.a.b.d)localObject2).k();
        j = ((com.tencent.beacon.a.b.d)localObject2).l();
      }
      localObject1 = ((com.tencent.beacon.b.c.a)localObject1).a();
      localObject2 = com.tencent.beacon.a.d.m();
      g = f.a(a, (com.tencent.beacon.a.d)localObject2, (byte[])localObject1, j, i);
      break;
      localObject2 = new com.tencent.beacon.b.c.a();
      String str = localJ.c();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      b = ((String)localObject1);
      str = localJ.e();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      d = ((String)localObject1);
      str = localJ.d();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      c = ((String)localObject1);
      str = localJ.f();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      e = ((String)localObject1);
      str = localJ.a();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      a = ((String)localObject1);
      str = localJ.m();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      f = ((String)localObject1);
      str = localJ.q();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      g = ((String)localObject1);
      str = localJ.r();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      h = ((String)localObject1);
      str = localJ.g();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      i = ((String)localObject1);
      j = localJ.h();
      k = true;
      str = localJ.p();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      l = ((String)localObject1);
      str = localJ.i();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      m = ((String)localObject1);
      str = localJ.j();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      n = ((String)localObject1);
      str = localJ.m();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      o = ((String)localObject1);
      str = localJ.k();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      p = ((String)localObject1);
      str = localJ.n();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      q = ((String)localObject1);
      str = localJ.l();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      r = ((String)localObject1);
      str = localJ.o();
      localObject1 = str;
      if (str == null) {
        localObject1 = "";
      }
      s = ((String)localObject1);
    }
  }
  
  public final void b(boolean paramBoolean) {}
}
