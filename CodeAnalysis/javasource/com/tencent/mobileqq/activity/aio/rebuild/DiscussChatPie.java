package com.tencent.mobileqq.activity.aio.rebuild;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.SystemClock;
import android.support.v4.app.FragmentActivity;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.DiscussionInfoCardActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.TroopMemberListActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.ChatContext;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.tips.DiscActiveTipsBar;
import com.tencent.mobileqq.activity.aio.tips.DiscFreqPttGrayTips;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.BizTroopObserver;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.DiscussionObserver;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.DiscMessageManager;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.RefreshMessageContext;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.troop.data.TroopAioAgent;
import com.tencent.mobileqq.troop.data.TroopAioAgent.Message;
import com.tencent.mobileqq.troop.data.TroopAioTips;
import com.tencent.mobileqq.troop.text.AtTroopMemberSpan;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.utils.RecordParams;
import com.tencent.mobileqq.widget.ScrollerRunnable;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ListView;
import com.tencent.widget.XEditTextEx;
import com.tencent.widget.XPanelContainer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import lgi;
import lgj;
import lgk;
import lgl;
import lgn;
import lgo;
import lgs;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;

public class DiscussChatPie
  extends BaseChatPie
{
  BizTroopObserver jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver;
  private DiscussionObserver jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver;
  protected MessageObserver a;
  public ActionSheet a;
  private final String ae;
  private Dialog g;
  
  public DiscussChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    ae = "DiscussChatPie";
    jdField_a_of_type_ComTencentWidgetActionSheet = null;
    jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver = new lgk(this);
    jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver = new lgl(this);
    jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new lgo(this);
  }
  
  private void a(int paramInt1, long paramLong, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("DiscussChatPie", 2, "refreshHeadMessage==>type:" + paramInt1 + "|value:" + paramLong);
    }
    long l2 = 0L;
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a();
    long l1 = l2;
    Object localObject2;
    if (localObject1 != null)
    {
      localObject1 = ((List)localObject1).iterator();
      do
      {
        l1 = l2;
        if (!((Iterator)localObject1).hasNext()) {
          break;
        }
        localObject2 = (ChatMessage)((Iterator)localObject1).next();
      } while (MsgProxyUtils.q(msgtype));
      l1 = shmsgseq;
    }
    localObject1 = new lgs(this);
    if (paramInt1 == 1) {
      if ((int)l1 >= 1L + paramLong)
      {
        if (l1 - paramLong <= 200L) {
          break label324;
        }
        paramLong = l1 - 200L;
      }
    }
    label324:
    for (;;)
    {
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
        jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(l1, paramLong, true);
      }
      jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(0, -1, (Runnable)localObject1);
      do
      {
        do
        {
          do
          {
            return;
          } while ((paramInt1 != 12) && (paramInt1 != 7));
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramLong);
        } while ((localObject2 == null) || (paramInt2 > 200));
        if ((int)l1 >= shmsgseq + 1L)
        {
          if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
            jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(l1, shmsgseq, false);
          }
          jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, 0, -1, (Runnable)localObject1);
          return;
        }
        paramInt2 = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.a((ChatMessage)localObject2);
      } while (paramInt2 == -1);
      jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable.a(paramInt1, paramInt2, paramInt2, null);
      return;
    }
  }
  
  private void as()
  {
    DiscussionManager localDiscussionManager = (DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52);
    DiscussionInfo localDiscussionInfo = localDiscussionManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if ((localDiscussionInfo != null) && (discussionName != null))
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = discussionName;
      a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, uin, jdField_b_of_type_AndroidWidgetTextView);
    }
    if (a.containsKey(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
      at();
    }
  }
  
  private void at()
  {
    if ((g != null) && (g.isShowing())) {}
    DiscussionManager localDiscussionManager;
    Object localObject1;
    String str1;
    String str2;
    do
    {
      do
      {
        do
        {
          return;
          localDiscussionManager = (DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52);
          if (a.containsKey(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.d("DiscussChatPie", 2, "DiscussionManager's discToTroopCache doesn't contain discussionUIN :" + jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        return;
        localObject1 = (String[])a.get(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      } while ((localObject1 == null) || (localObject1.length < 2));
      str1 = localObject1[0];
      str2 = localObject1[1];
    } while (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing());
    for (;;)
    {
      try
      {
        localObject1 = BitmapFactory.decodeResource(jdField_a_of_type_AndroidContentContext.getResources(), 2130839134);
        localObject2 = localObject1;
      }
      catch (OutOfMemoryError localOutOfMemoryError1)
      {
        try
        {
          localObject2 = ImageUtil.b((Bitmap)localObject1, 10.0F, 140, 140);
          g = DialogUtil.a(jdField_a_of_type_AndroidContentContext, (Bitmap)localObject2, ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, str2) + "已将讨论组升级为群", "群号：" + str1, jdField_a_of_type_AndroidContentContext.getString(2131369181), null, new lgj(this, str1), null);
          if ((g != null) && (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing())) {
            g.show();
          }
          a.remove(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          return;
        }
        catch (OutOfMemoryError localOutOfMemoryError2)
        {
          Object localObject2;
          for (;;) {}
        }
        localOutOfMemoryError1 = localOutOfMemoryError1;
        localObject1 = null;
      }
      if (QLog.isColorLevel())
      {
        QLog.d("DiscussChatPie", 2, QLog.getStackTraceString(localOutOfMemoryError1));
        localObject2 = localObject1;
      }
    }
  }
  
  private void d(String paramString)
  {
    Intent localIntent = AIOUtils.a(new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, SplashActivity.class), null);
    localIntent.putExtra("uin", paramString);
    localIntent.putExtra("uintype", 1);
    localIntent.putExtra("input_text", jdField_a_of_type_ComTencentWidgetXEditTextEx.getEditableText().toString());
    localIntent.putExtra("input_panel_status", jdField_a_of_type_ComTencentWidgetXPanelContainer.a());
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivity(localIntent);
  }
  
  protected void A()
  {
    super.A();
    as();
  }
  
  protected void R()
  {
    ar();
    super.R();
  }
  
  protected void X()
  {
    super.X();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.c(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver);
  }
  
  protected void Y()
  {
    super.Y();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver);
  }
  
  public QQRecorder.RecorderParam a()
  {
    boolean bool = super.l();
    return RecordParams.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, bool);
  }
  
  protected void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.a(paramInt1, paramInt2, paramIntent);
    if (paramInt2 == -1) {}
    switch (paramInt1)
    {
    default: 
      return;
    }
    a(paramIntent.getExtras().getString("member_uin"), paramIntent.getExtras().getString("member_display_name"), true);
  }
  
  public void a(Configuration paramConfiguration)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d != null) {
      a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_b_of_type_AndroidWidgetTextView);
    }
    super.a(paramConfiguration);
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if ((jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) && (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.d()) && (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1 != null)) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.b(0);
    }
    super.a(paramAbsListView, paramInt1, paramInt2, paramInt3);
  }
  
  protected void a(CharSequence paramCharSequence)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
    {
      paramCharSequence = new ArrayList();
      paramCharSequence = AtTroopMemberSpan.a(jdField_a_of_type_ComTencentWidgetXEditTextEx.getEditableText(), paramCharSequence);
    }
    super.a(paramCharSequence);
  }
  
  public void a(String paramString1, String paramString2, TextView paramTextView)
  {
    if (paramString1 == null) {
      if (QLog.isColorLevel()) {
        QLog.d("DiscussChatPie", 2, "genDiscussTitle, name == null");
      }
    }
    int i;
    do
    {
      return;
      i = ((DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      if (i > 0) {
        break;
      }
      paramTextView.setText(paramString1);
    } while (!AppSetting.i);
    paramTextView.setContentDescription(paramTextView.getText() + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131362063));
    a().setTitle(paramTextView.getText());
    return;
    int j = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDisplayMetrics().widthPixels;
    paramString2 = (RelativeLayout.LayoutParams)((View)paramTextView.getParent()).getLayoutParams();
    int k = AIOUtils.a(207.0F, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources());
    TextPaint localTextPaint = jdField_b_of_type_AndroidWidgetTextView.getPaint();
    float f2 = j - k - localTextPaint.measureText(String.format("(%d)", new Object[] { Integer.valueOf(i) })) - 4.0F * jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDisplayMetrics().density;
    String str = paramString1;
    float f1;
    float f3;
    if (f2 > 0.0F)
    {
      f1 = localTextPaint.measureText(paramString1);
      str = paramString1;
      if (f1 > f2)
      {
        f3 = f2 - localTextPaint.measureText("…");
        paramString2 = paramString1;
      }
    }
    for (;;)
    {
      if ((f3 > 0.0F) && (f1 > f3) && (paramString2.length() > 0))
      {
        paramString2 = paramString2.substring(0, paramString2.length() - 1);
        f2 = localTextPaint.measureText(paramString2);
        f1 = f2;
        if (f2 == 0.0F)
        {
          f1 = f2;
          if (paramString2.length() > 0) {
            f1 = 1.0F + f3;
          }
        }
        if (QLog.isColorLevel()) {
          QLog.d("DiscussChatPie", 2, "genDiscussTitle : name widht = " + f1);
        }
      }
      else
      {
        str = paramString1;
        if (f3 > 0.0F)
        {
          str = paramString1;
          if (paramString2.length() > 0) {
            str = paramString2 + "…";
          }
        }
        paramTextView.setText(String.format("%s(%d)", new Object[] { str, Integer.valueOf(i) }));
        if (!AppSetting.i) {
          break;
        }
        paramTextView.setContentDescription(paramTextView.getText() + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131362063));
        a().setTitle(paramTextView.getText());
        return;
      }
    }
  }
  
  public void a(String paramString1, String paramString2, boolean paramBoolean)
  {
    if ((TextUtils.isEmpty(paramString1)) || (TextUtils.isEmpty(paramString2))) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("_At_Me_DISC", 2, "memUin:" + paramString1 + " displayName:" + Utils.a(paramString2) + " isRemoveOldAtFlag:" + paramBoolean);
    }
    if ((jdField_a_of_type_ComTencentWidgetXPanelContainer.a() == 2) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getConfiguration().orientation == 2)) {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
    }
    jdField_a_of_type_MqqOsMqqHandler.postDelayed(new lgn(this, paramBoolean, paramString1, paramString2), 300L);
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    if (QLog.isColorLevel()) {
      QLog.d("DiscussChatPie", 2, "troop chatPie listView onViewCompleteVisableAndReleased");
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.getCount() > 0)
    {
      jdField_b_of_type_Long = SystemClock.uptimeMillis();
      ((ChatContext)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.a).a(jdField_b_of_type_Long);
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null)
      {
        if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.jdField_b_of_type_Boolean)
        {
          jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.e = true;
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.jdField_a_of_type_Long, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.jdField_b_of_type_Long, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.c, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
          jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.i();
          return true;
        }
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.e = false;
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.f = true;
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 20, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
        return true;
      }
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.e = false;
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext.f = true;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, 20, jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$RefreshMessageContext);
      return true;
    }
    d(false);
    return true;
  }
  
  protected void ar()
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips == null) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips = new TroopAioTips();
    }
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.g();
    jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, this, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1, jdField_a_of_type_ComTencentMobileqqBubbleChatXListView, jdField_a_of_type_ComTencentMobileqqWidgetScrollerRunnable);
    if ((jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a() != 9)) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.d();
    }
  }
  
  protected void b(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("uinname");
    paramIntent = str;
    if (str == null) {
      paramIntent = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, ContactUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int), 3);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = paramIntent;
    a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_b_of_type_AndroidWidgetTextView);
  }
  
  protected void f()
  {
    super.f();
    DiscActiveTipsBar localDiscActiveTipsBar = new DiscActiveTipsBar(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1);
    DiscFreqPttGrayTips localDiscFreqPttGrayTips = new DiscFreqPttGrayTips(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(localDiscActiveTipsBar);
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(localDiscFreqPttGrayTips);
  }
  
  protected void l()
  {
    jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(new lgi(this));
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_c_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131367356));
  }
  
  public void m()
  {
    Intent localIntent = new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, DiscussionInfoCardActivity.class);
    localIntent.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    localIntent.putExtra("uinname", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
    localIntent.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    if ((1000 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int) || (1004 == jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int)) {
      localIntent.putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
    }
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(localIntent, 2000);
  }
  
  protected void o()
  {
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130842628);
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    super.onTextChanged(paramCharSequence, paramInt1, paramInt2, paramInt3);
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString != null) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.length() != 0) && (paramInt3 == 1) && ((paramCharSequence.charAt(paramInt1) == '@') || (paramCharSequence.charAt(paramInt1) == 65312)) && (!n))
    {
      paramCharSequence = TroopMemberListActivity.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 10);
      paramCharSequence.putExtra("param_is_pop_up_style", true);
      paramCharSequence.setFlags(603979776);
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(paramCharSequence, 6001);
    }
  }
  
  protected void u()
  {
    if ((jdField_a_of_type_ComTencentWidgetActionSheet != null) && (jdField_a_of_type_ComTencentWidgetActionSheet.isShowing())) {
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
    }
    jdField_a_of_type_ComTencentWidgetActionSheet = null;
    if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
      jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a();
    }
    super.u();
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    super.update(paramObservable, paramObject);
    if (paramObject == null) {}
    do
    {
      do
      {
        do
        {
          return;
          if (!(paramObject instanceof TroopAioAgent.Message)) {
            break;
          }
          paramObservable = (TroopAioAgent.Message)paramObject;
        } while (paramObservable == null);
        if (jdField_a_of_type_Int == TroopAioAgent.jdField_a_of_type_Int)
        {
          if (c == 1)
          {
            a(c, jdField_a_of_type_Long, d);
            return;
          }
          a(c, jdField_b_of_type_Long, d);
          return;
        }
      } while ((jdField_a_of_type_Int != TroopAioAgent.jdField_b_of_type_Int) || (jdField_c_of_type_AndroidViewView == null));
      ((RelativeLayout.LayoutParams)jdField_c_of_type_AndroidViewView.getLayoutParams()).addRule(2, jdField_b_of_type_Int);
      return;
    } while (!(paramObject instanceof Integer));
  }
  
  protected void x()
  {
    TroopInfoManager localTroopInfoManager = (TroopInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(36);
    if (localTroopInfoManager != null) {
      localTroopInfoManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "&" + 3000, 0);
    }
    super.x();
  }
}
