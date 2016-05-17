package com.tencent.mobileqq.activity.aio.rebuild;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.av.gaudio.DoubleVideoGuideActivity;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.FriendProfileCardActivity;
import com.tencent.mobileqq.activity.aio.ChatBackground;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.tips.FriendHotTipsBar;
import com.tencent.mobileqq.activity.aio.tips.GatherContactsTips;
import com.tencent.mobileqq.activity.aio.tips.LightalkBlueTipsBar;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.StrangerObserver;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.emoticonview.EmoticonInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.jumplightalk.AIOJumpLightalkConfig;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.observer.VipGifObserver;
import com.tencent.mobileqq.servlet.ReduFriendObserver;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.utils.RecordParams;
import com.tencent.mobileqq.utils.StartupTracker;
import com.tencent.mobileqq.vipgift.VipGiftDownloadInfo;
import com.tencent.mobileqq.vipgift.VipGiftManager;
import com.tencent.qphone.base.util.QLog;
import java.util.Observable;
import lgt;
import lgu;
import lgv;
import lgw;
import lgx;
import lgz;
import lha;
import lhb;
import lhc;
import lhd;
import mqq.os.MqqHandler;

public class FriendChatPie
  extends BaseChatPie
{
  private boolean G;
  private boolean H;
  private boolean I;
  private boolean J;
  public FriendHotTipsBar a;
  private GatherContactsTips jdField_a_of_type_ComTencentMobileqqActivityAioTipsGatherContactsTips;
  FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  private StrangerObserver jdField_a_of_type_ComTencentMobileqqAppStrangerObserver;
  private AIOJumpLightalkConfig jdField_a_of_type_ComTencentMobileqqJumplightalkAIOJumpLightalkConfig;
  protected VipGifObserver a;
  private ReduFriendObserver jdField_a_of_type_ComTencentMobileqqServletReduFriendObserver;
  Runnable b;
  protected MessageObserver c;
  Runnable c;
  private long g;
  
  public FriendChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    G = false;
    H = false;
    I = true;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsGatherContactsTips = null;
    jdField_a_of_type_ComTencentMobileqqJumplightalkAIOJumpLightalkConfig = null;
    J = false;
    g = -1L;
    jdField_b_of_type_JavaLangRunnable = new lgv(this);
    jdField_c_of_type_JavaLangRunnable = new lgw(this);
    jdField_a_of_type_ComTencentMobileqqObserverVipGifObserver = new lha(this);
    jdField_a_of_type_ComTencentMobileqqServletReduFriendObserver = new lhb(this);
    jdField_a_of_type_ComTencentMobileqqAppStrangerObserver = new lhc(this);
    jdField_c_of_type_ComTencentMobileqqAppMessageObserver = new lhd(this);
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new lgu(this);
  }
  
  private void b(long paramLong)
  {
    VipGiftManager localVipGiftManager = (VipGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(75);
    VipGiftDownloadInfo localVipGiftDownloadInfo = localVipGiftManager.a();
    if ((localVipGiftDownloadInfo != null) && (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isResume()) && (b.equalsIgnoreCase(a())) && (d == 2L) && (paramLong == a)) {
      localVipGiftManager.a(localVipGiftDownloadInfo, jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
    }
  }
  
  protected void A()
  {
    super.A();
  }
  
  protected void I()
  {
    if ((H) && (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("callback_type").equals("schemeconfirm")) && (WpaThirdAppStructMsgUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo))) {
      return;
    }
    super.I();
  }
  
  protected void P()
  {
    StartupTracker.a(null, "AIO_onShow_business");
    super.P();
    ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    H = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getBooleanExtra("from3rdApp", false);
    G = WpaThirdAppStructMsgUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent());
    StartupTracker.a("AIO_onShow_business", null);
    ThreadManager.a(new lgz(this), 8, null, false);
  }
  
  protected void Q()
  {
    if ((!jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a()) && (!jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.b())) {}
    try
    {
      jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, false);
      if (I)
      {
        I = false;
        ThreadManager.a(jdField_c_of_type_JavaLangRunnable, 8, null, true);
      }
      super.Q();
      ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1);
      return;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.aio.BaseChatPie", 2, "friendchatpie onShow_otherThings, " + localNumberFormatException.toString());
        }
      }
    }
  }
  
  protected void X()
  {
    super.X();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.c(jdField_c_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppStrangerObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.registObserver(jdField_a_of_type_ComTencentMobileqqServletReduFriendObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.registObserver(jdField_a_of_type_ComTencentMobileqqObserverVipGifObserver);
  }
  
  protected void Y()
  {
    super.Y();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_c_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    if (jdField_a_of_type_ComTencentMobileqqServletReduFriendObserver != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(jdField_a_of_type_ComTencentMobileqqServletReduFriendObserver);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(jdField_a_of_type_ComTencentMobileqqObserverVipGifObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppStrangerObserver);
  }
  
  public AIOJumpLightalkConfig a()
  {
    return jdField_a_of_type_ComTencentMobileqqJumplightalkAIOJumpLightalkConfig;
  }
  
  public QQRecorder.RecorderParam a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0)
    {
      boolean bool = super.l();
      return RecordParams.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, bool);
    }
    return new QQRecorder.RecorderParam(RecordParams.f, 0, 0);
  }
  
  public void a(int paramInt1, String paramString1, String paramString2, String paramString3, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.aio.BaseChatPie", 2, "showAddFriendActivity-->uinType=" + paramInt1 + " peerUin=" + paramString1 + " name=" + paramString2 + " phoneNum=" + paramString3 + " srcId=" + paramInt2);
    }
    Intent localIntent = new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, DoubleVideoGuideActivity.class);
    localIntent.addFlags(262144);
    localIntent.addFlags(268435456);
    localIntent.putExtra("uinType", paramInt1);
    localIntent.putExtra("peerUin", paramString1);
    localIntent.putExtra("name", paramString2);
    localIntent.putExtra("phoneNum", paramString3);
    localIntent.putExtra("sourceId", paramInt2);
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivity(localIntent);
  }
  
  public void a(EmoticonInfo paramEmoticonInfo)
  {
    super.a(paramEmoticonInfo);
    if (G)
    {
      WpaThirdAppStructMsgUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, G);
      G = false;
    }
  }
  
  protected boolean a()
  {
    return ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
  }
  
  protected boolean a(boolean paramBoolean)
  {
    String str = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("PREVIOUS_WINDOW");
    if ((str != null) && (str.equals(FriendProfileCardActivity.class.getName()))) {
      g = NetConnInfoCenter.getServerTime();
    }
    return super.a(paramBoolean);
  }
  
  public void c()
  {
    super.c();
    if (G)
    {
      WpaThirdAppStructMsgUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, G);
      G = false;
    }
  }
  
  protected boolean d()
  {
    if ((H) && (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("callback_type").equals("schemeconfirm")) && (WpaThirdAppStructMsgUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo))) {
      return true;
    }
    return super.d();
  }
  
  protected void e()
  {
    super.e();
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = true;
    com.tencent.mobileqq.activity.aio.item.RichStatItemBuilder.a = 0L;
  }
  
  protected void f()
  {
    super.f();
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsGatherContactsTips = new GatherContactsTips(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioTipsLightalkBlueTipsBar == null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsLightalkBlueTipsBar = new LightalkBlueTipsBar(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsLightalkBlueTipsBar);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsGatherContactsTips);
  }
  
  protected void i(Intent paramIntent)
  {
    super.i(paramIntent);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioTipsGatherContactsTips != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsGatherContactsTips.a();
    }
  }
  
  protected void j()
  {
    if (jdField_b_of_type_Boolean) {
      t();
    }
  }
  
  protected void l()
  {
    jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(new lgx(this));
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_c_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131367355));
  }
  
  protected void t()
  {
    Object localObject;
    if (jdField_b_of_type_Boolean)
    {
      localObject = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      if (!i()) {
        break label28;
      }
    }
    label28:
    do
    {
      do
      {
        do
        {
          return;
          localObject = ((FriendsManager)localObject).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          if ((localObject == null) || (ContactUtils.a(detalStatusFlag, iTermType) == 0)) {
            break;
          }
          localObject = ContactUtils.b((Friends)localObject);
          b(true);
          jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
        } while (!F);
        jdField_c_of_type_AndroidWidgetTextView.setContentDescription((CharSequence)localObject);
        return;
      } while (jdField_c_of_type_AndroidWidgetTextView.getVisibility() != 0);
      b(false);
    } while (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a() != 5);
    FriendHotTipsBar.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
  }
  
  protected void u()
  {
    if (g > 0L) {
      ThreadManager.b().post(new lgt(this));
    }
    if (C) {
      if (QLog.isColorLevel()) {
        QLog.d("Q.aio.BaseChatPie", 2, "hasDestory = true return");
      }
    }
    do
    {
      return;
      super.u();
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a != null))
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a.setCallback(null);
        jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a = null;
      }
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioTipsGatherContactsTips != null) && ((jdField_a_of_type_ComTencentMobileqqActivityAioTipsGatherContactsTips.a()) || (jdField_a_of_type_ComTencentMobileqqActivityAioTipsGatherContactsTips.b()))) {
        ThreadManager.b(jdField_b_of_type_JavaLangRunnable);
      }
    } while (jdField_a_of_type_ComTencentMobileqqActivityAioTipsLightalkBlueTipsBar == null);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsLightalkBlueTipsBar = null;
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    if ((paramObject != null) && ((paramObject instanceof MessageForStructing)) && (!isread))
    {
      MessageForStructing localMessageForStructing = (MessageForStructing)paramObject;
      if ((localMessageForStructing == null) || (structingMsg == null) || (structingMsg.mMsgServiceID != 38) || (TextUtils.isEmpty(structingMsg.mResid)) || (!((VipGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(75)).a(localMessageForStructing))) {}
    }
    super.update(paramObservable, paramObject);
  }
  
  protected void x()
  {
    super.x();
  }
}
