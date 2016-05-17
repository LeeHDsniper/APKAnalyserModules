package com.tencent.mobileqq.activity.qqcard;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public abstract class BaseCardItemBuilder
{
  public static final String a;
  protected int a;
  protected Context a;
  protected LayoutInflater a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = BaseCardItemBuilder.class.getSimpleName();
  }
  
  public BaseCardItemBuilder(Context paramContext, int paramInt)
  {
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(jdField_a_of_type_AndroidContentContext);
  }
  
  public View a(Object paramObject, View paramView, ViewGroup paramViewGroup)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "getView convertView=" + paramView);
    }
    View localView = paramView;
    if (paramView == null)
    {
      localView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(jdField_a_of_type_Int, paramViewGroup, false);
      localView.setTag(a(localView));
    }
    a(paramObject, (BaseCardItemBuilder.BaseHolder)localView.getTag());
    return localView;
  }
  
  public abstract BaseCardItemBuilder.BaseHolder a(View paramView);
  
  public abstract void a(Object paramObject, BaseCardItemBuilder.BaseHolder paramBaseHolder);
}
