package com.tencent.mobileqq.activity.converse;

import android.content.Context;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.HashMap;

public class BannerFactory
{
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 100;
  public static final int d = 102;
  public static final int e = 103;
  public static final int f = 104;
  public static final int g = 105;
  public static final int h = 106;
  public static final int i = 107;
  public static final int j = 108;
  public static final int k = 109;
  public static final int l = 110;
  public static final int m = 200;
  public static final int n = 201;
  private Context jdField_a_of_type_AndroidContentContext;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  private ArrayList jdField_a_of_type_JavaUtilArrayList;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  private boolean jdField_a_of_type_Boolean;
  private ArrayList jdField_b_of_type_JavaUtilArrayList;
  private HashMap jdField_b_of_type_JavaUtilHashMap;
  
  public BannerFactory(Context paramContext, LinearLayout paramLinearLayout, View.OnClickListener paramOnClickListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_b_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    jdField_a_of_type_AndroidWidgetLinearLayout = paramLinearLayout;
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
  }
  
  private int a(int paramInt)
  {
    if ((jdField_b_of_type_JavaUtilHashMap != null) && (jdField_b_of_type_JavaUtilHashMap.containsKey(Integer.valueOf(paramInt)))) {
      return ((Integer)jdField_b_of_type_JavaUtilHashMap.get(Integer.valueOf(paramInt))).intValue();
    }
    return 0;
  }
  
  private BaseBanner a(int paramInt)
  {
    Object localObject2 = null;
    if ((jdField_a_of_type_JavaUtilHashMap != null) && (jdField_a_of_type_JavaUtilHashMap.containsKey(Integer.valueOf(paramInt))))
    {
      localObject2 = (BaseBanner)jdField_a_of_type_JavaUtilHashMap.get(Integer.valueOf(paramInt));
      return localObject2;
    }
    Object localObject1 = localObject2;
    switch (paramInt)
    {
    default: 
      localObject1 = localObject2;
    }
    for (;;)
    {
      localObject2 = localObject1;
      if (jdField_a_of_type_JavaUtilHashMap == null) {
        break;
      }
      localObject2 = localObject1;
      if (localObject1 == null) {
        break;
      }
      jdField_a_of_type_JavaUtilHashMap.put(Integer.valueOf(paramInt), localObject1);
      return localObject1;
      localObject1 = new NetworkBanner(jdField_a_of_type_AndroidViewView$OnClickListener);
      continue;
      localObject1 = new TroopAssistBanner(jdField_a_of_type_AndroidViewView$OnClickListener);
    }
  }
  
  public void a()
  {
    if (!jdField_a_of_type_Boolean) {
      return;
    }
    jdField_a_of_type_AndroidWidgetLinearLayout.removeAllViews();
    BaseBanner localBaseBanner1;
    if ((jdField_a_of_type_JavaUtilArrayList != null) && (jdField_a_of_type_JavaUtilArrayList.size() > 0))
    {
      localBaseBanner1 = (BaseBanner)jdField_a_of_type_JavaUtilArrayList.get(0);
      if ((jdField_b_of_type_JavaUtilArrayList != null) && (jdField_b_of_type_JavaUtilArrayList.size() > 0))
      {
        BaseBanner localBaseBanner2 = (BaseBanner)jdField_b_of_type_JavaUtilArrayList.get(0);
        if (jdField_a_of_type_Boolean) {
          jdField_a_of_type_AndroidWidgetLinearLayout.addView(localBaseBanner1.a(jdField_a_of_type_AndroidContentContext));
        }
        jdField_a_of_type_AndroidWidgetLinearLayout.addView(localBaseBanner2.a(jdField_a_of_type_AndroidContentContext));
      }
    }
    for (;;)
    {
      jdField_a_of_type_Boolean = false;
      return;
      jdField_a_of_type_AndroidWidgetLinearLayout.addView(localBaseBanner1.a(jdField_a_of_type_AndroidContentContext));
      continue;
      if ((jdField_b_of_type_JavaUtilArrayList != null) && (jdField_b_of_type_JavaUtilArrayList.size() > 0))
      {
        localBaseBanner1 = (BaseBanner)jdField_b_of_type_JavaUtilArrayList.get(0);
        jdField_a_of_type_AndroidWidgetLinearLayout.addView(localBaseBanner1.a(jdField_a_of_type_AndroidContentContext));
      }
    }
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    if (paramInt2 == 0) {
      if (jdField_a_of_type_JavaUtilArrayList == null) {
        jdField_a_of_type_JavaUtilArrayList = new ArrayList();
      }
    }
    for (ArrayList localArrayList = jdField_a_of_type_JavaUtilArrayList; localArrayList.size() > 0; localArrayList = jdField_b_of_type_JavaUtilArrayList)
    {
      paramInt2 = 0;
      while (paramInt2 < localArrayList.size())
      {
        if (getjdField_a_of_type_Int == paramInt1)
        {
          localArrayList.remove(paramInt2);
          if (paramInt2 == 0) {
            jdField_a_of_type_Boolean = true;
          }
        }
        paramInt2 += 1;
      }
      if (jdField_b_of_type_JavaUtilArrayList == null) {
        jdField_b_of_type_JavaUtilArrayList = new ArrayList();
      }
    }
    a();
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    ArrayList localArrayList;
    int i1;
    label45:
    BaseBanner localBaseBanner;
    if (paramInt3 == 0)
    {
      if (jdField_a_of_type_JavaUtilArrayList == null) {
        jdField_a_of_type_JavaUtilArrayList = new ArrayList();
      }
      localArrayList = jdField_a_of_type_JavaUtilArrayList;
      i1 = a(paramInt1);
      if (localArrayList.size() <= 0) {
        break label171;
      }
      paramInt3 = 0;
      if (paramInt3 < localArrayList.size())
      {
        localBaseBanner = (BaseBanner)localArrayList.get(paramInt3);
        if (jdField_a_of_type_Int != paramInt1) {
          break label115;
        }
        if (!localBaseBanner.a(paramInt2)) {}
      }
    }
    for (;;)
    {
      a();
      return;
      if (jdField_b_of_type_JavaUtilArrayList == null) {
        jdField_b_of_type_JavaUtilArrayList = new ArrayList();
      }
      localArrayList = jdField_b_of_type_JavaUtilArrayList;
      break;
      label115:
      if (c <= i1)
      {
        localBaseBanner = a(paramInt1);
        if (localBaseBanner != null)
        {
          localBaseBanner.a(paramInt2);
          localArrayList.add(paramInt3, localBaseBanner);
          if (paramInt3 == 0) {
            jdField_a_of_type_Boolean = true;
          }
        }
      }
      else
      {
        paramInt3 += 1;
        break label45;
        label171:
        localBaseBanner = a(paramInt1);
        if (localBaseBanner != null)
        {
          localArrayList.add(localBaseBanner);
          jdField_a_of_type_Boolean = true;
        }
      }
    }
  }
}
