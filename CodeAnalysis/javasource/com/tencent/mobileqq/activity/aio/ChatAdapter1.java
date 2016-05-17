package com.tencent.mobileqq.activity.aio;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.aio.item.ArkContainerWrapper;
import com.tencent.mobileqq.activity.aio.item.ItemBuilderFactory;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MarkFaceMessage;
import com.tencent.mobileqq.data.MessageForArkApp;
import com.tencent.mobileqq.data.MessageForGrayTips;
import com.tencent.mobileqq.data.MessageForMarketFace;
import com.tencent.mobileqq.data.MessageForTroopUnreadTips;
import com.tencent.mobileqq.emosm.EmosmUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.StartupTracker;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.BubblePopupWindow;
import com.tencent.widget.XBaseAdapter;
import java.util.ArrayList;
import java.util.List;
import kpx;

public class ChatAdapter1
  extends XBaseAdapter
{
  @Deprecated
  public static long a;
  @Deprecated
  public static String a;
  ChatAdapter1.AdapterGetViewListener jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1$AdapterGetViewListener;
  SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  public ItemBuilderFactory a;
  public QQAppInterface a;
  public Boolean a;
  CharSequence jdField_a_of_type_JavaLangCharSequence = null;
  List jdField_a_of_type_JavaUtilList = new ArrayList();
  kpx jdField_a_of_type_Kpx = new kpx(this, null);
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = -1L;
  }
  
  public ChatAdapter1(QQAppInterface paramQQAppInterface, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner, BaseChatPie paramBaseChatPie)
  {
    jdField_a_of_type_JavaLangBoolean = Boolean.valueOf(true);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioItemItemBuilderFactory = new ItemBuilderFactory(paramContext, paramQQAppInterface, paramSessionInfo, paramAIOAnimationConatiner, paramBaseChatPie);
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
  }
  
  public int a(long paramLong)
  {
    int j = getCount();
    int i = 0;
    while (i < j)
    {
      if (getItemId(i) == paramLong) {
        return i;
      }
      i += 1;
    }
    return -1;
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return jdField_a_of_type_JavaUtilList.indexOf(paramChatMessage);
  }
  
  public List a()
  {
    return jdField_a_of_type_JavaUtilList;
  }
  
  public kpx a()
  {
    return jdField_a_of_type_Kpx;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioItemItemBuilderFactory != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioItemItemBuilderFactory.a();
    }
  }
  
  public void a(ChatAdapter1.AdapterGetViewListener paramAdapterGetViewListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1$AdapterGetViewListener = paramAdapterGetViewListener;
  }
  
  public void a(ChatMessage paramChatMessage)
  {
    int i = jdField_a_of_type_JavaUtilList.indexOf(paramChatMessage);
    if (i >= 0)
    {
      if ((paramChatMessage instanceof MessageForArkApp)) {
        arkContainer.b(2);
      }
      jdField_a_of_type_JavaUtilList.remove(paramChatMessage);
      b(i, i);
    }
  }
  
  public void a(List paramList)
  {
    ChatMessage localChatMessage;
    int i;
    int j;
    if (paramList.size() > 0)
    {
      localChatMessage = (ChatMessage)paramList.get(paramList.size() - 1);
      i = 1;
      for (;;)
      {
        if ((localChatMessage instanceof MessageForGrayTips))
        {
          i += 1;
          if (paramList.size() - i >= 0)
          {
            localChatMessage = (ChatMessage)paramList.get(paramList.size() - i);
          }
          else
          {
            j = 0;
            if ((localChatMessage instanceof MessageForMarketFace)) {
              break;
            }
          }
        }
      }
    }
    label85:
    label184:
    label407:
    label413:
    label431:
    for (;;)
    {
      return;
      int k = i + 1;
      Object localObject1;
      Object localObject2;
      if (paramList.size() - k >= 0)
      {
        for (localObject1 = (ChatMessage)paramList.get(paramList.size() - k);; localObject1 = (ChatMessage)paramList.get(paramList.size() - k))
        {
          localObject2 = localObject1;
          i = j;
          if (!(localObject1 instanceof MessageForGrayTips)) {
            break label184;
          }
          k += 1;
          if (paramList.size() - k < 0) {
            break;
          }
        }
        i = 0;
        localObject2 = localObject1;
        if (!(localObject2 instanceof MessageForMarketFace)) {
          break label407;
        }
        paramList = (List)localObject2;
      }
      for (;;)
      {
        if ((i == 0) || (localChatMessage == null) || (paramList == null)) {
          break label431;
        }
        isMarketFaceFlow = false;
        isMarketFaceFlow = false;
        if ((istroop != 1) && (istroop != 3000)) {
          break label85;
        }
        localObject1 = mMarkFaceMessage;
        localObject2 = mMarkFaceMessage;
        if (localObject1 == null)
        {
          localChatMessage.parse();
          localObject1 = mMarkFaceMessage;
        }
        for (;;)
        {
          if (localObject2 == null) {
            paramList.parse();
          }
          for (paramList = mMarkFaceMessage;; paramList = (List)localObject2)
          {
            if ((localObject1 == null) || (paramList == null) || (dwTabID != dwTabID) || (!EmosmUtils.a(sbufID, mediaType).equals(EmosmUtils.a(sbufID, mediaType)))) {
              break label413;
            }
            isMarketFaceFlow = true;
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "Ep_show_follow", 0, 0, "", dwTabID + "", "", "");
            return;
            localObject2 = null;
            i = 0;
            break label184;
            break;
          }
          break;
        }
        j = 1;
        break;
        paramList = null;
        localChatMessage = null;
        i = 1;
      }
    }
  }
  
  public void a(List paramList, CharSequence paramCharSequence)
  {
    int i = 0;
    Object localObject = null;
    ChatMessage localChatMessage;
    if (i < paramList.size())
    {
      localChatMessage = (ChatMessage)paramList.get(i);
      if (((localObject == null) || (time - time > 180L)) && (MessageUtils.b(msgtype))) {}
      for (mNeedTimeStamp = true;; mNeedTimeStamp = false)
      {
        if (i != paramList.size() - 1) {
          isMarketFaceFlow = false;
        }
        i += 1;
        localObject = localChatMessage;
        break;
      }
    }
    jdField_a_of_type_JavaUtilList = paramList;
    if (paramCharSequence != null)
    {
      localChatMessage = (ChatMessage)jdField_a_of_type_JavaUtilList.get(0);
      mNeedGrayTips = true;
      mMessageSource = paramCharSequence;
    }
    if ((localObject != null) && (!isMarketFaceFlow)) {
      a(paramList);
    }
    super.notifyDataSetChanged();
  }
  
  public int b(long paramLong)
  {
    int j;
    if (paramLong < 0L)
    {
      j = -1;
      return j;
    }
    int i = 0;
    for (;;)
    {
      if (i >= jdField_a_of_type_JavaUtilList.size()) {
        break label58;
      }
      j = i;
      if (jdField_a_of_type_JavaUtilList.get(i)).uniseq == paramLong) {
        break;
      }
      i += 1;
    }
    label58:
    return -1;
  }
  
  public void b()
  {
    if (jdField_a_of_type_Kpx.a != null) {
      jdField_a_of_type_Kpx.a.b();
    }
  }
  
  public int c(long paramLong)
  {
    int j;
    if (paramLong < 0L)
    {
      j = -1;
      return j;
    }
    int i = 0;
    for (;;)
    {
      if (i >= jdField_a_of_type_JavaUtilList.size()) {
        break label73;
      }
      ChatMessage localChatMessage = (ChatMessage)jdField_a_of_type_JavaUtilList.get(i);
      if (shmsgseq == paramLong)
      {
        j = i;
        if (!MsgProxyUtils.q(msgtype)) {
          break;
        }
      }
      i += 1;
    }
    label73:
    return -1;
  }
  
  public int getCount()
  {
    return jdField_a_of_type_JavaUtilList.size();
  }
  
  public Object getItem(int paramInt)
  {
    if (paramInt < jdField_a_of_type_JavaUtilList.size()) {
      return jdField_a_of_type_JavaUtilList.get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    long l2 = 0L;
    long l1 = l2;
    if (jdField_a_of_type_JavaUtilList.size() > 0)
    {
      l1 = l2;
      if (paramInt < jdField_a_of_type_JavaUtilList.size()) {
        l1 = jdField_a_of_type_JavaUtilList.get(paramInt)).uniseq;
      }
    }
    return l1;
  }
  
  public int getItemViewType(int paramInt)
  {
    if (paramInt > jdField_a_of_type_JavaUtilList.size() - 1) {
      paramInt = jdField_a_of_type_JavaUtilList.size() - 1;
    }
    for (;;)
    {
      int i = paramInt;
      if (paramInt < 0) {
        i = 0;
      }
      ChatMessage localChatMessage = (ChatMessage)jdField_a_of_type_JavaUtilList.get(i);
      if (localChatMessage != null) {
        localChatMessage.parse();
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioItemItemBuilderFactory.a(localChatMessage);
    }
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (paramInt >= jdField_a_of_type_JavaUtilList.size()) {}
    do
    {
      return paramView;
      ChatMessage localChatMessage1 = (ChatMessage)jdField_a_of_type_JavaUtilList.get(paramInt);
      StartupTracker.a(null, "AIO_ChatAdapter_getView" + " | " + localChatMessage1.getClass().getName());
      ChatItemBuilder localChatItemBuilder = jdField_a_of_type_ComTencentMobileqqActivityAioItemItemBuilderFactory.a(localChatMessage1, this);
      if (paramInt != 0)
      {
        ChatMessage localChatMessage2 = (ChatMessage)jdField_a_of_type_JavaUtilList.get(paramInt - 1);
        if ((localChatMessage2 != null) && ((localChatMessage2 instanceof MessageForTroopUnreadTips))) {
          mNeedTimeStamp = true;
        }
      }
      paramViewGroup = localChatItemBuilder.a(paramInt, jdField_a_of_type_JavaUtilList.size(), localChatMessage1, paramView, paramViewGroup, jdField_a_of_type_Kpx);
      if (paramViewGroup != null) {
        paramViewGroup.setTag(2131296314, localChatMessage1);
      }
      StartupTracker.a("AIO_ChatAdapter_getView" + " | " + localChatMessage1.getClass().getName(), null);
      if (QLog.isColorLevel()) {
        QLog.d("ChatAdapter1", 2, "AIOTime getView " + localChatMessage1.getClass().getName());
      }
      paramView = paramViewGroup;
    } while (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1$AdapterGetViewListener == null);
    jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1$AdapterGetViewListener.a(paramInt, paramViewGroup);
    return paramViewGroup;
  }
  
  public int getViewTypeCount()
  {
    return 56;
  }
  
  public boolean hasStableIds()
  {
    return true;
  }
}
