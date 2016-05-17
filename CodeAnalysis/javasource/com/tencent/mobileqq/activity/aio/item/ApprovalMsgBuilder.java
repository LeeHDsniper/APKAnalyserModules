package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.os.Handler;
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
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForApproval;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.QLog;
import cooperation.dingdong.DingdongMsgItemTitleImageView;
import cooperation.dingdong.DingdongPluginHelper;
import kuw;

public class ApprovalMsgBuilder
  extends BaseBubbleBuilder
  implements FileTransferManager.Callback
{
  private static final String b;
  Handler a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_JavaLangString = ApprovalMsgBuilder.class.getSimpleName();
  }
  
  public ApprovalMsgBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_AndroidOsHandler = new Handler();
  }
  
  private void a(MessageForApproval paramMessageForApproval, kuw paramKuw)
  {
    for (;;)
    {
      int i;
      Object localObject5;
      Object localObject3;
      Object localObject4;
      try
      {
        d.setText(summary);
        String[] arrayOfString = title.split("\002");
        if (arrayOfString.length == 1)
        {
          jdField_b_of_type_AndroidWidgetTextView.setText(title.substring(3));
          c.setVisibility(8);
          return;
        }
        int j = arrayOfString.length;
        String str1 = "";
        paramMessageForApproval = "";
        localObject2 = "";
        localObject1 = "申请";
        i = 0;
        if (i < j)
        {
          String str2 = arrayOfString[i];
          if (str2.startsWith("000"))
          {
            localObject5 = (String)localObject1 + str2.substring(3);
            localObject3 = paramMessageForApproval;
            localObject4 = localObject2;
          }
          else if (str2.startsWith("001"))
          {
            localObject4 = str2.substring(3);
            localObject3 = paramMessageForApproval;
            localObject5 = localObject1;
          }
          else if (str2.startsWith("002"))
          {
            localObject3 = str2.substring(3);
            localObject4 = localObject2;
            localObject5 = localObject1;
          }
          else
          {
            localObject3 = paramMessageForApproval;
            localObject4 = localObject2;
            localObject5 = localObject1;
            if (str2.startsWith("003"))
            {
              str1 = str2.substring(3);
              localObject3 = paramMessageForApproval;
              localObject4 = localObject2;
              localObject5 = localObject1;
            }
          }
        }
        else
        {
          localObject3 = paramMessageForApproval;
          if ("1".equalsIgnoreCase(str1) == true) {
            localObject3 = paramMessageForApproval + "(含周末)";
          }
          jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
          c.setText((String)localObject2 + (String)localObject3);
          return;
        }
      }
      catch (Exception paramMessageForApproval)
      {
        if (QLog.isDevelopLevel())
        {
          jdField_b_of_type_AndroidWidgetTextView.setText("解析出错了，快查!");
          c.setText("解析出错了，快查!");
        }
        QLog.e(jdField_b_of_type_JavaLangString, 1, paramMessageForApproval.toString());
        return;
      }
      i += 1;
      paramMessageForApproval = (MessageForApproval)localObject3;
      Object localObject2 = localObject4;
      Object localObject1 = localObject5;
    }
  }
  
  private void a(kuw paramKuw, MessageForApproval paramMessageForApproval, View paramView, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)jdField_a_of_type_AndroidWidgetLinearLayout.getLayoutParams();
    RelativeLayout.LayoutParams localLayoutParams1 = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams();
    int i;
    if (paramMessageForApproval.isSend())
    {
      i = 2130837723;
      leftMargin = 0;
      rightMargin = ((int)(a_ * 6.0F));
    }
    for (leftMargin = ((int)(16.0F * a_));; leftMargin = ((int)(24.0F * a_)))
    {
      jdField_a_of_type_AndroidWidgetLinearLayout.setLayoutParams(localLayoutParams);
      jdField_a_of_type_AndroidWidgetTextView.setLayoutParams(localLayoutParams1);
      jdField_a_of_type_AndroidWidgetLinearLayout.invalidate();
      jdField_a_of_type_AndroidWidgetTextView.invalidate();
      jdField_a_of_type_CooperationDingdongDingdongMsgItemTitleImageView.setBackgroundResource(i);
      jdField_a_of_type_CooperationDingdongDingdongMsgItemTitleImageView.buildDrawingCache();
      jdField_a_of_type_CooperationDingdongDingdongMsgItemTitleImageView.setReplaceColor(Color.rgb(38, 209, 166));
      jdField_a_of_type_CooperationDingdongDingdongMsgItemTitleImageView.invalidate();
      paramView.setOnLongClickListener(paramOnLongClickAndTouchListener);
      paramView.setOnTouchListener(paramOnLongClickAndTouchListener);
      paramView.setOnClickListener(this);
      return;
      i = 2130837722;
      leftMargin = ((int)(a_ * 6.0F));
      rightMargin = 0;
    }
  }
  
  private void d(View paramView)
  {
    MessageForApproval localMessageForApproval = (MessageForApproval)AIOUtils.a(paramView);
    DingdongPluginHelper.a((Activity)paramView.getContext(), subType, workId);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 0;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramChatMessage = (ViewGroup)super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    paramView = (kuw)paramChatMessage.getTag();
    jdField_a_of_type_AndroidViewView.getLayoutParams().width = BaseChatItemLayout.h;
    if (jdField_b_of_type_Boolean) {}
    try
    {
      jdField_b_of_type_JavaLangStringBuilder.append(jdField_b_of_type_AndroidWidgetTextView.getText());
      jdField_b_of_type_JavaLangStringBuilder.append(c.getText());
      jdField_b_of_type_JavaLangStringBuilder.append("审批");
      paramChatMessage.setContentDescription(jdField_b_of_type_JavaLangStringBuilder.toString());
      return paramChatMessage;
    }
    catch (Exception paramView) {}
    return paramChatMessage;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramViewHolder = (kuw)paramViewHolder;
    paramBaseChatItemLayout = (MessageForApproval)paramChatMessage;
    paramBaseChatItemLayout.parse();
    paramChatMessage = paramView;
    if (paramView == null)
    {
      paramChatMessage = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903158, null);
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramChatMessage.findViewById(2131297363));
      c = ((TextView)paramChatMessage.findViewById(2131297364));
      d = ((TextView)paramChatMessage.findViewById(2131296691));
      jdField_a_of_type_CooperationDingdongDingdongMsgItemTitleImageView = ((DingdongMsgItemTitleImageView)paramChatMessage.findViewById(2131297360));
      jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)paramChatMessage.findViewById(2131297362));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramChatMessage.findViewById(2131297361));
    }
    a(paramViewHolder, paramBaseChatItemLayout, paramChatMessage, paramOnLongClickAndTouchListener);
    a(paramBaseChatItemLayout, paramViewHolder);
    return paramChatMessage;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new kuw(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    if (MsgUtils.a(issend)) {
      return "收到审批";
    }
    return "发来审批";
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
  
  protected void a(View paramView) {}
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    paramView = (kuw)AIOUtils.a(paramView);
    a((MessageForApproval)jdField_a_of_type_ComTencentMobileqqDataChatMessage, paramView);
  }
  
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
