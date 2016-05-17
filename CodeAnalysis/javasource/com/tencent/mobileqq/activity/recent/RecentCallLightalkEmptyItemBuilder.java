package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.qcall.PstnCardInfo;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.widget.ListView;

public class RecentCallLightalkEmptyItemBuilder
  extends RecentItemBaseBuilder
{
  public RecentCallLightalkEmptyItemBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    paramObject = paramView;
    if (paramView == null) {
      paramObject = LayoutInflater.from(paramContext).inflate(2130904059, null);
    }
    paramRecentFaceDecoder = (ViewGroup)paramObject.findViewById(2131301110);
    paramView = (ViewGroup)paramObject.findViewById(2131301112);
    paramContext = (TextView)paramObject.findViewById(2131301109);
    paramContext.setContentDescription("拨打QQ电话");
    paramOnLongClickListener = (TextView)paramObject.findViewById(2131301111);
    paramOnLongClickListener.setContentDescription("拨打来电专线");
    paramOnDragModeChangedListener = (TextView)paramObject.findViewById(2131301113);
    paramOnDragModeChangedListener.setContentDescription("了解来电专线");
    Object localObject = (QQAppInterface)BaseApplicationImpl.a().a();
    localObject = ((PstnManager)((QQAppInterface)localObject).getManager(142)).a(((QQAppInterface)localObject).a());
    if (localObject != null) {
      if ((pstn_ever_c2c_vip == 1) || (pstn_ever_multi_vip == 1))
      {
        paramRecentFaceDecoder.setVisibility(0);
        paramView.setVisibility(8);
      }
    }
    int i;
    for (;;)
    {
      paramContext.setOnClickListener(paramOnClickListener);
      paramOnLongClickListener.setOnClickListener(paramOnClickListener);
      paramOnDragModeChangedListener.setOnClickListener(paramOnClickListener);
      paramContext.setTag(-1, Integer.valueOf(paramInt));
      paramOnLongClickListener.setTag(-1, Integer.valueOf(paramInt));
      paramOnDragModeChangedListener.setTag(-1, Integer.valueOf(paramInt));
      if (!(paramViewGroup instanceof ListView)) {
        break label305;
      }
      paramRecentFaceDecoder = (ListView)paramViewGroup;
      int j = paramRecentFaceDecoder.getChildCount();
      i = 0;
      paramInt = 0;
      while (paramInt < j)
      {
        i += paramRecentFaceDecoder.getChildAt(paramInt).getHeight();
        paramInt += 1;
      }
      paramRecentFaceDecoder.setVisibility(8);
      paramView.setVisibility(0);
      continue;
      paramRecentFaceDecoder.setVisibility(8);
      paramView.setVisibility(0);
    }
    paramObject.setMinimumHeight(paramRecentFaceDecoder.getHeight() - i);
    label305:
    if (AppSetting.i)
    {
      paramObject.setFocusable(true);
      paramObject.setFocusableInTouchMode(true);
    }
    return paramObject;
  }
}
