package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForDingdongSchedule;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.QLog;
import cooperation.dingdong.DingdongMsgItemTitleImageView;
import cooperation.dingdong.DingdongPluginDataFactory.ScheduleSummaryData;
import cooperation.dingdong.DingdongPluginHelper;
import kvq;
import mqq.app.MobileQQ;

public class DingdongScheduleItemBuilder
  extends BaseBubbleBuilder
{
  private static final String b = "DingdongScheduleItemBuilder";
  
  public DingdongScheduleItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void d(View paramView)
  {
    DingdongPluginHelper.a("0X800652B", 1);
    MessageForDingdongSchedule localMessageForDingdongSchedule = (MessageForDingdongSchedule)AIOUtils.a(paramView);
    if (localMessageForDingdongSchedule != null)
    {
      Intent localIntent = new Intent();
      localIntent.putExtra("schedule_feed_id", getSummaryDatajdField_a_of_type_JavaLangString);
      DingdongPluginHelper.a((Activity)paramView.getContext(), "com.dingdong.business.Schedule.Activity.ScheduleDetailActivity", localIntent, -1);
    }
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 0;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramChatMessage = (ViewGroup)super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    paramView = (kvq)paramChatMessage.getTag();
    jdField_a_of_type_AndroidViewView.getLayoutParams().width = BaseChatItemLayout.h;
    if (b) {}
    try
    {
      jdField_b_of_type_JavaLangStringBuilder.append(jdField_c_of_type_AndroidWidgetTextView.getText());
      jdField_b_of_type_JavaLangStringBuilder.append(jdField_d_of_type_AndroidWidgetTextView.getText());
      jdField_b_of_type_JavaLangStringBuilder.append(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371974));
      paramChatMessage.setContentDescription(jdField_b_of_type_JavaLangStringBuilder.toString());
      return paramChatMessage;
    }
    catch (Exception paramView)
    {
      QLog.e("DingdongScheduleItemBuilder", 1, "getView. error:" + paramView.toString() + ".");
    }
    return paramChatMessage;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout = (MessageForDingdongSchedule)paramChatMessage;
    kvq localKvq = (kvq)paramViewHolder;
    paramViewHolder = paramView;
    RelativeLayout.LayoutParams localLayoutParams;
    label243:
    label395:
    label419:
    int j;
    if (paramView == null)
    {
      paramViewHolder = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903162, null);
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramViewHolder.findViewById(2131296352));
      jdField_d_of_type_AndroidWidgetTextView = ((TextView)paramViewHolder.findViewById(2131297394));
      e = ((TextView)paramViewHolder.findViewById(2131297397));
      f = ((TextView)paramViewHolder.findViewById(2131297398));
      jdField_a_of_type_CooperationDingdongDingdongMsgItemTitleImageView = ((DingdongMsgItemTitleImageView)paramViewHolder.findViewById(2131297360));
      jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)paramViewHolder.findViewById(2131297393));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewHolder.findViewById(2131297391));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramViewHolder.findViewById(2131297392));
      jdField_b_of_type_AndroidViewView = paramViewHolder.findViewById(2131297395);
      jdField_c_of_type_AndroidViewView = paramViewHolder.findViewById(2131297399);
      jdField_d_of_type_AndroidViewView = paramViewHolder.findViewById(2131297396);
      paramView = (LinearLayout.LayoutParams)jdField_a_of_type_AndroidWidgetLinearLayout.getLayoutParams();
      localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams();
      if (paramChatMessage.isSend())
      {
        i = 2130837723;
        leftMargin = 0;
        rightMargin = ((int)(a_ * 6.0F));
        leftMargin = ((int)(16.0F * a_));
        jdField_a_of_type_AndroidWidgetLinearLayout.setLayoutParams(paramView);
        jdField_a_of_type_AndroidWidgetTextView.setLayoutParams(localLayoutParams);
        jdField_a_of_type_AndroidWidgetLinearLayout.invalidate();
        jdField_a_of_type_AndroidWidgetTextView.invalidate();
        jdField_a_of_type_CooperationDingdongDingdongMsgItemTitleImageView.setBackgroundResource(i);
        jdField_a_of_type_CooperationDingdongDingdongMsgItemTitleImageView.setReplaceColor(Color.rgb(250, 165, 92));
        paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
        paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
        paramViewHolder.setOnClickListener(this);
      }
    }
    else
    {
      jdField_c_of_type_AndroidWidgetTextView.setText(getSummaryDatajdField_b_of_type_JavaLangString);
      jdField_d_of_type_AndroidWidgetTextView.setText(DingdongPluginHelper.a(getSummaryDatajdField_a_of_type_Long, getSummaryDatajdField_b_of_type_Long, false));
      if (!TextUtils.isEmpty(getSummaryDatac)) {
        break label557;
      }
      e.setVisibility(8);
      i = 0;
      if (!TextUtils.isEmpty(getSummaryDatad)) {
        break label611;
      }
      f.setVisibility(8);
      paramChatMessage = jdField_b_of_type_AndroidViewView;
      if (i == 0) {
        break label665;
      }
      j = 0;
      label433:
      paramChatMessage.setVisibility(j);
      paramChatMessage = jdField_c_of_type_AndroidViewView;
      if (i == 0) {
        break label671;
      }
      j = 0;
      label453:
      paramChatMessage.setVisibility(j);
      paramChatMessage = jdField_d_of_type_AndroidViewView;
      if (i == 0) {
        break label678;
      }
    }
    label557:
    label611:
    label665:
    label671:
    label678:
    for (int i = 0;; i = 8)
    {
      paramChatMessage.setVisibility(i);
      switch (notificationType)
      {
      default: 
        return paramViewHolder;
        i = 2130837722;
        leftMargin = ((int)(a_ * 6.0F));
        rightMargin = 0;
        leftMargin = ((int)(24.0F * a_));
        break label243;
        e.setVisibility(0);
        e.setText(String.format(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371980), new Object[] { getSummaryDatac }));
        i = 1;
        break label395;
        f.setVisibility(0);
        f.setText(String.format(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371981), new Object[] { getSummaryDatad }));
        i = 1;
        break label419;
        j = 4;
        break label433;
        j = 8;
        break label453;
      }
    }
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
    return paramViewHolder;
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371977));
    return paramViewHolder;
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371978));
    return paramViewHolder;
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371978));
    return paramViewHolder;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new kvq(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    if (MsgUtils.a(issend)) {
      return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371982);
    }
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371983);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 2131304463: 
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
      return;
    }
    super.b(paramChatMessage);
  }
  
  protected void a(View paramView) {}
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    super.b(paramView, jdField_a_of_type_AndroidContentContext);
    return paramView.a();
  }
  
  public void onClick(View paramView)
  {
    AIOUtils.l = true;
    if (super.a()) {
      return;
    }
    super.onClick(paramView);
    switch (paramView.getId())
    {
    case 2131296316: 
    default: 
      return;
    }
    d(paramView);
  }
}
