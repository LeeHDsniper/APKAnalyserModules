package com.tencent.mobileqq.activity.aio.tips;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.app.FragmentActivity;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.arrange.op.MeetingInfo;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.av.gaudio.AVNotifyCenter.UserInfo;
import com.tencent.av.gaudio.AVNotifyCenter.VideoRoomInfo;
import com.tencent.av.smallscreen.SmallScreenUtils;
import com.tencent.av.ui.MultiVideoEnterPageActivity;
import com.tencent.av.ui.PSTNC2CActivity;
import com.tencent.av.utils.GVideoUpdateUtil;
import com.tencent.av.utils.PstnUtils;
import com.tencent.av.utils.UITools;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DiscussionMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import lnj;
import lnk;
import lnl;
import mqq.os.MqqHandler;

public class VideoStatusTipsBar
  implements View.OnClickListener, TipsBarTask
{
  public static final int a = 0;
  private static final String jdField_a_of_type_JavaLangString = VideoStatusTipsBar.class.getSimpleName();
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 3;
  public static final int e = 4;
  protected float a;
  Context jdField_a_of_type_AndroidContentContext;
  private View jdField_a_of_type_AndroidViewView;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private lnl jdField_a_of_type_Lnl;
  private MqqHandler jdField_a_of_type_MqqOsMqqHandler;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public VideoStatusTipsBar(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, TipsManager paramTipsManager, Context paramContext, MqqHandler paramMqqHandler)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_MqqOsMqqHandler = paramMqqHandler;
    jdField_a_of_type_Float = getResourcesgetDisplayMetricsdensity;
  }
  
  private int a(int paramInt)
  {
    int i = 0;
    switch (paramInt)
    {
    case 22: 
    default: 
      i = 3;
    case 20: 
    case 21: 
      return i;
    }
    return 2;
  }
  
  private void a(int paramInt1, String paramString, int paramInt2)
  {
    Object localObject1 = null;
    int i = 0;
    if (!NetworkUtil.e(jdField_a_of_type_AndroidContentContext.getApplicationContext())) {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 2131366990, 0).b(jdField_a_of_type_AndroidContentContext.getApplicationContext().getResources().getDimensionPixelSize(2131492908));
    }
    while (paramString == null) {
      return;
    }
    boolean bool = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString);
    if ((paramInt2 == 2) && (!bool))
    {
      paramString = new HashMap();
      paramString.put("MultiAVType", String.valueOf(2));
      ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, null, paramString);
      return;
    }
    Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, MultiVideoEnterPageActivity.class);
    localIntent.addFlags(262144);
    localIntent.addFlags(268435456);
    Object localObject2;
    if (paramInt1 == 3000)
    {
      ArrayList localArrayList = ((DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52)).a(paramString);
      if (localArrayList != null)
      {
        int j = localArrayList.size();
        localObject2 = new long[j];
        for (;;)
        {
          localObject1 = localObject2;
          if (i >= j) {
            break;
          }
          localObject1 = (DiscussionMemberInfo)localArrayList.get(i);
          if (localObject1 != null) {
            localObject2[i] = Long.valueOf(memberUin).longValue();
          }
          i += 1;
        }
      }
      localIntent.putExtra("DiscussUinList", (long[])localObject1);
    }
    localIntent.putExtra("sessionType", 3);
    localIntent.putExtra("uin", paramString);
    localIntent.putExtra("uinType", paramInt1);
    localIntent.putExtra("Type", 3);
    localIntent.putExtra("GroupId", paramString);
    Long.valueOf(paramString).longValue();
    localIntent.putExtra("MultiAVType", paramInt2);
    localIntent.putExtra("flag", bool);
    ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localIntent);
    paramInt1 = UITools.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramInt1, paramString);
    if (localObject1 != null)
    {
      localObject2 = new Bundle();
      ((Bundle)localObject2).putParcelable("meetingInfo", (Parcelable)localObject1);
      localIntent.putExtras((Bundle)localObject2);
      localIntent.putExtra("creator_nick", ContactUtils.i(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, ((MeetingInfo)localObject1).getCreator_uin()));
    }
    GVideoUpdateUtil.a(jdField_a_of_type_AndroidContentContext, paramString, paramInt2, new lnk(this, localIntent));
  }
  
  private void c()
  {
    if (jdField_a_of_type_AndroidViewView == null)
    {
      jdField_a_of_type_AndroidViewView = ((LayoutInflater)jdField_a_of_type_AndroidContentContext.getSystemService("layout_inflater")).inflate(2130903076, null);
      jdField_a_of_type_AndroidViewView.setId(2131296341);
      jdField_a_of_type_AndroidViewView.setPadding(0, (int)(jdField_a_of_type_Float * 2.0F), 0, (int)(jdField_a_of_type_Float * 2.0F));
      jdField_a_of_type_AndroidViewView.setClickable(true);
      jdField_a_of_type_AndroidViewView.setOnClickListener(this);
      jdField_a_of_type_AndroidViewView.setBackgroundResource(2130838222);
    }
  }
  
  public int a()
  {
    return 2;
  }
  
  public View a(Object... paramVarArgs)
  {
    return jdField_a_of_type_AndroidViewView;
  }
  
  String a(Context paramContext, String paramString, TextView paramTextView, float paramFloat)
  {
    TextPaint localTextPaint = paramTextView.getPaint();
    paramTextView = paramString;
    if (paramFloat > 0.0F)
    {
      float f1 = localTextPaint.measureText(paramString);
      paramTextView = paramString;
      if (f1 > paramFloat)
      {
        float f2 = paramFloat - localTextPaint.measureText("...");
        paramFloat = f1;
        paramContext = paramString;
        while ((f2 > 0.0F) && (paramFloat > f2) && (paramContext.length() > 0))
        {
          paramTextView = paramContext.substring(0, paramContext.length() - 1);
          f1 = localTextPaint.measureText(paramTextView);
          paramContext = paramTextView;
          paramFloat = f1;
          if (f1 == 0.0F)
          {
            paramContext = paramTextView;
            paramFloat = f1;
            if (paramTextView.length() > 0)
            {
              paramFloat = 1.0F + f2;
              paramContext = paramTextView;
            }
          }
        }
        paramTextView = paramString;
        if (f2 > 0.0F)
        {
          paramTextView = paramString;
          if (paramContext.length() > 0) {
            paramTextView = paramContext + "...";
          }
        }
      }
    }
    return paramTextView;
  }
  
  public void a()
  {
    a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 4, 0L);
  }
  
  public void a(int paramInt1, String paramString, int paramInt2, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "refreshMultiVideoStatus():  uinType:" + paramInt1 + ", uin:" + paramString + ", type:" + paramInt2 + ",memberUin:" + paramLong);
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 3000) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1)) {}
    for (;;)
    {
      if (a() == jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a()) {
        jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
      }
      return;
      try
      {
        l1 = Long.parseLong(paramString);
        j = UITools.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        l2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(j, l1);
        paramInt1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(l1);
        if ((j == 1) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(j, l1)) && (paramString != null) && (TextUtils.isDigitsOnly(paramString)))
        {
          Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(Long.parseLong(paramString));
          if (localObject1 != null)
          {
            paramInt2 = a(c);
            l2 = jdField_a_of_type_Int;
            paramInt1 = jdField_b_of_type_Int;
            int i;
            if ((paramInt1 == 10) || (paramInt1 == 2))
            {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l1, paramInt1, (int)l2);
              localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l1, paramInt1);
              i = 21;
              if (localObject1 != null)
              {
                if (jdField_a_of_type_Int <= 0) {
                  i = 23;
                }
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l1, paramInt1, i, jdField_a_of_type_Int);
              }
            }
            localMeetingInfo = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(j, paramString);
            if ((localMeetingInfo == null) && (l2 <= 0L)) {
              continue;
            }
            c();
            localTextView = (TextView)jdField_a_of_type_AndroidViewView.findViewById(2131296896);
            ImageView localImageView1 = (ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131296897);
            localImageView2 = (ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131296894);
            localObject7 = null;
            localObject5 = null;
            localObject6 = null;
            localObject1 = null;
            localObject3 = null;
            localObject4 = null;
            str = null;
            if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(j, l1))
            {
              localObject4 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
              localObject1 = Long.toString(paramLong);
              if ((paramLong != 0L) && (!((String)localObject4).equals(Long.valueOf(paramLong))) && (paramInt1 != 2))
              {
                localObject3 = Long.toString(l1);
                i = 2;
                if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {
                  i = 1;
                }
                localObject3 = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject1, (String)localObject3, i, 0);
                if ((paramInt2 == 1) || (paramInt2 == 2))
                {
                  if (jdField_a_of_type_Lnl != null) {
                    break label790;
                  }
                  jdField_a_of_type_Lnl = new lnl(this);
                  if (jdField_a_of_type_MqqOsMqqHandler != null)
                  {
                    jdField_a_of_type_MqqOsMqqHandler.postDelayed(jdField_a_of_type_Lnl, 3000L);
                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(false);
                  }
                }
                if (paramInt2 == 1) {
                  if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
                  {
                    localObject1 = jdField_a_of_type_AndroidContentContext.getString(2131367739);
                    localTextView.setVisibility(8);
                    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 3000) {
                      break label1054;
                    }
                    UITools.a(jdField_a_of_type_AndroidViewView, jdField_a_of_type_AndroidContentContext.getString(2131363285));
                    localImageView1.setVisibility(0);
                    localObject4 = localObject3;
                    localObject3 = localObject1;
                    localObject1 = localObject4;
                    paramInt2 = jdField_a_of_type_AndroidContentContext.getResources().getColor(2131428179);
                    a((String)localObject1, (String)localObject3, paramInt2, String.valueOf(l1), paramInt1);
                    localTextView.setTextColor(paramInt2);
                    if ((paramInt1 != 2) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString))) {
                      break label1865;
                    }
                    localImageView2.setImageResource(2130842476);
                    label723:
                    localImageView1.setImageResource(2130838219);
                    if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) {
                      break label1888;
                    }
                    if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(j, l1)) {
                      break label1882;
                    }
                    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().i() != 2) {
                      break label1876;
                    }
                    bool = true;
                    label775:
                    a(bool);
                    return;
                  }
                }
              }
            }
          }
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        for (;;)
        {
          int j;
          long l2;
          MeetingInfo localMeetingInfo;
          TextView localTextView;
          ImageView localImageView2;
          Object localObject7;
          Object localObject5;
          Object localObject6;
          Object localObject3;
          Object localObject4;
          String str;
          boolean bool;
          long l1 = 0L;
          continue;
          label790:
          jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_a_of_type_Lnl);
          continue;
          if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
          {
            localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367741);
            continue;
            if (paramInt2 == 2)
            {
              if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
              {
                localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367740);
                continue;
              }
              if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
              {
                localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367742);
                continue;
                if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d())
                {
                  localObject4 = jdField_a_of_type_AndroidContentContext.getString(2131367747);
                  jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(false);
                  localObject3 = str;
                  localObject2 = localObject4;
                  if (paramInt1 != 2) {
                    continue;
                  }
                  localTextView.setVisibility(8);
                  localObject3 = str;
                  localObject2 = localObject4;
                  continue;
                }
                if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000) {
                  localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367745);
                }
                for (;;)
                {
                  jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(true);
                  localObject2 = String.format((String)localObject2, new Object[] { Long.valueOf(l2) });
                  localTextView.setVisibility(0);
                  localObject3 = str;
                  break;
                  localObject2 = localObject3;
                  if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {
                    localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367746);
                  }
                }
                label1054:
                if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1) {
                  continue;
                }
                UITools.a(jdField_a_of_type_AndroidViewView, jdField_a_of_type_AndroidContentContext.getString(2131363286), paramInt1);
                continue;
                if (localMeetingInfo != null)
                {
                  localObject3 = jdField_a_of_type_AndroidContentContext.getString(2131367735);
                  paramInt2 = 2;
                  if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {
                    paramInt2 = 1;
                  }
                  localObject2 = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMeetingInfo.getCreator_uin(), localMeetingInfo.getDiscuss_uin(), paramInt2, 0);
                  continue;
                }
                localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(j, l1);
                if (localObject3 == null) {
                  if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
                  {
                    localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367733);
                    label1188:
                    str = String.format((String)localObject2, new Object[] { Long.valueOf(l2) });
                    localObject3 = localObject4;
                    localObject2 = str;
                    if (paramInt1 == 2)
                    {
                      localObject3 = localObject4;
                      localObject2 = str;
                      if (l2 >= 99L)
                      {
                        localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131363826);
                        localObject3 = localObject4;
                      }
                    }
                  }
                }
                for (;;)
                {
                  localTextView.setVisibility(8);
                  if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000)
                  {
                    UITools.a(jdField_a_of_type_AndroidViewView, jdField_a_of_type_AndroidContentContext.getString(2131363473));
                    localObject4 = localObject2;
                    localObject2 = localObject3;
                    localObject3 = localObject4;
                    break;
                    localObject2 = localObject7;
                    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1) {
                      break label1188;
                    }
                    localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367738);
                    break label1188;
                    if (jdField_a_of_type_Boolean)
                    {
                      localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_Long);
                      if (localObject2 == null)
                      {
                        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000) {
                          localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367733);
                        }
                        for (;;)
                        {
                          str = String.format((String)localObject2, new Object[] { Long.valueOf(l2) });
                          localObject3 = localObject4;
                          localObject2 = str;
                          if (paramInt1 != 2) {
                            break;
                          }
                          localObject3 = localObject4;
                          localObject2 = str;
                          if (l2 < 99L) {
                            break;
                          }
                          localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131363826);
                          localObject3 = localObject4;
                          break;
                          localObject2 = localObject5;
                          if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {
                            localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367738);
                          }
                        }
                      }
                      if (l2 == 1L)
                      {
                        localObject4 = jdField_a_of_type_AndroidContentContext.getString(2131367734);
                        localObject3 = localObject2;
                        localObject2 = localObject4;
                        continue;
                      }
                      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000) {
                        localObject3 = jdField_a_of_type_AndroidContentContext.getString(2131367732);
                      }
                      for (;;)
                      {
                        localObject4 = String.format((String)localObject3, new Object[] { Long.valueOf(l2) });
                        if ((paramInt1 != 2) || (l2 < 99L)) {
                          break label1894;
                        }
                        localObject4 = jdField_a_of_type_AndroidContentContext.getString(2131363827);
                        localObject3 = localObject2;
                        localObject2 = localObject4;
                        break;
                        localObject3 = localObject6;
                        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {
                          localObject3 = jdField_a_of_type_AndroidContentContext.getString(2131367737);
                        }
                      }
                    }
                    localObject3 = Long.toString(jdField_a_of_type_Long);
                    localObject4 = Long.toString(l1);
                    paramInt2 = 2;
                    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {
                      paramInt2 = 1;
                    }
                    localObject4 = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject3, (String)localObject4, paramInt2, 0);
                    if (l2 == 1L)
                    {
                      localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367734);
                      localObject3 = localObject4;
                      continue;
                    }
                    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000) {
                      localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367732);
                    }
                    for (;;)
                    {
                      str = String.format((String)localObject2, new Object[] { Long.valueOf(l2) });
                      localObject3 = localObject4;
                      localObject2 = str;
                      if (paramInt1 != 2) {
                        break;
                      }
                      localObject3 = localObject4;
                      localObject2 = str;
                      if (l2 < 99L) {
                        break;
                      }
                      localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131363827);
                      localObject3 = localObject4;
                      break;
                      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {
                        localObject2 = jdField_a_of_type_AndroidContentContext.getString(2131367737);
                      }
                    }
                  }
                  if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) {
                    UITools.a(jdField_a_of_type_AndroidViewView, jdField_a_of_type_AndroidContentContext.getString(2131363474), paramInt1);
                  }
                  localObject4 = localObject2;
                  localObject2 = localObject3;
                  localObject3 = localObject4;
                  break;
                  label1865:
                  localImageView2.setImageResource(2130842489);
                  break label723;
                  label1876:
                  bool = false;
                  break label775;
                  label1882:
                  a(true);
                  return;
                  label1888:
                  a(true);
                  return;
                  label1894:
                  localObject3 = localObject2;
                  localObject2 = localObject4;
                }
              }
            }
          }
          Object localObject2 = null;
        }
      }
    }
  }
  
  public void a(int paramInt, String paramString1, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "refreshVideoStatus(): uinType:" + paramInt + ", peerUin:" + paramString1 + ",extraUin:" + paramString2);
    }
    int i;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(paramString1)) {
      i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramString1);
    }
    for (;;)
    {
      ImageView localImageView;
      TextView localTextView;
      if (((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) && ((i == 1) || (i == 2) || (i == 5)) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == paramInt) && ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(paramString1)) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(paramString2)))) || ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(paramString1)) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString.equals(paramString1)))) {
        if (jdField_a_of_type_AndroidViewView == null)
        {
          jdField_a_of_type_AndroidViewView = ((LayoutInflater)jdField_a_of_type_AndroidContentContext.getSystemService("layout_inflater")).inflate(2130903076, null);
          jdField_a_of_type_AndroidViewView.setId(2131296341);
          jdField_a_of_type_AndroidViewView.setPadding(0, (int)(2.0F * jdField_a_of_type_Float), 0, (int)(2.0F * jdField_a_of_type_Float));
          jdField_a_of_type_AndroidViewView.setBackgroundResource(2130838222);
          jdField_a_of_type_AndroidViewView.setClickable(true);
          localImageView = (ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131296897);
          localTextView = (TextView)jdField_a_of_type_AndroidViewView.findViewById(2131296896);
          label287:
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().e() == null) {}
        }
      }
      try
      {
        Long.parseLong(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().e());
        label345:
        String str;
        label407:
        boolean bool;
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(paramString1))
        {
          UITools.a(jdField_a_of_type_AndroidViewView, jdField_a_of_type_AndroidContentContext.getString(2131363561));
          str = "";
          if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(paramString1)) {
            break label670;
          }
          paramString2 = str;
          if (i == 1) {
            paramString2 = jdField_a_of_type_AndroidContentContext.getResources().getString(2131363561);
          }
          if (i != 2) {
            break label803;
          }
          paramString2 = jdField_a_of_type_AndroidContentContext.getResources().getString(2131363562);
          a(null, paramString2, jdField_a_of_type_AndroidContentContext.getResources().getColor(2131428179), paramString1, 0);
          jdField_a_of_type_AndroidViewView.setOnClickListener(this);
          jdField_a_of_type_AndroidViewView.setBackgroundResource(2130838222);
          localImageView.setImageResource(2130838219);
          localImageView.setVisibility(0);
          if ((!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(paramString1))) {
            break label761;
          }
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().i() != 2) {
            break label755;
          }
          bool = true;
          label501:
          a(bool);
          label507:
          if ((!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d())) {
            break label769;
          }
          localTextView.setVisibility(0);
        }
        label670:
        label755:
        label761:
        label769:
        do
        {
          return;
          if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) {
            break label806;
          }
          i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().g();
          break;
          localImageView = (ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131296897);
          localTextView = (TextView)jdField_a_of_type_AndroidViewView.findViewById(2131296896);
          break label287;
          if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) {
            break label345;
          }
          if (paramInt == 1)
          {
            UITools.a(jdField_a_of_type_AndroidViewView, jdField_a_of_type_AndroidContentContext.getString(2131363273), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a()));
            break label345;
          }
          UITools.a(jdField_a_of_type_AndroidViewView, jdField_a_of_type_AndroidContentContext.getString(2131363273));
          break label345;
          paramString2 = str;
          if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()) {
            break label803;
          }
          if (i == 1)
          {
            paramString2 = jdField_a_of_type_AndroidContentContext.getResources().getString(2131363468);
            break label407;
          }
          if (i == 5)
          {
            paramString2 = jdField_a_of_type_AndroidContentContext.getResources().getString(2131363867);
            break label407;
          }
          paramString2 = str;
          if (i != 2) {
            break label803;
          }
          paramString2 = jdField_a_of_type_AndroidContentContext.getResources().getString(2131363469);
          break label407;
          bool = false;
          break label501;
          a(true);
          break label507;
          localTextView.setVisibility(8);
          return;
        } while (a() != jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a());
        jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
        return;
      }
      catch (Exception paramString2)
      {
        label803:
        for (;;) {}
        label806:
        i = 0;
      }
    }
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if (paramInt != 1000) {}
    for (;;)
    {
      return;
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1))
      {
        ((DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 0, 0L);
        return;
      }
      paramInt = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().g();
      if (paramInt == 3)
      {
        if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
          a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 0, 0L);
        }
      }
      else {
        while ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) && (((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)))
        {
          paramVarArgs = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(paramVarArgs))
          {
            paramInt = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramVarArgs);
            if (paramInt == 1) {
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800478C", "0X800478C", 0, 0, "", "", "", "");
            }
            if (paramInt == 2) {
              ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004788", "0X8004788", 0, 0, "", "", "", "");
            }
          }
          a(0, paramVarArgs, "");
          return;
          if ((paramInt == 1) || (paramInt == 2)) {
            a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().h(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().e(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().f());
          } else if (paramInt == 5) {
            a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().jdField_a_of_type_JavaLangString);
          }
        }
      }
    }
  }
  
  public void a(String paramString1, String paramString2, int paramInt1, String paramString3, int paramInt2)
  {
    LinearLayout localLinearLayout = (LinearLayout)jdField_a_of_type_AndroidViewView.findViewById(2131296895);
    localLinearLayout.removeAllViews();
    if (paramString1 != null)
    {
      localTextView = new TextView(jdField_a_of_type_AndroidContentContext.getApplicationContext());
      localTextView.setId(2131296346);
      float f = jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131493829);
      paramString1 = a(jdField_a_of_type_AndroidContentContext, paramString1, localTextView, f);
      localTextView.setTextSize(14.0F);
      localTextView.setTextColor(paramInt1);
      localTextView.setSingleLine();
      localTextView.setGravity(5);
      localTextView.setMaxWidth(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131493831));
      localTextView.setEllipsize(TextUtils.TruncateAt.END);
      localTextView.setText(paramString1);
      localLinearLayout.addView(localTextView);
    }
    TextView localTextView = new TextView(jdField_a_of_type_AndroidContentContext.getApplicationContext());
    localTextView.setTextSize(14.0F);
    localTextView.setTextColor(paramInt1);
    paramInt1 = paramInt2;
    if (paramInt2 == 0) {}
    try
    {
      paramInt1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(Long.valueOf(paramString3).longValue());
      paramString1 = paramString2;
      if (paramString2 != null)
      {
        paramString1 = (String)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b.get(paramString3);
        if (paramString1 == null) {
          break label392;
        }
        i = Integer.valueOf(paramString1.split(";")[0]).intValue();
        paramInt2 = Integer.valueOf(paramString1.split(";")[1]).intValue();
        if (i != 1) {
          break label351;
        }
        if (paramInt2 >= 99) {
          paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131363825);
        }
      }
      else
      {
        localTextView.setText(paramString1);
        localTextView.setId(2131296467);
        localLinearLayout.addView(localTextView);
        return;
      }
    }
    catch (Exception paramString1)
    {
      for (;;)
      {
        int i;
        paramInt1 = 0;
        continue;
        paramString1 = String.format(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131363824), new Object[] { Integer.valueOf(paramInt2) });
        continue;
        label351:
        paramString1 = paramString2;
        if (paramInt1 == 2)
        {
          paramString1 = paramString2.replace(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367817), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367818));
          continue;
          label392:
          paramInt2 = 0;
          i = 0;
        }
      }
    }
  }
  
  public void a(boolean paramBoolean)
  {
    if ((jdField_a_of_type_AndroidContentContext != null) && ((jdField_a_of_type_AndroidContentContext instanceof FragmentActivity))) {}
    for (boolean bool = ((FragmentActivity)jdField_a_of_type_AndroidContentContext).isResume();; bool = false)
    {
      if ((paramBoolean) && (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager != null)) {
        jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(this, new Object[0]);
      }
      SmallScreenUtils.a(jdField_a_of_type_AndroidViewView, paramBoolean, bool);
      return;
    }
  }
  
  public int[] a()
  {
    return null;
  }
  
  public int b()
  {
    return 60;
  }
  
  public void b()
  {
    a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, 4, 0L);
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    }
    Object localObject;
    label289:
    label373:
    label492:
    label497:
    for (;;)
    {
      return;
      if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a()) && (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d()))
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "startGroupAudio phone is calling!");
        }
        paramView = jdField_a_of_type_AndroidContentContext.getString(2131363429);
        localObject = jdField_a_of_type_AndroidContentContext.getString(2131363425);
        DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230, (String)localObject, paramView, 2131366996, 2131366997, new lnj(this), null).show();
        return;
      }
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 3000) && (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1)) {
        break;
      }
      int j = UITools.a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      long l = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      paramView = new HashMap();
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l);
      int i;
      if (localObject != null)
      {
        i = jdField_b_of_type_Int;
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l, i);
        paramView.put("MultiAVType", String.valueOf(i));
        if (i == 2) {
          paramView.put("Fromwhere", "SmallScreen");
        }
        if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(j, l)) {
          break label373;
        }
        ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, true, null, paramView);
        if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(j, l)) {
          break label492;
        }
      }
      for (paramView = "Cover_back";; paramView = "Clk_discuss_floating")
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 3000) {
          break label497;
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Multi_call", paramView, 0, 0, "", "", "", "");
        return;
        i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(l);
        break;
        a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, i);
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1) {
          break label289;
        }
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(l) == 10)
        {
          ReportController.b(null, "CliOper", "", "", "0X8005933", "0X8005933", 0, 0, "", "", "", "");
          break label289;
        }
        ReportController.b(null, "CliOper", "", "", "0X80046DA", "0X80046DA", 0, 0, "", "", "", "");
        break label289;
      }
    }
    boolean bool = false;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().g() == 5)
    {
      paramView = new Intent(jdField_a_of_type_AndroidContentContext, PSTNC2CActivity.class);
      localObject = new PstnSessionInfo();
      jdField_a_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().jdField_a_of_type_JavaLangString;
      d = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().d;
      jdField_b_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().jdField_b_of_type_JavaLangString;
      c = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().c;
      jdField_a_of_type_Int = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().jdField_a_of_type_Int;
      jdField_b_of_type_Int = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().jdField_b_of_type_Int;
      paramView.putExtra("pstn_session_info", (Parcelable)localObject);
      jdField_a_of_type_AndroidContentContext.startActivity(paramView);
      PstnUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().g() == 1) {
      bool = true;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)) {
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString) == 1)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800478D", "0X800478D", 0, 0, "", "", "", "");
        bool = true;
      }
    }
    for (;;)
    {
      ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, null, bool, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString, false, true, null, "from_internal");
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Two_call", "Two_call_full", 0, 0, "2", "", "", "");
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004789", "0X8004789", 0, 0, "", "", "", "");
      bool = false;
    }
  }
}
