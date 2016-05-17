package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.webkit.URLUtil;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForVideoVip;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import lcq;
import lcr;

public class VideoVipItemBuilder
  extends AbstractChatItemBuilder
{
  public VideoVipItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private View a(View paramView, lcr paramLcr)
  {
    View localView = paramView;
    if (paramView == null)
    {
      localView = LayoutInflater.from(a).inflate(2130903174, null);
      b = ((TextView)localView.findViewById(2131297471));
    }
    return localView;
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramLinearLayout = (MessageForVideoVip)paramMessageRecord;
    paramViewHolder = (lcr)paramViewHolder;
    paramView = a(paramView, paramViewHolder);
    b.setText(wording);
    paramView.setOnClickListener(new lcq(this, paramLinearLayout, paramMessageRecord));
    return paramView;
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new lcr(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage) {}
  
  public boolean a(String paramString)
  {
    Intent localIntent = new Intent(a, QQBrowserActivity.class);
    localIntent.putExtra("url", URLUtil.guessUrl(paramString));
    localIntent.putExtra("fromAio", true);
    a.startActivity(localIntent);
    return true;
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    return null;
  }
}
