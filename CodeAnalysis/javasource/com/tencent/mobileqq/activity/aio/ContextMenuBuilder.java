package com.tencent.mobileqq.activity.aio;

import android.content.Context;
import android.view.View;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;

public abstract interface ContextMenuBuilder
{
  public abstract void a(int paramInt, Context paramContext, ChatMessage paramChatMessage);
  
  public abstract QQCustomMenuItem[] a(View paramView);
}
