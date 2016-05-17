package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class RecentCallContactItemBuilder
  extends RecentItemBaseBuilder
{
  public RecentCallContactItemBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    paramObject = paramView;
    if (paramView == null) {
      paramObject = LayoutInflater.from(paramContext).inflate(2130904050, null);
    }
    paramRecentFaceDecoder = paramObject.findViewById(2131301077);
    paramRecentFaceDecoder.setContentDescription("通讯录 按钮");
    paramRecentFaceDecoder.setOnClickListener(paramOnClickListener);
    paramRecentFaceDecoder.setOnLongClickListener(paramOnLongClickListener);
    paramRecentFaceDecoder.setTag(-1, Integer.valueOf(paramInt));
    return paramObject;
  }
}
