package com.tencent.mobileqq.activity.aio;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.aio.item.ItemBuilderFactory;
import com.tencent.mobileqq.activity.aio.item.VideoItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.Calendar;
import java.util.List;
import kpz;

public class ChatHistoryAdapterForC2C
  extends ChatAdapter1
{
  public int a;
  public Context a;
  public Calendar a;
  kpz a;
  public Calendar b;
  
  public ChatHistoryAdapterForC2C(QQAppInterface paramQQAppInterface, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner, BaseChatPie paramBaseChatPie)
  {
    super(paramQQAppInterface, paramContext, paramSessionInfo, paramAIOAnimationConatiner, paramBaseChatPie);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = -1;
    jdField_a_of_type_Kpz = new kpz(this, null);
    jdField_a_of_type_AndroidContentContext = paramContext;
  }
  
  public int a(List paramList, int paramInt1, Calendar paramCalendar1, Calendar paramCalendar2, int paramInt2, MessageRecord paramMessageRecord)
  {
    if ((paramList == null) || (paramCalendar1 == null)) {
      return -1;
    }
    Object localObject = null;
    int i = 0;
    if (i < paramList.size())
    {
      ChatMessage localChatMessage = (ChatMessage)paramList.get(i);
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
    i = 0;
    int j;
    if (paramInt1 == 2)
    {
      if ((b != null) && (b.get(1) == paramCalendar1.get(1)) && (b.get(2) == paramCalendar1.get(2)) && (b.get(5) == paramCalendar1.get(5))) {
        return -1;
      }
      b = ((Calendar)paramCalendar1.clone());
      paramInt2 = paramList.size() + 2;
      jdField_a_of_type_JavaUtilList.addAll(0, paramList);
      i = paramInt2;
      if (paramInt1 == 6)
      {
        i = paramInt2;
        if (paramMessageRecord != null)
        {
          j = jdField_a_of_type_JavaUtilList.size();
          paramInt1 = 0;
        }
      }
    }
    else
    {
      for (;;)
      {
        i = paramInt2;
        if (paramInt1 >= j) {
          break label663;
        }
        i = paramInt2;
        if (jdField_a_of_type_JavaUtilList.get(paramInt1)).shmsgseq == shmsgseq)
        {
          if (paramInt1 < j - 1) {}
          for (paramInt2 = paramInt1 + 2;; paramInt2 = paramInt1)
          {
            i = paramInt2;
            if (!QLog.isColorLevel()) {
              break label652;
            }
            QLog.d("ChatHistoryForC2C", 2, "refreshData---> cache id: " + ((ChatMessage)jdField_a_of_type_JavaUtilList.get(paramInt1)).getId() + ", searchRecord id: " + paramMessageRecord.getId() + ",msgseq:" + jdField_a_of_type_JavaUtilList.get(paramInt1)).msgseq + ",searchRecord: " + msgseq + ",selection:" + paramInt2 + ",cacheRecords size:" + j + ",msg text:" + jdField_a_of_type_JavaUtilList.get(paramInt1)).msg + ",search text:" + msg);
            notifyDataSetChanged();
            return paramInt2;
            if (paramInt1 == 3)
            {
              if ((jdField_a_of_type_JavaUtilCalendar != null) && (jdField_a_of_type_JavaUtilCalendar.get(1) == paramCalendar1.get(1)) && (jdField_a_of_type_JavaUtilCalendar.get(2) == paramCalendar1.get(2)) && (jdField_a_of_type_JavaUtilCalendar.get(5) == paramCalendar1.get(5))) {
                return -1;
              }
              jdField_a_of_type_JavaUtilCalendar = ((Calendar)paramCalendar1.clone());
              jdField_a_of_type_JavaUtilList.addAll(paramList);
              break;
            }
            if ((paramInt1 != 5) && (paramInt1 != 6) && (paramInt1 != 1))
            {
              paramInt2 = i;
              if (paramInt1 != 0) {
                break;
              }
            }
            b = ((Calendar)paramCalendar1.clone());
            if (paramCalendar2 != null) {}
            for (jdField_a_of_type_JavaUtilCalendar = ((Calendar)paramCalendar2.clone());; jdField_a_of_type_JavaUtilCalendar = ((Calendar)paramCalendar1.clone()))
            {
              jdField_a_of_type_JavaUtilList.clear();
              paramInt2 = 0;
              jdField_a_of_type_JavaUtilList.addAll(paramList);
              break;
            }
          }
        }
        label652:
        paramInt1 += 1;
        paramInt2 = i;
      }
    }
    label663:
    notifyDataSetChanged();
    return i;
  }
  
  public void b(List paramList)
  {
    if (paramList == null)
    {
      jdField_a_of_type_JavaUtilList.clear();
      return;
    }
    jdField_a_of_type_JavaUtilList.removeAll(paramList);
    paramList.clear();
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    ChatMessage localChatMessage = (ChatMessage)jdField_a_of_type_JavaUtilList.get(paramInt);
    ChatItemBuilder localChatItemBuilder = jdField_a_of_type_ComTencentMobileqqActivityAioItemItemBuilderFactory.a(localChatMessage, this);
    paramView = localChatItemBuilder.a(paramInt, jdField_a_of_type_JavaUtilList.size(), localChatMessage, paramView, paramViewGroup, jdField_a_of_type_Kpz);
    if (paramView != null) {
      paramView.setTag(2131296314, localChatMessage);
    }
    if ((msgtype == 63527) || (msgtype == 63520)) {
      ((VideoItemBuilder)localChatItemBuilder).a(false);
    }
    if (QLog.isColorLevel()) {
      QLog.d("ChatHistoryAdapterForC2C", 2, "AIOTime getView " + localChatMessage.getClass().getName());
    }
    return paramView;
  }
}
