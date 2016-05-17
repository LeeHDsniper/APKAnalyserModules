package com.tencent.mobileqq.activity.contact.troop;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.biz.pubaccount.AccountDetailActivity;
import com.tencent.mobileqq.activity.ChatSettingForTroop;
import com.tencent.mobileqq.activity.ProfileActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.TroopInfoActivity;
import com.tencent.mobileqq.activity.TroopRequestActivity;
import com.tencent.mobileqq.activity.contact.newfriend.BaseSystemMsgInterface;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.TroopRemindSettingManager;
import com.tencent.mobileqq.newfriend.TroopSystemMessage;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.mobileqq.troop.utils.TroopBindPubAccountProtocol;
import com.tencent.mobileqq.troop.utils.TroopUtils;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.ShaderAnimLayout;
import com.tencent.mobileqq.widget.SlideDetectListView;
import com.tencent.mobileqq.widget.SlideDetectListView.OnScrollToTopListener;
import com.tencent.mobileqq.widget.SlideDetectListView.OnSlideListener;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.List;
import ltc;
import ltd;
import lte;
import ltf;
import ltg;
import lth;
import lti;
import ltj;
import ltk;
import mqq.os.MqqHandler;
import tencent.mobileim.structmsg.structmsg.GroupInfo;
import tencent.mobileim.structmsg.structmsg.StructMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsgAction;
import tencent.mobileim.structmsg.structmsg.SystemMsgActionInfo;

