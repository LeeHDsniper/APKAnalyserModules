package com.tencent.mobileqq.activity.aio.rebuild;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import android.widget.Toast;
import com.tencent.biz.ProtoServlet;
import com.tencent.biz.bmqq.util.BmqqSegmentUtil;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.biz.pubaccount.AccountDetailActivity;
import com.tencent.biz.pubaccount.PublicAccountServlet;
import com.tencent.biz.pubaccount.assistant.PubAccountAssistantManager;
import com.tencent.biz.ui.CustomMenuBar;
import com.tencent.biz.ui.MenuItem;
import com.tencent.crmqq.structmsg.StructMsg.ButtonInfo;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.activity.aio.tips.PubAccountAssistantTipsBar;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.app.EnterpriseQQHandler;
import com.tencent.mobileqq.app.EnterpriseQQObserver;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.PublicAccountObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ShieldListObserver;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.bubble.ChatXListView;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.emoticonview.FastImagePreviewLayout;
import com.tencent.mobileqq.enterpriseqq.EnterpriseQQManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mp.mobileqq_mp.FollowRequest;
import com.tencent.mobileqq.mp.mobileqq_mp.GetEqqDetailInfoRequest;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.StartupTracker;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.widget.PatchedButton;
import com.tencent.widget.XEditTextEx;
import com.tencent.widget.XPanelContainer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Observable;
import lff;
import lfg;
import lfh;
import lfi;
import lfj;
import lfl;
import lfm;
import lfn;
import lfo;
import lfp;
import lfs;
import lft;
import lfu;
import lfv;
import lfw;
import lfz;
import lga;
import mqq.app.MobileQQ;
import mqq.app.NewIntent;
import mqq.observer.BusinessObserver;

