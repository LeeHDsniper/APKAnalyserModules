package com.tencent.mobileqq.activity.aio.tips;

import android.graphics.Color;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.activity.aio.AIOTipsController;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import com.tencent.widget.XPanelContainer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import lne;
import lnf;
import mqq.os.MqqHandler;

public class TipsManager
  implements Handler.Callback, TipsConstants
{
  private static final String jdField_a_of_type_JavaLangString = TipsManager.class.getSimpleName();
  private AIOTipsController jdField_a_of_type_ComTencentMobileqqActivityAioAIOTipsController;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private TipsBarTask jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private XPanelContainer jdField_a_of_type_ComTencentWidgetXPanelContainer;
  private ArrayList jdField_a_of_type_JavaUtilArrayList;
  public List a;
  protected final MqqHandler a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public TipsManager(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, AIOTipsController paramAIOTipsController, XPanelContainer paramXPanelContainer, List paramList)
  {
    jdField_a_of_type_MqqOsMqqHandler = new MqqWeakReferenceHandler(Looper.getMainLooper(), this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqActivityAioAIOTipsController = paramAIOTipsController;
    jdField_a_of_type_ComTencentWidgetXPanelContainer = paramXPanelContainer;
    jdField_a_of_type_JavaUtilList = paramList;
  }
  
  public static String a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return " [Unknow] ";
    case 4: 
      return " [TIPS_BAR_TYPE_DISC_FREQ_CALL] ";
    case 0: 
      return " [TIPS_BAR_TYPE_FRAUD] ";
    case 5: 
      return " [TIPS_BAR_TYPE_HOT_FRIEND_CALL] ";
    case 2: 
      return " [TIPS_BAR_TYPE_VIDEO_STATUS] ";
    case 3: 
      return " [TIPS_BAR_TYPE_TROOP_ASSIST] ";
    case 6: 
      return "[TIPS_QQ_OPERATE] ";
    case 7: 
      return " [TIPS_BAR_TYPE_PUB_ACCOUNT_ASSIT] ";
    case 1: 
      return " [TIPS_BAR_TYPE_READER] ";
    case 8: 
      return " [TIPS_BAR_TYPE_COLOR_RING] ";
    case 11: 
      return " [TIPS_TYPE_BAR_COMMING_RING] ";
    case 1001: 
      return " [GRAY_TIPS_DISC_FREQ_PTT] ";
    case 1000: 
      return " [GRAY_TIPS_FRIEND_FREQ] ";
    case 1002: 
      return " [GRAY_TIPS_SOUGOU_INPUT] ";
    case 1003: 
      return " [GRAY_TIPS_GATHER_CONTACTS] ";
    case 9: 
      return " [TIPS_TYPE_RED_PACKET] ";
    case 10: 
      return " [TIPS_BAR_TYPE_FUN_CALL]";
    case 12: 
      return "[TIPS_TYPE_BAR_LIGHTALK]";
    case 1004: 
      return " [TIPS_TYPE_GRAY_HONGBAO_KEYWORDS] ";
    }
    return " [TIPS_TYPE_GRAY_SPECIALCARE]";
  }
  
  private void a(TipsBarTask paramTipsBarTask, View paramView)
  {
    ViewGroup localViewGroup;
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString != null) && (PublicAccountUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (PublicAccountUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) && (paramView != null) && ((paramView instanceof ViewGroup)))
    {
      localViewGroup = (ViewGroup)paramView;
      localViewGroup.setBackgroundColor(Color.parseColor("#80000000"));
      Object localObject = null;
      paramView = localObject;
      if (paramTipsBarTask != null)
      {
        paramView = localObject;
        switch (paramTipsBarTask.a())
        {
        default: 
          paramView = localObject;
        }
      }
    }
    for (;;)
    {
      if ((paramView != null) && ((paramView instanceof TextView))) {
        ((TextView)paramView).setTextColor(-1);
      }
      return;
      paramView = localViewGroup.findViewById(2131297355);
      continue;
      paramView = localViewGroup.findViewById(2131296448);
      continue;
      paramView = localViewGroup.findViewById(2131296892);
      continue;
      paramView = localViewGroup.findViewById(2131296955);
    }
  }
  
  private boolean a(TipsTask paramTipsTask)
  {
    boolean bool3 = false;
    Object localObject1 = a(paramTipsTask.a());
    int i = -1;
    int[] arrayOfInt = paramTipsTask.a();
    boolean bool1;
    if (arrayOfInt != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask != null) {
        i = jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask.a();
      }
      boolean bool2 = true;
      int j = 0;
      Object localObject2 = localObject1;
      if (j < arrayOfInt.length)
      {
        switch (arrayOfInt[j])
        {
        default: 
          bool1 = bool2;
          localObject1 = localObject2;
        }
        for (;;)
        {
          j += 1;
          localObject2 = localObject1;
          bool2 = bool1;
          break;
          localObject1 = localObject2;
          bool1 = bool2;
          if (i == arrayOfInt[j])
          {
            localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_BAR_COLOR_RING ";
            bool1 = false;
            continue;
            localObject1 = localObject2;
            bool1 = bool2;
            if (i == arrayOfInt[j])
            {
              localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_BAR_COMMING_RING ";
              bool1 = false;
              continue;
              localObject1 = localObject2;
              bool1 = bool2;
              if (i == arrayOfInt[j])
              {
                localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_BAR_DISC_ACTIVE ";
                bool1 = false;
                continue;
                localObject1 = localObject2;
                bool1 = bool2;
                if (i == arrayOfInt[j])
                {
                  localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_BAR_FRAUD ";
                  bool1 = false;
                  continue;
                  localObject1 = localObject2;
                  bool1 = bool2;
                  if (i == arrayOfInt[j])
                  {
                    localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_BAR_FRIEND_HOT ";
                    bool1 = false;
                    continue;
                    localObject1 = localObject2;
                    bool1 = bool2;
                    if (i == arrayOfInt[j])
                    {
                      localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_BAR_READER ";
                      bool1 = false;
                      continue;
                      localObject1 = localObject2;
                      bool1 = bool2;
                      if (i == arrayOfInt[j])
                      {
                        localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_BAR_TROOP_ASSIST ";
                        bool1 = false;
                        continue;
                        localObject1 = localObject2;
                        bool1 = bool2;
                        if (i == arrayOfInt[j])
                        {
                          localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_BAR_VIDEO_STATUS ";
                          bool1 = false;
                          continue;
                          localObject1 = localObject2;
                          bool1 = bool2;
                          if (i == arrayOfInt[j])
                          {
                            localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_QQ_OPERATE ";
                            bool1 = false;
                            continue;
                            localObject1 = localObject2;
                            bool1 = bool2;
                            if (i == arrayOfInt[j])
                            {
                              localObject1 = localObject2 + ", not allowed by excludeType: TIPS_TYPE_BAR_PUB_ACCOUNT_ASSIST ";
                              bool1 = false;
                              continue;
                              localObject1 = localObject2;
                              bool1 = bool2;
                              if (jdField_a_of_type_ComTencentWidgetXPanelContainer != null)
                              {
                                localObject1 = localObject2;
                                bool1 = bool2;
                                if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() != 0)
                                {
                                  localObject1 = localObject2 + ", not allowed by excludeType: EXCLUDE_TYPE_EXT_PANEL ";
                                  bool1 = false;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      bool1 = bool2;
      localObject1 = localObject2;
    }
    for (;;)
    {
      if ((bool1) && ((paramTipsTask instanceof TipsBarTask)) && (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask.b() > ((TipsBarTask)paramTipsTask).b()))
      {
        localObject1 = (String)localObject1 + ", not allowed: priority is low ";
        bool1 = bool3;
      }
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "allowShow(): result = " + bool1 + " | " + (String)localObject1 + "|" + "curTipsBarType" + i);
        }
        return bool1;
      }
      bool1 = true;
      i = -1;
    }
  }
  
  public int a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask != null) {
      return jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask.a();
    }
    return -1;
  }
  
  public TipsBarTask a()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask;
  }
  
  public void a()
  {
    if (Thread.currentThread() == Looper.getMainLooper().getThread())
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioAIOTipsController != null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioAIOTipsController.a();
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask = null;
      if (jdField_a_of_type_JavaUtilList != null) {
        jdField_a_of_type_JavaUtilList.clear();
      }
      return;
    }
    lnf localLnf = new lnf(this);
    jdField_a_of_type_MqqOsMqqHandler.post(localLnf);
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if (jdField_a_of_type_JavaUtilArrayList != null)
    {
      Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
      while (localIterator.hasNext()) {
        ((TipsTask)localIterator.next()).a(paramInt, paramVarArgs);
      }
    }
  }
  
  public void a(TipsTask paramTipsTask)
  {
    if (paramTipsTask == null) {}
    do
    {
      return;
      if (jdField_a_of_type_JavaUtilArrayList == null) {
        jdField_a_of_type_JavaUtilArrayList = new ArrayList();
      }
    } while (jdField_a_of_type_JavaUtilArrayList.contains(paramTipsTask));
    jdField_a_of_type_JavaUtilArrayList.add(paramTipsTask);
  }
  
  public boolean a(GrayTipsTask paramGrayTipsTask, Object... paramVarArgs)
  {
    if (paramGrayTipsTask != null)
    {
      if (a(paramGrayTipsTask)) {
        break label30;
      }
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "showGrayTips() failure: mTipsMgr not allow");
      }
    }
    label30:
    do
    {
      return false;
      paramVarArgs = paramGrayTipsTask.a(paramVarArgs);
      if (paramVarArgs != null)
      {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramVarArgs, selfuin);
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "showGrayTips() success: from " + a(paramGrayTipsTask.a()));
        }
        return true;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "showGrayTips() failure: MessageRecord null, from " + a(paramGrayTipsTask.a()));
    return false;
  }
  
  public boolean a(TipsBarTask paramTipsBarTask, Object... paramVarArgs)
  {
    if (paramTipsBarTask != null) {
      if (!a(paramTipsBarTask)) {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "showTipsBar() failure: mTipsMgr not allow");
        }
      }
    }
    while (!QLog.isColorLevel())
    {
      return false;
      if (Thread.currentThread() == Looper.getMainLooper().getThread())
      {
        paramVarArgs = paramTipsBarTask.a(paramVarArgs);
        a(paramTipsBarTask, paramVarArgs);
        jdField_a_of_type_ComTencentMobileqqActivityAioAIOTipsController.a(paramVarArgs);
        jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsBarTask = paramTipsBarTask;
      }
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "showTipsBar() success: from " + a(paramTipsBarTask.a()));
        }
        return true;
        paramVarArgs = new lne(this, paramTipsBarTask, paramVarArgs);
        jdField_a_of_type_MqqOsMqqHandler.post(paramVarArgs);
      }
    }
    QLog.d(jdField_a_of_type_JavaLangString, 2, "showTipsBar() failure: tipsBar == null");
    return false;
  }
  
  public void b()
  {
    if (jdField_a_of_type_JavaUtilArrayList != null) {
      jdField_a_of_type_JavaUtilArrayList.clear();
    }
    a();
    jdField_a_of_type_ComTencentMobileqqActivityAioAIOTipsController.b();
    jdField_a_of_type_MqqOsMqqHandler.removeCallbacksAndMessages(null);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    return false;
  }
}
