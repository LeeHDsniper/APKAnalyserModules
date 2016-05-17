package com.tencent.mobileqq.activity.aio;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.util.SparseArray;
import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.app.IndividualRedPacketManager.VIPHBStrategy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import kqa;
import kqb;
import kqc;

public class CustomizeStrategyFactory
{
  public static final int a = 1;
  private static CustomizeStrategyFactory jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory;
  private static final String jdField_a_of_type_JavaLangString = "CustomizeStrategyFactory";
  public static final int b = 2;
  public static final int c = 3;
  private static final int d = 1;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private SparseArray jdField_a_of_type_AndroidUtilSparseArray;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  private HashMap b;
  
  private CustomizeStrategyFactory()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidUtilSparseArray = new SparseArray(5);
    jdField_a_of_type_JavaUtilHashMap = new HashMap(32);
    b = new HashMap(8);
    jdField_a_of_type_AndroidOsHandler = new kqa(this, Looper.getMainLooper());
  }
  
  public static Bitmap a(Resources paramResources, int paramInt)
  {
    if (paramInt <= 0) {
      return null;
    }
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeResource(paramResources, paramInt, localOptions);
    inPreferredConfig = Bitmap.Config.ARGB_4444;
    inJustDecodeBounds = false;
    try
    {
      paramResources = BitmapFactory.decodeResource(paramResources, paramInt, localOptions);
      return paramResources;
    }
    catch (OutOfMemoryError paramResources) {}
    return null;
  }
  
  private CustomizeStrategyFactory.HBCustomizeStrategy a(int paramInt, AppInterface paramAppInterface)
  {
    if (QLog.isColorLevel()) {
      QLog.i("CustomizeStrategyFactory", 2, "getCustomizeStrategy type =" + paramInt);
    }
    CustomizeStrategyFactory.HBCustomizeStrategy localHBCustomizeStrategy = (CustomizeStrategyFactory.HBCustomizeStrategy)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
    if (localHBCustomizeStrategy != null) {
      return localHBCustomizeStrategy;
    }
    if (2 == paramInt)
    {
      paramAppInterface = new IndividualRedPacketManager.VIPHBStrategy(paramAppInterface);
      jdField_a_of_type_AndroidUtilSparseArray.append(paramInt, paramAppInterface);
      return paramAppInterface;
    }
    if (1 == paramInt)
    {
      paramAppInterface = new kqc(paramAppInterface);
      jdField_a_of_type_AndroidUtilSparseArray.append(paramInt, paramAppInterface);
      return paramAppInterface;
    }
    paramAppInterface = new kqb(paramAppInterface);
    jdField_a_of_type_AndroidUtilSparseArray.append(paramInt, paramAppInterface);
    return paramAppInterface;
  }
  
  public static CustomizeStrategyFactory a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory == null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory = new CustomizeStrategyFactory();
    }
    return jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory;
  }
  
  public void a()
  {
    if (b != null)
    {
      Iterator localIterator = b.values().iterator();
      while (localIterator.hasNext())
      {
        ArrayList localArrayList = (ArrayList)localIterator.next();
        if (localArrayList != null) {
          localArrayList.clear();
        }
      }
      b.clear();
    }
    if (jdField_a_of_type_JavaUtilHashMap != null)
    {
      jdField_a_of_type_JavaUtilHashMap.clear();
      jdField_a_of_type_JavaUtilHashMap = null;
    }
    if (jdField_a_of_type_AndroidUtilSparseArray != null)
    {
      jdField_a_of_type_AndroidUtilSparseArray.clear();
      jdField_a_of_type_AndroidUtilSparseArray = null;
    }
    jdField_a_of_type_AndroidOsHandler = null;
    jdField_a_of_type_ComTencentMobileqqActivityAioCustomizeStrategyFactory = null;
  }
  
  public void a(AppInterface paramAppInterface, CustomizeStrategyFactory.RedPacketInfo paramRedPacketInfo, CustomizeStrategyFactory.OnCustomizeListener paramOnCustomizeListener)
  {
    if ((paramRedPacketInfo == null) || (paramOnCustomizeListener == null) || (TextUtils.isEmpty(jdField_a_of_type_JavaLangString))) {
      return;
    }
    int i = jdField_a_of_type_Int;
    Object localObject = new StringBuilder(jdField_a_of_type_Int);
    ((StringBuilder)localObject).append("_").append(jdField_a_of_type_JavaLangString);
    if ((i == 2) && (!TextUtils.isEmpty(b))) {
      ((StringBuilder)localObject).append("_").append(b);
    }
    c = ((StringBuilder)localObject).toString();
    localObject = (CustomizeStrategyFactory.RedPacketInfo)jdField_a_of_type_JavaUtilHashMap.get(c);
    if (localObject == null)
    {
      if (!b.containsKey(c)) {
        b.put(c, new ArrayList(8));
      }
      ((ArrayList)b.get(c)).add(paramOnCustomizeListener);
      a(i, paramAppInterface).a(paramRedPacketInfo);
      return;
    }
    paramOnCustomizeListener.a(i, (CustomizeStrategyFactory.RedPacketInfo)localObject);
  }
  
  public void a(CustomizeStrategyFactory.RedPacketInfo paramRedPacketInfo)
  {
    if ((jdField_a_of_type_AndroidOsHandler != null) && (paramRedPacketInfo != null))
    {
      Message localMessage = jdField_a_of_type_AndroidOsHandler.obtainMessage();
      what = 1;
      obj = paramRedPacketInfo;
      jdField_a_of_type_AndroidOsHandler.sendMessage(localMessage);
    }
  }
}
