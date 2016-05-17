package com.tencent.mobileqq.activity.recent;

import com.tencent.mobileqq.activity.recent.data.RecentMsgBoxItem;
import com.tencent.mobileqq.activity.recent.data.RecentSayHelloBoxItem;
import com.tencent.mobileqq.activity.recent.data.RecentSayHelloListItem;
import com.tencent.mobileqq.activity.recent.data.RecentUserBaseData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class RecentItemBuilderFactory
{
  protected static final int A = 1;
  protected static final int B = 1;
  protected static final int C = 2;
  protected static final int D = 3;
  protected static final int E = 1;
  protected static final int F = 2;
  protected static final int G = 3;
  protected static final int H = 1;
  protected static final int I = 2;
  protected static final int J = 1;
  protected static final int K = 2;
  protected static final int L = 3;
  protected static final int M = 4;
  protected static final int N = 5;
  protected static final int O = 6;
  protected static final int P = 7;
  protected static final int Q = 8;
  protected static final int R = 9;
  protected static final int S = 10;
  public static final int a = 0;
  public static final Long a;
  protected static final int[] a;
  public static final int b = 1;
  public static final Long b;
  protected static final int[] b;
  public static final int c = 3;
  public static final Long c;
  protected static final int[] c;
  public static final int d = 4;
  public static final Long d;
  protected static final int[] d;
  public static final int e = 5;
  public static final Long e;
  protected static final int[] e;
  public static final int f = 6;
  public static final Long f;
  protected static final int[] f;
  public static final int g = 7;
  public static final Long g;
  protected static final int[] g;
  public static final int h = 8;
  protected static final int[] h = { 0, 1, 2 };
  public static final int i = 9;
  protected static final int[] i = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
  public static final int j = 10;
  public static final int k = 11;
  public static final int l = 12;
  public static final int m = 13;
  public static final int n = 0;
  public static final int o = 1;
  public static final int p = 4;
  public static final int q = 5;
  public static final int r = 6;
  public static final int s = 7;
  public static final int t = 9;
  protected static final int u = 0;
  protected static final int v = 1;
  protected static final int w = 2;
  protected static final int x = 3;
  protected static final int y = 1;
  protected static final int z = 2;
  protected int T;
  protected RecentAdapter a;
  protected RecentItemBaseBuilder[] a;
  protected int[] j;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangLong = Long.valueOf(0L);
    jdField_b_of_type_JavaLangLong = Long.valueOf(1L);
    jdField_c_of_type_JavaLangLong = Long.valueOf(2L);
    jdField_d_of_type_JavaLangLong = Long.valueOf(3L);
    jdField_e_of_type_JavaLangLong = Long.valueOf(4L);
    jdField_f_of_type_JavaLangLong = Long.valueOf(5L);
    jdField_g_of_type_JavaLangLong = Long.valueOf(6L);
    jdField_a_of_type_ArrayOfInt = new int[] { 0 };
    jdField_b_of_type_ArrayOfInt = new int[] { 0, 1, 2, 3 };
    jdField_c_of_type_ArrayOfInt = new int[] { 0, 1, 2 };
    jdField_d_of_type_ArrayOfInt = new int[] { 0, 1 };
    jdField_e_of_type_ArrayOfInt = new int[] { 0, 1, 2, 3 };
    jdField_f_of_type_ArrayOfInt = new int[] { 0, 1, 2, 3 };
    jdField_g_of_type_ArrayOfInt = new int[] { 0, 1, 2 };
  }
  
  public RecentItemBuilderFactory(int paramInt)
  {
    T = paramInt;
    if (T == 0) {
      j = jdField_b_of_type_ArrayOfInt;
    }
    for (;;)
    {
      jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder = new RecentItemBaseBuilder[j.length];
      return;
      if (T == 1) {
        j = jdField_e_of_type_ArrayOfInt;
      } else if (T == 4) {
        j = i;
      } else if (T == 5) {
        j = h;
      } else if (T == 6) {
        j = jdField_c_of_type_ArrayOfInt;
      } else if (T == 7) {
        j = jdField_d_of_type_ArrayOfInt;
      } else if (T == 9) {
        j = jdField_g_of_type_ArrayOfInt;
      } else {
        j = jdField_a_of_type_ArrayOfInt;
      }
    }
  }
  
  public int a()
  {
    return T;
  }
  
  public int a(Object paramObject)
  {
    int i1 = j[0];
    switch (T)
    {
    }
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        int i2;
                        do
                        {
                          return i1;
                          if (!(paramObject instanceof Integer)) {
                            break;
                          }
                          i2 = ((Integer)paramObject).intValue();
                          if (i2 == 0) {
                            return j[1];
                          }
                        } while (i2 != 13);
                        return j[3];
                        if ((paramObject instanceof RecentUserBaseData)) {
                          return j[2];
                        }
                      } while (!(paramObject instanceof String));
                      return j[0];
                      if (!(paramObject instanceof Integer)) {
                        break;
                      }
                      paramObject = (Integer)paramObject;
                      if (paramObject.intValue() == 3) {
                        return j[3];
                      }
                      if (paramObject.intValue() == 4) {
                        return j[1];
                      }
                    } while (paramObject.intValue() != 5);
                    return j[1];
                  } while (!(paramObject instanceof RecentBaseData));
                  return j[2];
                  if (!(paramObject instanceof Integer)) {
                    break;
                  }
                  paramObject = (Integer)paramObject;
                  if (paramObject.intValue() == 11) {
                    return j[1];
                  }
                } while (paramObject.intValue() != 12);
                return j[1];
              } while (!(paramObject instanceof RecentBaseData));
              return j[2];
              if (!(paramObject instanceof Long)) {
                break;
              }
              paramObject = (Long)paramObject;
              if (jdField_a_of_type_JavaLangLong == paramObject) {
                return j[1];
              }
              if (jdField_b_of_type_JavaLangLong == paramObject) {
                return j[6];
              }
              if (jdField_d_of_type_JavaLangLong == paramObject) {
                return j[5];
              }
              if (jdField_e_of_type_JavaLangLong == paramObject) {
                return j[7];
              }
              if (jdField_c_of_type_JavaLangLong == paramObject) {
                return j[8];
              }
              if (jdField_f_of_type_JavaLangLong == paramObject) {
                return j[9];
              }
            } while (jdField_g_of_type_JavaLangLong != paramObject);
            return j[10];
            if ((paramObject instanceof Integer)) {
              return j[2];
            }
            if ((paramObject instanceof RecentBaseData))
            {
              if (((RecentBaseData)paramObject).a() == 8) {
                return j[4];
              }
              return j[3];
            }
          } while (!(paramObject instanceof String));
          return j[0];
          if ((paramObject instanceof Integer)) {
            return j[1];
          }
        } while (!(paramObject instanceof RecentBaseData));
        return j[2];
        if ((paramObject instanceof String)) {
          return j[0];
        }
        if ((paramObject instanceof RecentSayHelloBoxItem)) {
          return j[2];
        }
      } while (!(paramObject instanceof RecentMsgBoxItem));
      return j[1];
      if ((paramObject instanceof String)) {
        return j[0];
      }
    } while (!(paramObject instanceof RecentSayHelloListItem));
    return j[1];
  }
  
  public RecentItemBaseBuilder a(Object paramObject)
  {
    Object localObject = null;
    int i1 = a(paramObject);
    if (T == 0) {
      if (i1 == 1)
      {
        if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] == null) {
          jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] = new RecentEmptyItemBuilder();
        }
        paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1];
      }
    }
    for (;;)
    {
      localObject = paramObject;
      if (paramObject == null)
      {
        if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[0] == null) {
          jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[0] = new RecentBlankItemBuilder();
        }
        localObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[0];
      }
      ((RecentItemBaseBuilder)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter);
      return localObject;
      if (i1 == 2)
      {
        if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] == null) {
          jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] = new RecentEfficientItemBuilder();
        }
        paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2];
      }
      else
      {
        paramObject = localObject;
        if (i1 == 3)
        {
          if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[3] == null) {
            jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[3] = new LoginWelcomeViewBuilder();
          }
          paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[3];
          continue;
          if (T == 1)
          {
            if (i1 == 1)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] = new TroopAssistantEmptyItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1];
            }
            else if (i1 == 2)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] = new RecentDefaultItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2];
            }
            else
            {
              paramObject = localObject;
              if (i1 == 3)
              {
                if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[3] == null) {
                  jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[3] = new TroopAssistantEducationBuilder();
                }
                paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[3];
              }
            }
          }
          else if (T == 9)
          {
            if (i1 == 1)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] = new TroopAssistantEmptyItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1];
            }
            else
            {
              paramObject = localObject;
              if (i1 == 2)
              {
                if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] == null) {
                  jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] = new RecentDefaultItemBuilder();
                }
                paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2];
              }
            }
          }
          else if (T == 4)
          {
            if (i1 == 6)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[6] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[6] = new RecentCallContactItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[6];
            }
            else if (i1 == 5)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[5] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[5] = new RecentCallHuangyeItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[5];
            }
            else if (i1 == 7)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[7] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[7] = new RecentCallLightalkItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[7];
            }
            else if (i1 == 8)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[8] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[8] = new RecentCallHoldItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[8];
            }
            else if (i1 == 1)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] = new RecentCallMoreItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1];
            }
            else if (i1 == 2)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] = new RecentEmptyItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2];
            }
            else if (i1 == 3)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[3] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[3] = new RecentCallItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[3];
            }
            else if (i1 == 4)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[4] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[4] = new RecentCallItemBuilder(1);
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[4];
            }
            else if (i1 == 9)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[9] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[9] = new RecentCallLightalkVipItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[9];
            }
            else
            {
              paramObject = localObject;
              if (i1 == 10)
              {
                if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[10] == null) {
                  jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[10] = new RecentCallHoldItemBuilder();
                }
                paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[10];
              }
            }
          }
          else if (T == 5)
          {
            if (i1 == 1)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] = new RecentBlankItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1];
            }
            else
            {
              paramObject = localObject;
              if (i1 == 2)
              {
                if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] == null) {
                  jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] = new RecentDefaultItemBuilder();
                }
                paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2];
              }
            }
          }
          else if (T == 6)
          {
            if (i1 == 2)
            {
              if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] == null) {
                jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2] = new SayHelloBoxItemBuilder();
              }
              paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[2];
            }
            else
            {
              paramObject = localObject;
              if (i1 == 1)
              {
                if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] == null) {
                  jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] = new RecentDefaultItemBuilder();
                }
                paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1];
              }
            }
          }
          else
          {
            paramObject = localObject;
            if (T == 7)
            {
              paramObject = localObject;
              if (i1 == 1)
              {
                if (jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] == null) {
                  jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1] = new SayHelloListItemBuilder();
                }
                paramObject = jdField_a_of_type_ArrayOfComTencentMobileqqActivityRecentRecentItemBaseBuilder[1];
              }
            }
          }
        }
      }
    }
  }
  
  public void a(RecentAdapter paramRecentAdapter)
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter = paramRecentAdapter;
  }
  
  public int b()
  {
    return j.length;
  }
}
