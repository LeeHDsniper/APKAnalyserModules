package com.tencent.mobileqq.app.proxy;

import android.content.ContentValues;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;

public class BaseQueueItem
{
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 3;
  public static final int e = 4;
  public static final int f = 5;
  public static final int g = 6;
  public ContentValues a;
  ProxyListener a;
  public Entity a;
  public String a;
  public String[] a;
  public String b;
  public String c;
  public int h;
  public int i;
  
  public BaseQueueItem(String paramString1, int paramInt1, String paramString2, ContentValues paramContentValues, String paramString3, String[] paramArrayOfString, int paramInt2, ProxyListener paramProxyListener)
  {
    jdField_a_of_type_JavaLangString = paramString1;
    h = paramInt1;
    b = paramString2;
    c = paramString3;
    jdField_a_of_type_ArrayOfJavaLangString = paramArrayOfString;
    jdField_a_of_type_AndroidContentContentValues = paramContentValues;
    i = paramInt2;
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyListener = paramProxyListener;
  }
  
  public BaseQueueItem(String paramString1, int paramInt1, String paramString2, Entity paramEntity, int paramInt2, ProxyListener paramProxyListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = paramString1;
    h = paramInt1;
    b = paramString2;
    jdField_a_of_type_ComTencentMobileqqPersistenceEntity = paramEntity;
    i = paramInt2;
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyListener = paramProxyListener;
  }
}
