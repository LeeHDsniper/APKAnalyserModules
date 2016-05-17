package com.tencent.mobileqq.activity.aio.rebuild;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.ChatSettingForHotChat;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.HotChatHandler;
import com.tencent.mobileqq.app.HotChatHelper;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.HotChatObserver;
import com.tencent.mobileqq.app.HotchatSCHelper;
import com.tencent.mobileqq.app.HotchatSCHelper.OnShowNoteListener;
import com.tencent.mobileqq.app.MessageHandlerUtils;
import com.tencent.mobileqq.app.NearbyFlowerManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.bubble.ChatXListView;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.ShareHotChatGrayTips;
import com.tencent.mobileqq.dating.NearbyTransitActivity;
import com.tencent.mobileqq.hotchat.HCTopicSeatsView;
import com.tencent.mobileqq.hotchat.HotChatFavoriteHelper;
import com.tencent.mobileqq.hotchat.HotChatPttStageControl;
import com.tencent.mobileqq.hotchat.PKControl;
import com.tencent.mobileqq.hotchat.PttShowRoomMng;
import com.tencent.mobileqq.hotchat.ui.HotChatPttStageView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.HotChatUtil;
import com.tencent.mobileqq.nearby.NearbyChatFlowerHelper;
import com.tencent.mobileqq.nearby.NearbyChatFlowerHelper.FlowerPlayable;
import com.tencent.mobileqq.nearby.NearbyUtils;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageCacheItem;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.data.TroopAioTips;
import com.tencent.mobileqq.troop.logic.TroopFeedsCenterLogic;
import com.tencent.mobileqq.troop.text.AtTroopMemberSpan;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.QQRecorder.OnQQRecorderListener;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.XEditTextEx;
import com.tencent.widget.XPanelContainer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Observable;
import java.util.concurrent.ConcurrentHashMap;
import lhf;
import lhg;
import lhh;
import lhi;
import lhj;
import lhm;
import lhn;
import lho;
import lhp;
import lhq;
import lhr;
import lhs;
import lht;
import lhu;
import lhv;
import lhw;
import lhx;
import mqq.os.MqqHandler;

