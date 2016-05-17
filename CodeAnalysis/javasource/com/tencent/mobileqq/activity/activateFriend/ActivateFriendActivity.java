package com.tencent.mobileqq.activity.activateFriend;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.text.SpannableString;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.fling.TopGestureLayout;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.CardObserver;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendServlet;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsManager;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsObserver;
import com.tencent.mobileqq.app.activateFriends.MessageForActivateFriends;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.QQViewPager;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Observable;
import java.util.Observer;
import koq;
import kor;
import kos;
import kot;
import kou;
import kov;
import kow;
import tencent.im.s2c.msgtype0x210.submsgtype0x76.SubMsgType0x76.BirthdayNotify;
import tencent.im.s2c.msgtype0x210.submsgtype0x76.SubMsgType0x76.GeoGraphicNotify;
import tencent.im.s2c.msgtype0x210.submsgtype0x76.SubMsgType0x76.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x76.SubMsgType0x76.OneBirthdayFriend;
import tencent.im.s2c.msgtype0x210.submsgtype0x76.SubMsgType0x76.OneGeoGraphicFriend;

public class ActivateFriendActivity
  extends IphoneTitleBarActivity
  implements ViewPager.OnPageChangeListener, View.OnClickListener, Observer
{
  public static final int a = 1;
  public static final String a = "af_key_from";
  public static final int b = 2;
  private static final String b = "ActivateFriends.MainActivity";
  public static final int c = 3;
  public static final int d = 4;
  public static final int e = 5;
  public static final int f = 1000;
  public static final int g = 1;
  private static final int h = 1;
  private static final int k = 0;
  private static final int l = 1;
  private static final int m = 2;
  private static final int n = 3;
  Handler jdField_a_of_type_AndroidOsHandler;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private ActivatePageAdapter jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter;
  public BirthdayActivatePage a;
  private CardObserver jdField_a_of_type_ComTencentMobileqqAppCardObserver;
  private ActivateFriendsManager jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsManager;
  private ActivateFriendsObserver jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsObserver;
  private QQViewPager jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager;
  private boolean jdField_a_of_type_Boolean;
  private int i;
  private int j;
  
  public ActivateFriendActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidWidgetLinearLayout = null;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper(), new kos(this));
    jdField_a_of_type_ComTencentMobileqqAppCardObserver = new kou(this);
    jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsObserver = new kov(this);
  }
  
  private int a(int paramInt1, int paramInt2, int paramInt3)
  {
    Object localObject = Calendar.getInstance();
    ((Calendar)localObject).setTimeInMillis(MessageCache.a() * 1000L);
    int i1 = ((Calendar)localObject).get(1);
    int i2 = ((Calendar)localObject).get(2);
    int i3 = ((Calendar)localObject).get(6);
    ((Calendar)localObject).add(6, 1);
    int i4 = ((Calendar)localObject).get(6);
    localObject = new GregorianCalendar();
    ((GregorianCalendar)localObject).set(5, paramInt3);
    ((GregorianCalendar)localObject).set(2, paramInt2 - 1);
    ((GregorianCalendar)localObject).set(1, paramInt1);
    paramInt3 = ((GregorianCalendar)localObject).get(6);
    if (i1 == paramInt1) {
      if (paramInt3 >= i3) {}
    }
    while (paramInt1 <= i1)
    {
      return 0;
      if (paramInt3 == i3) {
        return 1;
      }
      if (paramInt3 == i4) {
        return 2;
      }
      return 3;
    }
    if ((paramInt1 == i1 + 1) && (i2 + 1 + 0 == 12) && (paramInt2 == 1))
    {
      if (i4 == paramInt3) {
        return 2;
      }
      return 3;
    }
    return 3;
  }
  
  private TopGestureLayout a()
  {
    ViewGroup localViewGroup = (ViewGroup)getWindow().getDecorView();
    View localView = localViewGroup.getChildAt(0);
    Object localObject = localViewGroup;
    if (localView != null)
    {
      localObject = localViewGroup;
      if ((localView instanceof DragFrameLayout)) {
        localObject = (ViewGroup)localView;
      }
    }
    localObject = ((ViewGroup)localObject).getChildAt(0);
    if ((localObject instanceof TopGestureLayout)) {
      return (TopGestureLayout)localObject;
    }
    return null;
  }
  
  private String a(int paramInt1, int paramInt2, int paramInt3)
  {
    switch (paramInt1)
    {
    default: 
      return getString(2131371054, new Object[] { Integer.valueOf(paramInt2), Integer.valueOf(paramInt3) });
    case 0: 
      return getString(2131371051);
    case 1: 
      return getString(2131371052);
    }
    return getString(2131371053);
  }
  
  private void a(QQAppInterface paramQQAppInterface, long paramLong, String paramString, long[] paramArrayOfLong)
  {
    PositionActivatePage localPositionActivatePage = new PositionActivatePage(this);
    localPositionActivatePage.a(paramQQAppInterface, paramLong, paramString, paramArrayOfLong);
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter.a(localPositionActivatePage);
  }
  
  private void a(QQAppInterface paramQQAppInterface, long paramLong, long[] paramArrayOfLong1, String[] paramArrayOfString, long[] paramArrayOfLong2)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage == null) {
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage = new BirthdayActivatePage(this);
    }
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage.a(paramQQAppInterface, paramLong, paramArrayOfLong1, paramArrayOfString, paramArrayOfLong2);
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage);
  }
  
  private boolean a()
  {
    if (getIntent().getExtras() != null) {}
    for (Object localObject1 = getIntent().getExtras().getString("leftViewText");; localObject1 = null)
    {
      if ((localObject1 != null) && (((String)localObject1).contains(getString(2131367297)))) {}
      for (int i1 = 1;; i1 = 0)
      {
        if (i1 != 0) {
          app.a().addObserver(this);
        }
        app.a().c(AppConstants.aI, 9002);
        localObject1 = app.a().b(AppConstants.aI, 9002);
        i1 = ((List)localObject1).size();
        if (QLog.isColorLevel()) {
          QLog.d("ActivateFriends.MainActivity", 2, "initData | message count = " + i1);
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter != null) {
          jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter.a();
        }
        if (i1 != 0) {
          break label260;
        }
        a(app, System.currentTimeMillis(), null, null, null);
        if (!jdField_a_of_type_Boolean) {
          break;
        }
        ActivateFriendServlet.a(app, false);
        a();
        return false;
      }
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage.d();
      localObject1 = (TextView)jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage.findViewById(2131299389);
      Object localObject2 = new SpannableString("启用一声问候，查看好友生日。");
      ((SpannableString)localObject2).setSpan(new koq(this), 0, 2, 33);
      ((TextView)localObject1).setText((CharSequence)localObject2);
      ((TextView)localObject1).setMovementMethod(LinkMovementMethod.getInstance());
      return false;
      label260:
      Collections.sort((List)localObject1, new kor(this));
      if (QLog.isColorLevel()) {
        QLog.d("ActivateFriends.MainActivity", 2, "entrance type : " + getIntent().getIntExtra("af_key_from", 0));
      }
      localObject2 = (MessageForActivateFriends)((List)localObject1).get(0);
      Object localObject3 = app;
      if (getMsgBodyuint32_msg_type.get() == 1)
      {
        i1 = 0;
        ReportController.b((QQAppInterface)localObject3, "CliOper", "", "", "0X8004E05", "0X8004E05", i1, 0, getIntent().getIntExtra("af_key_from", 1) + "", "", "", "");
        localObject1 = ((List)localObject1).iterator();
      }
      for (;;)
      {
        if (!((Iterator)localObject1).hasNext()) {
          break label829;
        }
        localObject3 = (MessageRecord)((Iterator)localObject1).next();
        localObject2 = ((MessageForActivateFriends)localObject3).getMsgBody();
        long l1 = 1000L * time;
        long[] arrayOfLong;
        if (uint32_msg_type.get() == 1)
        {
          localObject3 = msg_geographic_notify.bytes_local_city.get().toStringUtf8();
          arrayOfLong = new long[msg_geographic_notify.rpt_msg_one_friend.get().size()];
          i1 = 0;
          for (;;)
          {
            if (i1 < arrayOfLong.length)
            {
              arrayOfLong[i1] = msg_geographic_notify.rpt_msg_one_friend.get().get(i1)).uint64_uin.get();
              i1 += 1;
              continue;
              i1 = 1;
              break;
            }
          }
          a(app, l1, (String)localObject3, arrayOfLong);
        }
        else
        {
          localObject3 = new long[msg_birthday_notify.rpt_msg_one_friend.get().size()];
          arrayOfLong = new long[localObject3.length];
          String[] arrayOfString = new String[localObject3.length];
          i1 = 0;
          if (i1 < localObject3.length)
          {
            localObject3[i1] = msg_birthday_notify.rpt_msg_one_friend.get().get(i1)).uint64_uin.get();
            int i2 = msg_birthday_notify.rpt_msg_one_friend.get().get(i1)).uint32_birth_month.get();
            int i3 = msg_birthday_notify.rpt_msg_one_friend.get().get(i1)).uint32_birth_date.get();
            int i4 = a(msg_birthday_notify.rpt_msg_one_friend.get().get(i1)).uint32_birth_year.get(), i2, i3);
            arrayOfString[i1] = a(i4, i2, i3);
            if ((i4 == 0) || (i4 == 1)) {
              arrayOfLong[i1] = MessageCache.a();
            }
            for (;;)
            {
              i1 += 1;
              break;
              arrayOfLong[i1] = msg_birthday_notify.rpt_msg_one_friend.get().get(i1)).uint64_msg_send_time.get();
            }
          }
          a(app, l1, (long[])localObject3, arrayOfString, arrayOfLong);
        }
      }
      label829:
      if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter != null) {}
      for (i1 = jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter.getCount();; i1 = 0)
      {
        j = i1;
        if (j > 1)
        {
          jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
          i = 0;
          a(i);
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage != null) {
          jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage.d();
        }
        return true;
      }
    }
  }
  
  private void c()
  {
    super.setContentView(2130903990);
    super.setTitle(2131371026);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)super.findViewById(2131297324));
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setBackgroundResource(2130838440);
    jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297035));
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)super.findViewById(2131300834));
    jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager = ((QQViewPager)findViewById(2131300833));
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter = new ActivatePageAdapter(jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager);
    jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter);
    jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager.setOnPageChangeListener(this);
    jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsManager = ((ActivateFriendsManager)app.getManager(84));
    jdField_a_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsManager.a(true);
    if (AppSetting.i) {
      jdField_a_of_type_AndroidWidgetImageView.setContentDescription(getString(2131370577));
    }
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendBirthdayActivatePage.c();
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 5000L);
    }
  }
  
  void a(int paramInt)
  {
    int i1 = 0;
    if (QLog.isColorLevel()) {
      QLog.d("ActivateFriends.MainActivity", 2, "setIndicatorSelected-->index = " + paramInt);
    }
    if (j <= 1)
    {
      paramInt = i1;
      while (paramInt < jdField_a_of_type_AndroidWidgetLinearLayout.getChildCount())
      {
        jdField_a_of_type_AndroidWidgetLinearLayout.getChildAt(paramInt).setVisibility(8);
        paramInt += 1;
      }
    }
    i1 = 0;
    while (i1 < j)
    {
      jdField_a_of_type_AndroidWidgetLinearLayout.getChildAt(i1).setVisibility(0);
      i1 += 1;
    }
    i1 = 0;
    if (i1 < jdField_a_of_type_AndroidWidgetLinearLayout.getChildCount())
    {
      if (i1 == paramInt) {
        ((ImageView)jdField_a_of_type_AndroidWidgetLinearLayout.getChildAt(i1)).setImageResource(2130837548);
      }
      for (;;)
      {
        i1 += 1;
        break;
        ((ImageView)jdField_a_of_type_AndroidWidgetLinearLayout.getChildAt(i1)).setImageResource(2130837547);
      }
    }
  }
  
  public void b()
  {
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(this, null);
    localActionSheet.a(getString(2131371042), jdField_a_of_type_Boolean);
    localActionSheet.a(new kot(this, localActionSheet));
    localActionSheet.d(2131366996);
    localActionSheet.show();
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    int i1 = -1;
    StringBuilder localStringBuilder = new StringBuilder("doOnActiResult").append(" | rs code = ").append(paramInt2);
    long[] arrayOfLong;
    if ((paramInt1 == 1000) && (paramInt2 == -1)) {
      if (paramIntent != null)
      {
        arrayOfLong = paramIntent.getLongArrayExtra("key_friend_list");
        paramInt2 = paramIntent.getIntExtra("key_msg_type", -1);
        if ((arrayOfLong != null) && (arrayOfLong.length > 0) && (paramInt2 != -1)) {
          jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsManager.a(arrayOfLong, paramInt2);
        }
        paramIntent = localStringBuilder.append(" | uinArray len = ");
        if (arrayOfLong != null) {
          break label140;
        }
      }
    }
    label140:
    for (paramInt1 = i1;; paramInt1 = arrayOfLong.length)
    {
      paramIntent.append(paramInt1).append(" | type = ").append(paramInt2);
      super.finish();
      if (QLog.isColorLevel()) {
        QLog.d("ActivateFriends.MainActivity", 2, localStringBuilder.toString());
      }
      return;
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    c();
    a();
    addObserver(jdField_a_of_type_ComTencentMobileqqAppCardObserver);
    app.registObserver(jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsObserver);
    return true;
  }
  
  protected void doOnDestroy()
  {
    removeObserver(jdField_a_of_type_ComTencentMobileqqAppCardObserver);
    app.unRegistObserver(jdField_a_of_type_ComTencentMobileqqAppActivateFriendsActivateFriendsObserver);
    app.a().deleteObserver(this);
    jdField_a_of_type_ComTencentMobileqqWidgetQQViewPager.setAdapter(null);
    super.doOnDestroy();
  }
  
  protected void doOnNewIntent(Intent paramIntent)
  {
    setIntent(paramIntent);
    super.doOnNewIntent(paramIntent);
    if (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivatePageAdapter.a();
      a();
    }
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    }
    b();
  }
  
  public void onPageScrollStateChanged(int paramInt) {}
  
  public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2) {}
  
  public void onPageSelected(int paramInt)
  {
    i = paramInt;
    a(paramInt);
    TopGestureLayout localTopGestureLayout = a();
    if (localTopGestureLayout != null)
    {
      if (i == 0) {
        localTopGestureLayout.setInterceptTouchFlag(true);
      }
    }
    else {
      return;
    }
    localTopGestureLayout.setInterceptTouchFlag(false);
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    if ((paramObject instanceof MessageRecord))
    {
      int i2 = 1;
      int i1 = i2;
      if ((paramObject instanceof ChatMessage))
      {
        i1 = i2;
        if (((MessageRecord)paramObject).isSendFromLocal()) {
          i1 = 0;
        }
      }
      if (i1 != 0) {
        runOnUiThread(new kow(this));
      }
    }
  }
}
