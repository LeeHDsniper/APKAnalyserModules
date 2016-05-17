package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.ClipboardManager;
import android.text.SpannableStringBuilder;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.activity.aio.MixedImageOnclickListener;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.bubble.BubbleInfo;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageForMixedMsg;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PicPreDownloader;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.AnimationTextView;
import com.tencent.mobileqq.widget.AnimationTextView.OnDoubleClick;
import com.tencent.mobileqq.widget.MixedMsgLinearLayout;
import com.tencent.qphone.base.util.QLog;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kyq;
import kyr;

public class MixedMsgItemBuilder
  extends BaseBubbleBuilder
  implements FileTransferManager.Callback
{
  private static final String b;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener = new kyq(this);
  private MixedImageOnclickListener jdField_a_of_type_ComTencentMobileqqActivityAioMixedImageOnclickListener = new MixedImageOnclickListener();
  private AnimationTextView.OnDoubleClick jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick = new kyr(this);
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_JavaLangString = MixedMsgItemBuilder.class.getSimpleName();
  }
  
  public MixedMsgItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_ComTencentMobileqqActivityAioMixedImageOnclickListener.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
  }
  
  private void a(SpannableStringBuilder paramSpannableStringBuilder, List paramList)
  {
    if (paramSpannableStringBuilder.length() > 0)
    {
      MessageRecord localMessageRecord = MessageRecordFactory.a(64536);
      sb = new SpannableStringBuilder(paramSpannableStringBuilder);
      paramSpannableStringBuilder.clear();
      paramList.add(localMessageRecord);
    }
  }
  
  private void a(URLDrawable paramURLDrawable)
  {
    if ((AbsDownloader.a(paramURLDrawable.getURL().toString())) && (paramURLDrawable.getStatus() != 1)) {}
    try
    {
      paramURLDrawable.startDownload();
      return;
    }
    catch (OutOfMemoryError paramURLDrawable) {}
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout arg4, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    ??? = (MixedMsgItemBuilder.MixedHolder)paramViewHolder;
    if ((paramViewHolder != null) && (b == null)) {
      b = new StringBuilder();
    }
    int i;
    int j;
    if (!jdField_b_of_type_Boolean)
    {
      if (MixedMsgItemBuilder.MixedHolder.a(???) != null)
      {
        i = 1;
        if (MixedMsgItemBuilder.MixedHolder.a(???) != uniseq) {
          break label89;
        }
      }
      label89:
      for (j = 1;; j = 0)
      {
        if (((j & i) == 0) || (!android.text.TextUtils.isEmpty(paramChatMessage.getExtInfoFromExtStr("sens_msg_ctrl_info")))) {
          break label95;
        }
        return paramView;
        i = 0;
        break;
      }
    }
    label95:
    Object localObject2;
    if ((paramChatMessage instanceof MessageForMixedMsg))
    {
      localObject1 = (MessageForMixedMsg)paramChatMessage;
      if (jdField_b_of_type_Boolean)
      {
        if (!MsgUtils.a(issend)) {
          break label235;
        }
        b.append("发出");
      }
      for (;;)
      {
        synchronized (elemListSyncLock)
        {
          localObject2 = msgElemList.iterator();
          if (!((Iterator)localObject2).hasNext()) {
            break;
          }
          ??? = (MessageRecord)((Iterator)localObject2).next();
          if (!(??? instanceof MessageForPic)) {
            break label248;
          }
          if (jdField_b_of_type_Boolean) {
            b.append("图片");
          }
          ??? = (MessageForPic)???;
          if (time != 0L) {
            continue;
          }
          MessageForMixedMsg.copyBaseInfoFromMixedToPic((MessageForPic)???, (MessageForMixedMsg)localObject1);
        }
        label235:
        b.append("发来");
        continue;
        label248:
        if (jdField_b_of_type_Boolean) {
          b.append(com.tencent.mobileqq.text.TextUtils.a(msg));
        }
      }
      ??? = a(paramViewHolder, (MixedMsgLinearLayout)paramView, msgElemList, paramOnLongClickAndTouchListener);
      MixedMsgItemBuilder.MixedHolder.a((MixedMsgItemBuilder.MixedHolder)paramViewHolder, uniseq);
    }
    do
    {
      do
      {
        do
        {
          paramChatMessage = FileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
          paramView = ???;
          if (paramChatMessage == null) {
            break;
          }
          paramChatMessage.a(???, this);
          return ???;
          ??? = paramView;
        } while (!(paramChatMessage instanceof MessageForLongMsg));
        ??? = (MessageForLongMsg)paramChatMessage;
        if (jdField_b_of_type_Boolean) {
          b.append("说");
        }
        localObject2 = new ArrayList();
        ??? = paramView;
      } while (longMsgFragmentList == null);
      ??? = paramView;
    } while (longMsgFragmentList.isEmpty());
    Object localObject1 = new SpannableStringBuilder();
    ??? = longMsgFragmentList.iterator();
    label420:
    MessageForMixedMsg localMessageForMixedMsg;
    while (???.hasNext())
    {
      ??? = (MessageRecord)???.next();
      if ((??? instanceof MessageForText))
      {
        ((SpannableStringBuilder)localObject1).append(sb);
      }
      else if ((??? instanceof MessageForPic))
      {
        a((SpannableStringBuilder)localObject1, (List)localObject2);
        ((List)localObject2).add(???);
      }
      else if ((??? instanceof MessageForMixedMsg))
      {
        localMessageForMixedMsg = (MessageForMixedMsg)???;
      }
    }
    for (;;)
    {
      MessageRecord localMessageRecord;
      synchronized (elemListSyncLock)
      {
        j = msgElemList.size();
        i = 0;
        if (i >= j) {
          break label656;
        }
        localMessageRecord = (MessageRecord)msgElemList.get(i);
        if ((localMessageRecord instanceof MessageForPic))
        {
          if (time == 0L) {
            MessageForMixedMsg.copyBaseInfoFromMixedToPic((MessageForPic)localMessageRecord, localMessageForMixedMsg);
          }
          a((SpannableStringBuilder)localObject1, (List)localObject2);
          ((List)localObject2).add(localMessageRecord);
        }
        else if ((localMessageRecord instanceof MessageForText))
        {
          ((SpannableStringBuilder)localObject1).append(sb);
        }
      }
      ((List)localObject2).add(localMessageRecord);
      break label727;
      label656:
      break label420;
      a((SpannableStringBuilder)localObject1, (List)localObject2);
      paramView = a(paramViewHolder, (MixedMsgLinearLayout)paramView, (List)localObject2, paramOnLongClickAndTouchListener);
      MixedMsgItemBuilder.MixedHolder.a((MixedMsgItemBuilder.MixedHolder)paramViewHolder, uniseq);
      ??? = paramView;
      if (!jdField_b_of_type_Boolean) {
        break;
      }
      b.append(com.tencent.mobileqq.text.TextUtils.c(((SpannableStringBuilder)localObject1).toString()));
      ??? = paramView;
      break;
      label727:
      i += 1;
    }
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new MixedMsgItemBuilder.MixedHolder(this);
  }
  
  public MixedMsgLinearLayout a(BaseBubbleBuilder.ViewHolder paramViewHolder, MixedMsgLinearLayout paramMixedMsgLinearLayout, List paramList, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    ArrayList localArrayList = new ArrayList(paramList);
    paramList = paramMixedMsgLinearLayout;
    if (paramMixedMsgLinearLayout == null)
    {
      paramList = new MixedMsgLinearLayout(jdField_a_of_type_AndroidContentContext);
      paramList.setId(2131296325);
      paramList.setOrientation(1);
      paramList.setFocusable(false);
      paramList.setClickable(true);
      paramList.setMinimumHeight(AIOUtils.a(44.0F, jdField_a_of_type_AndroidContentContext.getResources()));
      paramList.setPadding(2131493039, 2131493037, 2131493040, 2131493038);
      paramMixedMsgLinearLayout = new RelativeLayout.LayoutParams(-2, -2);
      paramMixedMsgLinearLayout.addRule(1, 2131296683);
      paramMixedMsgLinearLayout.addRule(3, 2131297497);
      leftMargin = AIOUtils.a(3.0F, jdField_a_of_type_AndroidContentContext.getResources());
      rightMargin = AIOUtils.a(3.0F, jdField_a_of_type_AndroidContentContext.getResources());
      paramList.setLayoutParams(paramMixedMsgLinearLayout);
      jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick = jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick;
      MixedMsgItemBuilder.MixedHolder.a((MixedMsgItemBuilder.MixedHolder)paramViewHolder, paramList);
    }
    paramList.a(localArrayList);
    int j = localArrayList.size();
    int i = 0;
    while (i < j)
    {
      paramMixedMsgLinearLayout = (MessageRecord)localArrayList.get(i);
      paramViewHolder = paramList.getChildAt(i);
      if (paramViewHolder == null)
      {
        if (QLog.isColorLevel()) {
          QLog.e(jdField_b_of_type_JavaLangString, 2, "getMixedMsgLayout,child is null. size = " + j + ",i = " + i);
        }
        i += 1;
      }
      else
      {
        Object localObject;
        if ((paramMixedMsgLinearLayout instanceof MessageForText))
        {
          localObject = (AnimationTextView)paramViewHolder;
          ((AnimationTextView)localObject).setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
          ((AnimationTextView)localObject).setText(sb);
          label309:
          paramMixedMsgLinearLayout = (LinearLayout.LayoutParams)paramViewHolder.getLayoutParams();
          topMargin = BaseChatItemLayout.p;
          if (i != j - 1) {
            break label524;
          }
        }
        label524:
        for (bottomMargin = BaseChatItemLayout.p;; bottomMargin = 0)
        {
          paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
          paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
          break;
          if ((paramMixedMsgLinearLayout instanceof MessageForPic))
          {
            paramMixedMsgLinearLayout = (MessageForPic)paramMixedMsgLinearLayout;
            localObject = (ChatThumbView)paramViewHolder;
            URLDrawable localURLDrawable = PicItemBuilder.a(jdField_a_of_type_AndroidContentContext, paramMixedMsgLinearLayout, (ChatThumbView)localObject);
            ((ChatThumbView)localObject).setTag(2131296339, paramMixedMsgLinearLayout);
            ((ChatThumbView)localObject).setImageDrawable(localURLDrawable);
            if (QLog.isColorLevel()) {
              QLog.d(jdField_b_of_type_JavaLangString, 2, "getMixedMsgLayout,set picmsg, picDrawable " + localURLDrawable + ",picMsg = " + paramMixedMsgLinearLayout);
            }
            ((ChatThumbView)localObject).setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
            a(localURLDrawable);
            if (paramMixedMsgLinearLayout.isSendFromLocal()) {
              break label309;
            }
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramMixedMsgLinearLayout, 2);
            break label309;
          }
          if (!QLog.isColorLevel()) {
            break label309;
          }
          QLog.e(jdField_b_of_type_JavaLangString, 2, "mixed type not support yet." + paramMixedMsgLinearLayout.getClass().getSimpleName());
          break label309;
        }
      }
    }
    paramList.setOnTouchListener(paramOnLongClickAndTouchListener);
    paramList.setOnLongClickListener(paramOnLongClickAndTouchListener);
    b = jdField_a_of_type_ComTencentMobileqqWidgetAnimationTextView$OnDoubleClick;
    return paramList;
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    return "";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      super.a(paramInt, paramContext, paramChatMessage);
      return;
    case 2131304463: 
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
      return;
    case 2131304473: 
      super.b(paramChatMessage);
      return;
    case 2131304469: 
      ((ClipboardManager)jdField_a_of_type_AndroidContentContext.getSystemService("clipboard")).setText(MessageForMixedMsg.getTextFromMixedMsg(paramChatMessage));
      return;
    case 2131298639: 
      paramChatMessage = MessageForMixedMsg.getTextFromMixedMsg(paramChatMessage);
      paramContext = new Bundle();
      paramContext.putInt("forward_type", -1);
      paramContext.putString("forward_text", paramChatMessage.toString());
      paramChatMessage = new Intent();
      paramChatMessage.putExtras(paramContext);
      ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramChatMessage, 21);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005637", "0X8005637", 0, 0, "", "", "", "");
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "", "", "", "");
      return;
    case 2131299653: 
      QfavBuilder.b(paramChatMessage).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
      QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 8);
      return;
    }
    super.a(paramChatMessage);
  }
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    if (((e != 1) && (e != 131075)) || (paramInt1 != 2003)) {}
    label86:
    label171:
    label250:
    label322:
    label376:
    label468:
    label470:
    label476:
    label484:
    for (;;)
    {
      return;
      MixedMsgItemBuilder.MixedHolder localMixedHolder = (MixedMsgItemBuilder.MixedHolder)AIOUtils.a(paramView);
      paramView = null;
      Object localObject1;
      if ((a instanceof MessageForMixedMsg))
      {
        paramView = (MessageForMixedMsg)a;
        if ((MixedMsgItemBuilder.MixedHolder.a(localMixedHolder) != null) && (paramView != null) && (msgElemList != null)) {
          for (paramView = msgElemList.iterator(); paramView.hasNext(); paramView = (MessageForPic)localObject1)
          {
            localObject1 = (MessageRecord)paramView.next();
            if ((localObject1 == null) || (uniseq != c) || (!(localObject1 instanceof MessageForPic)) || (subMsgId != d)) {
              break label86;
            }
          }
        }
      }
      else
      {
        for (;;)
        {
          if (paramView == null) {
            break label484;
          }
          paramInt2 = MixedMsgItemBuilder.MixedHolder.a(localMixedHolder).getChildCount();
          paramInt1 = 0;
          Object localObject2;
          if (paramInt1 < paramInt2)
          {
            paramFileMsg = MixedMsgItemBuilder.MixedHolder.a(localMixedHolder).getChildAt(paramInt1);
            if ((paramFileMsg instanceof ChatThumbView))
            {
              localObject1 = ((ChatThumbView)paramFileMsg).getTag(2131296339);
              if (((localObject1 instanceof MessageForPic)) && (uniseq == uniseq) && (subMsgId == subMsgId))
              {
                paramFileMsg = (ChatThumbView)paramFileMsg;
                if (paramFileMsg == null) {
                  break label468;
                }
                paramFileMsg.setImageDrawable(PicItemBuilder.a(jdField_a_of_type_AndroidContentContext, paramView, paramFileMsg));
                return;
                if (!(a instanceof MessageForLongMsg)) {
                  break label476;
                }
                localObject1 = (MessageForLongMsg)a;
                if ((longMsgFragmentList == null) || (longMsgFragmentList.isEmpty())) {
                  break label476;
                }
                localObject1 = longMsgFragmentList.iterator();
                do
                {
                  if (!((Iterator)localObject1).hasNext()) {
                    break;
                  }
                  localObject2 = (MessageRecord)((Iterator)localObject1).next();
                } while (localObject2 == null);
                if (uniseq != c) {
                  break label470;
                }
                if ((localObject2 instanceof MessageForPic)) {
                  paramView = (MessageForPic)localObject2;
                }
              }
            }
          }
          for (;;)
          {
            break label322;
            if ((localObject2 instanceof MessageForMixedMsg))
            {
              localObject2 = msgElemList.iterator();
              for (;;)
              {
                if (((Iterator)localObject2).hasNext())
                {
                  MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject2).next();
                  if (((localMessageRecord instanceof MessageForPic)) && (subMsgId == d))
                  {
                    paramView = (MessageForPic)localMessageRecord;
                    break label376;
                    paramInt1 += 1;
                    break label171;
                    paramFileMsg = null;
                    break label250;
                    break;
                  }
                }
              }
            }
          }
          continue;
          paramView = null;
          continue;
          paramView = null;
        }
      }
    }
  }
  
  protected void a(BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, ChatMessage paramChatMessage, BubbleInfo paramBubbleInfo)
  {
    MixedMsgItemBuilder.MixedHolder localMixedHolder = (MixedMsgItemBuilder.MixedHolder)paramViewHolder;
    if ((c == 0) || (!paramBubbleInfo.a()))
    {
      paramView = paramView.getResources();
      if (paramChatMessage.isSend())
      {
        paramViewHolder = paramView.getColorStateList(2131428186);
        if (!paramChatMessage.isSend()) {
          break label79;
        }
      }
      label79:
      for (paramView = paramView.getColorStateList(2131428185);; paramView = paramView.getColorStateList(2131428184))
      {
        MixedMsgItemBuilder.MixedHolder.a(localMixedHolder).a(paramViewHolder, paramView);
        return;
        paramViewHolder = paramView.getColorStateList(2131428183);
        break;
      }
    }
    paramViewHolder = ColorStateList.valueOf(-16777216);
    paramView = paramView.getResources().getColorStateList(2131428184);
    if (d != 0) {
      paramViewHolder = ColorStateList.valueOf(d);
    }
    if (e != 0) {
      paramView = ColorStateList.valueOf(e);
    }
    MixedMsgItemBuilder.MixedHolder.a(localMixedHolder).a(paramViewHolder, paramView);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = (MixedMsgItemBuilder.MixedHolder)AIOUtils.a(paramView);
    ChatMessage localChatMessage = a;
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    localQQCustomMenu.a(jdField_a_of_type_AndroidContentContext.getString(2131367007));
    localQQCustomMenu.a(2131304469, jdField_a_of_type_AndroidContentContext.getString(2131367714));
    localQQCustomMenu.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
    a(localChatMessage, localQQCustomMenu);
    localQQCustomMenu.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
    if (a.isSend()) {
      a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a);
    }
    ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
    return localQQCustomMenu.a();
  }
}