public class HotChatPie
  extends TroopChatPie
  implements NearbyChatFlowerHelper.FlowerPlayable
{
  protected static final String[] a;
  public static final String ag = "abp_flag";
  public static final String ah = "is_from_web";
  protected static final int dw = 4;
  public boolean G = false;
  public boolean H = false;
  boolean I;
  PopupWindow jdField_a_of_type_AndroidWidgetPopupWindow;
  public HotChatManager a;
  HotChatObserver jdField_a_of_type_ComTencentMobileqqAppHotChatObserver = new lhg(this);
  public HotchatSCHelper a;
  public HotChatInfo a;
  HotChatFavoriteHelper jdField_a_of_type_ComTencentMobileqqHotchatHotChatFavoriteHelper;
  public HotChatPttStageControl a;
  public PKControl a;
  HotChatPttStageView jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView;
  public NearbyChatFlowerHelper a;
  public ConcurrentHashMap a;
  public String ai;
  public int dv;
  int dx = 0;
  public long g;
  Dialog g;
  public long h;
  public Dialog h;
  ImageView h;
  long i = 0L;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { "@all", "@全体成员" };
  }
  
  public HotChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    jdField_g_of_type_Long = 0L;
    jdField_h_of_type_Long = jdField_g_of_type_Long;
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  }
  
  private void aP()
  {
    if ((jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.isPttShowRoom())) {
      jdField_a_of_type_AndroidViewViewGroup.postDelayed(new lhp(this), 50L);
    }
  }
  
  private void b(List paramList)
  {
    PttShowRoomMng localPttShowRoomMng;
    if ((paramList != null) && (paramList.size() > 0))
    {
      localPttShowRoomMng = jdField_a_of_type_ComTencentMobileqqAppHotChatManager.a(true);
      if (Thread.currentThread() != Looper.getMainLooper().getThread()) {
        break label52;
      }
      ThreadManager.a(new lhi(this, paramList, localPttShowRoomMng), 8, null, true);
    }
    for (;;)
    {
      return;
      label52:
      paramList = paramList.iterator();
      while (paramList.hasNext()) {
        localPttShowRoomMng.a((MessageForPtt)paramList.next());
      }
    }
  }
  
  protected void A()
  {
    super.A();
    if ((jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.isPttShowRoom()))
    {
      jdField_a_of_type_AndroidViewViewGroup.setBackgroundColor(jdField_a_of_type_AndroidContentContext.getResources().getColor(2131427706));
      jdField_a_of_type_AndroidViewViewGroup.postDelayed(new lhr(this), 300L);
    }
  }
  
  protected void B()
  {
    super.B();
    if (jdField_a_of_type_ComTencentMobileqqHotchatPKControl != null) {
      jdField_a_of_type_ComTencentMobileqqHotchatPKControl.b();
    }
    if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null)
    {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.d();
    }
  }
  
  public void C()
  {
    if (jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper != null) {
      jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper.c();
    }
    super.C();
  }
  
  protected void I()
  {
    if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null)
    {
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.b();
      if ((jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView != null) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.a != null)) {
        jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.postDelayed(new lhx(this), 100L);
      }
    }
    aP();
    if (G)
    {
      if (jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips != null) {
        jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips.a();
      }
      HotChatManager.a(jdField_a_of_type_AndroidContentContext, G);
      return;
    }
    super.I();
  }
  
  protected void R()
  {
    au();
    super.R();
    i = SystemClock.elapsedRealtime();
    NearbyTransitActivity.a("AIOShow", 2);
    Object localObject2 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent();
    Object localObject1 = ((Intent)localObject2).getStringExtra("uin");
    String str1 = ((Intent)localObject2).getStringExtra("uinname");
    String str2 = ((Intent)localObject2).getStringExtra("hotnamecode");
    boolean bool = ((Intent)localObject2).getBooleanExtra("param_newly_created_hot_chat", false);
    if ((!I) && (bool) && (((Intent)localObject2).getBooleanExtra("param_newly_created_hot_chat", false)) && (!TextUtils.isEmpty((CharSequence)localObject1)) && (!TextUtils.isEmpty(str1)) && (!TextUtils.isEmpty(str2)))
    {
      localObject2 = HotChatHelper.a(str2, 1);
      String str3 = ShareHotChatGrayTips.makeShareGrayTip("你的热聊房间会被推荐给附近的人和好友，感兴趣的会加入进来哦。你也可以邀请好友加入。分享热聊房间", "分享热聊房间", (String)localObject1, str1, (String)localObject2, str2);
      if (!TextUtils.isEmpty(str3))
      {
        I = true;
        MessageRecord localMessageRecord = MessageRecordFactory.a(63503);
        long l = MessageCache.a();
        String str4 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        localMessageRecord.init(str4, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, str4, str3, l, 63503, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, l);
        isread = true;
        if (!MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageRecord, false)) {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localMessageRecord, str4);
        }
      }
      jdField_g_of_type_AndroidAppDialog = HotChatHelper.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, new lht(this, str1, (String)localObject1, (String)localObject2, str2));
    }
    jdField_a_of_type_ComTencentMobileqqDataHotChatInfo = jdField_a_of_type_ComTencentMobileqqAppHotChatManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if ((jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.pkFlag != 0))
    {
      if (jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper == null)
      {
        ThreadManager.a(new lhu(this), 5, null, true);
        localObject1 = new lhv(this);
        jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper = new HotchatSCHelper(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (HotchatSCHelper.OnShowNoteListener)localObject1, jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.uuid);
      }
      jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper.a(10000L);
    }
    if ((jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.subType == 1)) {
      HotChatUtil.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqDataHotChatInfo, jdField_a_of_type_ComTencentMobileqqAppHotChatManager, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getLongAccountUin());
    }
  }
  
  public void X()
  {
    super.X();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppHotChatObserver);
  }
  
  public void Y()
  {
    super.Y();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppHotChatObserver);
    if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatFavoriteHelper != null)
    {
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatFavoriteHelper.b();
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatFavoriteHelper = null;
    }
  }
  
  public NearbyChatFlowerHelper a()
  {
    return jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper;
  }
  
  protected void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    boolean bool = false;
    if (paramInt1 == 2000) {
      if (paramInt2 == -1)
      {
        if ((jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic != null) && (!jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a()))
        {
          jdField_a_of_type_ComTencentMobileqqDataHotChatInfo = jdField_a_of_type_ComTencentMobileqqAppHotChatManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          if (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) {
            a(jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.troopUin, jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.memo, jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.memoUrl);
          }
        }
        if ((paramIntent == null) || (paramIntent.getExtras() == null)) {
          break label334;
        }
      }
    }
    label325:
    label334:
    for (bool = paramIntent.getExtras().getBoolean("isNeedFinish");; bool = false)
    {
      if ((bool) && (a().getIntent().getBooleanExtra("is_from_web", false))) {
        a().sendBroadcast(new Intent("com.tencent.mobileqq.refresh_hot_chat_list"));
      }
      super.a(paramInt1, paramInt2, paramIntent);
      return;
      String str;
      if (paramInt1 == 13004)
      {
        if ((paramIntent == null) || (paramIntent.getExtras() == null)) {
          break label325;
        }
        str = paramIntent.getStringExtra("SEL_MEMBER_UIN");
      }
      for (int j = paramIntent.getIntExtra("HC_MEMBER_SEATID", 0);; j = 0)
      {
        if (QLog.isColorLevel()) {
          QLog.i("Q.aio.TroopChatPie", 2, "REQUEST_HCTOPIC_SEL_MEMBER_TO_INVITE, " + str);
        }
        if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl == null) {
          break;
        }
        HCTopicSeatsView localHCTopicSeatsView = jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.a();
        if (paramInt2 == -1) {
          bool = true;
        }
        localHCTopicSeatsView.a(bool, j, str);
        break;
        if ((paramInt1 != 13003) || (paramIntent == null)) {
          break;
        }
        str = paramIntent.getExtras().getString("uin");
        j = paramIntent.getExtras().getInt("from", 0);
        NearbyFlowerManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, j, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        break;
        str = null;
      }
    }
  }
  
  public void a(int paramInt1, boolean paramBoolean, int paramInt2, double paramDouble)
  {
    HCTopicSeatsView localHCTopicSeatsView;
    if ((jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.isPttShowRoom()) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null))
    {
      localHCTopicSeatsView = jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a();
      if (localHCTopicSeatsView != null)
      {
        if (paramInt1 != 1) {
          break label91;
        }
        localHCTopicSeatsView.setFlag(paramBoolean, 1);
        if (QLog.isColorLevel()) {
          NearbyUtils.a("PttShow", String.format("updateRecordState flag:%d isRecording=%b", new Object[] { Integer.valueOf(paramInt1), Boolean.valueOf(paramBoolean) }), new Object[0]);
        }
      }
    }
    label91:
    while (paramInt1 != 2) {
      return;
    }
    localHCTopicSeatsView.a(paramInt2, paramDouble);
  }
  
  public void a(long paramLong)
  {
    QLog.d("PttShow", 1, "HotChatPie deletePttInShowRoom uniseq=" + paramLong);
    if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null) {
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.c(paramLong);
    }
  }
  
  public void a(long paramLong, int paramInt)
  {
    if ((paramLong <= 1L) || (paramInt < 1)) {
      return;
    }
    if (paramInt > paramLong - 1L) {
      paramInt = (int)(paramLong - 1L);
    }
    for (;;)
    {
      Object localObject1 = (HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35);
      Object localObject2 = jdField_a_of_type_ComTencentMobileqqDataHotChatInfo;
      long l = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(1, troopUin);
      QLog.d("PttShow", 1, "getMorePttData shmsgseq=" + paramLong + ", count=" + paramInt + ", localCacheMinSeq=" + l + ", mMinPttSeq=" + jdField_g_of_type_Long + ", mMaxPttSeq=" + jdField_h_of_type_Long);
      if ((paramLong > l) && (paramLong - l >= paramInt))
      {
        localObject1 = new ArrayList();
        int j = 0;
        while (j < paramInt)
        {
          localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 1026, paramLong - paramInt + j);
          if ((localObject2 != null) && ((localObject2 instanceof MessageForPtt)))
          {
            localObject2 = (MessageForPtt)localObject2;
            QLog.d("PttShow", 1, "getMorePttData index=" + j + ", ptt=" + ((MessageForPtt)localObject2).toString());
            if (shmsgseq > jdField_h_of_type_Long) {
              jdField_h_of_type_Long = shmsgseq;
            }
            if (shmsgseq < jdField_g_of_type_Long) {
              jdField_g_of_type_Long = shmsgseq;
            }
            ((ArrayList)localObject1).add(localObject2);
            jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(Long.valueOf(uniseq), localObject2);
          }
          j += 1;
        }
        if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl == null) {
          break;
        }
        localObject2 = jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl;
        if ((paramLong == paramInt + l) && (l == 1L)) {}
        for (boolean bool = false;; bool = true)
        {
          ((HotChatPttStageControl)localObject2).a((List)localObject1, bool);
          b((List)localObject1);
          return;
        }
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(troopUin, 1);
      ((HotChatHandler)localObject1).a((HotChatInfo)localObject2, paramLong - 1L, paramInt, 0);
      return;
    }
  }
  
  protected void a(Context paramContext, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    if ((jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.e) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.f)) {
      return;
    }
    super.a(paramContext, paramBoolean1, paramBoolean2, paramBoolean3);
  }
  
  protected void a(QQMessageFacade.Message paramMessage) {}
  
  public void a(ChatMessage paramChatMessage, String paramString)
  {
    ActionSheet localActionSheet = ActionSheet.a(a());
    localActionSheet.c("@他");
    localActionSheet.a("删除成员", 3);
    localActionSheet.d(2131366996);
    localActionSheet.a(new lhj(this, localActionSheet, paramChatMessage, paramString));
    localActionSheet.show();
  }
  
  public void a(QQRecorder.OnQQRecorderListener paramOnQQRecorderListener, boolean paramBoolean, QQRecorder.RecorderParam paramRecorderParam)
  {
    super.a(paramOnQQRecorderListener, paramBoolean, paramRecorderParam);
    a(1, true, 0, 0.0D);
  }
  
  protected void a(CharSequence paramCharSequence)
  {
    if (!jdField_a_of_type_ComTencentMobileqqAppHotChatManager.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
      return;
    }
    super.a(paramCharSequence);
  }
  
  public void a(Object paramObject)
  {
    if ((paramObject == null) || (!(paramObject instanceof Integer))) {}
    int j;
    do
    {
      return;
      j = ((Integer)paramObject).intValue();
    } while (j == jdField_a_of_type_ComTencentWidgetXPanelContainer.a());
    switch (j)
    {
    }
    for (;;)
    {
      super.a(paramObject);
      return;
      if (HotChatUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true))
      {
        if (!HotChatUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))
        {
          if ((jdField_a_of_type_ComTencentMobileqqAppHotChatManager != null) && (jdField_a_of_type_ComTencentMobileqqAppHotChatManager.a(true))) {
            h(false);
          }
          for (;;)
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800657E", "0X800657E", 0, 0, "", "", "", "");
            return;
            h(true);
          }
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800657D", "0X800657D", 0, 0, "", "", "", "");
      }
    }
  }
  
  public void a(String paramString, int paramInt1, int paramInt2, QQRecorder.RecorderParam paramRecorderParam, int paramInt3, boolean paramBoolean)
  {
    a(1, false, 0, 0.0D);
    super.a(paramString, paramInt1, paramInt2, paramRecorderParam, paramInt3, paramBoolean);
  }
  
  public void a(String paramString, byte[] paramArrayOfByte, int paramInt1, int paramInt2, double paramDouble, QQRecorder.RecorderParam paramRecorderParam)
  {
    super.a(paramString, paramArrayOfByte, paramInt1, paramInt2, paramDouble, paramRecorderParam);
    a(2, true, paramInt2, paramDouble);
  }
  
  public boolean a(String paramString1, String paramString2, String paramString3)
  {
    if (!paramString1.equals(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
      return false;
    }
    jdField_a_of_type_ComTencentMobileqqDataHotChatInfo = jdField_a_of_type_ComTencentMobileqqAppHotChatManager.a(paramString1);
    if ((jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (!jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.memoShowed))
    {
      jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.memoShowed = true;
      ThreadManager.a().post(new lhw(this));
      if (!TextUtils.isEmpty(paramString2))
      {
        if (jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic == null) {
          jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic = new TroopFeedsCenterLogic(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_c_of_type_AndroidWidgetImageView, jdField_a_of_type_ComTencentMobileqqTroopDataTroopAioTips, K);
        }
        paramString1 = paramString3;
        if (!TextUtils.isEmpty(paramString3))
        {
          paramString1 = paramString3;
          if (!paramString3.startsWith("mqqapi"))
          {
            paramString1 = paramString3;
            if (!paramString3.startsWith("http://")) {
              paramString1 = "http://" + paramString3;
            }
          }
        }
        jdField_a_of_type_ComTencentMobileqqTroopLogicTroopFeedsCenterLogic.a(paramString2, paramString1);
        if (jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper != null) {
          jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper.b = false;
        }
      }
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  protected boolean a(boolean paramBoolean)
  {
    A = false;
    return super.a(paramBoolean);
  }
  
  protected void ar()
  {
    if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatFavoriteHelper == null) {
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatFavoriteHelper = new HotChatFavoriteHelper(jdField_c_of_type_AndroidWidgetImageView, jdField_a_of_type_ComTencentMobileqqDataHotChatInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
  }
  
  void as()
  {
    super.as();
    jdField_a_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131371121));
    if ((jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.state != 0)) {
      ThreadManager.a(new lhq(this), 5, null, false);
    }
  }
  
  protected void at() {}
  
  public void au()
  {
    jdField_a_of_type_ComTencentMobileqqDataHotChatInfo = jdField_a_of_type_ComTencentMobileqqAppHotChatManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    HotChatInfo localHotChatInfo = jdField_a_of_type_ComTencentMobileqqDataHotChatInfo;
    Object localObject1;
    int j;
    int m;
    Object localObject3;
    int k;
    label428:
    boolean bool;
    if (localHotChatInfo != null)
    {
      if ((HotChatManager.d()) && (localHotChatInfo.isPKHotChat()) && (jdField_a_of_type_ComTencentMobileqqHotchatPKControl == null)) {
        jdField_a_of_type_ComTencentMobileqqHotchatPKControl = new PKControl(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, uuid);
      }
      if (localHotChatInfo.isPttShowRoom())
      {
        if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl == null)
        {
          jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl = new HotChatPttStageControl(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, this, jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView, jdField_h_of_type_AndroidWidgetImageView, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, uuid);
          jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
          jdField_h_of_type_Long = 0L;
          jdField_g_of_type_Long = 0L;
        }
        jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.d = true;
        jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_h_of_type_Boolean = false;
        jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a();
        localObject1 = new ArrayList();
        long l1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(0, troopUin);
        Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 1026, 30);
        QLog.d("PttShow", 1, "mHotChatPttControl init msgList size=" + ((List)localObject2).size() + ", localMaxSeq=" + l1 + ", lLastMsgSeq=" + lLastMsgSeq);
        if (localObject2 != null)
        {
          j = 1;
          m = ((List)localObject2).size() - 1;
          if (m >= 0)
          {
            localObject3 = (MessageRecord)((List)localObject2).get(m);
            k = j;
            if (localObject3 != null)
            {
              k = j;
              if ((localObject3 instanceof MessageForPtt))
              {
                localObject3 = (MessageForPtt)localObject3;
                QLog.d("PttShow", 1, "mHotChatPttControl init index=" + m + ", ptt=" + ((MessageForPtt)localObject3).toString() + ", voice length=" + voiceLength);
                if (j == 0) {
                  break label674;
                }
                long l2 = shmsgseq;
                jdField_h_of_type_Long = l2;
                jdField_g_of_type_Long = l2;
                k = 0;
                ((ArrayList)localObject1).add(0, localObject3);
                jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(Long.valueOf(uniseq), localObject3);
              }
            }
            if (((ArrayList)localObject1).size() < 20) {
              break label725;
            }
          }
        }
        QLog.d("PttShow", 1, "mHotChatPttControl init pttList size=" + ((ArrayList)localObject1).size() + ", mMinPttSeq=" + jdField_g_of_type_Long + ", mMaxPttSeq=" + jdField_h_of_type_Long);
        localObject2 = jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl;
        if (jdField_g_of_type_Long <= 1L) {
          break label734;
        }
        bool = true;
        label539:
        ((HotChatPttStageControl)localObject2).a((List)localObject1, bool);
        b((List)localObject1);
        if (l1 < lLastMsgSeq)
        {
          jdField_a_of_type_ComTencentMobileqqAppHotChatManager.b(localHotChatInfo, 0);
          ((HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35)).a(localHotChatInfo, l1 + 1L, Math.min((int)(lLastMsgSeq - l1), 20), 1, 1, 0);
        }
      }
      jdField_a_of_type_ComTencentMobileqqAppHotChatManager.a();
      localObject1 = (HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35);
      if (userCreate != 1) {
        break label740;
      }
      ((HotChatHandler)localObject1).b(troopUin);
    }
    for (;;)
    {
      jdField_a_of_type_MqqOsMqqHandler.postDelayed(new lhh(this), 200L);
      return;
      label674:
      if (shmsgseq > jdField_h_of_type_Long) {
        jdField_h_of_type_Long = shmsgseq;
      }
      k = j;
      if (shmsgseq >= jdField_g_of_type_Long) {
        break label428;
      }
      jdField_g_of_type_Long = shmsgseq;
      k = j;
      break label428;
      label725:
      m -= 1;
      j = k;
      break;
      label734:
      bool = false;
      break label539;
      label740:
      if (uuid != null) {
        ((HotChatHandler)localObject1).a(uuid.getBytes(), troopUin);
      }
    }
  }
  
  protected void av()
  {
    Editable localEditable = jdField_a_of_type_ComTencentWidgetXEditTextEx.getEditableText();
    if ((localEditable == null) || (localEditable.length() < 4)) {}
    label164:
    for (;;)
    {
      return;
      String str1 = localEditable.toString().toLowerCase();
      Object localObject = jdField_a_of_type_ArrayOfJavaLangString;
      int m = localObject.length;
      int j = -1;
      int k = 0;
      String str2;
      if (k < m)
      {
        str2 = localObject[k];
        j = str1.indexOf(str2);
        if (j < 0) {}
      }
      for (str1 = localEditable.toString().substring(j, str2.length() + j);; str1 = null)
      {
        if ((j < 0) || (str1 == null)) {
          break label164;
        }
        localObject = AtTroopMemberSpan.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, "0", str1.substring(1), true, jdField_a_of_type_ComTencentWidgetXEditTextEx, true);
        localEditable.replace(j, str1.length() + j, (CharSequence)localObject);
        return;
        k += 1;
        break;
      }
    }
  }
  
  public void aw()
  {
    QQCustomDialog localQQCustomDialog = new QQCustomDialog(a(), 2131558942);
    localQQCustomDialog.setContentView(2130904114);
    TextView localTextView = (TextView)localQQCustomDialog.findViewById(2131301376);
    ((TextView)localQQCustomDialog.findViewById(2131297018)).setText(jdField_a_of_type_AndroidContentContext.getString(2131371141));
    ((TextView)localQQCustomDialog.findViewById(2131296768)).setText(jdField_a_of_type_AndroidContentContext.getString(2131371142));
    localTextView.setText(String.valueOf(HotChatManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) + "心");
    localQQCustomDialog.setNegativeButton("忽略", new lhm(this, localQQCustomDialog));
    localQQCustomDialog.setPositiveButton("去看攻略", new lhn(this));
    localQQCustomDialog.setCanceledOnTouchOutside(false);
    localQQCustomDialog.show();
  }
  
  protected void b(int paramInt1, int paramInt2)
  {
    super.b(paramInt1, paramInt2);
    if (jdField_a_of_type_ComTencentMobileqqHotchatPKControl != null) {
      jdField_a_of_type_ComTencentMobileqqHotchatPKControl.a(paramInt1, paramInt2);
    }
    if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null) {
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a(paramInt1, paramInt2);
    }
    dv = paramInt2;
    if (dx == 2) {
      u();
    }
    while (!QLog.isDevelopLevel()) {
      return;
    }
    NearbyUtils.a("PttShow", "doPanelChanged", new Object[] { Integer.valueOf(dx), jdField_a_of_type_AndroidWidgetPopupWindow });
  }
  
  public void b(String paramString, int paramInt, QQRecorder.RecorderParam paramRecorderParam)
  {
    a(1, false, 0, 0.0D);
    super.b(paramString, paramInt, paramRecorderParam);
  }
  
  public void c()
  {
    if (s()) {
      av();
    }
    super.c();
  }
  
  protected void d(Intent paramIntent)
  {
    super.d(paramIntent);
    jdField_a_of_type_ComTencentMobileqqAppHotChatManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(true);
    jdField_a_of_type_ComTencentMobileqqDataHotChatInfo = jdField_a_of_type_ComTencentMobileqqAppHotChatManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    if (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo == null)
    {
      if (QLog.isColorLevel()) {
        NearbyUtils.a("PttShow", new Object[] { "HotChatPie_updateSession_business HotChatInfo is null", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString });
      }
      a(0);
    }
    do
    {
      return;
      if ((jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.isPttShowRoom()))
      {
        jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView = new HotChatPttStageView(jdField_a_of_type_AndroidContentContext);
        jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.setId(2131296537);
        RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
        localLayoutParams.addRule(10);
        jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView, localLayoutParams);
        localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getLayoutParams();
        localLayoutParams.addRule(3, jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.getId());
        jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.setLayoutParams(localLayoutParams);
        jdField_h_of_type_AndroidWidgetImageView = new ImageView(jdField_a_of_type_AndroidContentContext);
        jdField_h_of_type_AndroidWidgetImageView.setBackgroundResource(2130840676);
        localLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
        localLayoutParams.addRule(6, jdField_a_of_type_ComTencentMobileqqBubbleChatXListView.getId());
        jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_h_of_type_AndroidWidgetImageView, localLayoutParams);
      }
    } while ((paramIntent == null) || (paramIntent.getIntExtra("hot_chat_from", 1) != 2) || (!jdField_a_of_type_ComTencentMobileqqAppHotChatManager.b()));
    HotChatHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
  }
  
  void d(String paramString) {}
  
  protected boolean d()
  {
    if (u()) {}
    while ((jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.b())) {
      return true;
    }
    boolean bool = super.d();
    if ((!bool) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView != null) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.a != null)) {
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.postDelayed(new lhs(this), 100L);
    }
    if ((!jdField_h_of_type_Boolean) && (G) && (!bool)) {
      HotChatManager.a(jdField_a_of_type_AndroidContentContext, G);
    }
    aP();
    return bool;
  }
  
  protected void e(Intent paramIntent)
  {
    G = paramIntent.getBooleanExtra("abp_flag", false);
    H = paramIntent.getBooleanExtra("is_from_web", false);
    if ((H) && (!G))
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(2131366418);
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription("返回");
      return;
    }
    if (G)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText("热聊");
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription("返回热聊");
      return;
    }
    super.e(paramIntent);
  }
  
  protected void h(boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl == null) {}
    for (;;)
    {
      return;
      u();
      Object localObject = null;
      if (paramBoolean)
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout != null) {
          localObject = jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.findViewWithTag(Integer.valueOf(2));
        }
        dx = 2;
      }
      for (jdField_a_of_type_AndroidWidgetPopupWindow = HotChatUtil.a((View)localObject); QLog.isDevelopLevel(); jdField_a_of_type_AndroidWidgetPopupWindow = HotChatUtil.a((View)localObject, new lho(this)))
      {
        NearbyUtils.a("PttShow", "showPttRoomGuideOrTip", new Object[] { Boolean.valueOf(paramBoolean), Integer.valueOf(dx), localObject });
        return;
        if (jdField_a_of_type_ComTencentWidgetXPanelContainer != null) {
          jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
        }
        localObject = jdField_a_of_type_AndroidViewViewGroup;
        dx = 1;
      }
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    boolean bool = true;
    switch (what)
    {
    default: 
      bool = super.handleMessage(paramMessage);
    }
    return bool;
  }
  
  protected void j()
  {
    if ((jdField_a_of_type_ComTencentMobileqqDataHotChatInfo != null) && (jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.mFissionRoomNum > 0))
    {
      b(true);
      jdField_c_of_type_AndroidWidgetTextView.setText(String.format(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131371107), new Object[] { Integer.valueOf(jdField_a_of_type_ComTencentMobileqqDataHotChatInfo.mFissionRoomNum) }));
    }
  }
  
  protected void l()
  {
    ThreadManager.a(new lhf(this), 8, null, true);
  }
  
  public void m()
  {
    String str = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    if (jdField_a_of_type_ComTencentMobileqqAppHotChatManager.a(str))
    {
      ChatSettingForHotChat.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, str);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004414", "0X8004414", 0, 0, "", "", "", "");
      return;
    }
    QQToast.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "你已不在该热聊", 0).b(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getTitleBarHeight());
  }
  
  public boolean o()
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqAppHotChatManager.c();
    if (!jdField_a_of_type_ComTencentMobileqqAppHotChatManager.c())
    {
      aw();
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005DD2", "0X8005DD2", 0, 0, "", "", "", "");
    }
    return bool;
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramInt3 == 1) && ((paramCharSequence.charAt(paramInt1) == '@') || (paramCharSequence.charAt(paramInt1) == 65312)) && (!n)) {
      return;
    }
    super.onTextChanged(paramCharSequence, paramInt1, paramInt2, paramInt3);
  }
  
  protected void q()
  {
    String str = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, ContactUtils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int), 3);
    if (!TextUtils.equals(str, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
      jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d = str;
    }
  }
  
  protected boolean s()
  {
    boolean bool2 = true;
    HotChatInfo localHotChatInfo = jdField_a_of_type_ComTencentMobileqqDataHotChatInfo;
    boolean bool1;
    if (localHotChatInfo != null)
    {
      bool1 = bool2;
      if (adminLevel != 1)
      {
        if (adminLevel == 2) {
          bool1 = bool2;
        }
      }
      else
      {
        bool2 = bool1;
        if (QLog.isDevelopLevel()) {
          QLog.i("Q.aio.TroopChatPie", 4, "isAbleToSendAtAllMsg, adminLevel = " + adminLevel);
        }
      }
    }
    for (bool2 = bool1;; bool2 = false)
    {
      bool1 = bool2;
      if (!bool2)
      {
        bool2 = HotChatManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false);
        bool1 = bool2;
        if (QLog.isDevelopLevel())
        {
          QLog.i("Q.aio.TroopChatPie", 4, "isAbleToSendAtAllMsg, isAuth = " + bool2);
          bool1 = bool2;
        }
      }
      return bool1;
      bool1 = false;
      break;
    }
  }
  
  public boolean t()
  {
    return true;
  }
  
  protected void u()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper.b();
      jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper = null;
    }
    long l = SystemClock.elapsedRealtime() - i;
    if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null)
    {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
      if ((jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView != null) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.a != null)) {
        jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.jdField_a_of_type_ComTencentMobileqqHotchatUiHotChatPttStageView.a.a = true;
      }
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.d();
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl = null;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006586", "0X8006586", 0, 0, String.valueOf(l), "", "", "");
    }
    for (;;)
    {
      if (((jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent() == null) || (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getBooleanExtra("open_chatfragment_fromphoto", false))) && (jdField_a_of_type_ComTencentMobileqqHotchatPKControl != null))
      {
        jdField_a_of_type_ComTencentMobileqqHotchatPKControl.b();
        jdField_a_of_type_ComTencentMobileqqHotchatPKControl = null;
      }
      if (jdField_h_of_type_AndroidAppDialog != null)
      {
        jdField_h_of_type_AndroidAppDialog.dismiss();
        jdField_h_of_type_AndroidAppDialog = null;
      }
      if (jdField_g_of_type_AndroidAppDialog != null)
      {
        jdField_g_of_type_AndroidAppDialog.dismiss();
        jdField_g_of_type_AndroidAppDialog = null;
      }
      super.u();
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006587", "0X8006587", 0, 0, String.valueOf(l), "", "", "");
    }
  }
  
  public boolean u()
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (jdField_a_of_type_AndroidWidgetPopupWindow != null)
    {
      bool1 = bool2;
      if (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())
      {
        jdField_a_of_type_AndroidWidgetPopupWindow.dismiss();
        jdField_a_of_type_AndroidWidgetPopupWindow = null;
        dx = 0;
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    super.update(paramObservable, paramObject);
    if ((paramObject != null) && ((paramObject instanceof MessageForPtt)))
    {
      paramObservable = (MessageForPtt)paramObject;
      QLog.d("PttShow", 1, "HotChatPie update receive ptt msg=" + paramObservable.toString() + "ptt voice length=" + voiceLength + ", before mMinPttSeq=" + jdField_g_of_type_Long + ", mMaxPttSeq=" + jdField_h_of_type_Long);
      if ((istroop == 1026) && (Utils.a(frienduin, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null))
      {
        if (shmsgseq > jdField_h_of_type_Long) {
          jdField_h_of_type_Long = shmsgseq;
        }
        if (shmsgseq < jdField_g_of_type_Long) {
          jdField_g_of_type_Long = shmsgseq;
        }
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(Long.valueOf(uniseq), paramObservable);
        paramObject = new ArrayList();
        paramObject.add(paramObservable);
        jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.a(paramObject, true);
        QLog.d("PttShow", 1, "HotChatPie update receive ptt msg after mMinPttSeq=" + jdField_g_of_type_Long + ", mMaxPttSeq=" + jdField_h_of_type_Long);
      }
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
    if (jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper != null) {
      jdField_a_of_type_ComTencentMobileqqAppHotchatSCHelper.a();
    }
    u();
    if (jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper != null) {
      jdField_a_of_type_ComTencentMobileqqNearbyNearbyChatFlowerHelper.b();
    }
    if (jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl != null) {
      jdField_a_of_type_ComTencentMobileqqHotchatHotChatPttStageControl.c();
    }
  }
}
