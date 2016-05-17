package com.tencent.mobileqq.activity.qqcard;

import android.content.Context;
import android.util.SparseArray;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class CardItemBuilderFactory
{
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 5;
  private Context jdField_a_of_type_AndroidContentContext;
  private SparseArray jdField_a_of_type_AndroidUtilSparseArray;
  
  public CardItemBuilderFactory(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_AndroidUtilSparseArray = new SparseArray();
  }
  
  public int a(Object paramObject)
  {
    if ((paramObject instanceof QQCardItem)) {
      return itemType;
    }
    return 0;
  }
  
  public BaseCardItemBuilder a(Object paramObject)
  {
    int i = a(paramObject);
    BaseCardItemBuilder localBaseCardItemBuilder = (BaseCardItemBuilder)jdField_a_of_type_AndroidUtilSparseArray.get(i);
    Object localObject = localBaseCardItemBuilder;
    if (localBaseCardItemBuilder == null)
    {
      paramObject = localBaseCardItemBuilder;
      switch (i)
      {
      default: 
        paramObject = localBaseCardItemBuilder;
      }
    }
    for (;;)
    {
      localObject = paramObject;
      if (paramObject != null)
      {
        jdField_a_of_type_AndroidUtilSparseArray.put(i, paramObject);
        localObject = paramObject;
      }
      return localObject;
      paramObject = new CommonCardItemBuilder(jdField_a_of_type_AndroidContentContext, 2130904411);
      continue;
      paramObject = new ObtainableCardBuilder(jdField_a_of_type_AndroidContentContext, 2130904429);
    }
  }
}
