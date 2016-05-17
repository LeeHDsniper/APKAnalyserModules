package com.tencent.mobileqq.statistics;

import android.app.Activity;
import android.app.Application.ActivityLifecycleCallbacks;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.support.v4.app.Fragment;
import android.support.v4.app.Fragment.IFragmentAttachCallback;
import android.support.v4.app.Fragment.IFragmentLifecycleCallback;
import android.support.v4.app.FragmentActivity;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pluginsdk.PluginProxyActivity;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;

public final class UEC
  implements Application.ActivityLifecycleCallbacks, Fragment.IFragmentAttachCallback, Fragment.IFragmentLifecycleCallback
{
  public static UEC a;
  private int jdField_a_of_type_Int;
  private LinkedHashMap jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap(8);
  private final boolean jdField_a_of_type_Boolean;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqStatisticsUEC = null;
  }
  
  public UEC()
  {
    if (BaseApplicationImpl.i == 1) {}
    for (;;)
    {
      jdField_a_of_type_Boolean = bool;
      jdField_a_of_type_ComTencentMobileqqStatisticsUEC = this;
      jdField_a_of_type_Int = 0;
      return;
      bool = false;
    }
  }
  
  private String a(Activity paramActivity)
  {
    Object localObject;
    if (paramActivity == null) {
      localObject = "null";
    }
    String str;
    do
    {
      return localObject;
      str = paramActivity.getClass().getName();
      localObject = str;
    } while (!(paramActivity instanceof PluginProxyActivity));
    paramActivity = ((PluginProxyActivity)paramActivity).getPluginActivity();
    return str + "_" + paramActivity;
  }
  
  private String a(Fragment paramFragment)
  {
    if (paramFragment == null) {
      return "null";
    }
    String str = a(paramFragment.getActivity());
    return str + "_fg_" + paramFragment.getClass().getName();
  }
  
  private String a(String paramString, Activity paramActivity)
  {
    paramActivity = a(paramActivity);
    return paramActivity + "_fm_" + paramString;
  }
  
  private void a()
  {
    Object localObject = jdField_a_of_type_JavaUtilLinkedHashMap;
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap(8);
    ArrayList localArrayList = new ArrayList(((LinkedHashMap)localObject).size());
    localObject = ((LinkedHashMap)localObject).values().iterator();
    while (((Iterator)localObject).hasNext()) {
      localArrayList.add((UEC.UECItem)((Iterator)localObject).next());
    }
    if (jdField_a_of_type_Boolean)
    {
      a(localArrayList);
      return;
    }
    localObject = new Intent();
    ((Intent)localObject).putParcelableArrayListExtra("UECData", localArrayList);
    ((Intent)localObject).setClass(BaseApplicationImpl.a, UECReceiver.class);
    BaseApplicationImpl.a.sendBroadcast((Intent)localObject);
  }
  
  private void a(Object paramObject, String paramString, boolean paramBoolean)
  {
    int i = paramObject.hashCode();
    if (paramBoolean)
    {
      a(paramString, i);
      return;
    }
    a(paramString, i, null);
    b(paramString, i);
  }
  
  public UEC.UECItem a(String paramString, int paramInt, Bundle paramBundle)
  {
    paramBundle = (UEC.UECItem)jdField_a_of_type_JavaUtilLinkedHashMap.get(paramString);
    if (paramBundle == null)
    {
      paramBundle = new UEC.UECItem();
      jdField_a_of_type_JavaLangString = paramString;
      jdField_a_of_type_Int = 1;
      jdField_a_of_type_JavaUtilLinkedHashMap.put(paramString, paramBundle);
      return paramBundle;
    }
    jdField_a_of_type_Int += 1;
    return paramBundle;
  }
  
  public void a(String paramString, int paramInt)
  {
    UEC.UECItem localUECItem2 = (UEC.UECItem)jdField_a_of_type_JavaUtilLinkedHashMap.get(paramString);
    UEC.UECItem localUECItem1 = localUECItem2;
    if (localUECItem2 == null) {
      localUECItem1 = a(paramString, paramInt, null);
    }
    if ((paramInt == c) && (jdField_b_of_type_Long > 0L))
    {
      jdField_a_of_type_Long = (SystemClock.uptimeMillis() - jdField_b_of_type_Long + jdField_a_of_type_Long);
      jdField_b_of_type_Long = 0L;
    }
  }
  
  public void a(String paramString, Activity paramActivity, boolean paramBoolean)
  {
    if (paramString != null) {
      a(paramString, a(paramString, paramActivity), paramBoolean);
    }
  }
  
  public void a(ArrayList paramArrayList)
  {
    if (!"Success".equals(BaseApplicationImpl.sInjectResult)) {}
    Object localObject;
    do
    {
      do
      {
        return;
        localObject = (QQAppInterface)BaseApplicationImpl.a.a();
      } while (localObject == null);
      localObject = (UEC.IReporter)((QQAppInterface)localObject).getManager(133);
    } while (localObject == null);
    ((UEC.IReporter)localObject).a(paramArrayList);
  }
  
  public void b(String paramString, int paramInt)
  {
    UEC.UECItem localUECItem2 = (UEC.UECItem)jdField_a_of_type_JavaUtilLinkedHashMap.get(paramString);
    UEC.UECItem localUECItem1 = localUECItem2;
    if (localUECItem2 == null) {
      localUECItem1 = a(paramString, paramInt, null);
    }
    c = paramInt;
    jdField_b_of_type_Int += 1;
    jdField_b_of_type_Long = SystemClock.uptimeMillis();
  }
  
  public void onActivityCreated(Activity paramActivity, Bundle paramBundle)
  {
    if ((paramActivity instanceof FragmentActivity)) {
      ((FragmentActivity)paramActivity).setFragmentAttachListener(this);
    }
    a(a(paramActivity), paramActivity.hashCode(), paramBundle);
  }
  
  public void onActivityDestroyed(Activity paramActivity) {}
  
  public void onActivityPaused(Activity paramActivity)
  {
    a(a(paramActivity), paramActivity.hashCode());
  }
  
  public void onActivityResumed(Activity paramActivity)
  {
    b(a(paramActivity), paramActivity.hashCode());
  }
  
  public void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle) {}
  
  public void onActivityStarted(Activity paramActivity)
  {
    jdField_a_of_type_Int += 1;
  }
  
  public void onActivityStopped(Activity paramActivity)
  {
    jdField_a_of_type_Int -= 1;
    if (jdField_a_of_type_Int == 0) {
      a();
    }
  }
  
  public void onFragmentAttached(Fragment paramFragment)
  {
    if (paramFragment != null) {
      paramFragment.setFragmentLifecycleCallback(this);
    }
  }
  
  public void onFragmentHiddenChanged(Fragment paramFragment, boolean paramBoolean)
  {
    if (paramFragment != null) {
      a(paramFragment, a(paramFragment), paramBoolean);
    }
  }
}
