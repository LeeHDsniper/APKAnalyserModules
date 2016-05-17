package com.tencent.mobileqq.activity.activateFriend;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class ActivateBasePage
  extends RelativeLayout
{
  LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  View jdField_a_of_type_AndroidViewView;
  public Button a;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  public ActivateFriendGrid a;
  TextView b;
  TextView c;
  TextView d;
  TextView e;
  
  public ActivateBasePage(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewView = null;
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(paramContext);
    a();
    if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid != null) {
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setTextScrolling(false);
    }
  }
  
  public ActivateBasePage(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_AndroidViewView = null;
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(paramContext);
  }
  
  public abstract void a();
  
  public void b()
  {
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.a();
  }
}
