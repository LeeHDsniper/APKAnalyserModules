package com.tencent.mobileqq.activity.aio.rebuild;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatSettingActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.tips.NearbyMarketGrayTips;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.app.CardHandler;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ShieldListObserver;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.dating.DatingUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbyChatFlowerHelper;
import com.tencent.mobileqq.nearby.NearbyChatFlowerHelper.FlowerPlayable;
import com.tencent.mobileqq.nearby.NearbyRelevantObserver;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.utils.StartupTracker;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.open.adapter.OpenAppClient;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XEditTextEx;
import java.util.Observable;
import lic;
import lid;
import lie;
import lif;
import lig;
import lih;
import lii;
import lij;
import mqq.os.MqqHandler;

public class NearbyChatPie
  extends BaseChatPie
  implements NearbyChatFlowerHelper.FlowerPlayable
{
  static final int ds = -1;
  public boolean G;
  protected boolean H;
  boolean I;
  protected MessageObserver a;
  ShieldListObserver jdField_a_of_type_ComTencentMobileqqAppShieldListObserver;
  public NearbyChatFlowerHelper a;
  NearbyRelevantObserver jdField_a_of_type_ComTencentMobileqqNearbyNearbyRelevantObserver;
  public final String ae;
  public String af;
  String ag;
  public String ah;
  protected String ai;
  int dt;
  public int du;
  protected int dv;
  
  public NearbyChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    ae = NearbyChatPie.class.getSimpleName();
    dt = 0;
    du = -1;
    H = false;
    I = false;
    jdField_a_of_type_ComTencentMobileqqAppShieldListObserver = new lig(this);
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lih(this);
    jdField_a_of_type_ComTencentMobileqqNearbyNearbyRelevantObserver = new lii(this);
    ag = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("from_where_to_aio");
    G = true;
  }
  
  public void C()
  {
    if (jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper != null) {
      jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper.c();
    }
    super.C();
  }
  
  protected void R()
  {
    super.R();
    jdField_a_of_type_MqqOsMqqHandler.postDelayed(new lij(this), 200L);
  }
  
  protected void X()
  {
    super.X();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppShieldListObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqNearbyNearbyRelevantObserver);
  }
  
  protected void Y()
  {
    super.Y();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppShieldListObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqNearbyNearbyRelevantObserver);
  }
  
  public NearbyChatFlowerHelper a()
  {
    return jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper;
  }
  
  protected void a(Intent paramIntent, int paramInt)
  {
    super.a(paramIntent, paramInt);
    if ((H) && (!I))
    {
      I = true;
      ai = paramIntent.getStringExtra("SHOWLOVE_PIC");
      ah = paramIntent.getStringExtra("SHOWLOVE_MSG");
      dv = paramIntent.getIntExtra("gender", -1);
      ar();
    }
  }
  
  protected boolean a()
  {
    return true;
  }
  
  protected boolean a(MessageRecord paramMessageRecord)
  {
    return (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(frienduin)) && ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == istroop) || ((MsgProxyUtils.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) && (MsgProxyUtils.c(istroop))));
  }
  
  public void ag()
  {
    if (H) {
      return;
    }
    super.ag();
  }
  
  void ar()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.nearby_bank", 4, "doSendShowLoveMsg,picPath:" + ai + ",msg:" + ah + ",gender:" + dv);
    }
    if (TextUtils.isEmpty(ai)) {
      return;
    }
    if (dv == 0) {}
    for (Object localObject1 = "男";; localObject1 = "女")
    {
      Object localObject2 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131371709, new Object[] { localObject1, localObject1 });
      localObject1 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getLayoutInflater().inflate(2130904256, null);
      ((View)localObject1).setOnClickListener(this);
      ((TextView)((View)localObject1).findViewById(2131301976)).setText((CharSequence)localObject2);
      localObject2 = new RelativeLayout.LayoutParams(-1, -2);
      ((RelativeLayout.LayoutParams)localObject2).addRule(6, 2131297342);
      ((RelativeLayout.LayoutParams)localObject2).addRule(8, 2131297342);
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView((View)localObject1, (ViewGroup.LayoutParams)localObject2);
      ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, ai);
      if (TextUtils.isEmpty(ah)) {
        break;
      }
      q = true;
      localObject1 = new Message();
      what = 41;
      obj = ah;
      jdField_a_of_type_MqqOsMqqHandler.sendMessageDelayed((Message)localObject1, 2000L);
      return;
    }
  }
  
  protected void b(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("uinname");
    paramIntent = str;
    if (TextUtils.isEmpty(str)) {
      paramIntent = ContactUtils.o(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString = paramIntent;
    b.setText(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString);
    if (QLog.isDevelopLevel()) {
      DatingUtil.a(ae, new Object[] { "updateSession_updateTitle", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString });
    }
  }
  
  public void c()
  {
    if (jdField_a_of_type_ComTencentWidgetXEditTextEx != null) {}
    for (String str = jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().toString();; str = null)
    {
      super.c();
      if ((af != null) && (af.length() > 0) && (af.equals(str))) {
        ThreadManager.a(new lie(this, str), 5, null, false);
      }
      af = null;
      if ((ag != null) && (ag.equals("nearby_recommend_people")) && (G)) {
        ThreadManager.a(new lif(this), 0, null, false);
      }
      return;
    }
  }
  
  protected boolean c()
  {
    return (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1001) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1010);
  }
  
  protected void d(Intent paramIntent)
  {
    super.d(paramIntent);
    StartupTracker.a(null, "AIO_updateSession_business");
    Object localObject;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1009)
    {
      localObject = paramIntent.getByteArrayExtra("rich_status_sig");
      if (QLog.isColorLevel()) {
        QLog.d(ae, 2, "From chatActivity : sameState Sig--->" + HexUtil.a((byte[])localObject));
      }
      if (localObject != null) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().g(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, (byte[])localObject);
      }
    }
    for (;;)
    {
      H = paramIntent.getBooleanExtra("IS_FROM_SHOWLOVE", false);
      r = H;
      if (-1 == du) {
        ThreadManager.a(new lic(this), 8, null, false);
      }
      StartupTracker.a("AIO_updateSession_business", null);
      return;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001)
      {
        du = paramIntent.getIntExtra("gender", -1);
        localObject = paramIntent.getByteArrayExtra("rich_accost_sig");
        if (QLog.isColorLevel()) {
          QLog.d(ae, 2, "From chatActivity : accost Sig--->" + HexUtil.a((byte[])localObject));
        }
        if (localObject != null) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().h(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, (byte[])localObject);
        }
        if (2 == paramIntent.getExtras().getInt("cSpecialFlag"))
        {
          ChatActivityFacade.e(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
        }
        else
        {
          localObject = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          if (localObject == null)
          {
            if (StringUtil.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
              ((CardHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(2)).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, (byte)1, 0);
            }
          }
          else if ((localObject != null) && (strCertificationInfo != null) && (!strCertificationInfo.equals(""))) {
            ChatActivityFacade.e(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
          }
        }
      }
      else if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1010)
      {
        du = paramIntent.getIntExtra("gender", -1);
        dt = paramIntent.getIntExtra("dating_from_id", 0);
        localObject = paramIntent.getByteArrayExtra("rich_date_sig");
        if (localObject != null) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().k(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, (byte[])localObject);
        }
      }
    }
  }
  
  protected void f()
  {
    if (H) {
      return;
    }
    super.f();
    NearbyMarketGrayTips localNearbyMarketGrayTips = new NearbyMarketGrayTips(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager);
    localNearbyMarketGrayTips.a(du);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(localNearbyMarketGrayTips);
  }
  
  protected void l()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1009)
    {
      super.l();
      return;
    }
    c.setOnClickListener(new lid(this));
    c.setVisibility(0);
    c.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131367355));
  }
  
  public void m()
  {
    Intent localIntent = new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, ChatSettingActivity.class);
    localIntent.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localIntent.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString);
    localIntent.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    localIntent.putExtra("add_friend_source_id", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_Int);
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(localIntent, 2000);
  }
  
  protected void q()
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString = ContactUtils.o(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    super.update(paramObservable, paramObject);
    if (((paramObject instanceof MessageRecord)) && ((paramObject instanceof ChatMessage)))
    {
      paramObservable = (MessageRecord)paramObject;
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1010) && ((dt == 2) || (dt == 3)) && (paramObservable.isSendFromLocal()) && (Utils.a(senderuin, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())))
      {
        if (dt != 2) {
          break label265;
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0X8004946", "0X8004946", 0, 0, "", "", "", "");
      }
    }
    for (;;)
    {
      dt = 0;
      if ((!paramObservable.isSendFromLocal()) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(frienduin)) && ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == istroop) || ((MsgProxyUtils.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) && (MsgProxyUtils.c(istroop)))) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001) && (msgtype == 62535))
      {
        paramObservable = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
        if ((paramObservable != null) && (istroop == 1001) && (msgtype == 62535)) {
          OpenAppClient.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), action);
        }
      }
      return;
      label265:
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0X8004945", "0X8004945", 0, 0, "", "", "", "");
    }
  }
  
  protected void x()
  {
    super.x();
    if (jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper != null) {
      jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper.b();
    }
  }
  
  protected void y()
  {
    super.y();
    if (jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper != null) {
      jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper.b();
    }
  }
}
