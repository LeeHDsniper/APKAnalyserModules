package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ArkAppMessage;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForArkApp;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;

public class ArkAppItemBuilder
  extends AbstractChatItemBuilder
{
  public ArkAppItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramLinearLayout.setPadding(0, AIOUtils.a(11.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, 0);
    paramLinearLayout = (MessageForArkApp)paramMessageRecord;
    paramMessageRecord = paramView;
    if (paramView == null) {
      paramMessageRecord = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903159, null);
    }
    paramView = (ArkUIView)paramMessageRecord.findViewById(2131297369);
    ((ArkRelativeLayout)paramMessageRecord.findViewById(2131297368)).a(paramView);
    if (arkContainer == null) {
      arkContainer = new ArkContainerWrapper();
    }
    View localView = paramMessageRecord.findViewById(2131297370);
    paramView.a(arkContainer, localView);
    arkContainer.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, ark_app_message.appName, ark_app_message.appView, ark_app_message.appMinVersion, ark_app_message.metaList, jdField_a_of_type_AndroidContentContext.getResources().getDisplayMetrics().scaledDensity, paramLinearLayout);
    paramViewHolder = (ArkAppItemBuilder.Holder)paramViewHolder;
    a = msg;
    paramView.setTag(paramViewHolder);
    paramView.setOnTouchListener(paramOnLongClickAndTouchListener);
    paramView.setOnLongClickListener(paramOnLongClickAndTouchListener);
    if (localView != null)
    {
      localView.setOnTouchListener(paramOnLongClickAndTouchListener);
      localView.setOnLongClickListener(paramOnLongClickAndTouchListener);
    }
    return paramMessageRecord;
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new ArkAppItemBuilder.Holder(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      return;
    }
    ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    paramView.a(2131304463, jdField_a_of_type_AndroidContentContext.getString(2131367614));
    return paramView.a();
  }
}
