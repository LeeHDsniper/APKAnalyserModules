package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class TroopAssistantEducationBuilder
  extends RecentItemBaseBuilder
{
  public TroopAssistantEducationBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    paramObject = paramView;
    if (paramView == null) {
      paramObject = View.inflate(paramContext, 2130904859, null);
    }
    paramRecentFaceDecoder = paramObject.findViewById(2131304221);
    paramRecentFaceDecoder.setTag(-1, Integer.valueOf(paramInt));
    paramRecentFaceDecoder.setOnClickListener(paramOnClickListener);
    paramRecentFaceDecoder = paramObject.findViewById(2131304222);
    paramRecentFaceDecoder.setTag(-1, Integer.valueOf(paramInt));
    paramRecentFaceDecoder.setOnClickListener(paramOnClickListener);
    paramObject.setTag(-1, Integer.valueOf(paramInt));
    return paramObject;
  }
}
