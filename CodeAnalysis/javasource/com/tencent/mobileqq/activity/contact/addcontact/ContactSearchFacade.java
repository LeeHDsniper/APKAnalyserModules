package com.tencent.mobileqq.activity.contact.addcontact;

import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.PhoneCodeUtils;
import com.tencent.qphone.base.util.QLog;
import lqf;

public class ContactSearchFacade
{
  public static final int a = 80000000;
  public static final String a;
  private static int[] jdField_a_of_type_ArrayOfInt;
  public static final int b = 80000001;
  private static int[] b;
  public static final int c = 80000002;
  private static int[] jdField_c_of_type_ArrayOfInt = { 80000002 };
  public static final int d = 80000003;
  private static int[] d = { 80000003 };
  public static final int e = 80000004;
  private static int[] e = { 80000000, 80000001, 80000002, 80000003 };
  public static final int f = 80000005;
  private static int[] f = { 80000002, 80000003 };
  private ContactSearchFacade.ISearchListener jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade$ISearchListener;
  FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new lqf(this);
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  public String b;
  private String jdField_c_of_type_JavaLangString;
  private int g;
  private int h;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = ContactSearchFacade.class.getName();
    jdField_a_of_type_ArrayOfInt = new int[] { 80000000 };
    jdField_b_of_type_ArrayOfInt = new int[] { 80000001 };
  }
  
  public ContactSearchFacade(QQAppInterface paramQQAppInterface)
  {
    jdField_b_of_type_JavaLangString = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_c_of_type_JavaLangString = PhoneCodeUtils.a(paramQQAppInterface.getApplication());
  }
  
  public int a()
  {
    return g;
  }
  
  final void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver, true);
    }
  }
  
  public void a(int paramInt)
  {
    g = paramInt;
  }
  
  public void a(ContactSearchFacade.ISearchListener paramISearchListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade$ISearchListener = paramISearchListener;
  }
  
  public void a(String paramString, int[] paramArrayOfInt, double paramDouble1, double paramDouble2, boolean paramBoolean, int paramInt)
  {
    ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).a(paramString, jdField_c_of_type_JavaLangString, 3, g, paramArrayOfInt, paramDouble1, paramDouble2, paramBoolean, paramInt);
  }
  
  public boolean a(String paramString)
  {
    a();
    ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).a(paramString, jdField_c_of_type_JavaLangString, 2, 0, null, 0.0D, 0.0D, true);
    return true;
  }
  
  public boolean a(String paramString, int paramInt1, double paramDouble1, double paramDouble2, int paramInt2)
  {
    a();
    jdField_b_of_type_JavaLangString = paramString;
    h = paramInt1;
    int[] arrayOfInt = null;
    switch (paramInt1)
    {
    }
    while (arrayOfInt == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "warning! wrong request type = " + paramInt1);
      }
      return false;
      arrayOfInt = jdField_a_of_type_ArrayOfInt;
      continue;
      arrayOfInt = jdField_b_of_type_ArrayOfInt;
      continue;
      arrayOfInt = jdField_c_of_type_ArrayOfInt;
      continue;
      arrayOfInt = d;
      continue;
      arrayOfInt = e;
      continue;
      arrayOfInt = f;
    }
    ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).a(paramString, jdField_c_of_type_JavaLangString, 3, g, arrayOfInt, paramDouble1, paramDouble2, true, paramInt2);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "searchFriend nextPage = " + g);
    }
    return true;
  }
  
  public final void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    }
  }
  
  public void c()
  {
    g = 0;
  }
  
  public void d()
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade$ISearchListener = null;
    g = 0;
    b();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
  }
}
