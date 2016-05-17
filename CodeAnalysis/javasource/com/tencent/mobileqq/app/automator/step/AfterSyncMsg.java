package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.bitapp.BitAppManager;
import com.tencent.biz.pubaccount.PublicAccountManager;
import com.tencent.biz.pubaccount.util.PAReportManager;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.bless.BlessManager;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagManager;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.DiscussionHandler;
import com.tencent.mobileqq.app.EqqDetailDataManager;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.LifeOnlineAccountInfoManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.PhoneUnityManager;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsManager;
import com.tencent.mobileqq.app.asyncdb.CacheManager;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.memory.MemoryReporter;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.proxy.FTSDBManager;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.fts.FTSTroopOperator;
import com.tencent.mobileqq.config.splashlogo.ConfigServlet;
import com.tencent.mobileqq.data.Setting;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mybusiness.MyBusinessManager;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.portal.PortalManager;
import com.tencent.mobileqq.portal.RedPacketServlet;
import com.tencent.mobileqq.search.util.SearchConfigManager;
import com.tencent.mobileqq.util.SystemUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.mobileqq.utils.fts.SQLiteFTSUtils;
import com.tencent.qphone.base.util.QLog;
import cooperation.dingdong.DingdongPluginManager;
import java.io.File;
import java.util.Hashtable;
import java.util.List;

