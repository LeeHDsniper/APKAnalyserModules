package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.text.SpannableString;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.text.style.ClickableSpan;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.etrump.mixlayout.ETTextView;
import com.tencent.device.msg.data.DeviceMsgHandle;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForDeviceText;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.AnimationTextView;
import kvl;
import kvm;
import kvn;
import kvo;
import kvp;

public class DeviceTextItemBuilder
  extends TextItemBuilder
{
  public DeviceTextItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    Object localObject = paramBaseChatItemLayout.getContext();
    paramBaseChatItemLayout = (TextItemBuilder.Holder)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = new ETTextView((Context)localObject);
      paramViewHolder.setTextColor(((Context)localObject).getResources().getColorStateList(2131428183));
      paramViewHolder.setLinkTextColor(((Context)localObject).getResources().getColorStateList(2131428182));
      paramViewHolder.setSpannableFactory(QQText.a);
      paramViewHolder.setMaxWidth(BaseChatItemLayout.h);
      paramViewHolder.setMovementMethod(LinkMovementMethod.getInstance());
      paramViewHolder.setId(2131297402);
      b = paramViewHolder;
    }
    ((ETTextView)b).setFont(0, uniseq);
    if (!TextUtils.isEmpty(paramChatMessage.getExtInfoFromExtStr("sens_msg_ctrl_info")))
    {
      paramView = ((ETTextView)b).a();
      if (paramView != null) {
        a = (uniseq + 1L);
      }
    }
    b.setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
    int j = BaseChatItemLayout.r;
    int i = BaseChatItemLayout.s;
    if (paramChatMessage.isSend())
    {
      j = BaseChatItemLayout.s;
      i = BaseChatItemLayout.r;
    }
    b.setPadding(j, BaseChatItemLayout.p, i, BaseChatItemLayout.q);
    if ((paramChatMessage instanceof MessageForDeviceText))
    {
      paramView = (MessageForDeviceText)paramChatMessage;
      if (msgtype == 63528) {
        if (paramChatMessage.isSend()) {
          b.setText(((Context)localObject).getString(2131370017));
        }
      }
    }
    for (;;)
    {
      b.setOnTouchListener(paramOnLongClickAndTouchListener);
      b.setOnLongClickListener(paramOnLongClickAndTouchListener);
      if ((b instanceof AnimationTextView)) {
        b).a = new kvp(this);
      }
      return paramViewHolder;
      b.setText(((Context)localObject).getString(2131370016));
      continue;
      if ("device_lock_msg".equals(extStr))
      {
        localObject = msg;
        paramChatMessage = new TextPaint();
        paramChatMessage.setColor(Color.rgb(26, 144, 240));
        paramChatMessage.setUnderlineText(true);
        paramView = new SpannableString((CharSequence)localObject);
        i = ((String)localObject).indexOf("点这里开启QQ设备锁");
        j = "点这里开启QQ设备锁".length();
        int k = ((String)localObject).indexOf("QQ设备锁介绍");
        int m = "QQ设备锁介绍".length();
        localObject = new kvn(this);
        kvo localKvo = new kvo(this);
        ((ClickableSpan)localObject).updateDrawState(paramChatMessage);
        localKvo.updateDrawState(paramChatMessage);
        paramView.setSpan(localObject, i, j + i, 33);
        paramView.setSpan(localKvo, k, m + k, 33);
        b.setMovementMethod(LinkMovementMethod.getInstance());
        b.setText(paramView);
      }
      else
      {
        b.setText(sb);
        continue;
        b.setText(msg);
      }
    }
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      super.a(paramInt, paramContext, paramChatMessage);
      return;
    }
    paramContext = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
    paramChatMessage = (MessageForDeviceText)paramChatMessage;
    paramContext.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, paramChatMessage);
  }
  
  protected void a(View paramView)
  {
    if (aisMultiMsg) {}
    String str1;
    String str2;
    do
    {
      return;
      paramView = (MessageForDeviceText)AIOUtils.a(paramView);
      str1 = jdField_a_of_type_AndroidContentContext.getString(2131367611);
      str2 = jdField_a_of_type_AndroidContentContext.getString(2131367612);
    } while (!paramView.isSendFromLocal());
    DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230, str1, str2, new kvl(this, paramView), new kvm(this)).show();
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = AIOUtils.a(paramView);
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    localQQCustomMenu.a(2131304469, "复制");
    if ((extraflag == 32768) && (paramView.isSendFromLocal())) {
      localQQCustomMenu.a(2131304471, jdField_a_of_type_AndroidContentContext.getString(2131367717));
    }
    localQQCustomMenu.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
    ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    return localQQCustomMenu.a();
  }
  
  protected void b(View paramView)
  {
    ChatMessage localChatMessage = AIOUtils.a(paramView);
    if (localChatMessage == null) {}
    do
    {
      do
      {
        return;
      } while (istroop != 9501);
      if (localChatMessage.isSendFromLocal())
      {
        super.b(paramView);
        return;
      }
    } while (!"device_groupchat".equals(extStr));
    super.b(paramView);
  }
}
