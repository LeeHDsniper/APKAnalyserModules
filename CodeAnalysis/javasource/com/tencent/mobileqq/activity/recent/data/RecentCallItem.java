package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.text.TextUtils;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.av.utils.UITools;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.RecentBaseData;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.DiscussionHandler;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.CircleBuddy;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.QCallRecent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.qcall.QCallCardHandler;
import com.tencent.mobileqq.qcall.QCallCardInfo;
import com.tencent.mobileqq.qcall.QCallCardManager;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;
import cooperation.huangye.C2BUtils;

public class RecentCallItem
  extends RecentBaseData
{
  public static final int R = 0;
  public static final int S = 1;
  public static final int T = 2;
  public static final int U = 3;
  public static final int V = 4;
  public static final int W = 5;
  public static final int X = 6;
  public static final int Y = 7;
  private static final String i = RecentCallItem.class.getSimpleName();
  public long a;
  protected QCallRecent a;
  public boolean a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public RecentCallItem(QCallRecent paramQCallRecent)
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Long = 0L;
    if (paramQCallRecent == null) {
      throw new NullPointerException("call is null");
    }
    jdField_a_of_type_ComTencentMobileqqDataQCallRecent = paramQCallRecent;
  }
  
  public int a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataQCallRecent.type;
  }
  
  public long a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataQCallRecent.lastCallTime;
  }
  
  public QCallRecent a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataQCallRecent;
  }
  
  public String a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataQCallRecent.uin;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    int k = 0;
    Object localObject2 = null;
    Object localObject6 = null;
    Object localObject5 = null;
    Object localObject4 = null;
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      label23:
      return;
    }
    String str = jdField_a_of_type_ComTencentMobileqqDataQCallRecent.uin;
    Object localObject1 = (FriendsManager)paramQQAppInterface.getManager(50);
    DiscussionManager localDiscussionManager = (DiscussionManager)paramQQAppInterface.getManager(52);
    if (localObject1 == null) {
      localObject1 = null;
    }
    label63:
    int j;
    switch (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.type)
    {
    default: 
      jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, str, true);
    case 1008: 
    case 1006: 
    case 9502: 
    case 1021: 
      for (;;)
      {
        jdField_b_of_type_JavaLangCharSequence = jdField_a_of_type_ComTencentMobileqqDataQCallRecent.lastCallMsg;
        if (localObject1 == null) {
          break label1962;
        }
        j = ((Friends)localObject1).getNetWorkType();
        F = j;
        if (localObject1 == null) {
          break label1967;
        }
        P = ContactUtils.a(detalStatusFlag, iTermType);
        if (QLog.isColorLevel()) {
          QLog.d("RecentCallItemBuilder", 2, "call.type = " + jdField_a_of_type_ComTencentMobileqqDataQCallRecent.type + ", call.getState(app) = " + jdField_a_of_type_ComTencentMobileqqDataQCallRecent.getState(paramQQAppInterface) + ", displayName:" + jdField_a_of_type_ComTencentMobileqqDataQCallRecent.displayName);
        }
        if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.type != 3000) {
          break label2027;
        }
        switch (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.getState(paramQQAppInterface))
        {
        case 5: 
        case 6: 
        case 7: 
        default: 
          if ((jdField_a_of_type_ComTencentMobileqqDataQCallRecent.time <= 0L) || (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isSend())) {
            break label2022;
          }
          j = 1;
          I = j;
          jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataQCallRecent.lastCallTime;
          if ((jdField_b_of_type_Long == 0L) && (QLog.isColorLevel())) {
            QLog.d(i, 2, "zsw RecentCallItem| mDisplayTime = " + jdField_b_of_type_Long);
          }
          if ((jdField_b_of_type_Long > 0L) && (jdField_b_of_type_Long != 9223372036854775806L)) {
            jdField_b_of_type_JavaLangString = TimeManager.a().a(a(), jdField_b_of_type_Long);
          }
          if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.type != 3000) {
            H = jdField_a_of_type_ComTencentMobileqqDataQCallRecent.missedCallCount;
          }
          if (QLog.isDevelopLevel()) {
            QLog.i(i, 4, "update mAuthenIconId=" + I + ";mUnreadNum=" + H + ";mStatus=" + F);
          }
          j = M & 0xFFFF0FFF;
          if (!jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isVideo()) {
            break label2210;
          }
          j |= 0x3000;
          M = j;
          localObject1 = (PstnManager)((QQAppInterface)BaseApplicationImpl.a().a()).getManager(142);
          j = k;
          if (localObject1 != null)
          {
            j = k;
            if (((PstnManager)localObject1).a() == 1) {
              j = 1;
            }
          }
          if ((I == 3) || (jdField_a_of_type_Long > 0L) || (I == 4) || (I == 5) || (I == 7) || (I == 6))
          {
            if (paramQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqDataQCallRecent.uin) != 2) {
              break label2226;
            }
            if (j == 0) {
              break label2219;
            }
            j = 2131370747;
            g = paramContext.getString(j);
          }
          if (!AppSetting.i) {
            break label23;
          }
          paramQQAppInterface = new StringBuilder(24);
          paramQQAppInterface.append(jdField_a_of_type_JavaLangString);
          if ((!jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isMissedCall()) || (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isSend())) {
            break label2236;
          }
          paramQQAppInterface.append("未接");
          switch (F)
          {
          default: 
            paramQQAppInterface.append(".").append(jdField_b_of_type_JavaLangString);
            c = paramQQAppInterface.toString();
            return;
            localObject1 = ((FriendsManager)localObject1).c(str);
            break label63;
            localObject5 = (PublicAccountDataManager)paramQQAppInterface.getManager(55);
            localObject2 = localObject4;
            if (localObject5 != null) {
              localObject2 = ((PublicAccountDataManager)localObject5).b(str);
            }
            if (localObject2 != null)
            {
              jdField_a_of_type_JavaLangString = name;
            }
            else
            {
              jdField_a_of_type_JavaLangString = C2BUtils.a(str);
              if (jdField_a_of_type_JavaLangString == null)
              {
                jdField_a_of_type_JavaLangString = str;
                continue;
                localObject4 = ContactUtils.f(paramQQAppInterface, str);
                localObject5 = (PhoneContactManager)paramQQAppInterface.getManager(10);
                if (localObject5 != null) {
                  localObject2 = ((PhoneContactManager)localObject5).c(str);
                }
                if (localObject2 != null)
                {
                  jdField_a_of_type_JavaLangString = name;
                }
                else if (localObject4 != null)
                {
                  jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, (String)localObject4, true);
                }
                else
                {
                  jdField_a_of_type_JavaLangString = str;
                  continue;
                  if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.businessName != null)
                  {
                    jdField_a_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqDataQCallRecent.businessName;
                  }
                  else
                  {
                    jdField_a_of_type_JavaLangString = str;
                    continue;
                    localObject2 = (CircleManager)paramQQAppInterface.getManager(34);
                    localObject4 = ((CircleManager)localObject2).a(str);
                    if ((localObject2 != null) && (localObject4 != null)) {
                      jdField_a_of_type_JavaLangString = ((CircleManager)localObject2).a((CircleBuddy)localObject4);
                    } else {
                      jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, str, true);
                    }
                  }
                }
              }
            }
            break;
          }
          break;
        }
      }
    case 0: 
    case 8: 
    case 1000: 
    case 1001: 
    case 1003: 
    case 1004: 
    case 1005: 
    case 1009: 
    case 1020: 
    case 1022: 
    case 1023: 
    case 1024: 
    case 1025: 
      label281:
      label308:
      label468:
      label673:
      label796:
      label805:
      label858:
      label892:
      if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.type == 8)
      {
        N = jdField_a_of_type_ComTencentMobileqqDataQCallRecent.extraType;
        f = jdField_a_of_type_ComTencentMobileqqDataQCallRecent.bindId;
        O = jdField_a_of_type_ComTencentMobileqqDataQCallRecent.bindType;
        h = jdField_a_of_type_ComTencentMobileqqDataQCallRecent.phoneNumber;
        if (N == 25)
        {
          localObject2 = (PhoneContactManager)paramQQAppInterface.getManager(10);
          if ((localObject2 == null) || (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.phoneNumber == null)) {
            break label2312;
          }
        }
      }
      break;
    }
    label1416:
    label1602:
    Object localObject3;
    label1962:
    label1967:
    label2022:
    label2027:
    label2210:
    label2219:
    label2226:
    label2236:
    label2312:
    for (localObject2 = ((PhoneContactManager)localObject2).c(jdField_a_of_type_ComTencentMobileqqDataQCallRecent.phoneNumber);; localObject3 = null)
    {
      if (localObject2 != null)
      {
        jdField_a_of_type_JavaLangString = name;
        if (QLog.isColorLevel()) {
          QLog.d(i, 2, "UNBINDQQ update contact = " + jdField_a_of_type_JavaLangString);
        }
      }
      for (;;)
      {
        if (!AppConstants.ap.equals(str)) {
          break label1416;
        }
        jdField_a_of_type_JavaLangString = paramContext.getString(2131368846);
        break;
        localObject2 = ((QCallCardManager)paramQQAppInterface.getManager(139)).a(str);
        if (localObject2 == null) {
          ((QCallCardHandler)paramQQAppInterface.a(79)).a(str);
        } else if ((localObject2 != null) && (nickname != null)) {
          jdField_a_of_type_JavaLangString = nickname;
        }
      }
      if (AppConstants.ar.equals(str))
      {
        jdField_a_of_type_JavaLangString = paramContext.getString(2131368844);
        break;
      }
      if (AppConstants.aq.equals(str))
      {
        jdField_a_of_type_JavaLangString = paramContext.getString(2131368009);
        break;
      }
      if (AppConstants.af.equals(str))
      {
        jdField_a_of_type_JavaLangString = paramContext.getString(2131368017);
        break;
      }
      if (AppConstants.an.equals(str))
      {
        jdField_a_of_type_JavaLangString = paramContext.getString(2131368886);
        break;
      }
      if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.type == 1000)
      {
        localObject2 = (TroopManager)paramQQAppInterface.getManager(51);
        if (localObject2 == null) {
          break;
        }
        jdField_a_of_type_JavaLangString = ContactUtils.a(paramQQAppInterface, str, ((TroopManager)localObject2).b(jdField_a_of_type_ComTencentMobileqqDataQCallRecent.troopUin), jdField_a_of_type_ComTencentMobileqqDataQCallRecent.troopUin, true, null);
        break;
      }
      if (localObject1 != null) {
        if (!TextUtils.isEmpty(remark)) {
          localObject2 = remark;
        }
      }
      for (jdField_a_of_type_JavaLangString = ((String)localObject2); (TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) || (jdField_a_of_type_JavaLangString.equals(str)); jdField_a_of_type_JavaLangString = "")
      {
        jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, str, true);
        break;
        localObject2 = name;
        break label1602;
      }
      jdField_a_of_type_JavaLangString = paramContext.getString(2131364475);
      break;
      jdField_a_of_type_JavaLangString = ContactUtils.c(paramQQAppInterface, str);
      if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString))
      {
        localObject2 = localObject6;
        if (localDiscussionManager != null) {
          localObject2 = localDiscussionManager.a(str);
        }
        if (localObject2 != null) {}
      }
      try
      {
        ((DiscussionHandler)paramQQAppInterface.a(6)).a(Long.valueOf(str).longValue());
        jdField_a_of_type_JavaLangString = ContactUtils.a(paramContext, (DiscussionInfo)localObject2);
        localObject4 = "";
        localObject2 = localObject4;
        if (localDiscussionManager != null)
        {
          j = localDiscussionManager.a(str);
          localObject2 = localObject4;
          if (j > 0) {
            localObject2 = "(" + j + ")";
          }
        }
        jdField_a_of_type_JavaLangCharSequence = ((CharSequence)localObject2);
        try
        {
          jdField_a_of_type_Long = paramQQAppInterface.a().a(UITools.a(jdField_a_of_type_ComTencentMobileqqDataQCallRecent.type), Long.parseLong(str));
        }
        catch (NumberFormatException localNumberFormatException)
        {
          localNumberFormatException.printStackTrace();
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.d(i, 2, "discussionHandler exception:" + localException.getMessage());
          }
        }
      }
      PhoneContactManager localPhoneContactManager = (PhoneContactManager)paramQQAppInterface.getManager(10);
      localObject3 = localObject5;
      if (localPhoneContactManager != null) {
        localObject3 = localPhoneContactManager.b(str);
      }
      if (localObject3 != null)
      {
        jdField_a_of_type_JavaLangString = name;
        break;
      }
      jdField_a_of_type_JavaLangString = str;
      break;
      jdField_a_of_type_JavaLangString = str;
      break;
      j = 0;
      break label281;
      P = -1;
      break label308;
      j = 3;
      break label468;
      j = 0;
      break label468;
      if ((jdField_a_of_type_ComTencentMobileqqDataQCallRecent.time > 0L) && (!jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isSend()))
      {
        j = 1;
        break label468;
      }
      j = 2;
      break label468;
      j = 2;
      break label468;
      j = 2;
      break label468;
      j = aajdField_b_of_type_Int;
      localObject1 = aajdField_b_of_type_JavaLangString;
      if (((j == 1) || (j == 2)) && (((String)localObject1).equals(jdField_a_of_type_ComTencentMobileqqDataQCallRecent.uin))) {
        j = 7;
      }
      while (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.type == 1024)
      {
        j = CrmUtils.a(paramQQAppInterface, str);
        break;
        if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.getState(paramQQAppInterface) == 5) {
          j = 4;
        } else if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.getState(paramQQAppInterface) == 6) {
          j = 5;
        } else if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.getState(paramQQAppInterface) == 7) {
          j = 6;
        } else if (((jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isMissedCall()) || (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isLastCallRealMissed)) && (!jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isSend())) {
          j = 0;
        } else if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isSend()) {
          j = 2;
        } else {
          j = 1;
        }
      }
      j |= 0x4000;
      break label673;
      j = 2131370748;
      break label796;
      g = "";
      break label805;
      if (jdField_a_of_type_ComTencentMobileqqDataQCallRecent.isSend())
      {
        paramQQAppInterface.append("已拨");
        break label858;
      }
      paramQQAppInterface.append("已接");
      break label858;
      paramQQAppInterface.append("WIFI网络");
      break label892;
      paramQQAppInterface.append("2G网络");
      break label892;
      paramQQAppInterface.append("3G网络");
      break label892;
      paramQQAppInterface.append("4G网络");
      break label892;
    }
  }
  
  public void a(QCallRecent paramQCallRecent)
  {
    if ((paramQCallRecent != null) && (uin.equals(jdField_a_of_type_ComTencentMobileqqDataQCallRecent.uin))) {
      jdField_a_of_type_ComTencentMobileqqDataQCallRecent = paramQCallRecent;
    }
  }
  
  public long b()
  {
    return 0L;
  }
  
  public boolean b()
  {
    return (jdField_a_of_type_Boolean) && (a() == 3000);
  }
  
  public int c()
  {
    return F;
  }
  
  public int d()
  {
    return F;
  }
}
