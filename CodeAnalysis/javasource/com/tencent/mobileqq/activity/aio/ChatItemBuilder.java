package com.tencent.mobileqq.activity.aio;

import android.view.View;
import android.view.ViewGroup;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract interface ChatItemBuilder
  extends ContextMenuBuilder
{
  public static final String a = ChatItemBuilder.class.getSimpleName();
  public static final boolean b;
  public static final boolean c = true;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = AppSetting.i;
  }
  
  public abstract View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener);
}
