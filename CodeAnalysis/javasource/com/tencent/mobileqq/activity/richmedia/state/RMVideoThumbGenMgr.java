package com.tencent.mobileqq.activity.richmedia.state;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import mjw;

public class RMVideoThumbGenMgr
{
  public static final int a = 1;
  public static final int b = 2;
  public static final int c = 3;
  public static final int d = 4;
  public static final int e = 5;
  public static final int f = 6;
  public static final int g = 7;
  RMVideoThumbGenMgr.ThumbGenItem jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem;
  private Object jdField_a_of_type_JavaLangObject;
  ArrayList jdField_a_of_type_JavaUtilArrayList;
  
  public RMVideoThumbGenMgr()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_JavaLangObject = new Object();
  }
  
  int a(RMVideoThumbGenMgr.ThumbGenItem paramThumbGenItem, boolean paramBoolean)
  {
    int i = 1;
    if (paramThumbGenItem == null) {}
    int j;
    do
    {
      do
      {
        return i;
        jdField_a_of_type_Boolean = true;
        j = jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.getAndSet(7);
        if ((j == 3) && (c != null) && (paramBoolean))
        {
          FileUtils.d(c);
          c = null;
          return j;
        }
        i = j;
      } while (j != 6);
      i = j;
    } while (jdField_b_of_type_JavaLangString == null);
    FileUtils.d(jdField_b_of_type_JavaLangString);
    jdField_b_of_type_JavaLangString = null;
    return j;
  }
  
  public RMVideoThumbGenMgr.ThumbGenItem a()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem.jdField_b_of_type_Boolean = false;
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      jdField_a_of_type_JavaUtilArrayList.add(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem = null;
      return;
    }
  }
  
  public void a(String paramString, float paramFloat, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem.jdField_b_of_type_Boolean = true;
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      jdField_a_of_type_JavaUtilArrayList.add(jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem = null;
      b(paramString, paramFloat, paramInt);
      return;
    }
  }
  
  public void b()
  {
    RMVideoThumbGenMgr.ThumbGenItem localThumbGenItem = null;
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (jdField_a_of_type_JavaUtilArrayList.size() > 0)
      {
        localThumbGenItem = (RMVideoThumbGenMgr.ThumbGenItem)jdField_a_of_type_JavaUtilArrayList.get(0);
        jdField_a_of_type_JavaUtilArrayList.remove(0);
      }
      if ((localThumbGenItem == null) || (a(localThumbGenItem, jdField_b_of_type_Boolean) != 2)) {}
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      jdField_a_of_type_JavaUtilArrayList.add(localThumbGenItem);
      return;
      localObject1 = finally;
      throw localObject1;
    }
  }
  
  void b(String paramString, float paramFloat, int paramInt)
  {
    RMVideoThumbGenMgr.ThumbGenItem localThumbGenItem = new RMVideoThumbGenMgr.ThumbGenItem(this);
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_JavaLangString = paramString;
    jdField_a_of_type_Int = paramInt;
    int i = (int)(jdField_a_of_type_Int / paramFloat);
    paramInt = i;
    if (i % 2 > 0) {
      paramInt = i - 1;
    }
    jdField_b_of_type_Int = paramInt;
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem = localThumbGenItem;
    jdField_a_of_type_Mjw.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem = localThumbGenItem;
    jdField_a_of_type_Mjw.execute(new Void[0]);
  }
}