public class NotificationView
  extends BaseTroopView
  implements View.OnClickListener, BaseSystemMsgInterface, FaceDecoder.DecodeTaskCompletionListener, SlideDetectListView.OnScrollToTopListener, SlideDetectListView.OnSlideListener
{
  protected static final String a = "NotificationView";
  protected static int b = 0;
  protected static int c = 0;
  protected static long c = 0L;
  protected static final int d = 15;
  static final int e = 60;
  public static final int f = 1012;
  public static final int g = 1013;
  public static final int h = 1014;
  public static final int i = 998;
  public static final int j = 999;
  public static final int k = 1000;
  public static final int l = 1100;
  public static final int m = 1001;
  public static final int n = 1002;
  public static final int o = 1003;
  public static final int p = 1012;
  public static int s;
  public final long a;
  public Context a;
  protected Bitmap a;
  protected View.OnClickListener a;
  protected View.OnTouchListener a;
  public NotificationAdapter a;
  public TroopNotificationUtils.TroopPrivilegeCallback a;
  MessageObserver a;
  public FaceDecoder a;
  public QQProgressDialog a;
  protected SlideDetectListView.OnScrollToTopListener a;
  protected SlideDetectListView a;
  public List a;
  public MqqHandler a;
  public final long b;
  protected View.OnClickListener b;
  protected boolean c;
  public boolean d;
  public View e;
  protected View f;
  public int q = 0;
  public int r;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Int = 0;
    jdField_c_of_type_Int = 1;
    s = 0;
    jdField_c_of_type_Long = 0L;
  }
  
  public NotificationView(Context paramContext)
  {
    super(paramContext);
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_Long = 1000L;
    jdField_b_of_type_Long = 500L;
    jdField_c_of_type_Boolean = false;
    jdField_a_of_type_MqqOsMqqHandler = new ltc(this);
    jdField_a_of_type_AndroidViewView$OnClickListener = new ltd(this);
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lte(this);
    jdField_a_of_type_AndroidViewView$OnTouchListener = new ltf(this);
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView$OnScrollToTopListener = new ltg(this);
    jdField_b_of_type_AndroidViewView$OnClickListener = new lti(this);
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopNotificationUtils$TroopPrivilegeCallback = new ltk(this);
    jdField_a_of_type_AndroidContentContext = paramContext;
  }
  
  private void a(long paramLong, structmsg.StructMsg paramStructMsg)
  {
    Bundle localBundle = new Bundle();
    localBundle.putByteArray("structMsg", paramStructMsg.toByteArray());
    TroopBindPubAccountProtocol.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramLong, new ltj(this), localBundle);
  }
  
  private void a(NotificationAdapter.ViewHolder paramViewHolder, structmsg.StructMsg paramStructMsg)
  {
    if ((paramViewHolder == null) || (paramStructMsg == null)) {
      return;
    }
    switch (TroopNotificationUtils.a(jdField_a_of_type_Int))
    {
    default: 
      jdField_a_of_type_AndroidWidgetTextView.setText(jdField_b_of_type_JavaLangString);
      return;
    case 0: 
      jdField_a_of_type_AndroidWidgetTextView.setText(msg.group_name.get());
      return;
    case 1: 
      jdField_a_of_type_AndroidWidgetTextView.setText(msg.action_uin_nick.get());
      return;
    }
    jdField_a_of_type_AndroidWidgetTextView.setText(jdField_b_of_type_JavaLangString);
  }
  
  private void a(XListView paramXListView, String paramString, Bitmap paramBitmap)
  {
    NotificationAdapter.ViewHolder localViewHolder;
    String str;
    if (q == 0)
    {
      int i2 = paramXListView.getChildCount();
      int i1 = 0;
      while (i1 < i2)
      {
        localViewHolder = (NotificationAdapter.ViewHolder)paramXListView.getChildAt(i1).getTag();
        if (localViewHolder == null) {
          i1 += 1;
        } else {
          switch (TroopNotificationUtils.a(jdField_a_of_type_Int))
          {
          default: 
            str = String.valueOf(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_code.get());
          }
        }
      }
    }
    while ((localViewHolder != null) && (paramString.equals(str)))
    {
      jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramBitmap);
      return;
      str = jdField_a_of_type_JavaLangString;
      continue;
      str = String.valueOf(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.action_uin.get());
    }
  }
  
  private void a(structmsg.StructMsg paramStructMsg, long paramLong)
  {
    if (paramStructMsg != null)
    {
      long l1 = getmsg_seq.get() + getmsg_type.get();
      GroupSystemMsgController.a().a(Long.valueOf(l1), (structmsg.StructMsg)paramStructMsg.get());
      GroupSystemMsgController.a().b(l1);
      GroupSystemMsgController.a().a(paramLong);
    }
  }
  
  private void a(boolean paramBoolean)
  {
    a(0, paramBoolean);
  }
  
  public static boolean a(int paramInt)
  {
    return (paramInt == 2) || (paramInt == 35) || (paramInt == 3) || (paramInt == 15) || (paramInt == 16) || (paramInt == 7);
  }
  
  private boolean a(int paramInt, structmsg.StructMsg paramStructMsg)
  {
    boolean bool = false;
    int i3;
    int i4;
    if (paramStructMsg != null)
    {
      int i1 = msg_type.get();
      long l1 = msg_seq.get();
      long l2 = req_uin.get();
      int i2 = msg.sub_type.get();
      i3 = msg.src_id.get();
      i4 = msg.sub_src_id.get();
      int i5 = msg.group_msg_type.get();
      List localList = msg.actions.get();
      if ((localList == null) || (paramInt >= localList.size())) {
        break label220;
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(i1, l1, l2, i2, i3, i4, i5, (structmsg.SystemMsgActionInfo)getaction_info.get(), paramInt);
    }
    label220:
    for (bool = true;; bool = false)
    {
      if ((i3 == 116) && (i4 == 0)) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_discuss", "", "verify_msg", "Clk_agree", 0, 0, String.valueOf(msg.group_code.get()), "", "", "");
      }
      return bool;
    }
  }
  
  private void b(NotificationAdapter.ViewHolder paramViewHolder)
  {
    int i1 = 1;
    if (paramViewHolder == null) {
      return;
    }
    Object localObject;
    String str;
    switch (TroopNotificationUtils.a(jdField_a_of_type_Int))
    {
    default: 
      localObject = String.valueOf(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_code.get());
      i1 = 4;
      str = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_name.get() + jdField_a_of_type_AndroidContentContext.getString(2131364419);
    }
    for (;;)
    {
      localObject = TroopNotificationUtils.a(jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder, (String)localObject, i1);
      jdField_a_of_type_AndroidWidgetImageView.setContentDescription(str);
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable((Drawable)localObject);
      return;
      localObject = jdField_a_of_type_JavaLangString;
      str = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.req_uin_nick.get() + jdField_a_of_type_AndroidContentContext.getString(2131364420);
      continue;
      localObject = String.valueOf(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.action_uin.get());
      str = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.action_uin_nick.get() + jdField_a_of_type_AndroidContentContext.getString(2131364421);
    }
  }
  
  private void b(NotificationAdapter.ViewHolder paramViewHolder, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("NotificationView", 2, "jumpToTroopRequestActivity!" + jdField_a_of_type_Long + ": dealMsgType = " + paramInt);
    }
    Intent localIntent = new Intent(a(), TroopRequestActivity.class);
    Bundle localBundle = new Bundle();
    localBundle.putLong("troopMsgId", jdField_a_of_type_Long);
    localBundle.putInt("mTroopMsgType", jdField_a_of_type_Int);
    localBundle.putString("mTroopCode", String.valueOf(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_code.get()));
    localBundle.putString("troopmanagerUin", String.valueOf(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.action_uin.get()));
    localBundle.putString("troopsMsg", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_additional.get());
    if (jdField_b_of_type_Int < jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.jdField_a_of_type_Int) {}
    for (boolean bool = true;; bool = false)
    {
      localBundle.putBoolean("is_unread", bool);
      localBundle.putString("troopRequestUin", String.valueOf(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.req_uin.get()));
      localBundle.putString("troopsummary", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_describe.get());
      localBundle.putLong("infotime", jdField_b_of_type_Long);
      localIntent.putExtra("troopMsgDealInfo", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.msg_detail.get());
      a((structmsg.StructMsg)jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.get(), jdField_c_of_type_Long);
      localBundle.putInt("t_s_f", 1001);
      localIntent.putExtras(localBundle);
      a(localIntent);
      return;
    }
  }
  
  private void m()
  {
    a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
  }
  
  private void n()
  {
    b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
  }
  
  private void o()
  {
    a(2130903658);
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView = ((SlideDetectListView)findViewById(2131299531));
    e = findViewById(2131299532);
    q();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
  }
  
  private void p()
  {
    int i1 = GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter = new NotificationAdapter(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this, i1, jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView);
    jdField_a_of_type_JavaUtilList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(AppConstants.av, 0);
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter);
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setDividerHeight(1);
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0) && (!(jdField_a_of_type_JavaUtilList.get(0) instanceof MessageForSystemMsg)))
    {
      if (QLog.isColorLevel()) {
        QLog.d("NotificationView", 2, "initListData error");
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.x();
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.a(null);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.a(jdField_a_of_type_JavaUtilList);
    k();
  }
  
  private void q()
  {
    if (f == null) {
      f = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130904297, null);
    }
    if (f.getParent() == null) {
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.b(f);
    }
    f.setVisibility(8);
  }
  
  private void r()
  {
    if (d) {}
    do
    {
      do
      {
        return;
        if (!NetworkUtil.e(BaseApplication.getContext()))
        {
          QQToast.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_AndroidContentContext.getResources().getString(2131366990), 0).b(a());
          return;
        }
      } while ((jdField_a_of_type_JavaUtilList.size() < 10) || (GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)));
      d = true;
      f.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().i();
    } while (!QLog.isColorLevel());
    QLog.i("NotificationView", 2, "loadNextPage.get next page.");
  }
  
  private void s()
  {
    if (f != null) {
      f.setVisibility(8);
    }
    d = false;
    if (QLog.isColorLevel()) {
      QLog.i("NotificationView", 2, "stopLoadMore().");
    }
  }
  
  private void t()
  {
    ThreadManager.a(new lth(this), 8, null, false);
    if (QLog.isColorLevel()) {
      QLog.i("NotificationView", 2, "sendReadConfirm is end!");
    }
  }
  
  public int a()
  {
    return getResources().getDimensionPixelSize(2131492908);
  }
  
  public void a() {}
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if ((paramBitmap == null) || (TextUtils.isEmpty(paramString))) {
      return;
    }
    a(jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView, paramString, paramBitmap);
  }
  
  public void a(Intent paramIntent)
  {
    GroupSystemMsgController.a().e();
    super.a(paramIntent);
  }
  
  protected void a(Intent paramIntent, BaseTroopView.ITroopContext paramITroopContext)
  {
    super.a(paramIntent, paramITroopContext);
    m();
    o();
    p();
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setOnTouchListener(jdField_a_of_type_AndroidViewView$OnTouchListener);
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setOnScrollToTopListener(jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView$OnScrollToTopListener);
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(jdField_a_of_type_AndroidContentContext, a());
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(getClass(), jdField_a_of_type_MqqOsMqqHandler);
    if (TroopNotificationUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface) > 0) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(3);
    }
    TroopNotificationUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
  }
  
  public void a(SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder paramSystemMsgItemBaseHolder, int paramInt) {}
  
  public void a(NotificationAdapter.ViewHolder paramViewHolder)
  {
    if (QLog.isColorLevel()) {
      QLog.d("NotificationView", 2, "handleGroupSystemMsg! start " + jdField_a_of_type_Long);
    }
    b(paramViewHolder, 998);
    String str6 = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_info.msg_alert.get();
    String str4 = "";
    String str5 = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_code.get() + "";
    String str3 = "";
    String str2 = "";
    String str1;
    int i1;
    label155:
    Object localObject1;
    Object localObject2;
    Object localObject3;
    if (jdField_b_of_type_Int < jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.jdField_a_of_type_Int)
    {
      str1 = "1";
      i1 = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_inviter_role.get();
      if ((i1 != 2) && (i1 != 3)) {
        break label324;
      }
      i1 = 0;
      localObject1 = str4;
      localObject2 = str3;
      localObject3 = str2;
      switch (jdField_a_of_type_Int)
      {
      default: 
        localObject3 = str2;
        localObject2 = str3;
        localObject1 = str4;
      }
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_contacts", "", "notice", (String)localObject1, 0, 0, str5, str1, (String)localObject2, (String)localObject3);
      return;
      str1 = "0";
      break;
      label324:
      i1 = 1;
      break label155;
      localObject3 = "enter_askjoin";
      if ((str6 == null) || ("".equals(str6))) {}
      for (localObject1 = "1";; localObject1 = "0")
      {
        if (jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.sub_type.get() != 1) {
          break label398;
        }
        paramViewHolder = "0";
        localObject2 = localObject1;
        localObject1 = localObject3;
        localObject3 = paramViewHolder;
        break;
      }
      label398:
      long l1 = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.actor_uin.get();
      if ((l1 != 0L) && (!(l1 + "").equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))) {}
      for (paramViewHolder = "2";; paramViewHolder = "1")
      {
        localObject2 = localObject1;
        localObject1 = localObject3;
        localObject3 = paramViewHolder;
        break;
      }
      localObject1 = "refuseask_page";
      localObject2 = str3;
      localObject3 = str2;
      continue;
      if (jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.sub_type.get() == 1) {}
      for (paramViewHolder = "0";; paramViewHolder = "1")
      {
        localObject1 = "enter_invite";
        localObject2 = str3;
        localObject3 = paramViewHolder;
        break;
      }
      if (i1 != 0) {}
      for (paramViewHolder = "0";; paramViewHolder = "1")
      {
        localObject1 = "refuseinvite_page";
        localObject2 = paramViewHolder;
        localObject3 = str2;
        break;
      }
      if (i1 != 0) {}
      for (paramViewHolder = "0";; paramViewHolder = "1")
      {
        localObject1 = "refuseagree_page";
        localObject2 = paramViewHolder;
        localObject3 = str2;
        break;
      }
      localObject1 = "quit_page";
      localObject2 = str3;
      localObject3 = str2;
      continue;
      localObject1 = "byquit_page";
      localObject2 = "0";
      localObject3 = str2;
      continue;
      localObject1 = "byquit_page";
      localObject2 = "1";
      localObject3 = str2;
      continue;
      if ((jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.req_uin.get() + "").equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) {}
      for (paramViewHolder = "0";; paramViewHolder = "1")
      {
        localObject1 = "set_admin_page";
        localObject2 = paramViewHolder;
        localObject3 = str2;
        break;
      }
      localObject1 = "un_admin_page";
      localObject2 = "0";
      localObject3 = str2;
      continue;
      localObject1 = "un_admin_page";
      localObject2 = "1";
      localObject3 = str2;
    }
  }
  
  public void a(NotificationAdapter.ViewHolder paramViewHolder, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("NotificationView", 2, "bindTroopSystemMsgView! start " + jdField_a_of_type_Long);
    }
    structmsg.StructMsg localStructMsg = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg;
    jdField_a_of_type_Long = paramInt;
    jdField_a_of_type_JavaLangString = (req_uin.get() + "");
    jdField_a_of_type_Int = msg.group_msg_type.get();
    int i1 = msg.sub_type.get();
    jdField_b_of_type_Long = msg_time.get();
    jdField_b_of_type_JavaLangString = msg.req_uin_nick.get();
    label214:
    label272:
    String str;
    Object localObject1;
    label345:
    Object localObject2;
    if ((jdField_b_of_type_JavaLangString != null) && (!jdField_b_of_type_JavaLangString.equals("")))
    {
      a(paramViewHolder, localStructMsg);
      switch (jdField_a_of_type_Int)
      {
      default: 
        paramInt = 0;
        if ((paramInt != 0) && ((msg.group_ext_flag.get() & 0x800) != 0)) {
          if (msg.group_info.group_auth_type.get() == 2)
          {
            jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
            jdField_b_of_type_AndroidWidgetImageView.setBackgroundResource(2130838643);
            str = msg.group_info.msg_alert.get();
            jdField_c_of_type_AndroidWidgetTextView.setTextAppearance(jdField_a_of_type_AndroidContentContext, 2131558581);
            if ((TextUtils.isEmpty(str)) || ((jdField_a_of_type_Int != 1) && (jdField_a_of_type_Int != 22))) {
              break label865;
            }
            jdField_c_of_type_AndroidWidgetTextView.setTextAppearance(jdField_a_of_type_AndroidContentContext, 2131558582);
            localObject1 = str;
            if (jdField_a_of_type_Int == 11)
            {
              localObject2 = msg.msg_additional.get();
              localObject1 = localObject2;
              if (((String)localObject2).length() > 15) {
                localObject1 = ((String)localObject2).subSequence(0, 15) + "...";
              }
            }
            localObject2 = localObject1;
            if (msg.pic_url.has())
            {
              if (TextUtils.isEmpty((CharSequence)localObject1)) {
                break label1010;
              }
              localObject2 = "[图片]" + (String)localObject1;
            }
            label459:
            if (TextUtils.isEmpty((CharSequence)localObject2)) {
              break label1018;
            }
            jdField_c_of_type_AndroidWidgetTextView.setSingleLine(true);
            jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject2);
            jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
            label492:
            localObject1 = TroopUtils.a(localStructMsg, msg.msg_describe.get());
            if (localObject1 == null) {
              break label1030;
            }
            jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
            label524:
            if (jdField_a_of_type_Int != 80) {
              break label1091;
            }
            localObject1 = msg.actions.get();
            jdField_a_of_type_AndroidWidgetButton.setClickable(true);
            jdField_a_of_type_AndroidWidgetButton.setText(get0name.get());
            jdField_a_of_type_AndroidWidgetButton.setTextAppearance(jdField_a_of_type_AndroidContentContext, 2131558856);
            jdField_a_of_type_AndroidWidgetButton.setBackgroundResource(2130838139);
            jdField_a_of_type_AndroidWidgetButton.setContentDescription(jdField_a_of_type_AndroidWidgetButton.getText() + "");
            jdField_a_of_type_AndroidWidgetButton.setTag(paramViewHolder);
            jdField_a_of_type_AndroidWidgetButton.setOnClickListener(jdField_b_of_type_AndroidViewView$OnClickListener);
            label654:
            if (!TextUtils.isEmpty(jdField_a_of_type_AndroidWidgetButton.getText())) {
              break label1410;
            }
            jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
          }
        }
        break;
      }
    }
    for (;;)
    {
      if ((i1 == 2) && (jdField_a_of_type_Int == 2) && (((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(String.valueOf(msg.group_code.get())) != null)) {
        TroopRemindSettingManager.a().b(String.valueOf(msg.group_code.get()), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
      jdField_a_of_type_AndroidWidgetRelativeLayout.setTag(paramViewHolder);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      jdField_a_of_type_AndroidWidgetImageView.setTag(paramViewHolder);
      jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
      b(paramViewHolder);
      return;
      jdField_b_of_type_JavaLangString = jdField_a_of_type_JavaLangString;
      break;
      paramInt = 1;
      break label214;
      if (msg.group_info.group_auth_type.get() == 1)
      {
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
        jdField_b_of_type_AndroidWidgetImageView.setBackgroundResource(2130839128);
        break label272;
      }
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
      break label272;
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
      break label272;
      label865:
      if (!TextUtils.isEmpty(msg.msg_qna.get()))
      {
        localObject1 = msg.msg_qna.get();
        break label345;
      }
      if (!TextUtils.isEmpty(msg.msg_actor_describe.get()))
      {
        localObject1 = TroopUtils.a(localStructMsg, msg.msg_actor_describe.get());
        break label345;
      }
      if (!TextUtils.isEmpty(msg.msg_additional_list.get()))
      {
        localObject1 = msg.msg_additional_list.get();
        break label345;
      }
      if (!TextUtils.isEmpty(msg.msg_additional.get()))
      {
        localObject1 = msg.msg_additional.get();
        break label345;
      }
      localObject1 = "";
      break label345;
      label1010:
      localObject2 = "[图片]";
      break label459;
      label1018:
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
      break label492;
      label1030:
      localObject1 = msg.msg_additional.get();
      if ((localObject1 == null) || ("".equals(localObject1)))
      {
        jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_AndroidContentContext.getString(2131364103));
        break label524;
      }
      jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
      break label524;
      label1091:
      if (i1 == 1)
      {
        localObject1 = msg.actions.get();
        jdField_a_of_type_AndroidWidgetButton.setClickable(true);
        if ((localObject1 != null) && (((List)localObject1).size() > 0))
        {
          if ((str == null) || ("".equals(str))) {
            if (((List)localObject1).size() > 1)
            {
              jdField_a_of_type_AndroidWidgetButton.setText(get1name.get());
              jdField_a_of_type_AndroidWidgetButton.setTextAppearance(jdField_a_of_type_AndroidContentContext, 2131558856);
              jdField_a_of_type_AndroidWidgetButton.setBackgroundResource(2130838139);
            }
          }
          for (;;)
          {
            jdField_a_of_type_AndroidWidgetButton.setContentDescription(jdField_a_of_type_AndroidWidgetButton.getText() + "");
            jdField_a_of_type_AndroidWidgetButton.setTag(paramViewHolder);
            jdField_a_of_type_AndroidWidgetButton.setOnClickListener(jdField_b_of_type_AndroidViewView$OnClickListener);
            break;
            jdField_a_of_type_AndroidWidgetButton.setText("");
            continue;
            jdField_a_of_type_AndroidWidgetButton.setText(get0name.get());
            jdField_a_of_type_AndroidWidgetButton.setTextAppearance(jdField_a_of_type_AndroidContentContext, 2131558870);
            jdField_a_of_type_AndroidWidgetButton.setBackgroundResource(2130838138);
          }
        }
        jdField_a_of_type_AndroidWidgetButton.setText("");
        jdField_a_of_type_AndroidWidgetButton.setBackgroundDrawable(null);
        break label654;
      }
      jdField_a_of_type_AndroidWidgetButton.setBackgroundDrawable(null);
      jdField_a_of_type_AndroidWidgetButton.setClickable(false);
      jdField_a_of_type_AndroidWidgetButton.setTextAppearance(jdField_a_of_type_AndroidContentContext, 2131558583);
      jdField_a_of_type_AndroidWidgetButton.setText(msg.msg_decided.get());
      localObject1 = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetButton.getLayoutParams();
      break label654;
      label1410:
      jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
    }
  }
  
  public void a(SlideDetectListView paramSlideDetectListView, View paramView, int paramInt)
  {
    NotificationAdapter.ViewHolder localViewHolder = (NotificationAdapter.ViewHolder)paramView.getTag();
    if ((localViewHolder != null) && ((localViewHolder instanceof NotificationAdapter.ViewHolder)))
    {
      paramView = (ShaderAnimLayout)paramView.findViewById(2131299529);
      if (paramView != null) {
        break label38;
      }
    }
    label38:
    Button localButton;
    do
    {
      return;
      localButton = (Button)paramView.findViewById(2131299530);
    } while (localButton == null);
    paramSlideDetectListView.setDeleteAreaWidth(getLayoutParamswidth);
    paramView.a();
    localButton.setTag(localViewHolder);
  }
  
  public void a(AbsListView paramAbsListView, int paramInt) {}
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  public boolean a(float paramFloat)
  {
    if (jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.getChildCount() - jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.m() > 0)
    {
      View localView = jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.getChildAt(jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.getChildCount() - 1);
      int[] arrayOfInt = new int[2];
      localView.getLocationOnScreen(arrayOfInt);
      int i1 = arrayOfInt[1];
      if (paramFloat > localView.getMeasuredHeight() + i1) {
        return true;
      }
    }
    return false;
  }
  
  public void b()
  {
    super.b();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(AppConstants.aB, 9000, 0 - GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface));
    GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0);
    jdField_c_of_type_Boolean = false;
    if ((jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.getCount() > 0))
    {
      k();
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.notifyDataSetChanged();
      t();
    }
    a(false);
  }
  
  public void b(SlideDetectListView paramSlideDetectListView, View paramView, int paramInt)
  {
    paramSlideDetectListView = (ShaderAnimLayout)paramView.findViewById(2131299529);
    if (paramSlideDetectListView != null)
    {
      paramSlideDetectListView.d();
      paramSlideDetectListView = (Button)paramSlideDetectListView.findViewById(2131299530);
      if (paramSlideDetectListView != null) {
        paramSlideDetectListView.setTag(null);
      }
    }
  }
  
  protected void d()
  {
    super.d();
    a(false);
  }
  
  protected void e()
  {
    super.e();
    jdField_c_of_type_Boolean = false;
    if ((jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.getCount() > 0))
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.jdField_a_of_type_Int = GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.notifyDataSetChanged();
    }
    ((NewFriendManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(33)).a(new TroopSystemMessage(0));
  }
  
  protected void f()
  {
    super.f();
  }
  
  protected void g()
  {
    super.g();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.c();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a();
  }
  
  protected void h()
  {
    super.h();
    n();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.a();
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter = null;
    }
    TroopNotificationUtils.b();
    if ((jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.getCount() > 0)) {
      t();
    }
    GroupSystemMsgController.a().b();
    if (jdField_c_of_type_Boolean) {
      GroupSystemMsgController.a().d();
    }
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(null);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(getClass());
  }
  
  public void i()
  {
    GroupSystemMsgController.a().b();
    if ((jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.getCount() > 0)) {
      t();
    }
    jdField_c_of_type_Boolean = true;
    super.i();
  }
  
  public void k()
  {
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0))
    {
      e.setVisibility(8);
      return;
    }
    e.setVisibility(0);
  }
  
  public void l()
  {
    t();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.w();
    GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0);
    jdField_a_of_type_JavaUtilList.clear();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopNotificationAdapter.a();
    }
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(1012);
  }
  
  public void onClick(View paramView)
  {
    long l1 = System.currentTimeMillis();
    if ((l1 - jdField_c_of_type_Long > 0L) && (l1 - jdField_c_of_type_Long < 800L)) {}
    Object localObject1;
    do
    {
      do
      {
        return;
        jdField_c_of_type_Long = l1;
        switch (paramView.getId())
        {
        default: 
          return;
        }
      } while (!(paramView.getTag() instanceof NotificationAdapter.ViewHolder));
      localObject1 = (NotificationAdapter.ViewHolder)paramView.getTag();
    } while (localObject1 == null);
    Object localObject2 = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg;
    int i1 = jdField_a_of_type_Int;
    if (TroopNotificationUtils.a(i1) == 0)
    {
      paramView = TroopInfoActivity.a(String.valueOf(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_code.get()), 4);
      paramView.putInt("t_s_f", 1001);
      ChatSettingForTroop.a(a(), paramView, 2);
      if ((i1 == 2) || (i1 == 10) || (i1 == 12))
      {
        i1 = 1;
        localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        localObject1 = jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_code.get() + "";
        if (i1 == 0) {
          break label243;
        }
      }
      label243:
      for (paramView = "0";; paramView = "1")
      {
        ReportController.b((QQAppInterface)localObject2, "P_CliOper", "Grp_contacts", "", "notice", "see_data", 0, 0, (String)localObject1, paramView, "", "");
        return;
        i1 = 0;
        break;
      }
    }
    if (jdField_a_of_type_Int == 82)
    {
      paramView = new Intent(jdField_a_of_type_AndroidContentContext, AccountDetailActivity.class);
      paramView.putExtra("uin", jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.req_uin.get() + "");
      paramView.putExtra("account_type", 1);
      paramView.putExtra("source", 112);
      a(paramView);
      return;
    }
    l1 = req_uin.get();
    switch (TroopNotificationUtils.a(i1))
    {
    default: 
      paramView = String.valueOf(l1);
      if (((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).b(paramView)) {
        paramView = new ProfileActivity.AllInOne(paramView, 1);
      }
      break;
    }
    for (;;)
    {
      ProfileActivity.b(a(), paramView);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_contacts", "", "notice", "see_fromdata", 0, 0, jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.group_code.get() + "", "3", "", "");
      return;
      paramView = jdField_a_of_type_JavaLangString;
      break;
      paramView = String.valueOf(jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg.msg.action_uin.get());
      break;
      if ((msg.group_msg_type.get() == 2) && (msg.sub_type.get() == 3))
      {
        paramView = new ProfileActivity.AllInOne(paramView, 26);
        d = 1;
      }
      else
      {
        paramView = new ProfileActivity.AllInOne(paramView, 24);
      }
    }
  }
}
