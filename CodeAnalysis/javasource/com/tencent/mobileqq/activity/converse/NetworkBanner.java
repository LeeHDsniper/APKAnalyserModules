package com.tencent.mobileqq.activity.converse;

import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class NetworkBanner
  extends BaseBanner
{
  public static final int e = 0;
  public static final int f = 1;
  private TextView a;
  
  public NetworkBanner(View.OnClickListener paramOnClickListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 100;
    b = 0;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
  }
  
  public View a(Context paramContext)
  {
    if (jdField_a_of_type_AndroidViewView == null)
    {
      jdField_a_of_type_AndroidViewView = View.inflate(paramContext, 2130903413, null);
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131297718));
      if (jdField_a_of_type_AndroidViewView$OnClickListener != null) {
        jdField_a_of_type_AndroidViewView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      }
    }
    return jdField_a_of_type_AndroidViewView;
  }
  
  protected void a(int paramInt)
  {
    super.a(paramInt);
    if (jdField_a_of_type_AndroidWidgetTextView != null)
    {
      if (paramInt == 1) {
        jdField_a_of_type_AndroidWidgetTextView.setText(2131369828);
      }
    }
    else {
      return;
    }
    jdField_a_of_type_AndroidWidgetTextView.setText(2131369827);
  }
}
