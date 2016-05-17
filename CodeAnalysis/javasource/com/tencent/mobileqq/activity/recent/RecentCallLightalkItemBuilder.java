package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.jumplightalk.CallTabLightalkConfig;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.qphone.base.util.BaseApplication;

public class RecentCallLightalkItemBuilder
  extends RecentItemBaseBuilder
{
  public RecentCallLightalkItemBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    paramObject = paramView;
    if (paramView == null) {
      paramObject = LayoutInflater.from(paramContext).inflate(2130904030, null);
    }
    paramRecentFaceDecoder = paramObject.findViewById(2131301022);
    paramView = (ImageView)paramObject.findViewById(2131301019);
    paramViewGroup = (TextView)paramObject.findViewById(2131301023);
    paramContext = paramObject.findViewById(2131301024);
    paramOnLongClickListener = ((QQAppInterface)BaseApplicationImpl.a().a()).a();
    paramOnDragModeChangedListener = CallTabLightalkConfig.a(paramOnLongClickListener);
    if (paramOnDragModeChangedListener != null)
    {
      if (!StringUtil.b(g))
      {
        Drawable localDrawable = BaseApplicationImpl.getContext().getResources().getDrawable(2130840311);
        paramView.setImageDrawable(URLDrawable.getDrawable(g, 0, 0, localDrawable, localDrawable, false));
      }
      paramViewGroup.setText(f);
      paramRecentFaceDecoder.setContentDescription(f);
      paramRecentFaceDecoder.setOnClickListener(paramOnClickListener);
      paramRecentFaceDecoder.setTag(-1, Integer.valueOf(paramInt));
      paramRecentFaceDecoder.setVisibility(0);
      if (BaseApplicationImpl.getContext().getSharedPreferences("call_tab_lightalk_entrance" + paramOnLongClickListener, 0).getBoolean("show_reddot", true)) {
        paramContext.setVisibility(0);
      }
      for (;;)
      {
        ReportController.b(null, "CliOper", "", "", "0X8005C8A", "0X8005C8A", 0, 0, "", "", "", "");
        return paramObject;
        paramContext.setVisibility(8);
      }
    }
    paramRecentFaceDecoder.setVisibility(8);
    return paramObject;
  }
}