public class AfterSyncMsg
  extends AsyncStep
{
  public AfterSyncMsg()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void c()
  {
    if (a.e) {
      ((TroopHandler)a.b.a(20)).a();
    }
    ((FriendListHandler)a.b.a(1)).b();
    e();
    ((CircleManager)a.b.getManager(34)).a();
    ((LifeOnlineAccountInfoManager)a.b.getManager(86)).b();
    Object localObject = (PortalManager)a.b.getManager(78);
    RedPacketServlet.a(a.b, ((PortalManager)localObject).c());
    ((PhoneContactManagerImp)a.b.getManager(10)).a(true, true);
    ((MyBusinessManager)a.b.getManager(48)).a();
    localObject = (DingdongPluginManager)a.b.getManager(114);
    ((DingdongPluginManager)localObject).a();
    ((DingdongPluginManager)localObject).b();
    a.b.a().m();
    ((PAReportManager)a.b.getManager(100)).a();
    ((BitAppManager)a.b.getManager(143)).a();
    localObject = (PasswdRedBagManager)a.b.getManager(124);
    ((PasswdRedBagManager)localObject).b();
    ((PasswdRedBagManager)localObject).a();
    if (QLog.isColorLevel()) {
      QLog.d(".troop.del_abnormal_troop_local_msg", 2, "checkDelAbnormalLocalTroopMsg onReconnect");
    }
    a.b.a().p();
    switch (NetworkUtil.a(BaseApplicationImpl.a()))
    {
    }
    for (;;)
    {
      long l1 = SharedPreUtils.a(BaseApplicationImpl.a());
      long l2 = System.currentTimeMillis();
      if (Math.abs(l2 - l1) > 21600000L)
      {
        ConfigServlet.a(a.b, a.b.a(), -1, "doOnReconnect");
        SharedPreUtils.a(BaseApplicationImpl.a(), l2);
      }
      return;
      ((BlessManager)a.b.getManager(137)).f();
    }
  }
  
  private void d()
  {
    a.b.a().a();
    a.b.a().b();
    ((SVIPHandler)a.b.a(13)).a();
    a.b.j = true;
    a.b.D();
    a.b.a(false);
    if (a.e) {
      ((TroopHandler)a.b.a(20)).a();
    }
    e();
    ((EqqDetailDataManager)a.b.getManager(68)).a();
    ((PublicAccountDataManager)a.b.getManager(55)).a();
    Object localObject = (PhoneContactManagerImp)a.b.getManager(10);
    ((PhoneContactManagerImp)localObject).d();
    ((PhoneContactManagerImp)localObject).a(true, true);
    ((CircleManager)a.b.getManager(34)).a();
    localObject = (ActivateFriendsManager)a.b.getManager(84);
    if (localObject != null) {
      ((ActivateFriendsManager)localObject).a();
    }
    ((LifeOnlineAccountInfoManager)a.b.getManager(86)).a();
    PublicAccountUtil.a(a.b);
    localObject = (DingdongPluginManager)a.b.getManager(114);
    ((DingdongPluginManager)localObject).a();
    ((DingdongPluginManager)localObject).b();
    a.b.a().n();
    a.b.a().m();
    SQLiteFTSUtils.b();
    ((PAReportManager)a.b.getManager(100)).a();
    localObject = (PhoneUnityManager)a.b.getManager(101);
    ((PhoneUnityManager)localObject).b();
    ((PhoneUnityManager)localObject).a(0, 31, null, null);
    localObject = (BitAppManager)a.b.getManager(143);
    ((BitAppManager)localObject).a();
    ((BitAppManager)localObject).b();
    localObject = (PasswdRedBagManager)a.b.getManager(124);
    ((PasswdRedBagManager)localObject).b();
    ((PasswdRedBagManager)localObject).a();
    if (QLog.isColorLevel()) {
      QLog.d(".troop.del_abnormal_troop_local_msg", 2, "checkDelAbnormalLocalTroopMsg afterLogin");
    }
    a.b.a().p();
    PublicAccountManager.a().c(a.b);
    ConfigServlet.a(a.b, a.b.a(), -1, "doAfterLogin");
    SearchConfigManager.a(a.b);
    if (QLog.isColorLevel()) {
      QLog.d("Q.fts", 2, "troopMemberLimit=" + SearchConfigManager.troopMemberLimit + " durationUnderWifi=" + SearchConfigManager.troopDurationUnderWifi + " durationUnderNotWifi=" + SearchConfigManager.troopDurationUnderNotWifi);
    }
    ((FTSTroopOperator)a.b.a().a(2)).f();
    MemoryReporter.a().a();
  }
  
  private void e()
  {
    boolean bool2 = true;
    Object localObject = (FriendListHandler)a.b.a(1);
    a.b.a().i();
    f();
    ((DiscussionHandler)a.b.a(6)).d();
    ((FriendListHandler)localObject).c();
    ((FriendListHandler)localObject).a();
    localObject = a.b.a();
    boolean bool1;
    if (!a.f)
    {
      bool1 = true;
      if (a.g) {
        break label131;
      }
    }
    for (;;)
    {
      ((MessageHandler)localObject).a(bool1, bool2);
      a.b.a().l();
      a.b.a().m();
      return;
      bool1 = false;
      break;
      label131:
      bool2 = false;
    }
  }
  
  private void f()
  {
    if (SystemUtil.a())
    {
      com.tencent.mobileqq.utils.FileUtils.b(AppConstants.bd + "head/" + ".nomedia");
      com.tencent.mobileqq.utils.FileUtils.b(AppConstants.bz + ".nomedia");
    }
    if (a.a.getBoolean("isConvertOldQQHeadOK", false)) {
      return;
    }
    Hashtable localHashtable = new Hashtable();
    EntityManager localEntityManager = a.b.a().createEntityManager();
    List localList = localEntityManager.a(Setting.class, new Setting().getTableName(), false, "bHeadType=? or (bHeadType<>? and bUsrType=?)", new String[] { "0", "0", "4" }, null, null, null, null);
    if ((localList != null) && (localList.size() > 0))
    {
      int i = 0;
      if (i < localList.size())
      {
        Object localObject2 = (Setting)localList.get(i);
        if ((uin != null) && (uin.length() > 0))
        {
          if (bUsrType != 4) {
            break label386;
          }
          if ((bHeadType != 0) || (systemHeadID != 0)) {
            break label248;
          }
        }
        for (;;)
        {
          i += 1;
          break;
          label248:
          label273:
          int j;
          label275:
          String str1;
          String str2;
          if (uin.startsWith("troop_"))
          {
            localObject1 = uin.substring(6);
            j = 4;
            str1 = a.b.a(j, (String)localObject1);
            str2 = a.b.a(j, (String)localObject1, 0);
            if (bHeadType != 0) {
              break label397;
            }
          }
          label386:
          label397:
          for (localObject1 = "sys_" + String.valueOf(systemHeadID);; localObject1 = uin)
          {
            localObject2 = new File(str1);
            if (!localHashtable.containsKey(localObject1)) {
              break label406;
            }
            if (!((File)localObject2).exists()) {
              break;
            }
            ((File)localObject2).delete();
            break;
            localObject1 = uin;
            break label273;
            localObject1 = uin;
            j = 1;
            break label275;
          }
          label406:
          if (((File)localObject2).exists())
          {
            com.tencent.mobileqq.transfile.filebrowser.FileUtils.a(str1, str2);
            ((File)localObject2).delete();
            localHashtable.put(localObject1, Boolean.valueOf(true));
          }
        }
      }
    }
    localEntityManager.a();
    Object localObject1 = new File(AppConstants.bd + "head/" + "_thd/");
    if (((File)localObject1).exists()) {
      com.tencent.open.base.FileUtils.a((File)localObject1);
    }
    localObject1 = new File(SystemUtil.b + "head/" + "_thd/");
    if (((File)localObject1).exists()) {
      com.tencent.open.base.FileUtils.a((File)localObject1);
    }
    a.a.edit().putBoolean("isConvertOldQQHeadOK", true).commit();
  }
  
  protected int a()
  {
    switch (h)
    {
    default: 
      a.b.a().a(false);
      a.a(6008, false, null, true);
    }
    for (;;)
    {
      return 7;
      d();
      continue;
      c();
      continue;
      e();
    }
  }
}
