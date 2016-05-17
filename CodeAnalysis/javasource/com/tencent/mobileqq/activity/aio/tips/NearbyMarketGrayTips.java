package com.tencent.mobileqq.activity.aio.tips;

import android.os.Handler.Callback;
import android.os.Message;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.NearbyGrayTipsManager;
import com.tencent.mobileqq.app.NearbyGrayTipsManager.GrayTipsConfig;
import com.tencent.mobileqq.app.NearbyGrayTipsManager.Wording;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForNearbyMarketGrayTips;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.CustomHandler;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import mqq.os.MqqHandler;

public class NearbyMarketGrayTips
  implements Handler.Callback, GrayTipsTask
{
  private static final String jdField_a_of_type_JavaLangString = NearbyMarketGrayTips.class.getSimpleName();
  private int jdField_a_of_type_Int;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  private NearbyGrayTipsManager jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private QQMessageFacade jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade;
  private Random jdField_a_of_type_JavaUtilRandom;
  private MqqHandler jdField_a_of_type_MqqOsMqqHandler = new CustomHandler(ThreadManager.b(), this);
  private int b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public NearbyMarketGrayTips(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, TipsManager paramTipsManager)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_Int = -1;
    jdField_a_of_type_JavaUtilRandom = new Random();
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001) {
      b = 1;
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager = ((NearbyGrayTipsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(92));
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade = ((QQMessageFacade)paramQQAppInterface.getManager(19));
      return;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1010) {
        b = 2;
      }
    }
  }
  
  private NearbyGrayTipsManager.GrayTipsConfig a(NearbyGrayTipsManager.GrayTipsConfig paramGrayTipsConfig1, NearbyGrayTipsManager.GrayTipsConfig paramGrayTipsConfig2)
  {
    if (paramGrayTipsConfig1 != null)
    {
      if (paramGrayTipsConfig2 == null) {}
      do
      {
        do
        {
          return paramGrayTipsConfig1;
          if (priority != priority) {
            break;
          }
          if (createTime < createTime) {
            return paramGrayTipsConfig2;
          }
        } while (createTime != createTime);
        return paramGrayTipsConfig1;
      } while (priority >= priority);
      return paramGrayTipsConfig2;
    }
    if (paramGrayTipsConfig2 != null) {
      return paramGrayTipsConfig2;
    }
    return null;
  }
  
  private boolean a(int paramInt, Object... paramVarArgs)
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800524B", "0X800524B", 0, 0, String.valueOf(paramInt), "", "", "");
    return jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(this, paramVarArgs);
  }
  
  public int a()
  {
    return 1006;
  }
  
  public MessageRecord a(Object... paramVarArgs)
  {
    MessageRecord localMessageRecord = null;
    if ((paramVarArgs != null) && (paramVarArgs.length > 0) && (paramVarArgs[0] != null)) {}
    for (paramVarArgs = paramVarArgs[0].toString();; paramVarArgs = null)
    {
      if (!TextUtils.isEmpty(paramVarArgs))
      {
        localMessageRecord = MessageRecordFactory.a(63509);
        long l = MessageCache.a();
        String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        localMessageRecord.init(str, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, str, paramVarArgs, l, 63509, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, l);
        isread = true;
      }
      return localMessageRecord;
    }
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "setOtherGender, " + jdField_a_of_type_Int);
    }
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 4, "onAIOEvent, " + paramInt);
    }
    switch (paramInt)
    {
    }
    do
    {
      return;
    } while (jdField_a_of_type_MqqOsMqqHandler.hasMessages(paramInt));
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(paramInt);
  }
  
  public int[] a()
  {
    return null;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      switch (what)
      {
      }
      break;
    }
    long l1;
    label375:
    NearbyGrayTipsManager.GrayTipsConfig localGrayTipsConfig;
    do
    {
      do
      {
        do
        {
          return false;
          if ((jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a()) && (!jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(MessageCache.a() * 1000L))) {
            break;
          }
          return false;
          l1 = MessageCache.a() * 1000L;
          long l2 = System.currentTimeMillis();
          paramMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          long l3 = System.currentTimeMillis();
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "getAIOList cost:" + (l3 - l2) + " ms");
          }
          if ((paramMessage == null) || (paramMessage.size() <= 0)) {
            break label375;
          }
        } while (jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(paramMessage));
        paramMessage = (ChatMessage)paramMessage.get(paramMessage.size() - 1);
      } while (MessageUtils.a(msgtype));
      if (paramMessage.isSend()) {}
      for (paramMessage = jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(b, jdField_a_of_type_Int, msg, 1, l1); paramMessage != null; paramMessage = jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(b, jdField_a_of_type_Int, msg, 2, l1))
      {
        localObject = paramMessage.getGrayTipWording(jdField_a_of_type_JavaUtilRandom);
        if (localObject == null) {
          break;
        }
        localObject = MessageForNearbyMarketGrayTips.makeGrayTipMsg(id, text, highlightText, 4, url);
        if (TextUtils.isEmpty((CharSequence)localObject)) {
          break;
        }
        if (!a(id, new Object[] { localObject })) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(id, l1);
        break;
      }
      localGrayTipsConfig = a(jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(b, jdField_a_of_type_Int, l1), jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.c(b, jdField_a_of_type_Int, l1));
    } while (localGrayTipsConfig == null);
    jdField_a_of_type_JavaUtilRandom.setSeed(l1);
    Object localObject = localGrayTipsConfig.getGrayTipWording(jdField_a_of_type_JavaUtilRandom);
    if (sceneId == 2)
    {
      if (localObject == null) {
        break label1320;
      }
      paramMessage = MessageForNearbyMarketGrayTips.makeGrayTipMsg(id, text, highlightText, 2, url);
    }
    while (!TextUtils.isEmpty(paramMessage))
    {
      if (!a(id, new Object[] { paramMessage })) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(id, l1);
      break;
      if (sceneId == 4)
      {
        if (localObject != null)
        {
          paramMessage = (Message)localObject;
          if (!TextUtils.isEmpty(text)) {}
        }
        else
        {
          paramMessage = new NearbyGrayTipsManager.Wording();
          text = "不知道如何开口，试试推荐的打招呼吧！";
          highlightText = "打招呼";
        }
        paramMessage = MessageForNearbyMarketGrayTips.makeGrayTipMsg(id, text, highlightText, 8, url);
        continue;
        paramMessage = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        if (jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(paramMessage)) {
          return false;
        }
        l1 = MessageCache.a() * 1000L;
        int i;
        label668:
        label825:
        int j;
        if ((jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a()) && (!jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(l1)))
        {
          i = 1;
          if ((i == 0) || (paramMessage == null) || (paramMessage.size() <= 0)) {
            break label864;
          }
          localObject = (ChatMessage)paramMessage.get(paramMessage.size() - 1);
          if (QLog.isDevelopLevel()) {
            QLog.d("longchen", 4, "last msg=" + ((ChatMessage)localObject).toString());
          }
          if (!MsgUtils.b(issend)) {
            break label1174;
          }
          localObject = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          if (MsgUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (QQMessageFacade.Message)localObject)) {
            break;
          }
          localObject = jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(b, jdField_a_of_type_Int, msg, 1, l1);
          if (paramMessage == null) {
            break label866;
          }
          paramMessage = paramMessage.iterator();
          i = 0;
          j = i;
          if (!paramMessage.hasNext()) {
            break label868;
          }
          if (MessageUtils.a(nextmsgtype)) {
            break label1317;
          }
          i += 1;
        }
        label864:
        label866:
        label868:
        label935:
        label958:
        label981:
        label1114:
        label1125:
        label1137:
        label1172:
        label1174:
        label1317:
        for (;;)
        {
          break label825;
          i = 0;
          break label668;
          break;
          j = 0;
          if (j == 1) {}
          for (paramMessage = jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.b(b, jdField_a_of_type_Int, l1);; paramMessage = null)
          {
            localGrayTipsConfig = a((NearbyGrayTipsManager.GrayTipsConfig)localObject, paramMessage);
            if (QLog.isDevelopLevel())
            {
              StringBuilder localStringBuilder1 = new StringBuilder();
              StringBuilder localStringBuilder2 = localStringBuilder1.append("send msg done. config1 id=");
              if (localObject == null)
              {
                localObject = "null";
                localObject = localStringBuilder2.append(localObject).append("|config2 id=");
                if (paramMessage != null) {
                  break label1114;
                }
                paramMessage = "null";
                localObject = ((StringBuilder)localObject).append(paramMessage).append("|chosen config id=");
                if (localGrayTipsConfig != null) {
                  break label1125;
                }
                paramMessage = "null";
                ((StringBuilder)localObject).append(paramMessage);
                QLog.d("nearby_aio_operation_gray_tips", 4, localStringBuilder1.toString());
              }
            }
            else
            {
              if (localGrayTipsConfig == null) {
                break;
              }
              localObject = localGrayTipsConfig.getGrayTipWording(jdField_a_of_type_JavaUtilRandom);
              if (localObject == null) {
                break;
              }
              paramMessage = null;
              if (sceneId != 1) {
                break label1137;
              }
              paramMessage = MessageForNearbyMarketGrayTips.makeGrayTipMsg(id, text, highlightText, 1, url);
            }
            for (;;)
            {
              if (TextUtils.isEmpty(paramMessage)) {
                break label1172;
              }
              if (!a(id, new Object[] { paramMessage })) {
                break;
              }
              jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(id, l1);
              break;
              localObject = Integer.valueOf(id);
              break label935;
              paramMessage = Integer.valueOf(id);
              break label958;
              paramMessage = Integer.valueOf(id);
              break label981;
              if (sceneId == 3) {
                paramMessage = MessageForNearbyMarketGrayTips.makeGrayTipMsg(id, text, highlightText, 4, url);
              }
            }
            break;
            if (QLog.isDevelopLevel()) {
              QLog.d("nearby_aio_operation_gray_tips", 4, "receive message");
            }
            if (MessageUtils.a(msgtype)) {
              break;
            }
            paramMessage = jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(b, jdField_a_of_type_Int, msg, 2, l1);
            if (paramMessage == null) {
              break;
            }
            localObject = paramMessage.getGrayTipWording(jdField_a_of_type_JavaUtilRandom);
            if (localObject == null) {
              break;
            }
            localObject = MessageForNearbyMarketGrayTips.makeGrayTipMsg(id, text, highlightText, 4, url);
            if (TextUtils.isEmpty((CharSequence)localObject)) {
              break;
            }
            if (!a(id, new Object[] { localObject })) {
              break;
            }
            jdField_a_of_type_ComTencentMobileqqAppNearbyGrayTipsManager.a(id, l1);
            break;
          }
        }
      }
      label1320:
      paramMessage = null;
    }
  }
}
