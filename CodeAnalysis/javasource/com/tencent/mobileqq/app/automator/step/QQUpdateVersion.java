package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.message.C2CMessageManager;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class QQUpdateVersion
  extends AsyncStep
{
  private final String c;
  private final String d;
  
  public QQUpdateVersion()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    c = "qq_update_5.6";
    d = "QQUpdateVersion";
  }
  
  private void c()
  {
    int i = 0;
    String str;
    int j;
    Object localObject3;
    Object localObject1;
    if (i < MsgProxyUtils.b.length)
    {
      str = MsgProxyUtils.b[i];
      j = MsgProxyUtils.s[i];
      localObject3 = a.b.a().b(str, j);
      localObject1 = AppConstants.aN;
      if (MsgProxyUtils.a(j) != 1001) {
        break label75;
      }
      localObject1 = AppConstants.aN;
    }
    for (;;)
    {
      if ((localObject3 == null) || (((List)localObject3).isEmpty()))
      {
        return;
        label75:
        if (MsgProxyUtils.a(j) == 1010) {
          localObject1 = AppConstants.aO;
        }
      }
      else
      {
        Object localObject2 = null;
        ArrayList localArrayList = new ArrayList();
        Iterator localIterator = ((List)localObject3).iterator();
        label113:
        while (localIterator.hasNext())
        {
          localObject3 = (MessageRecord)localIterator.next();
          if ((!((String)localObject1).equals(senderuin)) && (MsgProxyUtils.c((MessageRecord)localObject3)))
          {
            if (QLog.isColorLevel()) {
              QLog.d("QQUpdateVersion", 2, "doMergeSayHelloBox oneWay=" + ((MessageRecord)localObject3).getBaseInfoString());
            }
            if (localObject2 != null) {
              break label459;
            }
            localObject2 = localObject3;
          }
        }
        label459:
        for (;;)
        {
          a.b.a().a().a(str, j, senderuin, selfuin, false);
          frienduin = ((String)localObject1);
          ((MessageRecord)localObject3).setStatus(1000);
          localArrayList.add(localObject3);
          break label113;
          if (localArrayList.size() > 0) {
            a.b.a().b(localArrayList);
          }
          if (localObject2 != null)
          {
            a.b.a().a(str, j, frienduin, selfuin);
            localObject3 = MessageRecordFactory.a(msgtype);
            MessageRecord.copyMessageRecordBaseField((MessageRecord)localObject3, localObject2);
            senderuin = ((String)localObject1);
            frienduin = str;
            istroop = j;
            localObject1 = new ArrayList();
            ((List)localObject1).add(localObject3);
            a.b.a().b((List)localObject1);
            a.b.a().b(str, j);
            a.b.a().a().a((MessageRecord)localObject3, true, 2);
            a.b.a().a().a(localObject2, true, 2);
            a.b.a().a(localObject3);
          }
          i += 1;
          break;
        }
      }
    }
  }
  
  protected int a()
  {
    SharedPreferences localSharedPreferences = a.b.a().getSharedPreferences(a.b.a(), 0);
    if (localSharedPreferences.getBoolean("qq_update_5.6", true)) {
      if (QLog.isColorLevel()) {
        QLog.d("QQUpdateVersion", 2, "do qq update 5.6");
      }
    }
    try
    {
      String[] arrayOfString = "6.3.3".split("\\.");
      if ((arrayOfString != null) && (arrayOfString.length >= 2))
      {
        int i = Integer.parseInt(arrayOfString[0]);
        int j = Integer.parseInt(arrayOfString[1]);
        if ((i >= 5) && (j >= 6)) {
          c();
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.w("QQUpdateVersion", 2, localException.getMessage(), localException);
        }
      }
    }
    localSharedPreferences.edit().putBoolean("qq_update_5.6", false).commit();
    return 7;
  }
}
