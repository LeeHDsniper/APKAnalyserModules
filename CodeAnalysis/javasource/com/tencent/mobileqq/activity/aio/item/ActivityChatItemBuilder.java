package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewTreeObserver;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForActivity;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.browser.TroopQQBrowserHelper;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import kut;
import kuu;

public class ActivityChatItemBuilder
  extends AbstractChatItemBuilder
  implements View.OnClickListener
{
  protected String b;
  
  public ActivityChatItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramLinearLayout = (kuu)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903618, null);
      b = ((TextView)paramViewHolder.findViewById(2131299371));
      c = ((TextView)paramViewHolder.findViewById(2131299376));
      d = ((TextView)paramViewHolder.findViewById(2131299377));
      a = ((ImageView)paramViewHolder.findViewById(2131299374));
      paramViewHolder.setOnClickListener(this);
      b.setOnClickListener(this);
      c.setOnClickListener(this);
      d.setOnClickListener(this);
      a.setOnClickListener(this);
    }
    if ((paramMessageRecord instanceof MessageForActivity))
    {
      paramView = (MessageForActivity)paramMessageRecord;
      b.setText("群活动");
      c.setText(title);
      a(summary, d);
    }
    try
    {
      paramMessageRecord = URLDrawable.getDrawable(bigPic, paramViewHolder.getResources().getDrawable(2130839185), paramViewHolder.getResources().getDrawable(2130839184));
      a.setBackgroundDrawable(paramMessageRecord);
      b = url;
      if (TextUtils.isEmpty(title))
      {
        paramMessageRecord = "";
        paramLinearLayout = new StringBuilder().append(paramMessageRecord);
        if (!TextUtils.isEmpty(summary)) {
          break label289;
        }
        paramMessageRecord = "";
        paramViewHolder.setContentDescription(paramMessageRecord);
        return paramViewHolder;
      }
    }
    catch (Exception paramMessageRecord)
    {
      for (;;)
      {
        a.setBackgroundResource(2130839184);
        continue;
        paramMessageRecord = title;
        continue;
        label289:
        paramMessageRecord = summary;
      }
    }
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new kuu(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage) {}
  
  protected void a(String paramString, TextView paramTextView)
  {
    paramTextView.getViewTreeObserver().addOnPreDrawListener(new kut(this, paramTextView, paramString));
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    return null;
  }
  
  public void onClick(View paramView)
  {
    TroopQQBrowserHelper.a(jdField_a_of_type_AndroidContentContext, b, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
  }
}
