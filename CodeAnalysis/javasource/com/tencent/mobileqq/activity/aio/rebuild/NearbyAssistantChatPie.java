package com.tencent.mobileqq.activity.aio.rebuild;

import android.content.Context;
import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import lib;

public class NearbyAssistantChatPie
  extends BaseChatPie
{
  protected MessageObserver a;
  private final String ae;
  
  public NearbyAssistantChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    ae = "NearbyAssistantChatPie";
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lib(this);
  }
  
  protected void X()
  {
    super.X();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
  }
  
  protected void Y()
  {
    super.Y();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
  }
  
  protected boolean a()
  {
    return false;
  }
  
  protected boolean a(MessageRecord paramMessageRecord)
  {
    return jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a.equals(frienduin);
  }
  
  protected void b(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("uinname");
    paramIntent = str;
    if (str == null) {
      paramIntent = a().getString(2131371693);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = paramIntent;
    b.setText(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
  }
  
  protected boolean c()
  {
    return false;
  }
  
  protected void o()
  {
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  protected void q() {}
}
