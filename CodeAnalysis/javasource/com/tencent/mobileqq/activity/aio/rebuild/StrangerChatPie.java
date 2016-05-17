package com.tencent.mobileqq.activity.aio.rebuild;

import SecurityAccountServer.RespondQueryQQBindingStat;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.mobileqq.activity.AddFriendLogicActivity;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.ChatSettingActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.activity.aio.tips.FriendHotTipsBar;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.app.CardHandler;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ShieldListObserver;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.StructMsgFactory;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.utils.ShareMsgHelper;
import com.tencent.mobileqq.utils.StartupTracker;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.open.adapter.OpenAppClient;
import com.tencent.qphone.base.util.QLog;
import java.util.Observable;
import lkn;
import lko;
import lkp;

public class StrangerChatPie
  extends BaseChatPie
{
  public static final String ae = "key_sub_title_from";
  boolean G;
  private boolean H;
  private boolean I;
  protected MessageObserver a;
  private ShieldListObserver a;
  private final String af;
  
  public StrangerChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    af = "StrangerChatPie";
    G = false;
    H = false;
    I = false;
    jdField_a_of_type_ComTencentMobileqqAppShieldListObserver = new lko(this);
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lkp(this);
  }
  
  private void as()
  {
    Object localObject = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent();
    if (localObject == null) {}
    do
    {
      String str;
      do
      {
        return;
        str = ((Intent)localObject).getStringExtra("gid");
      } while (!ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, str));
      localObject = StructMsgFactory.a(((Intent)localObject).getByteArrayExtra("stuctmsg_bytes"));
    } while (localObject == null);
    ShareMsgHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, (AbsStructMsg)localObject, null);
    if (((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "mp_msg_sys_67", "twohand_send", 0, 1, 0, "1", "", "", "");
      return;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "mp_msg_sys_67", "twohand_send", 0, 1, 0, "", "1", "", "");
  }
  
  protected void I()
  {
    if ((I) && (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("callback_type").equals("schemeconfirm")) && (WpaThirdAppStructMsgUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo))) {
      return;
    }
    super.I();
  }
  
  protected void Q()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006) && (!jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a()) && (!jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.b())) {
      jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true);
    }
    super.Q();
  }
  
  protected void X()
  {
    super.X();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppShieldListObserver);
  }
  
  protected void Y()
  {
    super.Y();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppShieldListObserver);
  }
  
  protected boolean a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006)
    {
      PhoneContact localPhoneContact = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10)).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      StringBuilder localStringBuilder;
      if (QLog.isColorLevel())
      {
        localStringBuilder = new StringBuilder().append("StrangerChatPie.showorhideAddFriend curFriendUin=").append(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString).append(" contact=");
        if (localPhoneContact != null) {
          break label99;
        }
      }
      label99:
      for (String str = "null";; str = "real")
      {
        QLog.d("StrangerChatPie", 2, str);
        if (localPhoneContact == null) {
          break;
        }
        return false;
      }
    }
    return true;
  }
  
  protected boolean a(MessageRecord paramMessageRecord)
  {
    return (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(frienduin)) && ((MsgProxyUtils.u(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == istroop) || ((MsgProxyUtils.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) && (MsgProxyUtils.c(istroop))));
  }
  
  public void ar()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006)
    {
      Intent localIntent = AddFriendLogicActivity.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, null, 3006, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString, null, null, null, null);
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivity(localIntent);
    }
  }
  
  protected void b(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("uinname");
    paramIntent = str;
    if (str == null)
    {
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1000) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1020) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1004)) {
        break label108;
      }
      paramIntent = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.c, ContactUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int), 3);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString = paramIntent;
      jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString);
      return;
      label108:
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006)
      {
        paramIntent = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10)).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        if (paramIntent != null) {
          paramIntent = name;
        } else if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f != null) {
          paramIntent = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, ContactUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int), 3);
        } else {
          paramIntent = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
        }
      }
      else
      {
        str = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, ContactUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int), 3);
        if (str != null)
        {
          paramIntent = str;
          if (!str.equals(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {}
        }
        else
        {
          paramIntent = str;
          if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1005)
          {
            jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
            paramIntent = str;
          }
        }
      }
    }
  }
  
  public void c()
  {
    super.c();
    if (G)
    {
      G = false;
      as();
    }
    if (H)
    {
      WpaThirdAppStructMsgUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, H);
      H = false;
    }
  }
  
  protected boolean c()
  {
    return (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1006) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1000) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1004);
  }
  
  protected void d(Intent paramIntent)
  {
    super.d(paramIntent);
    StartupTracker.a(null, "AIO_updateSession_business");
    Object localObject;
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1000) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1020))
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.c = paramIntent.getStringExtra("troop_code");
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.c == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.c.trim().length() == 0))
      {
        localObject = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
        jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.c = ((TroopManager)localObject).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.c == null)
        {
          localObject = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
          jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.c = ((HotChatManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
        }
      }
    }
    for (;;)
    {
      G = paramIntent.getBooleanExtra("fromSencondhandCommunity", false);
      I = paramIntent.getBooleanExtra("from3rdApp", false);
      H = WpaThirdAppStructMsgUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, paramIntent);
      StartupTracker.a("AIO_updateSession_business", null);
      return;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1004)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.c = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b;
      }
      else if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006)
      {
        localObject = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10)).a();
        if (localObject != null) {
          jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.e = (nationCode + mobileNo);
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f = ContactUtils.f(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f == null) && (QLog.isColorLevel())) {
          QLog.e("StrangerChatPie", 2, "contactUin == null");
        }
        jdField_a_of_type_Boolean = false;
        jdField_b_of_type_Boolean = true;
      }
      else if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1003)
      {
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
      else if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1009)
      {
        localObject = paramIntent.getByteArrayExtra("rich_status_sig");
        if (QLog.isColorLevel()) {
          QLog.d("StrangerChatPie", 2, "From chatActivity : sameState Sig--->" + HexUtil.a((byte[])localObject));
        }
        if (localObject != null) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().g(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, (byte[])localObject);
        }
      }
      else if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001)
      {
        localObject = paramIntent.getByteArrayExtra("rich_accost_sig");
        if (QLog.isColorLevel()) {
          QLog.d("StrangerChatPie", 2, "From chatActivity : accost Sig--->" + HexUtil.a((byte[])localObject));
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
        localObject = paramIntent.getByteArrayExtra("rich_date_sig");
        if (localObject != null) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().k(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, (byte[])localObject);
        }
      }
    }
  }
  
  protected boolean d()
  {
    if ((I) && (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("callback_type").equals("schemeconfirm")) && (WpaThirdAppStructMsgUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo))) {
      return true;
    }
    return super.d();
  }
  
  protected void e(Intent paramIntent)
  {
    super.e(paramIntent);
    if (paramIntent.hasExtra("key_sub_title_from"))
    {
      paramIntent = paramIntent.getStringExtra("key_sub_title_from");
      if (!TextUtils.isEmpty(paramIntent))
      {
        if (jdField_c_of_type_AndroidWidgetTextView.getVisibility() == 8) {
          b(true);
        }
        jdField_c_of_type_AndroidWidgetTextView.setText(paramIntent);
        jdField_a_of_type_Boolean = false;
      }
    }
  }
  
  protected void j()
  {
    if (jdField_b_of_type_Boolean) {
      t();
    }
  }
  
  protected void k()
  {
    super.k();
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1003) {
      jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setChildVisible(8, 8);
    }
  }
  
  protected void l()
  {
    jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(new lkn(this));
    if ((ChatActivityUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo)) || (CrmUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1))
    {
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_c_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131367355));
      return;
    }
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
  }
  
  public void m()
  {
    Intent localIntent = new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, ChatSettingActivity.class);
    localIntent.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localIntent.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString);
    localIntent.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006) {
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f != null) && (!jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f.equals(""))) {
        break label176;
      }
    }
    label176:
    for (boolean bool = true;; bool = false)
    {
      localIntent.putExtra("isShieldMsgSwitchUnClickable", bool);
      if ((1000 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int) || (1004 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) {
        localIntent.putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
      }
      localIntent.putExtra("add_friend_source_id", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_Int);
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(localIntent, 2000);
      return;
    }
  }
  
  protected void q()
  {
    Object localObject;
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1000) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1020) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1004)) {
      localObject = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.c, ContactUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int), 3);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString = ((String)localObject);
      return;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006)
      {
        localObject = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10)).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        if (localObject != null) {
          localObject = name;
        } else if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f != null) {
          localObject = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.f, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, ContactUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int), 3);
        } else {
          localObject = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
        }
      }
      else
      {
        String str = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, ContactUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int), 3);
        localObject = str;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1005) {
          if (str != null)
          {
            localObject = str;
            if (!str.equals(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {}
          }
          else
          {
            jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
            localObject = str;
          }
        }
      }
    }
  }
  
  protected void t()
  {
    if ((jdField_b_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1006))
    {
      Object localObject = ((PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10)).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if ((localObject == null) || (ContactUtils.a(detalStatusFlag, iTermType) == 0)) {
        break label96;
      }
      localObject = ContactUtils.a((PhoneContact)localObject);
      b(true);
      jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
      if (F) {
        jdField_c_of_type_AndroidWidgetTextView.setContentDescription((CharSequence)localObject);
      }
    }
    label96:
    do
    {
      do
      {
        return;
      } while (jdField_c_of_type_AndroidWidgetTextView.getVisibility() != 0);
      b(false);
    } while (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a() != 5);
    FriendHotTipsBar.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    super.update(paramObservable, paramObject);
    if (((paramObject instanceof MessageRecord)) && ((paramObject instanceof ChatMessage)))
    {
      paramObservable = (MessageRecord)paramObject;
      if ((!paramObservable.isSendFromLocal()) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(frienduin)) && ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == istroop) || ((MsgProxyUtils.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) && (MsgProxyUtils.c(istroop)))) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1001) && (msgtype == 62535))
      {
        paramObservable = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
        if ((paramObservable != null) && (istroop == 1001) && (msgtype == 62535)) {
          OpenAppClient.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), action);
        }
      }
    }
  }
}
