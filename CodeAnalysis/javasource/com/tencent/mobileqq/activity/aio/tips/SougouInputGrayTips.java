package com.tencent.mobileqq.activity.aio.tips;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import android.text.format.Time;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.List;
import mqq.os.MqqHandler;

public class SougouInputGrayTips
  implements GrayTipsTask, Runnable
{
  private static final int jdField_a_of_type_Int = 10;
  private static final String jdField_a_of_type_JavaLangString = SougouInputGrayTips.class.getSimpleName();
  private static final String jdField_b_of_type_JavaLangString = "key_sougou_input_gray_tips_";
  private static final String c = "key_sougou_input_gray_tips_count_";
  private final long jdField_a_of_type_Long = 604800000L;
  private Context jdField_a_of_type_AndroidContentContext;
  private Time jdField_a_of_type_AndroidTextFormatTime;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private StringBuilder jdField_a_of_type_JavaLangStringBuilder = new StringBuilder("");
  private boolean jdField_a_of_type_Boolean = false;
  private boolean jdField_b_of_type_Boolean;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public SougouInputGrayTips(QQAppInterface paramQQAppInterface, TipsManager paramTipsManager, Context paramContext, SessionInfo paramSessionInfo)
  {
    b = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
  }
  
  private String a(Context paramContext)
  {
    int j = 0;
    jdField_a_of_type_JavaLangStringBuilder.setLength(0);
    Object localObject1 = (InputMethodManager)paramContext.getSystemService("input_method");
    try
    {
      localObject1 = ((InputMethodManager)localObject1).getInputMethodList();
      if (localObject1 == null)
      {
        i = 0;
        while (j < i)
        {
          InputMethodInfo localInputMethodInfo = (InputMethodInfo)((List)localObject1).get(j);
          jdField_a_of_type_JavaLangStringBuilder.append(localInputMethodInfo.loadLabel(paramContext.getPackageManager()));
          jdField_a_of_type_JavaLangStringBuilder.append(" ");
          j += 1;
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "TransactionTooLargeException occursed when getInputMethodList");
        }
        Object localObject2 = null;
        continue;
        int i = localObject2.size();
      }
    }
    return jdField_a_of_type_JavaLangStringBuilder.toString();
  }
  
  private boolean a(Context paramContext)
  {
    long l1 = System.currentTimeMillis();
    paramContext = a(paramContext);
    if ((paramContext.contains("搜狗输入法")) || (paramContext.contains("QQ输入法"))) {}
    for (boolean bool = true;; bool = false)
    {
      long l2 = System.currentTimeMillis();
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "hasInstallSougouOrQQInput ret = " + bool + ", cost:" + (l2 - l1) + " ms");
      }
      return bool;
    }
  }
  
  public int a()
  {
    return 1002;
  }
  
  public MessageRecord a(Object... paramVarArgs)
  {
    paramVarArgs = MessageRecordFactory.a(64522);
    long l = MessageCache.a();
    String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    paramVarArgs.init(str, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, str, "", l, 64493, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, l);
    isread = true;
    return paramVarArgs;
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if (paramInt != 1002) {}
    do
    {
      return;
      paramInt = ((String)paramVarArgs[0]).length();
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "sendContent size = " + paramInt);
      }
    } while (paramInt < 10);
    ThreadManager.b().postDelayed(this, 1000L);
  }
  
  public int[] a()
  {
    return TipsConstants.a;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, ".....run......");
    }
    if (!jdField_a_of_type_Boolean)
    {
      b = a(jdField_a_of_type_AndroidContentContext);
      jdField_a_of_type_Boolean = true;
    }
    if (b) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "installSougouOrQQInput, just return");
      }
    }
    long l1;
    Object localObject1;
    long l2;
    do
    {
      return;
      l1 = System.currentTimeMillis();
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      l2 = System.currentTimeMillis();
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getAIOList cost:" + (l2 - l1) + " ms");
      }
      if (localObject1 != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "aioMsgList == null");
    return;
    int j = ((List)localObject1).size();
    int i = j - 1;
    label172:
    boolean bool;
    if (i >= 0) {
      if (i < j - 11) {
        bool = false;
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "findExcludeMsg :" + bool);
      }
      if (bool) {
        break;
      }
      localObject1 = "key_sougou_input_gray_tips_" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      Object localObject2 = "key_sougou_input_gray_tips_count_" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      SharedPreferences localSharedPreferences = BaseApplication.getContext().getSharedPreferences("free_call", 0);
      String str1 = localSharedPreferences.getString((String)localObject1, "");
      String str2 = localSharedPreferences.getString((String)localObject2, "");
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "sougouInputGrayShowCountStr = " + str2);
      }
      if (!TextUtils.isEmpty(str2))
      {
        j = Integer.parseInt(str2);
        i = j;
        if (j < 2) {
          break label490;
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d(jdField_a_of_type_JavaLangString, 2, "showCount >= 2, just return;");
        return;
        localObject2 = (ChatMessage)((List)localObject1).get(i);
        if ((msgtype == 64522) || (msgtype == 64519) || (msgtype == 64520) || (msgtype == 64495) || (msgtype == 64493) || ((msgtype == 64523) && (istroop == 0)))
        {
          bool = true;
          continue;
        }
        i -= 1;
        break label172;
      }
      i = 0;
      label490:
      l1 = MessageCache.a() * 1000L;
      if (!TextUtils.isEmpty(str1))
      {
        if (jdField_a_of_type_AndroidTextFormatTime == null) {
          jdField_a_of_type_AndroidTextFormatTime = new Time();
        }
        jdField_a_of_type_AndroidTextFormatTime.set(l1);
        j = jdField_a_of_type_AndroidTextFormatTime.year;
        int k = jdField_a_of_type_AndroidTextFormatTime.month;
        int m = jdField_a_of_type_AndroidTextFormatTime.monthDay;
        int n = jdField_a_of_type_AndroidTextFormatTime.hour;
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "curDate :" + j + " - " + k + " - " + m + " - " + n);
        }
        l2 = Long.parseLong(str1);
        jdField_a_of_type_AndroidTextFormatTime.set(l2);
        j = jdField_a_of_type_AndroidTextFormatTime.year;
        k = jdField_a_of_type_AndroidTextFormatTime.month;
        m = jdField_a_of_type_AndroidTextFormatTime.monthDay;
        n = jdField_a_of_type_AndroidTextFormatTime.hour;
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "lastShowDate :" + j + " - " + k + " - " + m + " - " + n);
        }
        if (l1 - l2 > 604800000L) {
          break label793;
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d(jdField_a_of_type_JavaLangString, 2, "has show in a week, just return;");
        return;
      }
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "has never shown sougouInput Gray Tips");
      }
      label793:
      if (!jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(this, new Object[0])) {
        break;
      }
      localSharedPreferences.edit().putString((String)localObject1, String.valueOf(l1)).putString((String)localObject2, String.valueOf(i + 1)).commit();
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80047CE", "0X80047CE", 0, 0, "", "", "", "");
      return;
      bool = false;
    }
  }
}
