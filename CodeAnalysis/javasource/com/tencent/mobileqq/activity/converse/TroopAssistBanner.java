package com.tencent.mobileqq.activity.converse;

import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class TroopAssistBanner
  extends BaseBanner
{
  public TroopAssistBanner(View.OnClickListener paramOnClickListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 108;
    b = 0;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
  }
  
  public View a(Context paramContext)
  {
    if (jdField_a_of_type_AndroidViewView == null)
    {
      jdField_a_of_type_AndroidViewView = View.inflate(paramContext, 2130903221, null);
      if (jdField_a_of_type_AndroidViewView$OnClickListener != null) {
        jdField_a_of_type_AndroidViewView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      }
    }
    return jdField_a_of_type_AndroidViewView;
  }
}
