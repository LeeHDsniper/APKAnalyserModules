package com.facebook.ads.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Parcel;
import android.util.Log;
import com.facebook.ads.internal.util.g;
import com.facebook.ads.internal.util.g.a;
import com.facebook.ads.internal.util.s;
import java.lang.reflect.Method;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.atomic.AtomicBoolean;

public class f
{
  public static final String a = f.class.getSimpleName();
  private final String b;
  private final boolean c;
  
  private f(String paramString, boolean paramBoolean)
  {
    b = paramString;
    c = paramBoolean;
  }
  
  private static f a(Context paramContext)
  {
    Object localObject = g.a("com.google.android.gms.common.GooglePlayServicesUtil", "isGooglePlayServicesAvailable", new Class[] { Context.class });
    if (localObject == null) {
      return null;
    }
    localObject = g.a(null, (Method)localObject, new Object[] { paramContext });
    if ((localObject == null) || (((Integer)localObject).intValue() != 0)) {
      return null;
    }
    localObject = g.a("com.google.android.gms.ads.identifier.AdvertisingIdClient", "getAdvertisingIdInfo", new Class[] { Context.class });
    if (localObject == null) {
      return null;
    }
    paramContext = g.a(null, (Method)localObject, new Object[] { paramContext });
    if (paramContext == null) {
      return null;
    }
    localObject = g.a(paramContext.getClass(), "getId", new Class[0]);
    Method localMethod = g.a(paramContext.getClass(), "isLimitAdTrackingEnabled", new Class[0]);
    if ((localObject == null) || (localMethod == null)) {
      return null;
    }
    return new f((String)g.a(paramContext, (Method)localObject, new Object[0]), ((Boolean)g.a(paramContext, localMethod, new Object[0])).booleanValue());
  }
  
  public static f a(Context paramContext, g.a paramA)
  {
    if (Looper.myLooper() == Looper.getMainLooper()) {
      throw new IllegalStateException("Cannot get advertising info on main thread.");
    }
    if ((paramA != null) && (!s.a(b))) {
      paramA = new f(b, c);
    }
    f localF;
    do
    {
      return paramA;
      localF = a(paramContext);
      paramA = localF;
    } while (localF != null);
    return b(paramContext);
  }
  
  private static f b(Context paramContext)
  {
    b localB = new b(null);
    Object localObject1 = new Intent("com.google.android.gms.ads.identifier.service.START");
    ((Intent)localObject1).setPackage("com.google.android.gms");
    if (paramContext.bindService((Intent)localObject1, localB, 1)) {}
    try
    {
      localObject1 = new a(localB.a());
      localObject1 = new f(((a)localObject1).a(), ((a)localObject1).b());
      return localObject1;
    }
    catch (Exception localException)
    {
      Log.d(a, "Unable to get advertising id from service", localException);
      return null;
    }
    finally
    {
      paramContext.unbindService(localB);
    }
  }
  
  public String a()
  {
    return b;
  }
  
  public boolean b()
  {
    return c;
  }
  
  private static final class a
    implements IInterface
  {
    private IBinder a;
    
    a(IBinder paramIBinder)
    {
      a = paramIBinder;
    }
    
    public String a()
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.ads.identifier.internal.IAdvertisingIdService");
        a.transact(1, localParcel1, localParcel2, 0);
        localParcel2.readException();
        String str = localParcel2.readString();
        return str;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public IBinder asBinder()
    {
      return a;
    }
    
    /* Error */
    public boolean b()
    {
      // Byte code:
      //   0: iconst_1
      //   1: istore_2
      //   2: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   5: astore_3
      //   6: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   9: astore 4
      //   11: aload_3
      //   12: ldc 27
      //   14: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   17: aload_3
      //   18: iconst_1
      //   19: invokevirtual 54	android/os/Parcel:writeInt	(I)V
      //   22: aload_0
      //   23: getfield 17	com/facebook/ads/internal/f$a:a	Landroid/os/IBinder;
      //   26: iconst_2
      //   27: aload_3
      //   28: aload 4
      //   30: iconst_0
      //   31: invokeinterface 37 5 0
      //   36: pop
      //   37: aload 4
      //   39: invokevirtual 40	android/os/Parcel:readException	()V
      //   42: aload 4
      //   44: invokevirtual 58	android/os/Parcel:readInt	()I
      //   47: istore_1
      //   48: iload_1
      //   49: ifeq +14 -> 63
      //   52: aload 4
      //   54: invokevirtual 46	android/os/Parcel:recycle	()V
      //   57: aload_3
      //   58: invokevirtual 46	android/os/Parcel:recycle	()V
      //   61: iload_2
      //   62: ireturn
      //   63: iconst_0
      //   64: istore_2
      //   65: goto -13 -> 52
      //   68: astore 5
      //   70: aload 4
      //   72: invokevirtual 46	android/os/Parcel:recycle	()V
      //   75: aload_3
      //   76: invokevirtual 46	android/os/Parcel:recycle	()V
      //   79: aload 5
      //   81: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	82	0	this	a
      //   47	2	1	i	int
      //   1	64	2	bool	boolean
      //   5	71	3	localParcel1	Parcel
      //   9	62	4	localParcel2	Parcel
      //   68	12	5	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   11	48	68	finally
    }
  }
  
  private static final class b
    implements ServiceConnection
  {
    private AtomicBoolean a = new AtomicBoolean(false);
    private final BlockingQueue<IBinder> b = new LinkedBlockingDeque();
    
    private b() {}
    
    public IBinder a()
    {
      if (a.compareAndSet(true, true)) {
        throw new IllegalStateException("Binder already consumed");
      }
      return (IBinder)b.take();
    }
    
    public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
    {
      try
      {
        b.put(paramIBinder);
        return;
      }
      catch (InterruptedException paramComponentName) {}
    }
    
    public void onServiceDisconnected(ComponentName paramComponentName) {}
  }
}
