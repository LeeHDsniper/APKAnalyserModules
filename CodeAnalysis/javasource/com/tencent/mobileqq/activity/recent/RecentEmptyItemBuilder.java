package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.dating.MsgBoxListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView.LayoutParams;

public class RecentEmptyItemBuilder
  extends RecentItemBaseBuilder
{
  private int a;
  private int b;
  private int q;
  
  public RecentEmptyItemBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 0;
    b = 0;
    q = 0;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    paramRecentFaceDecoder = paramView;
    if (paramView == null)
    {
      paramRecentFaceDecoder = View.inflate(paramContext, 2130903218, null);
      b = paramContext.getResources().getDimensionPixelSize(2131493027);
      a = paramContext.getResources().getDimensionPixelSize(2131493023);
      q = paramContext.getResources().getDimensionPixelSize(2131493029);
    }
    int i = paramViewGroup.getHeight() - a * 2 - b;
    if (i > q)
    {
      paramView = new AbsListView.LayoutParams(-1, -1);
      width = -1;
      height = i;
      paramRecentFaceDecoder.setLayoutParams(paramView);
      paramRecentFaceDecoder.setTag(Boolean.valueOf(true));
      paramView = (TextView)paramRecentFaceDecoder.findViewById(2131297712);
      paramViewGroup = (Button)paramRecentFaceDecoder.findViewById(2131297713);
      if (!(paramObject instanceof Integer)) {
        break label504;
      }
      i = ((Integer)paramObject).intValue();
      if (i != 1) {
        break label240;
      }
      paramView.setCompoundDrawablesWithIntrinsicBounds(0, 2130838552, 0, 0);
      paramView.setVisibility(0);
      paramView.setText(2131369983);
      paramView.setTextColor(paramContext.getResources().getColorStateList(2131428216));
      paramViewGroup.setVisibility(8);
      paramViewGroup.setOnClickListener(null);
    }
    for (;;)
    {
      paramRecentFaceDecoder.setTag(-1, Integer.valueOf(paramInt));
      return paramRecentFaceDecoder;
      i = q;
      break;
      label240:
      if (i == 0)
      {
        if ((paramContext instanceof MsgBoxListActivity))
        {
          if (d)
          {
            paramView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
            paramView.setVisibility(0);
            paramView.setText("");
          }
        }
        else
        {
          paramView.setCompoundDrawablesWithIntrinsicBounds(0, 2130838552, 0, 0);
          paramView.setVisibility(0);
          paramView.setText(2131368583);
          paramView.setTextColor(paramContext.getResources().getColorStateList(2131428216));
          paramViewGroup.setVisibility(8);
          paramViewGroup.setOnClickListener(null);
        }
      }
      else if (i == 7)
      {
        paramView.setCompoundDrawablesWithIntrinsicBounds(0, 2130840310, 0, 0);
        paramView.setVisibility(0);
        paramView.setText(2131369983);
        paramView.setTextColor(paramContext.getResources().getColorStateList(2131428216));
        paramViewGroup.setVisibility(8);
        paramViewGroup.setOnClickListener(null);
      }
      else if (i == 6)
      {
        paramView.setCompoundDrawablesWithIntrinsicBounds(0, 2130840310, 0, 0);
        paramView.setVisibility(0);
        paramView.setText(2131368585);
        paramView.setTextColor(paramContext.getResources().getColorStateList(2131428173));
        paramViewGroup.setVisibility(0);
        paramViewGroup.setTag(-1, Integer.valueOf(paramInt));
        paramViewGroup.setOnClickListener(paramOnClickListener);
        if (AppSetting.i) {
          paramViewGroup.setContentDescription("点击进行选人，可以直接发起QQ电话");
        }
      }
      else
      {
        paramView.setVisibility(4);
        paramView.setText("");
        continue;
        label504:
        paramView.setVisibility(8);
        paramView.setText("");
        paramViewGroup.setVisibility(8);
      }
    }
  }
}
