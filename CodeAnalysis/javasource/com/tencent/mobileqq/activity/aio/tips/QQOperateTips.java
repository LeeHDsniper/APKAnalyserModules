package com.tencent.mobileqq.activity.aio.tips;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.MessageHandlerUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.config.operation.QQOperateManager;
import com.tencent.mobileqq.config.operation.QQOperationRequestInfo;
import com.tencent.mobileqq.config.operation.QQOperationViopTipTask;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XPanelContainer;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import lnb;
import lnc;

public class QQOperateTips
  implements GrayTipsTask, TipsBarTask
{
  private static final String jdField_a_of_type_JavaLangString = QQOperateTips.class.getSimpleName();
  private int jdField_a_of_type_Int = -1;
  private long jdField_a_of_type_Long = -1L;
  private ChatAdapter1 jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private XPanelContainer jdField_a_of_type_ComTencentWidgetXPanelContainer;
  private WeakReference jdField_a_of_type_JavaLangRefWeakReference;
  protected List a;
  private long b = -1L;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public QQOperateTips(QQAppInterface paramQQAppInterface, TipsManager paramTipsManager, Context paramContext, XPanelContainer paramXPanelContainer, List paramList, SessionInfo paramSessionInfo, ChatAdapter1 paramChatAdapter1)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentWidgetXPanelContainer = paramXPanelContainer;
    jdField_a_of_type_JavaUtilList = paramList;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_JavaLangRefWeakReference = new WeakReference(paramContext);
    jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1 = paramChatAdapter1;
  }
  
  private void a()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new lnb(this));
  }
  
  private void b()
  {
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a();
    Object localObject1;
    if ((localObject2 != null) && (((List)localObject2).size() > 0))
    {
      int j = ((List)localObject2).size();
      localObject1 = new ArrayList();
      int i;
      ChatMessage localChatMessage;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0)
      {
        i = j - 1;
        if (i >= 0)
        {
          localChatMessage = (ChatMessage)((List)localObject2).get(i);
          if ((localChatMessage != null) && (time > jdField_a_of_type_Long))
          {
            if (uniseq != b) {
              ((ArrayList)localObject1).add(localChatMessage);
            }
            for (;;)
            {
              i -= 1;
              break;
              jdField_a_of_type_Long = time;
            }
          }
        }
      }
      else if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
      {
        i = j - 1;
        if (i >= 0)
        {
          localChatMessage = (ChatMessage)((List)localObject2).get(i);
          if ((localChatMessage != null) && (shmsgseq > jdField_a_of_type_Long))
          {
            if (uniseq != b) {
              ((ArrayList)localObject1).add(localChatMessage);
            }
            for (;;)
            {
              i -= 1;
              break;
              jdField_a_of_type_Long = shmsgseq;
            }
          }
        }
      }
      if (((ArrayList)localObject1).size() > 0)
      {
        localObject2 = (ChatMessage)((List)localObject2).get(j - 1);
        if (localObject2 != null)
        {
          if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 0) {
            break label347;
          }
          jdField_a_of_type_Long = time;
          b = uniseq;
        }
      }
    }
    for (;;)
    {
      localObject2 = QQOperateManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      localObject1 = ((QQOperateManager)localObject2).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (List)localObject1, false, -1);
      if (jdField_a_of_type_Boolean)
      {
        localObject1 = jdField_a_of_type_JavaUtilArrayList;
        ((QQOperateManager)localObject2).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, (ArrayList)localObject1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
      return;
      label347:
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
      {
        jdField_a_of_type_Long = shmsgseq;
        b = uniseq;
      }
    }
  }
  
  private void b(QQOperationViopTipTask paramQQOperationViopTipTask)
  {
    List localList = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a();
    if (localList == null) {
      return;
    }
    int j = localList.size();
    int i = j - 1;
    label27:
    if (i >= 0) {
      if (i < j - 10) {
        i = 0;
      }
    }
    for (;;)
    {
      if (i != 0)
      {
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d(jdField_a_of_type_JavaLangString, 2, " findExcludeMsg, just return ");
        return;
        if (getmsgtype == 64493)
        {
          i = 1;
          continue;
        }
        i -= 1;
        break label27;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(this, new Object[] { paramQQOperationViopTipTask });
      return;
      i = 0;
    }
  }
  
  public int a()
  {
    return 6;
  }
  
  public View a(Object... paramVarArgs)
  {
    if ((paramVarArgs[0] instanceof QQOperationViopTipTask))
    {
      paramVarArgs = (QQOperationViopTipTask)paramVarArgs[0];
      if ((jdField_a_of_type_JavaLangRefWeakReference == null) || (jdField_a_of_type_JavaLangRefWeakReference.get() == null)) {
        return null;
      }
      View localView = LayoutInflater.from((Context)jdField_a_of_type_JavaLangRefWeakReference.get()).inflate(2130904003, null);
      TextView localTextView = (TextView)localView.findViewById(2131300893);
      Button localButton = (Button)localView.findViewById(2131300892);
      localTextView.setText(adwords);
      localButton.setText(clickableWord);
      localButton.setOnClickListener(new lnc(this, paramVarArgs));
      return localView;
    }
    return null;
  }
  
  public MessageRecord a(Object... paramVarArgs)
  {
    if ((paramVarArgs[0] instanceof QQOperationViopTipTask))
    {
      paramVarArgs = (QQOperationViopTipTask)paramVarArgs[0];
      MessageRecord localMessageRecord = MessageRecordFactory.a(64495);
      long l = MessageCache.a();
      localMessageRecord.init(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), adwords + "|" + clickableWord + "|" + linkOffset + "|" + url + "|" + taskid, l, 64495, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, l);
      isread = true;
      if (!MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageRecord, false)) {
        return localMessageRecord;
      }
      return null;
    }
    return null;
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 0) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 3000)) {}
    do
    {
      return;
      if (paramInt == 1000)
      {
        a();
        return;
      }
    } while (paramInt != 1001);
    b();
  }
  
  public void a(QQOperationViopTipTask paramQQOperationViopTipTask)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(this, new Object[] { paramQQOperationViopTipTask });
  }
  
  public void a(List paramList)
  {
    QQOperateManager localQQOperateManager = QQOperateManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      int i = nexttaskid;
      QQOperationViopTipTask localQQOperationViopTipTask = localQQOperateManager.a(i);
      if ((QLog.isDevelopLevel()) && (localQQOperationViopTipTask == null)) {
        QLog.d("QQOperateVoIP", 4, "on showTips, voipTask is null, taskId=" + i);
      }
      if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 0) {}
      for (i = 1;; i = 0)
      {
        if (localQQOperationViopTipTask == null) {
          break label123;
        }
        if (!localQQOperationViopTipTask.isBlueTipsTask()) {
          break label147;
        }
        if (i == 0) {
          break label125;
        }
        a(localQQOperationViopTipTask);
        break;
      }
      label123:
      continue;
      label125:
      if (jdField_a_of_type_JavaUtilList != null)
      {
        jdField_a_of_type_JavaUtilList.add(localQQOperationViopTipTask);
        continue;
        label147:
        if ((localQQOperationViopTipTask.isGryTipsTask()) && (!localQQOperateManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 2))) {
          b(localQQOperationViopTipTask);
        }
      }
    }
  }
  
  public int[] a()
  {
    return null;
  }
  
  public int b()
  {
    return 40;
  }
}
