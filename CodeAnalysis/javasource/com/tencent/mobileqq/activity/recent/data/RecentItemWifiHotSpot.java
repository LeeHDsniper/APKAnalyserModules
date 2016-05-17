package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qqhotspot.QQHotSpotHelper.APInfo;
import cooperation.qqhotspot.QQHotSpotHelper.ConversationShowApinfo;
import cooperation.qqhotspot.QQHotSpotHelper.HotSpotNodeAPInfo;
import cooperation.qqhotspot.WifiConversationManager;

public class RecentItemWifiHotSpot
  extends RecentUserBaseData
{
  public RecentItemWifiHotSpot(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    super.a(paramQQAppInterface, paramContext);
    jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataRecentUser.lastmsgtime;
    jdField_b_of_type_JavaLangString = TimeManager.a().a(a(), jdField_b_of_type_Long);
    if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
      jdField_a_of_type_JavaLangString = paramContext.getResources().getString(2131366223);
    }
    K = paramContext.getResources().getColor(2131428212);
    paramQQAppInterface = WifiConversationManager.a().a();
    if (paramQQAppInterface != null)
    {
      if ((mStatus == 0) || (mStatus == 1))
      {
        c = paramContext.getResources().getString(2131366253);
        return;
      }
      if ((mStatus == 2) && (mApInfo != null) && (!TextUtils.isEmpty(mApInfo.mApInfo.StoreName)))
      {
        c = paramContext.getResources().getString(2131366254, new Object[] { mApInfo.mApInfo.StoreName });
        return;
      }
      if ((mStatus == 3) && (mApInfo != null) && (!TextUtils.isEmpty(mApInfo.mApInfo.StoreName)))
      {
        c = paramContext.getResources().getString(2131366255, new Object[] { mApInfo.mApInfo.StoreName });
        return;
      }
      c = paramContext.getResources().getString(2131366253);
      return;
    }
    c = paramContext.getResources().getString(2131366253);
  }
}
