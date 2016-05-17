package com.tencent.mobileqq.activity.messagesearch;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatHistorySearchData;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import lvr;

public class BaseMessageResultAdapter
  extends BaseAdapter
{
  protected static final int a = 20;
  private static final String b = MessageResultAdapter.class.getSimpleName();
  protected Context a;
  public SessionInfo a;
  public QQAppInterface a;
  public ChatHistorySearchData a;
  public MqqWeakReferenceHandler a;
  public Object a;
  public String a;
  protected List a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public BaseMessageResultAdapter(Context paramContext, MqqWeakReferenceHandler paramMqqWeakReferenceHandler, SessionInfo paramSessionInfo, QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_JavaLangObject = new Object();
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler = paramMqqWeakReferenceHandler;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  public ChatHistorySearchData a(ChatHistorySearchData paramChatHistorySearchData, ArrayList paramArrayList)
  {
    int i = 0;
    for (;;)
    {
      if (i < 20)
      {
        if (paramChatHistorySearchData == null)
        {
          if (QLog.isColorLevel()) {
            QLog.i(b, 2, "chatHistorySearchData == null");
          }
          return paramChatHistorySearchData;
        }
        if (mSearchData1 == null)
        {
          if (QLog.isColorLevel()) {
            QLog.i(b, 2, "chatHistorySearchData.mSearchData1 == null");
          }
          offset = 0;
          return paramChatHistorySearchData;
        }
        if (QLog.isColorLevel()) {
          QLog.i(b, 2, "chatHistorySearchData.offset = " + offset);
        }
        int k = offset;
        while (k < mSearchData1.size())
        {
          MessageRecord localMessageRecord = (MessageRecord)mSearchData1.get(k);
          offset += 1;
          int j = i;
          if (a(localMessageRecord))
          {
            paramArrayList.add(new MessageItem(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageRecord));
            i += 1;
            j = i;
            if (i == 20)
            {
              if (QLog.isColorLevel()) {
                QLog.i(b, 2, "getMessageRecords, one page, offset = " + offset);
              }
              return paramChatHistorySearchData;
            }
          }
          k += 1;
          i = j;
        }
        if ((mSearchData2 == null) || (mSearchData2.isEmpty()))
        {
          if (QLog.isColorLevel()) {
            QLog.i(b, 2, "chatHistorySearchData.mSearchData2 == null or empty");
          }
          return paramChatHistorySearchData;
        }
        paramChatHistorySearchData = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, mSearchData2);
        if (paramChatHistorySearchData != null) {
          offset = 0;
        }
      }
      else
      {
        return paramChatHistorySearchData;
      }
    }
  }
  
  public String a()
  {
    return jdField_a_of_type_JavaLangString;
  }
  
  public void a(long paramLong, String paramString, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.i(b, 2, "loadMessageResult, keyword = " + paramString + ", loadType = " + paramInt);
    }
    if (paramString == null) {
      return;
    }
    jdField_a_of_type_JavaLangString = paramString;
    MessageItem.a(paramString);
    ThreadManager.a(new lvr(this, paramString, paramInt, paramLong), 8, null, false);
  }
  
  public void a(String paramString)
  {
    jdField_a_of_type_JavaLangString = paramString;
    MessageItem.a(paramString);
  }
  
  public void a(List paramList, int paramInt)
  {
    if (paramInt == 1) {
      jdField_a_of_type_JavaUtilList = paramList;
    }
    while (paramInt != 2) {
      return;
    }
    jdField_a_of_type_JavaUtilList.addAll(paramList);
  }
  
  public boolean a(MessageRecord paramMessageRecord)
  {
    if ((paramMessageRecord == null) || (msg == null) || (msg.trim().length() == 0)) {
      if (QLog.isColorLevel()) {
        QLog.i(b, 2, "isValidData, empty item");
      }
    }
    String str;
    do
    {
      return false;
      str = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, paramMessageRecord.isSend(), senderuin).toLowerCase(Locale.US);
      paramMessageRecord = MessageItem.a(msg).toLowerCase(Locale.US);
    } while ((!str.contains(MessageItem.jdField_a_of_type_JavaLangString)) && (!paramMessageRecord.contains(MessageItem.jdField_a_of_type_JavaLangString)));
    return true;
  }
  
  public int getCount()
  {
    return jdField_a_of_type_JavaUtilList.size();
  }
  
  public Object getItem(int paramInt)
  {
    return jdField_a_of_type_JavaUtilList.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    return paramView;
  }
}
