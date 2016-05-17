package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Looper;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import com.tencent.ark.ark;
import com.tencent.ark.ark.Container;
import com.tencent.ark.ark.ContainerCallback;
import com.tencent.ark.ark.ModuleCallbackWrapper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.ark.ArkAppCenter;
import com.tencent.mobileqq.ark.ArkLocalAppMgr;
import com.tencent.mobileqq.data.MessageForArkApp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import kux;
import kuy;
import kuz;
import kva;
import kvb;

public class ArkContainerWrapper
{
  public static final int a = 0;
  private static ark.ModuleCallbackWrapper jdField_a_of_type_ComTencentArkArk$ModuleCallbackWrapper;
  private static final String jdField_a_of_type_JavaLangString = "ArkApp";
  public static WeakReference a;
  public static ArrayList a;
  protected static boolean a = false;
  public static final int b = 1;
  private static String jdField_b_of_type_JavaLangString = "ThirdPartyAPI";
  public static WeakReference b;
  public static final int c = 2;
  private Rect jdField_a_of_type_AndroidGraphicsRect = new Rect();
  GestureDetector.SimpleOnGestureListener jdField_a_of_type_AndroidViewGestureDetector$SimpleOnGestureListener;
  private GestureDetector jdField_a_of_type_AndroidViewGestureDetector;
  private ark.Container jdField_a_of_type_ComTencentArkArk$Container;
  private ark.ContainerCallback jdField_a_of_type_ComTencentArkArk$ContainerCallback;
  public kvb a;
  private boolean jdField_b_of_type_Boolean = false;
  private WeakReference jdField_c_of_type_JavaLangRefWeakReference;
  private boolean jdField_c_of_type_Boolean = false;
  private WeakReference jdField_d_of_type_JavaLangRefWeakReference;
  private boolean jdField_d_of_type_Boolean = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
  }
  
  public ArkContainerWrapper()
  {
    jdField_a_of_type_Kvb = new kvb(this, null);
    ArkAppCenter.a();
    if (jdField_a_of_type_ComTencentArkArk$ModuleCallbackWrapper == null) {
      jdField_a_of_type_ComTencentArkArk$ModuleCallbackWrapper = new kux(this);
    }
    if (jdField_a_of_type_JavaUtilArrayList == null) {
      jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    }
    jdField_a_of_type_JavaUtilArrayList.add(new WeakReference(this));
    jdField_a_of_type_ComTencentArkArk$ContainerCallback = new kuy(this);
    jdField_a_of_type_AndroidViewGestureDetector$SimpleOnGestureListener = new kuz(this);
    if ((jdField_b_of_type_JavaLangRefWeakReference != null) && (jdField_b_of_type_JavaLangRefWeakReference.get() != null)) {
      jdField_a_of_type_AndroidViewGestureDetector = new GestureDetector((Context)jdField_b_of_type_JavaLangRefWeakReference.get(), jdField_a_of_type_AndroidViewGestureDetector$SimpleOnGestureListener);
    }
  }
  
  private void a()
  {
    jdField_a_of_type_AndroidViewGestureDetector = null;
    if (jdField_a_of_type_ComTencentArkArk$Container != null)
    {
      if ((jdField_c_of_type_JavaLangRefWeakReference != null) && (jdField_c_of_type_JavaLangRefWeakReference.get() != null))
      {
        ((ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get()).a();
        if (Looper.myLooper() != Looper.getMainLooper()) {
          QLog.e("ArkApp", 1, "ArkContainerWrapper.ArkDestroy.other_thread");
        }
      }
      jdField_a_of_type_ComTencentArkArk$Container = null;
    }
    jdField_b_of_type_Boolean = false;
    kvb.a(jdField_a_of_type_Kvb, true);
    jdField_c_of_type_Boolean = false;
  }
  
  public static void a(int paramInt)
  {
    if (jdField_a_of_type_JavaUtilArrayList != null)
    {
      int i = 0;
      while (i < jdField_a_of_type_JavaUtilArrayList.size())
      {
        WeakReference localWeakReference = (WeakReference)jdField_a_of_type_JavaUtilArrayList.get(i);
        if ((localWeakReference != null) && (localWeakReference.get() != null))
        {
          ((ArkContainerWrapper)localWeakReference.get()).b(paramInt);
          if (paramInt == 2)
          {
            localWeakReference = getjdField_d_of_type_JavaLangRefWeakReference;
            if ((localWeakReference != null) && (localWeakReference.get() != null)) {
              getarkContainer = null;
            }
          }
        }
        i += 1;
      }
    }
    if ((paramInt == 2) && (jdField_a_of_type_JavaUtilArrayList != null))
    {
      jdField_a_of_type_JavaUtilArrayList.clear();
      jdField_a_of_type_JavaUtilArrayList = null;
    }
  }
  
  private void a(String paramString, kvb paramKvb, boolean paramBoolean)
  {
    boolean bool = true;
    jdField_c_of_type_Boolean = false;
    QLog.d("ArkApp", 4, "ark container LoadArkApp In!!!!");
    String str;
    if ((paramBoolean) || (paramKvb == null) || ((paramKvb != null) && (kvb.a(paramKvb))))
    {
      jdField_b_of_type_Boolean = false;
      jdField_c_of_type_Boolean = true;
      if ((jdField_c_of_type_JavaLangRefWeakReference != null) && (jdField_c_of_type_JavaLangRefWeakReference.get() != null))
      {
        paramString = (ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get();
        if (!jdField_c_of_type_Boolean)
        {
          paramBoolean = true;
          paramString.a(paramBoolean);
        }
      }
      else
      {
        str = Boolean.toString(jdField_c_of_type_Boolean);
        if (paramKvb == null) {
          break label140;
        }
        paramString = Boolean.toString(kvb.a(paramKvb));
        label110:
        QLog.i("ArkApp", 4, String.format("ark container LoadArkApp Failed!!!! mLoadFailed:%s info.canceled:%s", new Object[] { str, paramString }));
      }
    }
    label140:
    do
    {
      return;
      paramBoolean = false;
      break;
      paramString = "";
      break label110;
      str = ArkAppCenter.d;
      File localFile = new File(str);
      if (!localFile.exists()) {
        localFile.mkdirs();
      }
      if (!jdField_a_of_type_Boolean)
      {
        ark.arkSetStoragePath(str);
        ark.arkHTTPStartup();
        ark.arkHTTPSetDownloadDirectory(str);
        ark.arkSetPixelScale(kvb.b(paramKvb));
        jdField_a_of_type_Boolean = true;
      }
      jdField_d_of_type_Boolean = true;
      ArkAppCenter.b();
      jdField_a_of_type_ComTencentArkArk$Container = new ark.Container();
      jdField_a_of_type_ComTencentArkArk$Container.SetContainerCallback(jdField_a_of_type_ComTencentArkArk$ContainerCallback);
      if (jdField_a_of_type_ComTencentArkArk$Container.CreateRootView(kvb.a(paramKvb), paramString, kvb.b(paramKvb), paramString, str))
      {
        if ((jdField_d_of_type_JavaLangRefWeakReference != null) && (jdField_d_of_type_JavaLangRefWeakReference.get() != null))
        {
          paramString = ((MessageForArkApp)jdField_d_of_type_JavaLangRefWeakReference.get()).getExtInfoFromExtStr("pa_msgId");
          if ((paramString == null) || (paramString.length() <= 0)) {
            break label442;
          }
          jdField_a_of_type_ComTencentArkArk$Container.SetID(paramString);
        }
        jdField_a_of_type_ComTencentArkArk$Container.SetMetadata(kvb.c(paramKvb), "json");
        QLog.d("ArkApp", 4, "ark container LoadArkApp successed!!!!");
      }
      jdField_d_of_type_Boolean = false;
    } while ((jdField_c_of_type_JavaLangRefWeakReference == null) || (jdField_c_of_type_JavaLangRefWeakReference.get() == null));
    ((ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get()).a(jdField_a_of_type_AndroidGraphicsRect);
    paramString = (ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get();
    if (!jdField_c_of_type_Boolean)
    {
      paramBoolean = true;
      label396:
      paramString.a(paramBoolean);
      paramString = new StringBuilder().append("ark container LoadArkApp UI view init : ");
      if (jdField_c_of_type_Boolean) {
        break label473;
      }
    }
    label442:
    label473:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      QLog.d("ArkApp", 4, paramBoolean);
      return;
      jdField_a_of_type_ComTencentArkArk$Container.SetID(String.valueOf(jdField_d_of_type_JavaLangRefWeakReference.get()).uniseq));
      break;
      paramBoolean = false;
      break label396;
    }
  }
  
  private boolean a(boolean paramBoolean)
  {
    boolean bool = false;
    if ((jdField_a_of_type_JavaLangRefWeakReference == null) || (jdField_a_of_type_JavaLangRefWeakReference.get() == null))
    {
      jdField_b_of_type_Boolean = false;
      jdField_c_of_type_Boolean = true;
      if ((jdField_c_of_type_JavaLangRefWeakReference != null) && (jdField_c_of_type_JavaLangRefWeakReference.get() != null))
      {
        localObject1 = (ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get();
        paramBoolean = bool;
        if (!jdField_c_of_type_Boolean) {
          paramBoolean = true;
        }
        ((ArkContainerWrapper.OnArkContainerEventListener)localObject1).a(paramBoolean);
      }
      return true;
    }
    Object localObject1 = ((ArkAppCenter)((QQAppInterface)jdField_a_of_type_JavaLangRefWeakReference.get()).getManager(120)).a();
    Object localObject2 = ((ArkLocalAppMgr)localObject1).a(kvb.a(jdField_a_of_type_Kvb), kvb.d(jdField_a_of_type_Kvb));
    if (localObject2 != null)
    {
      QLog.d("ArkApp", 4, "ark container getAppPathByNameFromLocal In!!!!");
      a((String)localObject2, jdField_a_of_type_Kvb, paramBoolean);
      return true;
    }
    if ((jdField_c_of_type_JavaLangRefWeakReference != null) && (jdField_c_of_type_JavaLangRefWeakReference.get() != null)) {
      ((ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get()).b();
    }
    localObject2 = new WeakReference(this);
    ((ArkLocalAppMgr)localObject1).a(kvb.a(jdField_a_of_type_Kvb), kvb.d(jdField_a_of_type_Kvb), jdField_a_of_type_Kvb, new kva(this, (WeakReference)localObject2, paramBoolean));
    return false;
  }
  
  private static Intent b(Context paramContext, String paramString, boolean paramBoolean, long paramLong)
  {
    Intent localIntent = new Intent();
    localIntent.setClassName("com.tencent.mobileqq", "com.tencent.mobileqq.activity.QQBrowserDelegationActivity");
    localIntent.putExtra("param_force_internal_browser", paramBoolean);
    localIntent.putExtra("injectrecommend", false);
    localIntent.putExtra("url", paramString);
    localIntent.putExtra("appShareID", paramLong);
    localIntent.addFlags(603979776);
    if (paramContext != null) {
      paramContext.startActivity(localIntent);
    }
    return localIntent;
  }
  
  public float a()
  {
    return kvb.b(jdField_a_of_type_Kvb);
  }
  
  public Rect a()
  {
    return jdField_a_of_type_AndroidGraphicsRect;
  }
  
  public Rect a(Rect paramRect)
  {
    if (paramRect == null) {
      return null;
    }
    float f = kvb.a(jdField_a_of_type_Kvb);
    Rect localRect = new Rect();
    left = ((int)(left * f));
    top = ((int)(top * f));
    right = ((int)Math.ceil(right * f));
    bottom = ((int)Math.ceil(f * bottom));
    return localRect;
  }
  
  public ark.Container a()
  {
    return jdField_a_of_type_ComTencentArkArk$Container;
  }
  
  public void a(Bitmap paramBitmap)
  {
    if (jdField_a_of_type_ComTencentArkArk$Container == null) {
      return;
    }
    if (Looper.myLooper() != Looper.getMainLooper()) {
      QLog.e("ArkApp", 1, "ArkContainerWrapper.detachBitmap.other_thread");
    }
    jdField_a_of_type_ComTencentArkArk$Container.DetachBitmap(paramBitmap);
  }
  
  public void a(Rect paramRect)
  {
    if ((jdField_a_of_type_ComTencentArkArk$Container != null) && (!paramRect.equals(jdField_a_of_type_AndroidGraphicsRect)))
    {
      jdField_a_of_type_AndroidGraphicsRect.set(paramRect);
      jdField_a_of_type_ComTencentArkArk$Container.SetSize(jdField_a_of_type_AndroidGraphicsRect.width(), jdField_a_of_type_AndroidGraphicsRect.height());
    }
  }
  
  public void a(ArkContainerWrapper.OnArkContainerEventListener paramOnArkContainerEventListener)
  {
    if (paramOnArkContainerEventListener != null)
    {
      jdField_c_of_type_JavaLangRefWeakReference = new WeakReference(paramOnArkContainerEventListener);
      return;
    }
    jdField_c_of_type_JavaLangRefWeakReference = null;
  }
  
  public boolean a()
  {
    if (jdField_c_of_type_Boolean)
    {
      jdField_c_of_type_Boolean = false;
      if (!jdField_b_of_type_Boolean) {}
    }
    else
    {
      return true;
    }
    jdField_b_of_type_Boolean = true;
    return a(false);
  }
  
  public boolean a(Bitmap paramBitmap)
  {
    if (jdField_a_of_type_ComTencentArkArk$Container == null) {
      return false;
    }
    return jdField_a_of_type_ComTencentArkArk$Container.AttachBitmap(paramBitmap);
  }
  
  public boolean a(View paramView, MotionEvent paramMotionEvent)
  {
    if (jdField_a_of_type_ComTencentArkArk$Container == null) {
      return false;
    }
    if (jdField_a_of_type_AndroidViewGestureDetector != null) {
      jdField_a_of_type_AndroidViewGestureDetector.onTouchEvent(paramMotionEvent);
    }
    float f = kvb.a(jdField_a_of_type_Kvb);
    int i = (int)(paramMotionEvent.getX() / f);
    int j = (int)(paramMotionEvent.getY() / f);
    switch (paramMotionEvent.getAction())
    {
    default: 
      return false;
    case 0: 
      jdField_a_of_type_ComTencentArkArk$Container.MouseDown(i, j, 1L, 0L);
      return true;
    case 2: 
      jdField_a_of_type_ComTencentArkArk$Container.MouseMove(i, j, 0L);
      return true;
    case 1: 
      jdField_a_of_type_ComTencentArkArk$Container.MouseUp(i, j, 1L, 0L);
      return true;
    }
    jdField_a_of_type_ComTencentArkArk$Container.MouseUp(i, j, 1L, 0L);
    return true;
  }
  
  public boolean a(QQAppInterface paramQQAppInterface, String paramString1, String paramString2, String paramString3, String paramString4, float paramFloat, MessageForArkApp paramMessageForArkApp)
  {
    if (jdField_c_of_type_Boolean)
    {
      if ((jdField_c_of_type_JavaLangRefWeakReference != null) && (jdField_c_of_type_JavaLangRefWeakReference.get() != null)) {
        ((ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get()).c();
      }
      QLog.d("ArkApp", 4, "ark container initArkContainer mLoadFailed true!!!");
      return true;
    }
    if (jdField_b_of_type_Boolean)
    {
      if (jdField_a_of_type_ComTencentArkArk$Container != null)
      {
        jdField_a_of_type_ComTencentArkArk$Container.SetContainerCallback(jdField_a_of_type_ComTencentArkArk$ContainerCallback);
        if ((jdField_c_of_type_JavaLangRefWeakReference != null) && (jdField_c_of_type_JavaLangRefWeakReference.get() != null))
        {
          ((ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get()).a(jdField_a_of_type_AndroidGraphicsRect);
          ((ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get()).a(true);
        }
        QLog.d("ArkApp", 4, "ark container initArkContainer mInit true!!!");
      }
      return true;
    }
    jdField_b_of_type_Boolean = true;
    kvb.a(jdField_a_of_type_Kvb, paramFloat);
    kvb.b(jdField_a_of_type_Kvb, Math.round(paramFloat));
    kvb.a(jdField_a_of_type_Kvb, paramString1);
    kvb.b(jdField_a_of_type_Kvb, paramString2);
    kvb.c(jdField_a_of_type_Kvb, paramString4);
    kvb.d(jdField_a_of_type_Kvb, paramString3);
    kvb.a(jdField_a_of_type_Kvb, false);
    jdField_d_of_type_JavaLangRefWeakReference = new WeakReference(paramMessageForArkApp);
    return a(false);
  }
  
  public float b()
  {
    return kvb.a(jdField_a_of_type_Kvb);
  }
  
  public Rect b(Rect paramRect)
  {
    if (paramRect == null) {
      return null;
    }
    float f = kvb.a(jdField_a_of_type_Kvb);
    Rect localRect = new Rect();
    left = ((int)Math.ceil(left / f));
    top = ((int)Math.ceil(top / f));
    right = ((int)(right / f));
    bottom = ((int)(bottom / f));
    return localRect;
  }
  
  public void b(int paramInt)
  {
    if (paramInt == 0) {}
    do
    {
      do
      {
        return;
        if (paramInt != 1) {
          break;
        }
      } while ((jdField_a_of_type_ComTencentArkArk$Container == null) || (jdField_c_of_type_JavaLangRefWeakReference == null) || (jdField_c_of_type_JavaLangRefWeakReference.get() == null));
      ((ArkContainerWrapper.OnArkContainerEventListener)jdField_c_of_type_JavaLangRefWeakReference.get()).a(jdField_a_of_type_AndroidGraphicsRect);
      return;
    } while (paramInt != 2);
    a();
  }
  
  protected void finalize()
  {
    if (jdField_a_of_type_ComTencentArkArk$Container != null) {
      QLog.e("ArkApp", 1, "ArkContainerWrapper.finalize.mContainer != null!!");
    }
    super.finalize();
  }
}
