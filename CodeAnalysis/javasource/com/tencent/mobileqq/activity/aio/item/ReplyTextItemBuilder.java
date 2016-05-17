package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.etrump.mixlayout.ETTextView;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.bubble.BubbleInfo;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForReplyText;
import com.tencent.mobileqq.data.MessageForReplyText.SourceMsgInfo;
import com.tencent.mobileqq.data.MessageForText.AtTroopMemberInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.text.QQTextBuilder;
import com.tencent.mobileqq.troop.utils.TroopBusinessUtil;
import com.tencent.mobileqq.troop.utils.TroopBusinessUtil.TroopBusinessMessage;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.mobileqq.widget.AnimationTextView;
import com.tencent.widget.immersive.ImmersiveUtils;
import java.util.ArrayList;
import java.util.List;
import kzs;
import kzt;
import kzu;
import kzv;

public class ReplyTextItemBuilder
  extends TextItemBuilder
{
  protected View.OnClickListener a;
  
  public ReplyTextItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewView$OnClickListener = new kzs(this);
  }
  
  public static final TextView a(Context paramContext)
  {
    ETTextView localETTextView = new ETTextView(paramContext);
    localETTextView.setTextColor(paramContext.getResources().getColorStateList(2131428183));
    localETTextView.setLinkTextColor(paramContext.getResources().getColorStateList(2131428182));
    ImmersiveUtils.a(localETTextView, 0.5F);
    localETTextView.setTextSize(1, 14.0F);
    localETTextView.setEditableFactory(QQTextBuilder.a);
    localETTextView.setSpannableFactory(QQText.a);
    localETTextView.setMaxWidth(BaseChatItemLayout.h);
    return localETTextView;
  }
  
  public static MessageRecord a(QQAppInterface paramQQAppInterface, String paramString, int paramInt, long paramLong)
  {
    paramQQAppInterface = paramQQAppInterface.a().a(paramString, paramInt);
    int i = paramQQAppInterface.size();
    paramInt = 0;
    while (paramInt < i)
    {
      paramString = (ChatMessage)paramQQAppInterface.get(paramInt);
      if (shmsgseq == paramLong)
      {
        if (!mIsParsed) {
          paramString.parse();
        }
        return paramString;
      }
      paramInt += 1;
    }
    return null;
  }
  
  public static final void a(Context paramContext, QQAppInterface paramQQAppInterface, TextView paramTextView, MessageForReplyText.SourceMsgInfo paramSourceMsgInfo, String paramString, int paramInt, long paramLong)
  {
    Object localObject;
    if (!TextUtils.isEmpty(mAnonymousNickName)) {
      localObject = mAnonymousNickName;
    }
    for (;;)
    {
      if ((paramTextView instanceof ETTextView)) {
        ((ETTextView)paramTextView).setFont(0, paramLong);
      }
      String str = TimeFormatterUtils.a(paramContext, 3, mSourceMsgTime * 1000L).toString();
      if (mSourceSummaryFlag != 1) {
        break;
      }
      paramContext = mSourceMsgText;
      paramContext = (String)localObject + " " + str + "\r\n" + paramContext;
      paramTextView.setText(new QQText("“" + paramContext, 7));
      return;
      if (mSourceMsgSenderUin == 50000000L)
      {
        localObject = a(paramQQAppInterface, paramString, paramInt, mSourceMsgSeq);
        if (localObject != null)
        {
          localObject = TroopBusinessUtil.a((MessageRecord)localObject);
          if (localObject != null) {
            mAnonymousNickName = c;
          }
        }
        localObject = "";
      }
      else
      {
        localObject = ContactUtils.e(paramQQAppInterface, paramString, mSourceMsgSenderUin + "");
      }
    }
    paramContext = a(paramQQAppInterface, paramString, paramInt, mSourceMsgSeq);
    if (paramContext != null)
    {
      paramQQAppInterface = ((ChatMessage)paramContext).getSummaryMsg();
      mSourceMsgText = paramQQAppInterface;
      mSourceSummaryFlag = 1;
    }
    for (;;)
    {
      paramContext = paramQQAppInterface;
      if (paramQQAppInterface != null) {
        break;
      }
      paramContext = mSourceMsgText;
      break;
      paramQQAppInterface = null;
    }
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    Context localContext = paramBaseChatItemLayout.getContext();
    paramBaseChatItemLayout = (kzv)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = new LinearLayout(localContext);
      paramViewHolder.setOrientation(1);
      a = a(localContext);
      paramViewHolder.addView(a);
      paramView = new ETTextView(localContext);
      paramView.setTextColor(localContext.getResources().getColorStateList(2131428183));
      paramView.setLinkTextColor(localContext.getResources().getColorStateList(2131428182));
      paramView.setEditableFactory(QQTextBuilder.a);
      paramView.setSpannableFactory(QQText.a);
      paramView.setMaxWidth(BaseChatItemLayout.h);
      paramView.setMovementMethod(LinkMovementMethod.getInstance());
      paramView.setId(2131297402);
      b = paramView;
      paramViewHolder.addView(b);
    }
    if (!TextUtils.isEmpty(paramChatMessage.getExtInfoFromExtStr("sens_msg_ctrl_info")))
    {
      paramView = ((ETTextView)b).a();
      if (paramView != null) {
        a = (uniseq + 1L);
      }
    }
    paramView = (MessageForReplyText)paramChatMessage;
    ((ETTextView)b).setFont(0, uniseq);
    b.setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(senderuin)) && (mSourceMsgInfo.mLocalAtInfoDone == 0))
    {
      mSourceMsgInfo.mLocalAtInfoDone = 1;
      if ((atInfoList != null) && (atInfoList.size() > 0))
      {
        paramChatMessage = (MessageForText.AtTroopMemberInfo)atInfoList.remove(0);
        if (msg.length() > textLen + 1)
        {
          msg = msg.substring(textLen + 1);
          sb = new QQText(msg, 13, 32, paramView);
        }
      }
    }
    b.setText(sb);
    a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a, mSourceMsgInfo, frienduin, istroop, uniseq);
    a.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
    paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
    a.setOnTouchListener(paramOnLongClickAndTouchListener);
    a.setOnLongClickListener(paramOnLongClickAndTouchListener);
    b.setOnTouchListener(paramOnLongClickAndTouchListener);
    b.setOnLongClickListener(paramOnLongClickAndTouchListener);
    if ((b instanceof AnimationTextView)) {
      b).jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick = jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick;
    }
    if ((a instanceof AnimationTextView)) {
      a).jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick = jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick;
    }
    return paramViewHolder;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new kzv(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      super.a(paramInt, paramContext, paramChatMessage);
      return;
    }
    Bundle localBundle = new Bundle();
    localBundle.putInt("forward_type", -1);
    paramContext = (MessageForReplyText)paramChatMessage;
    if (sb != null) {}
    for (paramContext = sb.toString();; paramContext = msg)
    {
      localBundle.putString("forward_text", paramContext);
      paramContext = new Intent();
      paramContext.putExtras(localBundle);
      ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramContext, 21);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "", "", "", "");
      return;
    }
  }
  
  protected void a(View paramView)
  {
    if (aisMultiMsg) {}
    String str1;
    String str2;
    do
    {
      return;
      paramView = (MessageForReplyText)AIOUtils.a(paramView);
      str1 = jdField_a_of_type_AndroidContentContext.getString(2131367611);
      str2 = jdField_a_of_type_AndroidContentContext.getString(2131367612);
    } while (!paramView.isSendFromLocal());
    DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230, str1, str2, new kzt(this, paramView), new kzu(this)).show();
  }
  
  protected void a(BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, ChatMessage paramChatMessage, BubbleInfo paramBubbleInfo)
  {
    kzv localKzv = (kzv)paramViewHolder;
    if ((c == 0) || (!paramBubbleInfo.a()))
    {
      paramView = paramView.getResources();
      if (paramChatMessage.isSend())
      {
        paramViewHolder = paramView.getColorStateList(2131428186);
        b.setTextColor(paramViewHolder);
        a.setTextColor(paramViewHolder);
        if (!paramChatMessage.isSend()) {
          break label114;
        }
      }
      label114:
      for (paramViewHolder = paramView.getColorStateList(2131428185);; paramViewHolder = paramView.getColorStateList(2131428184))
      {
        b.setLinkTextColor(paramViewHolder);
        a.setLinkTextColor(paramViewHolder);
        ImmersiveUtils.a(a, 0.5F);
        return;
        paramViewHolder = paramView.getColorStateList(2131428183);
        break;
      }
    }
    if (d == 0)
    {
      b.setTextColor(-16777216);
      a.setTextColor(-16777216);
      if (e != 0) {
        break label232;
      }
      paramViewHolder = paramView.getResources().getColorStateList(2131428184);
      b.setLinkTextColor(paramViewHolder);
      a.setLinkTextColor(paramViewHolder);
    }
    for (;;)
    {
      ImmersiveUtils.a(a, 0.5F);
      return;
      b.setTextColor(d);
      a.setTextColor(d);
      break;
      label232:
      b.setLinkTextColor(e);
      a.setLinkTextColor(e);
    }
  }
}
