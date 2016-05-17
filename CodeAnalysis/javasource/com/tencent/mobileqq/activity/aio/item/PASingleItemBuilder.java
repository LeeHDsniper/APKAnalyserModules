package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.biz.common.util.Util;
import com.tencent.biz.pubaccount.PublicAccountBrowser;
import com.tencent.biz.pubaccount.util.PAMessageUtil;
import com.tencent.biz.pubaccount.util.PubAccountHttpDownloader;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.gamecenter.AppLaucherHelper;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.open.adapter.OpenAppClient;
import com.tencent.open.business.base.AppUtil;
import java.util.ArrayList;
import java.util.List;
import kyv;
import kyw;

public class PASingleItemBuilder
  extends AbstractChatItemBuilder
{
  View.OnClickListener a;
  
  public PASingleItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewView$OnClickListener = new kyv(this);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, long paramLong)
  {
    if (PAMessageUtil.a(paramString1, paramContext)) {
      return;
    }
    if ((paramString2 != null) && (paramString2.equals("open_local")))
    {
      paramString1 = new Bundle();
      paramString1.putString("schemaurl", paramString3);
      paramString1.putString("uin", paramQQAppInterface.a());
      paramString1.putString("vkey", paramQQAppInterface.d());
      OpenAppClient.b((Activity)paramContext, paramString1);
      return;
    }
    paramString1 = new Intent(paramContext, PublicAccountBrowser.class);
    paramString1.putExtra("uin", paramQQAppInterface.a());
    paramString1.putExtra("url", paramString3);
    paramString1.putExtra("assignBackText", paramContext.getResources().getString(2131367694));
    paramString1.putExtra("puin", paramString4);
    if (paramLong >= 0L) {
      paramString1.putExtra("msg_id", String.valueOf(paramLong));
    }
    paramString1.putExtra("source_name", paramString5);
    paramString1.putExtra("fromAio", true);
    paramString1.putExtra("uin_type", 1008);
    PublicAccountUtil.a(paramString1, paramString3);
    paramContext.startActivity(paramString1);
    ReportController.b(null, "P_CliOper", "Pb_account_lifeservice", paramString4, "aio_msg_url", "aio_url_clickqq", 0, 1, 0, paramString3, "", "", "");
  }
  
  public static boolean a(QQAppInterface paramQQAppInterface, Context paramContext, String paramString1, long paramLong, String paramString2)
  {
    int i = 0;
    paramString2 = Uri.parse(paramString2);
    paramString1 = paramString2.getScheme();
    paramString2 = paramString2.getHost();
    if ((!TextUtils.isEmpty(paramString1)) && (AppUtil.a(paramString1)))
    {
      AppLaucherHelper localAppLaucherHelper = new AppLaucherHelper();
      if (AppLaucherHelper.a(paramString2) == 0) {}
      Bundle localBundle;
      int j;
      for (;;)
      {
        localBundle = AppLaucherHelper.a(paramString2);
        j = localBundle.getInt("a_launch_mode", 268435456);
        if (i == 0) {
          break;
        }
        localAppLaucherHelper.a(paramQQAppInterface, paramContext, String.valueOf(paramLong), paramString2, paramString1, j);
        return true;
        i = 1;
      }
      return AppUtil.a(paramContext, paramString1, localBundle, j);
    }
    return false;
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramLinearLayout.setPadding(0, AIOUtils.a(11.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, 0);
    paramLinearLayout = paramView;
    if (paramView == null) {
      paramLinearLayout = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903168, null);
    }
    Object localObject3 = (MessageForPubAccount)paramMessageRecord;
    paramMessageRecord = (kyw)paramViewHolder;
    paramViewHolder = paramLinearLayout.findViewById(2131297406);
    Object localObject5 = (TextView)paramLinearLayout.findViewById(2131297405);
    Object localObject2 = (TextView)paramLinearLayout.findViewById(2131297407);
    TextView localTextView1 = (TextView)paramLinearLayout.findViewById(2131297408);
    Object localObject1 = (ImageView)paramLinearLayout.findViewById(2131297409);
    Object localObject6 = (TextView)paramLinearLayout.findViewById(2131297410);
    Object localObject7 = (TextView)paramLinearLayout.findViewById(2131297411);
    TextView localTextView2 = (TextView)paramLinearLayout.findViewById(2131297412);
    TextView localTextView3 = (TextView)paramLinearLayout.findViewById(2131297413);
    TextView localTextView4 = (TextView)paramLinearLayout.findViewById(2131297414);
    Object localObject4 = (TextView)paramLinearLayout.findViewById(2131297416);
    paramView = new ArrayList();
    paramView.add(localObject6);
    paramView.add(localObject7);
    paramView.add(localTextView2);
    paramView.add(localTextView3);
    paramView.add(localTextView4);
    localObject6 = mPAMessage;
    label388:
    int i;
    long l;
    if (grayTips != null)
    {
      ((TextView)localObject5).setText(grayTips);
      ((TextView)localObject5).setVisibility(0);
      localObject5 = (PAMessage.Item)items.get(0);
      jdField_c_of_type_JavaLangString = url;
      jdField_b_of_type_JavaLangString = actionUrl;
      jdField_a_of_type_JavaLangString = nativeJumpString;
      jdField_c_of_type_Int = type;
      jdField_b_of_type_Int = 5;
      jdField_a_of_type_JavaLangObject = Long.valueOf(uniseq);
      d = moreText;
      jdField_a_of_type_Long = appId;
      e = actionData;
      f = a_actionData;
      g = i_actionData;
      if (TextUtils.isEmpty(moreText)) {
        break label755;
      }
      ((TextView)localObject4).setText(moreText);
      localObject3 = Util.d(title);
      ((TextView)localObject2).setText((CharSequence)localObject3);
      if (mVideoFlag == 1)
      {
        localObject4 = jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130839278);
        i = DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 5.0F);
        ((Drawable)localObject4).setBounds(i, 0, DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 17.0F) + i, DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 20.0F));
        localObject7 = new SpannableString((String)localObject3 + "1");
        ((SpannableString)localObject7).setSpan(new ImageSpan((Drawable)localObject4, 0), ((String)localObject3).length(), ((String)localObject3).length() + 1, 17);
        ((TextView)localObject2).setText((CharSequence)localObject7);
      }
      if (time == 0L) {
        break label766;
      }
      l = time;
      label555:
      if (l == 0L) {
        break label776;
      }
      localTextView1.setText(TimeFormatterUtils.a(jdField_a_of_type_AndroidContentContext, l * 1000L));
      localTextView1.setVisibility(0);
    }
    for (;;)
    {
      try
      {
        localObject2 = URLDrawable.getDrawable(PubAccountHttpDownloader.a(cover, 0), jdField_a_of_type_AndroidContentContext.getResources().getDisplayMetrics().widthPixels - AIOUtils.a(50.0F, jdField_a_of_type_AndroidContentContext.getResources()), AIOUtils.a(150.0F, jdField_a_of_type_AndroidContentContext.getResources()));
        ((URLDrawable)localObject2).addHeader("my_uin", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        ((ImageView)localObject1).setImageDrawable((Drawable)localObject2);
        localObject1 = digestList;
        if (localObject1 != null)
        {
          i = ((List)localObject1).size();
          int j = 0;
          if (j < paramView.size())
          {
            localObject2 = (TextView)paramView.get(j);
            if (i > j)
            {
              ((TextView)localObject2).setText((CharSequence)((List)localObject1).get(j));
              ((TextView)localObject2).setVisibility(0);
              j += 1;
              continue;
              ((TextView)localObject5).setVisibility(8);
              break;
              label755:
              ((TextView)localObject4).setText(2131369976);
              break label388;
              label766:
              l = sendTime;
              break label555;
              label776:
              localTextView1.setVisibility(8);
              continue;
            }
          }
        }
      }
      catch (Exception localException)
      {
        ((ImageView)localObject1).setImageResource(2130837565);
        continue;
        localException.setVisibility(8);
        continue;
        paramViewHolder.setTag(paramMessageRecord);
        paramViewHolder.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
        paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
        return paramLinearLayout;
      }
      i = 0;
    }
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new kyw(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    boolean bool = true;
    switch (paramInt)
    {
    default: 
      return;
    }
    paramContext = ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    if ((paramContext != null) && (uniseq == uniseq)) {
      ChatActivityFacade.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    }
    paramContext = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    Context localContext = jdField_a_of_type_AndroidContentContext;
    String str = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    paramInt = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int;
    long l = uniseq;
    if (issend == 1) {}
    for (;;)
    {
      PublicAccountUtil.a(paramContext, localContext, str, paramInt, l, bool);
      return;
      bool = false;
    }
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    paramView.a(2131304463, jdField_a_of_type_AndroidContentContext.getString(2131367614));
    return paramView.a();
  }
}