public class BusinessCmrTmpChatPie
  extends FriendChatPie
{
  public static final String ae = "isforceRequestDetail";
  private Handler jdField_a_of_type_AndroidOsHandler;
  private CustomMenuBar jdField_a_of_type_ComTencentBizUiCustomMenuBar;
  private EnterpriseQQObserver jdField_a_of_type_ComTencentMobileqqAppEnterpriseQQObserver;
  protected MessageObserver a;
  private PublicAccountObserver jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver;
  private ShieldListObserver jdField_a_of_type_ComTencentMobileqqAppShieldListObserver;
  private PublicAccountInfo jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo;
  private NewIntent jdField_a_of_type_MqqAppNewIntent;
  private final String af;
  private LinearLayout b;
  protected MessageObserver b;
  public List b;
  private LinearLayout c;
  private RelativeLayout e;
  private TextView f;
  private View g;
  protected ImageView g;
  private View h;
  protected ImageView h;
  private ImageView i;
  private ImageView j;
  
  public BusinessCmrTmpChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    af = "BusinessChatPie";
    jdField_a_of_type_MqqAppNewIntent = null;
    jdField_a_of_type_AndroidOsHandler = new lff(this);
    jdField_b_of_type_JavaUtilList = null;
    jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver = new lfu(this);
    jdField_a_of_type_ComTencentMobileqqAppShieldListObserver = new lfv(this);
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lfz(this);
    jdField_a_of_type_ComTencentMobileqqAppEnterpriseQQObserver = new lfi(this);
    jdField_b_of_type_ComTencentMobileqqAppMessageObserver = new lfo(this);
  }
  
  private StructMsg.ButtonInfo a(int paramInt)
  {
    Object localObject;
    if ((jdField_b_of_type_JavaUtilList == null) || (jdField_b_of_type_JavaUtilList.isEmpty()))
    {
      localObject = null;
      return localObject;
    }
    int k = 0;
    for (;;)
    {
      if (k >= jdField_b_of_type_JavaUtilList.size()) {
        break label156;
      }
      StructMsg.ButtonInfo localButtonInfo = (StructMsg.ButtonInfo)jdField_b_of_type_JavaUtilList.get(k);
      localObject = localButtonInfo;
      if (id.get() == paramInt) {
        break;
      }
      localObject = sub_button.get();
      if ((localObject != null) && (((List)localObject).size() > 0))
      {
        int m = 0;
        while (m < ((List)localObject).size())
        {
          if (getid.get() == paramInt) {
            return (StructMsg.ButtonInfo)((List)localObject).get(m);
          }
          m += 1;
        }
      }
      k += 1;
    }
    label156:
    return null;
  }
  
  private void a(int paramInt, BusinessObserver paramBusinessObserver)
  {
    EnterpriseQQHandler localEnterpriseQQHandler = (EnterpriseQQHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(21);
    if (localEnterpriseQQHandler != null) {
      localEnterpriseQQHandler.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 3, paramInt, 2, paramBusinessObserver);
    }
  }
  
  private void a(Editable paramEditable)
  {
    if ((paramEditable.length() > 0) && (jdField_a_of_type_ComTencentWidgetXEditTextEx.getLineCount() > 1))
    {
      r(80);
      return;
    }
    r(16);
  }
  
  private void a(PublicAccountInfo paramPublicAccountInfo)
  {
    if (paramPublicAccountInfo != null)
    {
      localPublicAccountDataManager = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
      if (localPublicAccountDataManager == null) {
        if (QLog.isColorLevel()) {
          QLog.d("BusinessChatPie", 2, "showEqqLbsEnableDialog(): pam is null");
        }
      }
    }
    while (!QLog.isColorLevel())
    {
      PublicAccountDataManager localPublicAccountDataManager;
      do
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.d("BusinessChatPie", 2, "showEqqLbsEnableDialog(): eqqPublicAccountInfo.mIsSyncLbsSelected=" + mIsSyncLbsSelected + ", eqqPublicAccountInfo.isSyncLbs=" + isSyncLbs + ", eqqPublicAccountInfo.mIsAgreeSyncLbs=" + mIsAgreeSyncLbs);
        }
      } while ((!isSyncLbs) || (mIsSyncLbsSelected) || (mIsAgreeSyncLbs));
      String str1 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131362662);
      String str2 = String.format(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131362663), new Object[] { jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d });
      paramPublicAccountInfo = DialogUtil.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 230, str1, str2, 2131362664, 2131362665, new lfj(this, paramPublicAccountInfo, localPublicAccountDataManager), new lfl(this, paramPublicAccountInfo, localPublicAccountDataManager));
      paramPublicAccountInfo.setCanceledOnTouchOutside(true);
      paramPublicAccountInfo.show();
      return;
    }
    QLog.e("BusinessChatPie", 2, "showEqqLbsEnableDialog(): eqqPublicAccountInfo=NULL, uin=" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
  }
  
  private void aA()
  {
    if (QLog.isColorLevel()) {
      QLog.d("BusinessChatPie", 2, "getMyLocationAndSend(): BEGIN");
    }
    SosoInterface.a(new lfn(this, 1, true, true, 0L, true, false, "BusinessCmrTmpChatPie"));
  }
  
  private void aB()
  {
    try
    {
      String str = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
      Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(str, 0);
      if ((localObject != null) && (((List)localObject).size() > 0))
      {
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject).next();
          if ((msgtype == 64523) || (msgtype == 64517) || (msgtype == 64518) || (msgtype == 63517)) {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(str, 0, uniseq);
          }
        }
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private void aw()
  {
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getLayoutInflater().inflate(2130903081, jdField_a_of_type_AndroidWidgetRelativeLayout);
    jdField_h_of_type_AndroidViewView = jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296915);
    jdField_a_of_type_ComTencentBizUiCustomMenuBar = ((CustomMenuBar)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296918));
    Object localObject = jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296914);
    ((View)localObject).setOnClickListener(new lga(this));
    jdField_a_of_type_ComTencentBizUiCustomMenuBar.setCoverView((View)localObject);
    jdField_a_of_type_ComTencentBizUiCustomMenuBar.setOnMenuItemClickListener(new lfg(this));
    jdField_a_of_type_ComTencentBizUiCustomMenuBar.setOnBackClickListner(new lfh(this));
    if (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getBooleanExtra("crm_ivr_aio_video_action_sheet", false)) {
      CrmUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    }
    for (;;)
    {
      jdField_c_of_type_AndroidWidgetLinearLayout = ((LinearLayout)d.findViewById(2131297344));
      localObject = (LinearLayout.LayoutParams)jdField_c_of_type_AndroidWidgetLinearLayout.getLayoutParams();
      gravity = 16;
      jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      jdField_c_of_type_AndroidWidgetLinearLayout.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localObject = (LinearLayout.LayoutParams)jdField_a_of_type_ComTencentWidgetPatchedButton.getLayoutParams();
      bottomMargin = 0;
      topMargin = 1;
      gravity = 16;
      jdField_a_of_type_ComTencentWidgetPatchedButton.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localObject = (LinearLayout.LayoutParams)jdField_a_of_type_ComTencentWidgetXEditTextEx.getLayoutParams();
      bottomMargin = 0;
      topMargin = 1;
      gravity = 16;
      jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams((ViewGroup.LayoutParams)localObject);
      i = ((ImageView)jdField_c_of_type_AndroidWidgetLinearLayout.findViewById(2131296338));
      i.setOnClickListener(this);
      if (CustomMenuBar.a())
      {
        jdField_a_of_type_ComTencentBizUiCustomMenuBar.setBackgroundColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427671));
        jdField_a_of_type_ComTencentBizUiCustomMenuBar.setMinimumHeight(AIOUtils.a(48.0F, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources()));
      }
      jdField_h_of_type_AndroidWidgetImageView = ((ImageView)jdField_c_of_type_AndroidWidgetLinearLayout.findViewById(2131298591));
      jdField_h_of_type_AndroidWidgetImageView.setOnClickListener(this);
      jdField_g_of_type_AndroidWidgetImageView = ((ImageView)jdField_c_of_type_AndroidWidgetLinearLayout.findViewById(2131297759));
      jdField_g_of_type_AndroidWidgetImageView.setOnClickListener(this);
      if (!CustomMenuBar.a())
      {
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130841586);
        jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130837559);
      }
      if (jdField_a_of_type_ComTencentWidgetXEditTextEx != null)
      {
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setBackgroundResource(2130842525);
        if (CustomMenuBar.a()) {
          jdField_a_of_type_AndroidWidgetLinearLayout.setBackgroundColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427671));
        }
      }
      return;
      if (QLog.isColorLevel()) {
        QLog.d("BusinessChatPie", 2, "We needn't show video action sheet, because isShowVideoActionSheet is false");
      }
    }
  }
  
  private void ax()
  {
    if (jdField_b_of_type_JavaUtilList == null) {
      jdField_b_of_type_JavaUtilList = new ArrayList();
    }
    jdField_b_of_type_JavaUtilList.clear();
    List localList = EnterpriseQQManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a());
    if ((localList != null) && (localList.size() > 0)) {
      jdField_b_of_type_JavaUtilList.addAll(localList);
    }
    if ((jdField_b_of_type_JavaUtilList != null) && (!jdField_b_of_type_JavaUtilList.isEmpty())) {
      h(true);
    }
    for (;;)
    {
      b(jdField_b_of_type_JavaUtilList);
      return;
      h(false);
    }
  }
  
  private void ay()
  {
    if (QLog.isColorLevel()) {
      QLog.d("BusinessChatPie", 2, "showEqqLbsEnableDialog(): BEGIN");
    }
    Object localObject;
    if (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getBooleanExtra("isforceRequestDetail", false))
    {
      localObject = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
      if (localObject != null) {
        jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo = ((PublicAccountDataManager)localObject).c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      }
    }
    if (jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo != null) {
      a(jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo);
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("BusinessChatPie", 2, "showEqqLbsEnableDialog(): END");
      }
      return;
      localObject = new NewIntent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), ProtoServlet.class);
      ((NewIntent)localObject).putExtra("cmd", "EqqAccountSvc.get_eqq_detail");
      mobileqq_mp.GetEqqDetailInfoRequest localGetEqqDetailInfoRequest = new mobileqq_mp.GetEqqDetailInfoRequest();
      version.set(1);
      seqno.set(0);
      try
      {
        eqq_id.set((int)Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
        ((NewIntent)localObject).putExtra("data", localGetEqqDetailInfoRequest.toByteArray());
        ((NewIntent)localObject).setObserver(new lfm(this));
        if (QLog.isColorLevel()) {
          QLog.d("BusinessChatPie", 2, "showEqqLbsEnableDialog() get eqq detail");
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet((NewIntent)localObject);
      }
      catch (Exception localException)
      {
        for (;;) {}
      }
    }
  }
  
  private void az()
  {
    if (jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo == null)
    {
      PublicAccountDataManager localPublicAccountDataManager = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
      if (localPublicAccountDataManager != null) {
        jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo = localPublicAccountDataManager.c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      }
    }
    if ((jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo.isSyncLbs) && (jdField_a_of_type_ComTencentMobileqqDataPublicAccountInfo.mIsAgreeSyncLbs)) {
      aA();
    }
  }
  
  private void b(List paramList)
  {
    jdField_a_of_type_ComTencentBizUiCustomMenuBar.a();
    if ((paramList == null) || (paramList.isEmpty()))
    {
      jdField_a_of_type_ComTencentBizUiCustomMenuBar.setVisibility(8);
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      i.setVisibility(8);
    }
    for (;;)
    {
      return;
      i.setVisibility(0);
      int m = paramList.size();
      int k = 0;
      while ((k < m) && (k <= 2))
      {
        Object localObject = (StructMsg.ButtonInfo)paramList.get(k);
        MenuItem localMenuItem = new MenuItem(key.get(), name.get(), null, id.get());
        if (sub_button.get().size() > 0)
        {
          localObject = sub_button.get().iterator();
          while (((Iterator)localObject).hasNext())
          {
            StructMsg.ButtonInfo localButtonInfo = (StructMsg.ButtonInfo)((Iterator)localObject).next();
            localMenuItem.a(new MenuItem(key.get(), name.get(), null, id.get()));
          }
        }
        jdField_a_of_type_ComTencentBizUiCustomMenuBar.a(localMenuItem, a());
        k += 1;
      }
    }
  }
  
  private void h(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
      jdField_a_of_type_ComTencentBizUiCustomMenuBar.setVisibility(0);
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(4);
      return;
    }
    i.setVisibility(0);
  }
  
  private void r(int paramInt)
  {
    if (jdField_c_of_type_AndroidWidgetLinearLayout == null) {}
    LinearLayout.LayoutParams localLayoutParams1;
    do
    {
      return;
      localLayoutParams1 = (LinearLayout.LayoutParams)jdField_c_of_type_AndroidWidgetLinearLayout.getLayoutParams();
      LinearLayout.LayoutParams localLayoutParams2 = (LinearLayout.LayoutParams)jdField_a_of_type_ComTencentWidgetXEditTextEx.getLayoutParams();
      if (gravity != paramInt)
      {
        gravity = paramInt;
        jdField_c_of_type_AndroidWidgetLinearLayout.setLayoutParams(localLayoutParams1);
      }
      if (gravity != paramInt)
      {
        gravity = paramInt;
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams2);
      }
      localLayoutParams1 = (LinearLayout.LayoutParams)jdField_a_of_type_ComTencentWidgetPatchedButton.getLayoutParams();
    } while (gravity == paramInt);
    gravity = paramInt;
    jdField_a_of_type_ComTencentWidgetPatchedButton.setLayoutParams(localLayoutParams1);
  }
  
  protected void B()
  {
    super.B();
    if ((j != null) && (jdField_a_of_type_AndroidWidgetLinearLayout != null))
    {
      jdField_a_of_type_AndroidWidgetLinearLayout.removeView(j);
      j = null;
    }
    if (jdField_a_of_type_ComTencentBizUiCustomMenuBar != null) {
      jdField_a_of_type_ComTencentBizUiCustomMenuBar.a();
    }
  }
  
  protected void X()
  {
    super.X();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppEnterpriseQQObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_b_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppShieldListObserver);
  }
  
  protected void Y()
  {
    super.Y();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppEnterpriseQQObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_b_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppShieldListObserver);
  }
  
  protected void a(Intent paramIntent)
  {
    super.a(paramIntent);
    ar();
  }
  
  protected boolean a()
  {
    return false;
  }
  
  protected boolean a(boolean paramBoolean)
  {
    A = false;
    super.a(paramBoolean);
    if (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing())
    {
      aw();
      ax();
      EnterpriseQQManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), false);
    }
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.sendBroadcast(new Intent("com.tencent.mobileqq.addLbsObserver"));
    lfp localLfp = new lfp(this);
    CrmUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, localLfp);
    aB();
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setCustomHeight(0);
    }
    return true;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    super.afterTextChanged(paramEditable);
    a(paramEditable);
  }
  
  public void ar()
  {
    if (s())
    {
      if (QLog.isColorLevel()) {
        QLog.i("ChatActivity", 2, "updateFollowAndShieldView true");
      }
      as();
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.i("ChatActivity", 2, "updateFollowAndShieldView false");
    }
    at();
  }
  
  protected void as()
  {
    if (QLog.isColorLevel()) {
      QLog.d("BusinessChatPie", 2, "showFollowAndShield() ==== called.");
    }
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    Object localObject2;
    if (jdField_b_of_type_AndroidWidgetLinearLayout == null)
    {
      localObject2 = new lfs(this);
      jdField_b_of_type_AndroidWidgetLinearLayout = new LinearLayout(jdField_a_of_type_AndroidContentContext);
      jdField_b_of_type_AndroidWidgetLinearLayout.setId(2131296391);
      jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      jdField_b_of_type_AndroidWidgetLinearLayout.setOrientation(0);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, (int)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getDimension(2131493099));
      localLayoutParams.addRule(10);
      LinearLayout.LayoutParams localLayoutParams1 = new LinearLayout.LayoutParams(0, -1);
      weight = 1.0F;
      jdField_g_of_type_AndroidViewView = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getLayoutInflater().inflate(2130903702, null);
      jdField_g_of_type_AndroidViewView.setBackgroundDrawable(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getDrawable(2130837633));
      jdField_g_of_type_AndroidViewView.findViewById(2131299699).setVisibility(8);
      f = ((TextView)jdField_g_of_type_AndroidViewView.findViewById(2131298109));
      f.setTextColor(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getColorStateList(2131428210));
      ((ImageView)jdField_g_of_type_AndroidViewView.findViewById(2131298108)).setImageResource(2130838632);
      jdField_g_of_type_AndroidViewView.setOnClickListener((View.OnClickListener)localObject2);
      jdField_b_of_type_AndroidWidgetLinearLayout.addView(jdField_g_of_type_AndroidViewView, localLayoutParams1);
      View localView = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getLayoutInflater().inflate(2130903702, null);
      localView.setBackgroundDrawable(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getDrawable(2130837633));
      TextView localTextView = (TextView)localView.findViewById(2131298109);
      localTextView.setTextColor(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getColorStateList(2131428210));
      localTextView.setText(jdField_a_of_type_AndroidContentContext.getString(2131369985));
      ((ImageView)localView.findViewById(2131298108)).setImageResource(2130838610);
      localView.setTag(Integer.valueOf(3));
      localView.setOnClickListener((View.OnClickListener)localObject2);
      jdField_b_of_type_AndroidWidgetLinearLayout.addView(localView, localLayoutParams1);
      ((RelativeLayout.LayoutParams)jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getLayoutParams()).addRule(3, 2131296391);
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_b_of_type_AndroidWidgetLinearLayout, 0, localLayoutParams);
    }
    if (ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, (String)localObject1, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.e))
    {
      f.setText(jdField_a_of_type_AndroidContentContext.getString(2131367380));
      jdField_g_of_type_AndroidViewView.setTag(Integer.valueOf(1));
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      localObject1 = d.findViewById(2131297350);
      if (localObject1 != null)
      {
        localObject2 = (RelativeLayout.LayoutParams)((View)localObject1).getLayoutParams();
        topMargin = ((int)jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDimension(2131493099));
        ((View)localObject1).setLayoutParams((ViewGroup.LayoutParams)localObject2);
      }
      return;
      f.setText(jdField_a_of_type_AndroidContentContext.getString(2131369984));
      jdField_g_of_type_AndroidViewView.setTag(Integer.valueOf(2));
    }
  }
  
  protected void at()
  {
    if (jdField_b_of_type_AndroidWidgetLinearLayout != null) {
      jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(8);
    }
    if (d != null)
    {
      View localView = d.findViewById(2131297350);
      if (localView != null)
      {
        RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)localView.getLayoutParams();
        topMargin = 0;
        localView.setLayoutParams(localLayoutParams);
      }
    }
  }
  
  public void au()
  {
    ChatActivityUtils.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
    if (QLog.isColorLevel()) {
      QLog.d("BusinessChatPie", 2, "follow");
    }
    ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if (jdField_a_of_type_MqqAppNewIntent != null) {
      jdField_a_of_type_MqqAppNewIntent.setObserver(null);
    }
    jdField_a_of_type_MqqAppNewIntent = new NewIntent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), PublicAccountServlet.class);
    jdField_a_of_type_MqqAppNewIntent.putExtra("cmd", "follow");
    Object localObject = new mobileqq_mp.FollowRequest();
    account_type.set(2);
    uin.set((int)Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    jdField_a_of_type_MqqAppNewIntent.putExtra("data", ((mobileqq_mp.FollowRequest)localObject).toByteArray());
    localObject = new lft(this);
    jdField_a_of_type_MqqAppNewIntent.setObserver((BusinessObserver)localObject);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(jdField_a_of_type_MqqAppNewIntent);
    if (QLog.isColorLevel()) {
      QLog.d("BusinessChatPie", 2, "follow exit");
    }
  }
  
  protected void av()
  {
    if (jdField_g_of_type_AndroidWidgetImageView == null) {}
    do
    {
      return;
      if (l != 1) {
        break;
      }
      jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130840223);
      jdField_g_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_g_of_type_AndroidWidgetImageView.setEnabled(true);
    } while (!VersionUtils.e());
    jdField_g_of_type_AndroidWidgetImageView.setAlpha(1.0F);
    return;
    if (l == 2)
    {
      jdField_g_of_type_AndroidWidgetImageView.setEnabled(false);
      if (VersionUtils.e()) {
        jdField_g_of_type_AndroidWidgetImageView.setAlpha(0.6F);
      }
      if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 3)
      {
        if (CustomMenuBar.a()) {
          jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842493);
        }
        for (;;)
        {
          jdField_g_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidContentContext.getString(2131367371));
          return;
          jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842684);
        }
      }
      if (CustomMenuBar.a()) {
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842492);
      }
      for (;;)
      {
        jdField_g_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidContentContext.getString(2131367370));
        return;
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842685);
      }
    }
    jdField_g_of_type_AndroidWidgetImageView.setEnabled(true);
    if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 3)
    {
      if (CustomMenuBar.a()) {
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842493);
      }
      for (;;)
      {
        jdField_g_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidContentContext.getString(2131367371));
        label246:
        if (!VersionUtils.e()) {
          break;
        }
        jdField_g_of_type_AndroidWidgetImageView.setAlpha(1.0F);
        return;
        jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842684);
      }
    }
    if (CustomMenuBar.a()) {
      jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842492);
    }
    for (;;)
    {
      jdField_g_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidContentContext.getString(2131367370));
      break label246;
      break;
      jdField_g_of_type_AndroidWidgetImageView.setImageResource(2130842685);
    }
  }
  
  protected void b(int paramInt1, int paramInt2)
  {
    super.b(paramInt1, paramInt2);
    av();
    if (paramInt2 == 8) {
      if (jdField_h_of_type_AndroidWidgetImageView != null)
      {
        if (!CustomMenuBar.a()) {
          break label40;
        }
        jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130842504);
      }
    }
    label40:
    while (jdField_h_of_type_AndroidWidgetImageView == null)
    {
      return;
      jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130842488);
      return;
    }
    if (CustomMenuBar.a())
    {
      jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130842503);
      return;
    }
    jdField_h_of_type_AndroidWidgetImageView.setImageResource(2130842487);
  }
  
  public void c(Intent paramIntent)
  {
    paramIntent.putExtra("uintype", 1024);
    super.c(paramIntent);
    ay();
    az();
  }
  
  protected boolean c()
  {
    return true;
  }
  
  protected void d(Intent paramIntent)
  {
    StartupTracker.a(null, "AIO_updateSession_business");
    paramIntent = paramIntent.getByteArrayExtra("sigt");
    if (QLog.isColorLevel()) {
      QLog.d("BusinessChatPie", 2, "From chatActivity : buinessCrm Sigt--->" + HexUtil.a(paramIntent));
    }
    if (paramIntent != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, paramIntent);
      if (QLog.isDevelopLevel()) {
        QLog.d("BusinessChatPie", 4, "updateSession()--AIO 已保存 sigt");
      }
    }
    StartupTracker.a("AIO_updateSession_business", null);
  }
  
  protected boolean d()
  {
    if (jdField_a_of_type_ComTencentBizUiCustomMenuBar != null) {
      jdField_a_of_type_ComTencentBizUiCustomMenuBar.b();
    }
    return super.d();
  }
  
  protected void f()
  {
    super.f();
    PubAccountAssistantTipsBar localPubAccountAssistantTipsBar = new PubAccountAssistantTipsBar(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, this, jdField_a_of_type_MqqOsMqqHandler);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(localPubAccountAssistantTipsBar);
  }
  
  public void l()
  {
    boolean bool = CrmUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    if (bool)
    {
      jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(new lfw(this, bool));
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_c_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131367355));
    }
  }
  
  public void m()
  {
    Intent localIntent = new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, AccountDetailActivity.class);
    localIntent.putExtra("account_type", 2);
    localIntent.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localIntent.putExtra("need_finish", true);
    localIntent.putExtra("uintype", 1024);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Biz_card", "Open_biz_card", 0, 0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "", "", "");
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(localIntent, 2000);
  }
  
  protected void o()
  {
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130842631);
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == 2131296338) {
      h(true);
    }
    if ((paramView.getId() == 2131297759) && (l != 1))
    {
      if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 3)
      {
        jdField_a_of_type_ComTencentWidgetXPanelContainer.a(1);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "0X8005796", 0, 0, "", "", "", "");
      }
    }
    else if (paramView.getId() == 2131298591)
    {
      ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if (jdField_a_of_type_ComTencentWidgetXPanelContainer.a() != 8) {
        break label243;
      }
      if (jdField_h_of_type_AndroidWidgetImageView != null) {
        jdField_h_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131370848));
      }
      if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewFastImagePreviewLayout != null) && (jdField_a_of_type_ComTencentMobileqqEmoticonviewFastImagePreviewLayout.getVisibility() == 0))
      {
        if (QLog.isColorLevel()) {
          QLog.d("fastimage", 2, "BaseCHatPie onClick keybordicon removeFastImage");
        }
        a(true);
      }
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a(1);
    }
    for (;;)
    {
      super.onClick(paramView);
      return;
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a(3);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "ep_mall", "0X8005795", 0, 0, "", "", "", "");
      break;
      label243:
      S();
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a(8);
      if (jdField_h_of_type_AndroidWidgetImageView != null) {
        jdField_h_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131370849));
      }
      i(0);
    }
  }
  
  public void q(int paramInt)
  {
    Toast.makeText(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getApplicationContext(), paramInt, 0).show();
  }
  
  protected boolean s()
  {
    PublicAccountDataManager localPublicAccountDataManager;
    long l1;
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1024) && (!BmqqSegmentUtil.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
    {
      localPublicAccountDataManager = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
      l1 = 0L;
    }
    try
    {
      long l2 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      l1 = l2;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
    if (!localPublicAccountDataManager.a(Long.valueOf(l1))) {
      return true;
    }
    return false;
  }
  
  protected void u()
  {
    super.u();
    if ((j != null) && (jdField_a_of_type_AndroidWidgetLinearLayout != null))
    {
      jdField_a_of_type_AndroidWidgetLinearLayout.removeView(j);
      j = null;
    }
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    super.update(paramObservable, paramObject);
    paramObservable = PubAccountAssistantManager.a();
    if (paramObservable != null) {
      paramObservable.d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
  }
}
