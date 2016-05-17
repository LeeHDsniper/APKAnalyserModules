package com.tencent.mobileqq.activity.aio.tips;

import android.app.Activity;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import android.text.format.Time;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.av.utils.UITools;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.config.operation.QQOperateManager;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.HashSet;
import java.util.List;
import mqq.app.MobileQQ;

public class DiscFreqPttGrayTips
  implements GrayTipsTask
{
  private static final String jdField_a_of_type_JavaLangString = DiscFreqPttGrayTips.class.getSimpleName();
  private Time jdField_a_of_type_AndroidTextFormatTime;
  private ChatAdapter1 jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public DiscFreqPttGrayTips(QQAppInterface paramQQAppInterface, TipsManager paramTipsManager, Activity paramActivity, SessionInfo paramSessionInfo, ChatAdapter1 paramChatAdapter1)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1 = paramChatAdapter1;
  }
  
  public int a()
  {
    return 1001;
  }
  
  public MessageRecord a(Object... paramVarArgs)
  {
    paramVarArgs = MessageRecordFactory.a(64520);
    long l = MessageCache.a();
    String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    paramVarArgs.init(str, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, str, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131367017), l, 64519, 3000, l);
    isread = true;
    return paramVarArgs;
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if (paramInt != 1001) {}
    String str;
    boolean bool;
    label461:
    do
    {
      do
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV =====>");
        }
        str = "";
        for (;;)
        {
          try
          {
            if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 3000)
            {
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + "curType != disscusion");
              return;
            }
            localObject1 = QQOperateManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
            if (((QQOperateManager)localObject1).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 2))
            {
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + "hasNetTipShow today");
              return;
            }
            localList = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a();
            if (localList == null)
            {
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + "aioMsgList == null");
              return;
            }
            if (!NetworkUtil.h(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication()))
            {
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + "not wifi");
              return;
            }
            if (localList.size() < 5)
            {
              paramVarArgs = "msgList size < 5, size = " + localList.size();
              return;
            }
            l1 = Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).longValue();
            paramInt = UITools.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
            if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramInt, l1))
            {
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + "current discussion is on voice chating");
              return;
            }
            i = localList.size();
            paramInt = i - 1;
          }
          finally
          {
            Object localObject1;
            List localList;
            long l1;
            SharedPreferences localSharedPreferences;
            Object localObject2;
            Object localObject3;
            int k;
            int m;
            int n;
            long l2;
            if (!QLog.isColorLevel()) {
              continue;
            }
            QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + str);
          }
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "findExcludeMsg :" + bool);
          }
          if (!bool) {
            continue;
          }
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + "findExcludeMsg, just return");
          return;
          if (getmsgtype != 64493) {
            break label1245;
          }
          bool = true;
        }
        l1 = 1000L * MessageCache.a();
        if (jdField_a_of_type_AndroidTextFormatTime == null) {
          jdField_a_of_type_AndroidTextFormatTime = new Time();
        }
        jdField_a_of_type_AndroidTextFormatTime.set(l1);
        paramInt = jdField_a_of_type_AndroidTextFormatTime.year;
        i = jdField_a_of_type_AndroidTextFormatTime.month;
        j = jdField_a_of_type_AndroidTextFormatTime.monthDay;
        paramVarArgs = "voice_disc_ptt_freq_tip_msg_insert_time" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        localSharedPreferences = BaseApplication.getContext().getSharedPreferences("free_call", 0);
        localObject2 = localSharedPreferences.getString(paramVarArgs, null);
        if (QLog.isColorLevel())
        {
          localObject3 = paramInt + "-" + i + "-" + j;
          QLog.d("VoiceTipMsg", 2, "currDate is:" + (String)localObject3 + ",curr hour is:" + jdField_a_of_type_AndroidTextFormatTime.hour + ",discPttFreqTipMsgInsertTime is:" + (String)localObject2);
        }
        if (TextUtils.isEmpty((CharSequence)localObject2)) {
          break;
        }
        jdField_a_of_type_AndroidTextFormatTime.set(Long.parseLong((String)localObject2));
        k = jdField_a_of_type_AndroidTextFormatTime.year;
        m = jdField_a_of_type_AndroidTextFormatTime.month;
        n = jdField_a_of_type_AndroidTextFormatTime.monthDay;
        if ((paramInt != k) || (i != m) || (j != n)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + "already insert discuss ppt frequent tip msg this day");
      return;
      localObject2 = localSharedPreferences.getString("start_group_audio_time" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), null);
      if ((TextUtils.isEmpty((CharSequence)localObject2)) || (l1 - Long.parseLong((String)localObject2) > 600000L)) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + "has startGroupAudio in less 10 mins, just return");
    return;
    l2 = (l1 - 600000L) / 1000L;
    int i = localList.size();
    paramInt = 0;
    localObject2 = new HashSet();
    int j = i - 1;
    for (;;)
    {
      if (j >= 0)
      {
        localObject3 = (ChatMessage)localList.get(j);
        i = paramInt;
        if (time >= l2)
        {
          i = paramInt;
          if (msgtype == 63534)
          {
            i = paramInt;
            if (extraflag == 0)
            {
              i = paramInt + 1;
              ((HashSet)localObject2).add(senderuin);
            }
          }
        }
      }
      else
      {
        i = ((HashSet)localObject2).size();
        if ((paramInt >= 5) && (i >= 2))
        {
          if (!jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(this, new Object[0])) {
            break label1215;
          }
          ((QQOperateManager)localObject1).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 2);
          localObject1 = localSharedPreferences.edit();
          ((SharedPreferences.Editor)localObject1).putString(paramVarArgs, String.valueOf(l1));
          ((SharedPreferences.Editor)localObject1).commit();
        }
        for (;;)
        {
          try
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8003F01", "0X8003F01", 0, 0, "", "", "", "");
            paramVarArgs = "insert discuss ppt frequent tip msg success";
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.d(jdField_a_of_type_JavaLangString, 2, "onAIOEvent() : TYPE_ON_MSG_SENT_RECV <=====, step is:" + paramVarArgs);
            return;
          }
          finally
          {
            str = "insert discuss ppt frequent tip msg success";
          }
          paramVarArgs = "pttMsgNum : " + paramInt + ", msgUinNum : " + i;
          continue;
          label1215:
          paramVarArgs = "";
        }
        label1245:
        label1250:
        for (;;)
        {
          bool = false;
          break;
          for (;;)
          {
            if (paramInt < 0) {
              break label1250;
            }
            if (paramInt >= i - 10) {
              break label461;
            }
            bool = false;
            break;
            paramInt -= 1;
          }
        }
      }
      j -= 1;
      paramInt = i;
    }
  }
  
  public int[] a()
  {
    return null;
  }
}
