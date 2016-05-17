package com.tencent.mobileqq.activity.messagesearch;

import android.content.Context;
import android.content.res.Resources;
import android.os.SystemClock;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.anonymous.AnonymousChatHelper.AnonymousExtInfo;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.MessageRoamManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.util.FaceDrawable;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import lvs;
import lvt;
import lvu;
import mqq.os.MqqHandler;

public class C2CMessageResultAdapter
  extends BaseMessageResultAdapter
{
  public Set a;
  public List b;
  
  public C2CMessageResultAdapter(Context paramContext, MqqWeakReferenceHandler paramMqqWeakReferenceHandler, SessionInfo paramSessionInfo, QQAppInterface paramQQAppInterface)
  {
    super(paramContext, paramMqqWeakReferenceHandler, paramSessionInfo, paramQQAppInterface);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = new ArrayList();
    jdField_a_of_type_JavaUtilSet = new HashSet();
  }
  
  public void a()
  {
    jdField_a_of_type_JavaUtilList.clear();
    notifyDataSetChanged();
  }
  
  void a(String paramString, long paramLong)
  {
    b.clear();
    jdField_a_of_type_JavaUtilSet.clear();
    if (QLog.isColorLevel()) {
      QLog.d("C2CMessageResultAdapter", 2, "displayCloudMessages...");
    }
    ThreadManager.b().post(new lvt(this, paramString, paramLong));
  }
  
  void a(List paramList)
  {
    long l = SystemClock.uptimeMillis();
    if (paramList.size() > 0) {
      Collections.sort(paramList, new lvu(this));
    }
    if (QLog.isColorLevel()) {
      QLog.d("C2CMessageResultAdapter", 2, "resortRecords cost time: " + (SystemClock.uptimeMillis() - l));
    }
  }
  
  public void a(List paramList, int paramInt1, boolean paramBoolean, int paramInt2)
  {
    Object localObject;
    int i;
    if (QLog.isColorLevel())
    {
      localObject = new StringBuilder().append("setMessageItems loadType: ").append(paramInt1).append(", searchMode: ").append(paramInt2).append(", cloudGetCompleted: ").append(paramBoolean).append(", messageItems size: ");
      if (paramList == null)
      {
        i = 0;
        QLog.d("C2CMessageResultAdapter", 2, i);
      }
    }
    else
    {
      if ((paramInt1 != 1) || (paramInt2 != 0)) {
        break label103;
      }
      b(paramList);
      jdField_a_of_type_JavaUtilList = paramList;
    }
    label103:
    do
    {
      do
      {
        return;
        i = paramList.size();
        break;
        if ((paramInt1 == 2) && (paramInt2 == 0))
        {
          b(paramList);
          jdField_a_of_type_JavaUtilList.addAll(paramList);
          return;
        }
      } while ((paramInt1 != 4) || (paramList == null) || (paramList.size() == 0) || (paramInt2 != 1));
      b(paramList, paramBoolean);
      if ((jdField_a_of_type_JavaUtilList.size() <= 0) || (paramList.size() <= 0)) {
        break label253;
      }
      localObject = (MessageItem)paramList.get(0);
      MessageItem localMessageItem = (MessageItem)jdField_a_of_type_JavaUtilList.get(jdField_a_of_type_JavaUtilList.size() - 1);
      if (a.time <= a.time) {
        break label253;
      }
    } while (!QLog.isColorLevel());
    QLog.e("C2CMessageResultAdapter", 2, "setMessageItems: error firstItem time > lastItem time");
    return;
    label253:
    b(paramList);
    jdField_a_of_type_JavaUtilList.addAll(paramList);
  }
  
  public void a(List paramList, String paramString, long paramLong)
  {
    b.clear();
    if (QLog.isColorLevel()) {
      QLog.d("C2CMessageResultAdapter", 2, "displayCloudMessages...");
    }
    ThreadManager.a(new lvs(this, paramString, paramLong, paramList), 8, null, false);
  }
  
  public void a(List paramList, boolean paramBoolean)
  {
    if ((paramList == null) || (paramList.size() <= 0)) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("C2CMessageResultAdapter", 2, "mergeMsgsAtFirstTime: merge cloud and local msgs cloudGetCompleted: " + paramBoolean);
    }
    jdField_a_of_type_JavaUtilList.clear();
    b(paramList, paramBoolean);
    b(paramList);
    jdField_a_of_type_JavaUtilList.addAll(paramList);
  }
  
  public void b(List paramList)
  {
    if ((paramList == null) || (paramList.size() <= 0)) {
      return;
    }
    long l = NetConnInfoCenter.getServerTime();
    Object localObject = (MessageRoamManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(91);
    Calendar localCalendar = ((MessageRoamManager)localObject).c();
    if (localCalendar != null) {
      l = ((Long)asecond).longValue();
    }
    int i = 0;
    int j = paramList.size();
    label72:
    if (i < j)
    {
      localObject = paramList.get(i);
      if (!(localObject instanceof MessageItem)) {
        break label153;
      }
      localObject = a;
    }
    for (;;)
    {
      label104:
      int k;
      if ((localObject != null) && (time > l))
      {
        paramList.remove(i);
        k = j - 1;
        j = i - 1;
        i = k;
      }
      for (;;)
      {
        k = j + 1;
        j = i;
        i = k;
        break label72;
        break;
        label153:
        if (!(localObject instanceof MessageRecord)) {
          break label182;
        }
        localObject = (MessageRecord)localObject;
        break label104;
        k = i;
        i = j;
        j = k;
      }
      label182:
      localObject = null;
    }
  }
  
  void b(List paramList, boolean paramBoolean)
  {
    int k = 1;
    int m = 0;
    if (QLog.isColorLevel()) {
      QLog.d("C2CMessageResultAdapter", 2, "mergeMessageItems localSize: " + b.size() + ", cloudSize:" + paramList.size() + ", cloudCompleted:" + paramBoolean);
    }
    if ((b.size() == 0) || ((paramList.size() == 0) && (!paramBoolean))) {}
    do
    {
      return;
      localObject = new ArrayList();
      if (!paramBoolean) {
        break label512;
      }
      if (!jdField_a_of_type_JavaUtilList.isEmpty()) {
        break;
      }
      paramList.addAll(b);
      i = k;
      if (QLog.isColorLevel())
      {
        QLog.d("C2CMessageResultAdapter", 2, "mergeMessageItems completed and adapter is empty add all local");
        i = k;
      }
      if (((List)localObject).size() > 0)
      {
        b.removeAll((Collection)localObject);
        if (QLog.isColorLevel()) {
          QLog.d("C2CMessageResultAdapter", 2, "mergeMessageItems removed validItem size: " + ((List)localObject).size());
        }
      }
    } while (i == 0);
    Object localObject = new HashSet();
    int i = m;
    label225:
    if (i < paramList.size())
    {
      long l1 = geta.shmsgseq;
      if (((Set)localObject).contains(Long.valueOf(l1)))
      {
        paramList.remove(i);
        i -= 1;
      }
      for (;;)
      {
        i += 1;
        break label225;
        l1 = jdField_a_of_type_JavaUtilList.get(jdField_a_of_type_JavaUtilList.size() - 1)).a.time;
        int j = 0;
        i = 0;
        while (j < b.size())
        {
          if (b.get(j)).a.time < l1)
          {
            ((List)localObject).add(b.get(j));
            i = 1;
          }
          j += 1;
        }
        paramList.addAll((Collection)localObject);
        if (QLog.isColorLevel()) {
          QLog.d("C2CMessageResultAdapter", 2, "mergeMessageItems completed  merge local size: " + ((List)localObject).size());
        }
        j = i;
        if (paramList.size() < 20)
        {
          paramList.addAll(b);
          i = k;
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d("C2CMessageResultAdapter", 2, "mergeMessageItems add all local local size: " + b.size());
          i = k;
          break;
          label512:
          if (jdField_a_of_type_JavaUtilList.isEmpty())
          {
            l1 = getsize1a.time;
            j = 0;
            i = 0;
            while (j < b.size())
            {
              if (b.get(j)).a.time >= l1)
              {
                ((List)localObject).add(b.get(j));
                i = 1;
              }
              j += 1;
            }
            paramList.addAll((Collection)localObject);
            if (QLog.isColorLevel()) {
              QLog.d("C2CMessageResultAdapter", 2, "mergeMessageItems uncompleted first screem merger local size: " + ((List)localObject).size());
            }
            break;
          }
          l1 = jdField_a_of_type_JavaUtilList.get(jdField_a_of_type_JavaUtilList.size() - 1)).a.time;
          long l2 = getsize1a.time;
          j = 0;
          for (i = 0; j < b.size(); i = k)
          {
            long l3 = b.get(j)).a.time;
            k = i;
            if (l2 <= l3)
            {
              k = i;
              if (l3 < l1)
              {
                ((List)localObject).add(b.get(j));
                k = 1;
              }
            }
            j += 1;
          }
          paramList.addAll((Collection)localObject);
          j = i;
          if (QLog.isColorLevel())
          {
            QLog.d("C2CMessageResultAdapter", 2, "mergeMessageItems uncompleted load more merger local size: " + ((List)localObject).size());
            j = i;
          }
        }
        i = j;
        break;
        ((Set)localObject).add(Long.valueOf(l1));
      }
    }
    a(paramList);
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    MessageItem localMessageItem = (MessageItem)getItem(paramInt);
    MessageRecord localMessageRecord;
    String str;
    Object localObject;
    if (paramView == null)
    {
      paramView = View.inflate(jdField_a_of_type_AndroidContentContext, 2130903400, null);
      paramViewGroup = new BaseMessageResultAdapter.MessageHolder();
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131297636));
      b = ((TextView)paramView.findViewById(2131297640));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131296683));
      c = ((TextView)paramView.findViewById(2131298321));
      paramView.setTag(paramViewGroup);
      localMessageRecord = a;
      str = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, localMessageRecord.isSend(), senderuin);
      b.setText(localMessageItem.a(msg));
      if (!localMessageRecord.isSend()) {
        break label262;
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      label158:
      if (!AnonymousChatHelper.a(localMessageRecord)) {
        break label274;
      }
      localObject = AnonymousChatHelper.a(localMessageRecord);
      jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_AndroidContentContext.getResources().getString(2131364597) + jdField_b_of_type_JavaLangString);
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(URLDrawable.getDrawable(AnonymousChatHelper.a(jdField_b_of_type_Int)));
    }
    for (;;)
    {
      c.setText(localMessageItem.a(time));
      return paramView;
      paramViewGroup = (BaseMessageResultAdapter.MessageHolder)paramView.getTag();
      break;
      label262:
      localObject = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a;
      break label158;
      label274:
      jdField_a_of_type_AndroidWidgetTextView.setText(localMessageItem.a(str));
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(FaceDrawable.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 1, (String)localObject));
    }
  }
}
