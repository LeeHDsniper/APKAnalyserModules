package com.tencent.mobileqq.activity.aio.anim;

import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForLongMsg;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsShareMsg;
import com.tencent.mobileqq.structmsg.AbsStructMsgElement;
import com.tencent.mobileqq.structmsg.AbsStructMsgItem;
import com.tencent.mobileqq.structmsg.view.StructMsgItemSummary;
import com.tencent.mobileqq.structmsg.view.StructMsgItemTitle;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kri;
import krj;
import krk;
import krl;
import krm;
import krn;
import kro;
import krp;
import krq;
import krr;
import krs;

public class AioAnimationDetector
{
  public static final int a = 800;
  private static volatile AioAnimationDetector jdField_a_of_type_ComTencentMobileqqActivityAioAnimAioAnimationDetector;
  public static final String a;
  private static final int jdField_b_of_type_Int = 0;
  private static final int c = 1;
  private static final int d = 2;
  private static final int e = 3;
  public volatile long a;
  private Handler jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
  public volatile boolean a;
  private long jdField_b_of_type_Long = -1L;
  private boolean jdField_b_of_type_Boolean = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = AioAnimationDetector.class.getSimpleName();
  }
  
  private AioAnimationDetector()
  {
    jdField_a_of_type_Long = -1L;
    jdField_a_of_type_Boolean = false;
  }
  
  public static AioAnimationDetector a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAioAnimationDetector == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAioAnimationDetector == null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimAioAnimationDetector = new AioAnimationDetector();
      }
      return jdField_a_of_type_ComTencentMobileqqActivityAioAnimAioAnimationDetector;
    }
    finally {}
  }
  
  private void a(QQAppInterface paramQQAppInterface, ChatMessage paramChatMessage, int paramInt)
  {
    String str2 = "";
    String str1;
    if (paramInt == 0) {
      str1 = "0X8004A27";
    }
    for (;;)
    {
      if (!TextUtils.isEmpty(str1)) {
        VipUtils.a(paramQQAppInterface, "Vip_StructuredEgg", str1, str1, 0, 0, new String[0]);
      }
      return;
      str1 = str2;
      if (paramInt == 1) {
        if (istroop == 1)
        {
          str1 = "0X8004A28";
        }
        else
        {
          str1 = str2;
          if (istroop == 3000) {
            str1 = "0X8004A29";
          }
        }
      }
    }
  }
  
  private void a(QQAppInterface paramQQAppInterface, ChatMessage paramChatMessage, int paramInt1, int paramInt2, AioAnimationRule paramAioAnimationRule)
  {
    int j = -1;
    int i;
    if (paramInt1 == 0)
    {
      i = 0;
      if (paramInt2 != 2) {
        break label134;
      }
      if (paramChatMessage.isSendFromLocal()) {
        break label100;
      }
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "Supr-Eggs", "Egg_stack_rec", 0, 0, String.valueOf(i), String.valueOf(jdField_a_of_type_Int), "", "");
    }
    label100:
    label134:
    while (paramInt2 != 3)
    {
      return;
      i = j;
      if (paramInt1 != 1) {
        break;
      }
      if (istroop == 1)
      {
        i = 1;
        break;
      }
      i = j;
      if (istroop != 3000) {
        break;
      }
      i = 2;
      break;
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "Supr-Eggs", "Egg_stack_launch", 0, 0, String.valueOf(i), String.valueOf(jdField_a_of_type_Int), "", "");
      return;
    }
    if (!paramChatMessage.isSendFromLocal())
    {
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "Supr-Eggs", "Egg_jump_rec", 0, 0, String.valueOf(i), String.valueOf(jdField_a_of_type_Int), "", "");
      return;
    }
    ReportController.b(paramQQAppInterface, "CliOper", "", "", "Supr-Eggs", "Egg_jump_launch", 0, 0, String.valueOf(i), String.valueOf(jdField_a_of_type_Int), "", "");
  }
  
  private void a(QQAppInterface paramQQAppInterface, ChatMessage paramChatMessage, AioAnimationRule paramAioAnimationRule)
  {
    boolean bool = false;
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "detect combo =======> isLastStackMessageFromOthers ? " + jdField_b_of_type_Boolean + "  lastStackMessageSeq=" + jdField_b_of_type_Long + "thisMessageSeq=" + shmsgseq);
    }
    if ((paramChatMessage.isSendFromLocal()) && (jdField_b_of_type_Boolean) && (shmsgseq == jdField_b_of_type_Long + 1L)) {
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "Supr-Eggs", "Eggs_stack_new", 0, 0, String.valueOf(0), String.valueOf(jdField_a_of_type_Int), "", "");
    }
    if (!paramChatMessage.isSendFromLocal()) {
      bool = true;
    }
    jdField_b_of_type_Boolean = bool;
    jdField_b_of_type_Long = shmsgseq;
  }
  
  public String a(AbsShareMsg paramAbsShareMsg)
  {
    if ((paramAbsShareMsg != null) && (paramAbsShareMsg.getItemCount() > 0))
    {
      StringBuilder localStringBuilder = new StringBuilder();
      paramAbsShareMsg = paramAbsShareMsg.iterator();
      while (paramAbsShareMsg.hasNext())
      {
        Object localObject = (AbsStructMsgElement)paramAbsShareMsg.next();
        if ((localObject instanceof AbsStructMsgItem))
        {
          localObject = jdField_a_of_type_JavaUtilArrayList.iterator();
          while (((Iterator)localObject).hasNext())
          {
            AbsStructMsgElement localAbsStructMsgElement = (AbsStructMsgElement)((Iterator)localObject).next();
            String str = jdField_a_of_type_JavaLangString;
            if ("title".equals(str)) {
              localStringBuilder.append(((StructMsgItemTitle)localAbsStructMsgElement).b());
            } else if ("summary".equals(str)) {
              localStringBuilder.append(((StructMsgItemSummary)localAbsStructMsgElement).b());
            }
          }
        }
      }
      return localStringBuilder.toString();
    }
    return "";
  }
  
  public ArrayList a(ChatMessage paramChatMessage)
  {
    AioAnimationRule localAioAnimationRule = null;
    Object localObject1 = null;
    Iterator localIterator = null;
    Object localObject2 = localIterator;
    if (paramChatMessage != null)
    {
      if (a(paramChatMessage)) {
        break label32;
      }
      localObject2 = localIterator;
    }
    label32:
    Object localObject3;
    do
    {
      return localObject2;
      localObject3 = AioAnimationConfigHelper.a().a();
      if (localObject3 != null) {
        break;
      }
      localObject2 = localIterator;
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "match : rules == null, just return;");
    return null;
    paramChatMessage.parse();
    long l1 = System.currentTimeMillis();
    if (b(paramChatMessage))
    {
      localObject2 = a((AbsShareMsg)structingMsg);
      label98:
      if (TextUtils.isEmpty((CharSequence)localObject2)) {
        break label272;
      }
      localIterator = ((ArrayList)localObject3).iterator();
      paramChatMessage = localAioAnimationRule;
      label116:
      localObject1 = paramChatMessage;
      if (!localIterator.hasNext()) {
        break label272;
      }
      localAioAnimationRule = (AioAnimationRule)localIterator.next();
      if (jdField_a_of_type_JavaUtilArrayList == null) {
        break label329;
      }
      localObject1 = jdField_a_of_type_JavaUtilArrayList.iterator();
      for (;;)
      {
        if (((Iterator)localObject1).hasNext())
        {
          localObject3 = (String)((Iterator)localObject1).next();
          if ((localObject2 != null) && (((String)localObject2).contains((CharSequence)localObject3))) {
            if (paramChatMessage == null)
            {
              paramChatMessage = new ArrayList();
              label208:
              paramChatMessage.add(localAioAnimationRule);
              localObject1 = paramChatMessage;
              if (QLog.isColorLevel()) {
                QLog.d(jdField_a_of_type_JavaLangString, 2, "matched ===> rule: id=" + jdField_a_of_type_Int);
              }
            }
          }
        }
      }
    }
    label272:
    label329:
    for (localObject1 = paramChatMessage;; localObject1 = paramChatMessage)
    {
      paramChatMessage = (ChatMessage)localObject1;
      break label116;
      localObject2 = msg;
      break label98;
      long l2 = System.currentTimeMillis();
      localObject2 = localObject1;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d(jdField_a_of_type_JavaLangString, 2, "match duration: " + (l2 - l1) + " ms");
      return localObject1;
      break label208;
    }
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidOsHandler != null) {
      jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
    }
    jdField_a_of_type_Long = -1L;
  }
  
  public void a(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    if ((paramQQAppInterface == null) || (paramSessionInfo == null) || (paramAIOAnimationConatiner == null)) {}
    for (;;)
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "handleUnreadMsgList, hasUnRead=" + jdField_a_of_type_Boolean);
      }
      if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_Int != 1008))
      {
        int j = 0;
        int i;
        if ((jdField_a_of_type_Int == 1) || (jdField_a_of_type_Int == 3000)) {
          i = 1;
        }
        while ((i != 0) || (j != 0))
        {
          paramSessionInfo = paramQQAppInterface.a().a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
          long l = jdField_a_of_type_Long;
          j = 0;
          int n = paramSessionInfo.size();
          int m = 0;
          label136:
          ChatMessage localChatMessage;
          int k;
          ArrayList localArrayList;
          if (m < n)
          {
            localChatMessage = (ChatMessage)paramSessionInfo.get(m);
            if (i != 0)
            {
              k = j;
              if (shmsgseq >= l)
              {
                k = j;
                if (!isAioAnimChecked)
                {
                  if (QLog.isColorLevel()) {
                    QLog.d(jdField_a_of_type_JavaLangString, 2, "handleUnreadMsgList, troop&discussion message ===> (" + shmsgseq + ")");
                  }
                  boolean bool = false;
                  if (m == n - 1) {
                    bool = true;
                  }
                  localArrayList = a(localChatMessage);
                  jdField_a_of_type_Long = shmsgseq;
                  if (localArrayList == null) {
                    break label458;
                  }
                  a(paramQQAppInterface, localArrayList, true, localChatMessage, bool, paramAIOAnimationConatiner, j * 800);
                  j += 1;
                }
              }
            }
          }
          label458:
          for (;;)
          {
            k = j;
            for (;;)
            {
              m += 1;
              j = k;
              break label136;
              if (!MsgProxyUtils.c(jdField_a_of_type_Int)) {
                break label461;
              }
              j = 1;
              i = 0;
              break;
              k = j;
              if (time >= l)
              {
                k = j;
                if (!isAioAnimChecked)
                {
                  if (QLog.isColorLevel()) {
                    QLog.d(jdField_a_of_type_JavaLangString, 2, "handleUnreadMsgList, c2c message ===> (" + time + ")");
                  }
                  localArrayList = a(localChatMessage);
                  jdField_a_of_type_Long = time;
                  k = j;
                  if (localArrayList != null)
                  {
                    a(paramQQAppInterface, localArrayList, false, localChatMessage, false, paramAIOAnimationConatiner, j * 800);
                    k = j + 1;
                  }
                }
              }
            }
            jdField_a_of_type_Boolean = false;
            return;
          }
          label461:
          i = 0;
        }
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, MessageRecord paramMessageRecord, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    if (jdField_a_of_type_Boolean) {}
    label70:
    label156:
    label305:
    label406:
    label410:
    for (;;)
    {
      return;
      if (jdField_a_of_type_Long == -1L)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "handleNewMsg, lastMsgIdOrTime == -1, just return");
        }
      }
      else if (jdField_a_of_type_Int != 1008)
      {
        int j = 0;
        int i;
        if ((jdField_a_of_type_Int == 1) || (jdField_a_of_type_Int == 3000)) {
          i = 1;
        }
        for (;;)
        {
          if (((i == 0) && (j == 0)) || (!jdField_a_of_type_JavaLangString.equals(frienduin)) || ((jdField_a_of_type_Int != istroop) && ((j == 0) || (!MsgProxyUtils.c(istroop))))) {
            break label410;
          }
          paramSessionInfo = paramQQAppInterface.a().a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
          paramMessageRecord = a();
          long l = jdField_a_of_type_Long;
          j = paramSessionInfo.size() - 1;
          ChatMessage localChatMessage;
          ArrayList localArrayList;
          if (j >= 0)
          {
            localChatMessage = (ChatMessage)paramSessionInfo.get(j);
            if (i == 0) {
              break label305;
            }
            if (shmsgseq <= l) {
              break;
            }
            if (!isAioAnimChecked)
            {
              if (QLog.isColorLevel()) {
                QLog.d(jdField_a_of_type_JavaLangString, 2, "handle troop&discussion new message ===> (" + shmsgseq + ")");
              }
              localArrayList = paramMessageRecord.a(localChatMessage);
              if (localArrayList != null) {
                paramMessageRecord.a(paramQQAppInterface, localArrayList, true, localChatMessage, true, paramAIOAnimationConatiner, 0);
              }
              jdField_a_of_type_Long = shmsgseq;
            }
          }
          for (;;)
          {
            j -= 1;
            break label156;
            break;
            if (!MsgProxyUtils.c(jdField_a_of_type_Int)) {
              break label406;
            }
            j = 1;
            i = 0;
            break label70;
            if (time <= l) {
              break;
            }
            if (!isAioAnimChecked)
            {
              if (QLog.isColorLevel()) {
                QLog.d(jdField_a_of_type_JavaLangString, 2, "handle c2c new message ===> (" + time + ")");
              }
              localArrayList = paramMessageRecord.a(localChatMessage);
              if (localArrayList != null) {
                paramMessageRecord.a(paramQQAppInterface, localArrayList, false, localChatMessage, true, paramAIOAnimationConatiner, 0);
              }
              jdField_a_of_type_Long = time;
            }
          }
          i = 0;
        }
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, ArrayList paramArrayList, boolean paramBoolean1, ChatMessage paramChatMessage, boolean paramBoolean2, AIOAnimationConatiner paramAIOAnimationConatiner, int paramInt)
  {
    if ((paramQQAppInterface == null) || (paramChatMessage == null) || (paramAIOAnimationConatiner == null) || (paramArrayList == null) || (!a(paramChatMessage))) {}
    do
    {
      return;
      if (!isAioAnimChecked) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "detect : message is checked, just return;");
    return;
    isAioAnimChecked = true;
    paramArrayList = paramArrayList.iterator();
    label64:
    Object localObject1;
    int i;
    int m;
    Object localObject2;
    int k;
    for (;;)
    {
      if (paramArrayList.hasNext())
      {
        localObject1 = (AioAnimationRule)paramArrayList.next();
        i = paramChatMessage.getRepeatCount();
        j = jdField_b_of_type_Int;
        m = c;
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "detect : troopOrDiscussion=" + paramBoolean1 + " matched (" + uniseq + "), rule: id=" + jdField_a_of_type_Int + ",M=" + i + ",X=" + j + ",Y=" + m + ",crazyMode=" + jdField_a_of_type_Boolean);
        }
        if (!paramBoolean1)
        {
          if ((j == 0) && (m == 0))
          {
            if (QLog.isColorLevel()) {
              QLog.d(jdField_a_of_type_JavaLangString, 2, "detect c2c =======>  egg_jumper animation, crazyModeEnable=" + jdField_a_of_type_Boolean);
            }
            a(paramQQAppInterface, paramChatMessage, 0, 3, (AioAnimationRule)localObject1);
            if ((paramChatMessage instanceof MessageForStructing)) {
              a(paramQQAppInterface, paramChatMessage, 0);
            }
            if (jdField_a_of_type_Boolean)
            {
              j = jdField_b_of_type_JavaUtilArrayList.size();
              i = 0;
              while (i < j)
              {
                localObject2 = (AioAnimationRule.JumpImage)jdField_b_of_type_JavaUtilArrayList.get(i);
                localObject2 = AioAnimationRule.JumpImage.a(paramQQAppInterface.getApplication(), (AioAnimationRule.JumpImage)localObject2);
                k = i * 800;
                jdField_a_of_type_AndroidOsHandler.postDelayed(new kri(this, paramAIOAnimationConatiner, (Drawable)localObject2, k), paramInt + k);
                i += 1;
              }
            }
            else
            {
              localObject1 = (AioAnimationRule.JumpImage)jdField_b_of_type_JavaUtilArrayList.get(0);
              localObject1 = AioAnimationRule.JumpImage.a(paramQQAppInterface.getApplication(), (AioAnimationRule.JumpImage)localObject1);
              jdField_a_of_type_AndroidOsHandler.postDelayed(new krl(this, paramAIOAnimationConatiner, (Drawable)localObject1), paramInt);
            }
          }
        }
        else if ((j == 0) && (m == 0))
        {
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "detect =======>  egg_jumper animation ,crazyModeEnable=" + jdField_a_of_type_Boolean);
          }
          a(paramQQAppInterface, paramChatMessage, 1, 3, (AioAnimationRule)localObject1);
          if ((paramChatMessage instanceof MessageForStructing)) {
            a(paramQQAppInterface, paramChatMessage, 1);
          }
          if (jdField_a_of_type_Boolean)
          {
            j = jdField_b_of_type_JavaUtilArrayList.size();
            i = 0;
            while (i < j)
            {
              localObject2 = (AioAnimationRule.JumpImage)jdField_b_of_type_JavaUtilArrayList.get(i);
              localObject2 = AioAnimationRule.JumpImage.a(paramQQAppInterface.getApplication(), (AioAnimationRule.JumpImage)localObject2);
              k = i * 800;
              jdField_a_of_type_AndroidOsHandler.postDelayed(new krm(this, paramAIOAnimationConatiner, (Drawable)localObject2, k), paramInt + k);
              i += 1;
            }
          }
          else
          {
            localObject1 = (AioAnimationRule.JumpImage)jdField_b_of_type_JavaUtilArrayList.get(0);
            localObject1 = AioAnimationRule.JumpImage.a(paramQQAppInterface.getApplication(), (AioAnimationRule.JumpImage)localObject1);
            jdField_a_of_type_AndroidOsHandler.postDelayed(new krn(this, paramAIOAnimationConatiner, (Drawable)localObject1), paramInt);
          }
        }
        else if ((j < m) && (i >= j))
        {
          if (i == m)
          {
            if (QLog.isColorLevel()) {
              QLog.d(jdField_a_of_type_JavaLangString, 2, "detect (M == Y) =======>  egg_combo animation, checkCombo= " + paramBoolean2);
            }
            if (paramBoolean2)
            {
              a(paramQQAppInterface, paramChatMessage, 1, 2, (AioAnimationRule)localObject1);
              a(paramQQAppInterface, paramChatMessage, (AioAnimationRule)localObject1);
              jdField_a_of_type_AndroidOsHandler.postDelayed(new kro(this, paramAIOAnimationConatiner, i, paramChatMessage), paramInt + 0);
            }
            if (QLog.isColorLevel()) {
              QLog.d(jdField_a_of_type_JavaLangString, 2, "detect (M == Y) =======>  egg_jumper animation ,Y=" + m + ",crazyModeEnable=" + jdField_a_of_type_Boolean);
            }
            a(paramQQAppInterface, paramChatMessage, 1, 3, (AioAnimationRule)localObject1);
            i = 0;
            label834:
            if (i < m) {
              if (!paramBoolean2) {
                break label1442;
              }
            }
          }
        }
      }
    }
    label1436:
    label1442:
    for (int j = 1000;; j = 0)
    {
      if (jdField_a_of_type_Boolean)
      {
        int n = jdField_b_of_type_JavaUtilArrayList.size();
        k = 0;
        while (k < n)
        {
          localObject2 = (AioAnimationRule.JumpImage)jdField_b_of_type_JavaUtilArrayList.get(k);
          localObject2 = AioAnimationRule.JumpImage.a(paramQQAppInterface.getApplication(), (AioAnimationRule.JumpImage)localObject2);
          int i1 = (k + i) * 800;
          jdField_a_of_type_AndroidOsHandler.postDelayed(new krp(this, paramAIOAnimationConatiner, (Drawable)localObject2, i1), paramInt + j + i1);
          k += 1;
        }
      }
      localObject2 = (AioAnimationRule.JumpImage)jdField_b_of_type_JavaUtilArrayList.get(0);
      localObject2 = AioAnimationRule.JumpImage.a(paramQQAppInterface.getApplication(), (AioAnimationRule.JumpImage)localObject2);
      k = i * 800;
      jdField_a_of_type_AndroidOsHandler.postDelayed(new krq(this, paramAIOAnimationConatiner, (Drawable)localObject2, k), paramInt + j + k);
      i += 1;
      break label834;
      break label64;
      if (i > m)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "detect (M > Y) =======>  egg_combo animation, checkCombo= " + paramBoolean2);
        }
        if (paramBoolean2)
        {
          a(paramQQAppInterface, paramChatMessage, 1, 2, (AioAnimationRule)localObject1);
          a(paramQQAppInterface, paramChatMessage, (AioAnimationRule)localObject1);
          jdField_a_of_type_AndroidOsHandler.postDelayed(new krr(this, paramAIOAnimationConatiner, i, paramChatMessage), paramInt + 0);
        }
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "detect (M > Y) =======>  egg_jumper animation ,Y=" + m + ",crazyModeEnable=" + jdField_a_of_type_Boolean);
        }
        a(paramQQAppInterface, paramChatMessage, 1, 3, (AioAnimationRule)localObject1);
        if (!paramBoolean2) {
          break label1436;
        }
      }
      for (i = 1000;; i = 0)
      {
        if (jdField_a_of_type_Boolean)
        {
          k = jdField_b_of_type_JavaUtilArrayList.size();
          j = 0;
          while (j < k)
          {
            localObject2 = (AioAnimationRule.JumpImage)jdField_b_of_type_JavaUtilArrayList.get(j);
            localObject2 = AioAnimationRule.JumpImage.a(paramQQAppInterface.getApplication(), (AioAnimationRule.JumpImage)localObject2);
            m = j * 800;
            jdField_a_of_type_AndroidOsHandler.postDelayed(new krs(this, paramAIOAnimationConatiner, (Drawable)localObject2, m), paramInt + i + m);
            j += 1;
          }
          break label64;
        }
        localObject1 = (AioAnimationRule.JumpImage)jdField_b_of_type_JavaUtilArrayList.get(0);
        localObject1 = AioAnimationRule.JumpImage.a(paramQQAppInterface.getApplication(), (AioAnimationRule.JumpImage)localObject1);
        jdField_a_of_type_AndroidOsHandler.postDelayed(new krj(this, paramAIOAnimationConatiner, (Drawable)localObject1), paramInt + i);
        break label64;
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "detect (X <= M < Y) ======>  egg_combo animation, checkCombo= " + paramBoolean2);
        }
        if (!paramBoolean2) {
          break label64;
        }
        a(paramQQAppInterface, paramChatMessage, 1, 2, (AioAnimationRule)localObject1);
        a(paramQQAppInterface, paramChatMessage, (AioAnimationRule)localObject1);
        jdField_a_of_type_AndroidOsHandler.postDelayed(new krk(this, paramAIOAnimationConatiner, i, paramChatMessage), 0 + paramInt);
        break label64;
        break;
      }
    }
  }
  
  public boolean a(ChatMessage paramChatMessage)
  {
    if ((!(paramChatMessage instanceof MessageForText)) && (!(paramChatMessage instanceof MessageForLongMsg)) && (!(paramChatMessage instanceof MessageForStructing)))
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "checkMsgType : not MessageForText and MessageForLongMsg, return false;");
      }
      return false;
    }
    if ((paramChatMessage instanceof MessageForText)) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "checkMsgType : messageForText");
      }
    }
    for (;;)
    {
      return true;
      if ((paramChatMessage instanceof MessageForLongMsg))
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "checkMsgType : MessageForLongMsg");
        }
      }
      else if (((paramChatMessage instanceof MessageForStructing)) && (QLog.isColorLevel())) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "checkMsgType : MessageForStructing");
      }
    }
  }
  
  public boolean b(ChatMessage paramChatMessage)
  {
    if ((paramChatMessage instanceof MessageForStructing))
    {
      paramChatMessage = structingMsg;
      if (paramChatMessage != null) {
        break label37;
      }
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "msg type is MessageForStructing, strctMsg is null");
      }
    }
    return false;
    label37:
    return paramChatMessage instanceof AbsShareMsg;
  }
}
