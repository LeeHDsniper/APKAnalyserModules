package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class SubscriptGrayTipsItemBuilder
  extends GrayTipsItemBuilder
{
  public SubscriptGrayTipsItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramMessageRecord = super.a(paramMessageRecord, paramViewHolder, paramView, paramLinearLayout, paramOnLongClickAndTouchListener);
    if (a != null) {
      a.setVisibility(8);
    }
    paramMessageRecord.findViewById(2131297569).setBackgroundColor(0);
    paramMessageRecord.setBackgroundColor(Color.parseColor("#1A000000"));
    paramViewHolder = new LinearLayout.LayoutParams(-1, -2);
    gravity = 1;
    topMargin = AIOUtils.a(7.5F, paramLinearLayout.getResources());
    bottomMargin = AIOUtils.a(7.5F, paramLinearLayout.getResources());
    paramMessageRecord.setLayoutParams(paramViewHolder);
    return paramMessageRecord;
  }
}
