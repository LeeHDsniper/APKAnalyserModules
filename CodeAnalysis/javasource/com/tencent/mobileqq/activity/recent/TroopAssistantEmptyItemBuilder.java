package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView.LayoutParams;

public class TroopAssistantEmptyItemBuilder
  extends RecentItemBaseBuilder
{
  private static final String jdField_b_of_type_JavaLangString = "TroopAssistantEmptyItemBuilder";
  private int a;
  private int jdField_b_of_type_Int;
  private int q;
  private int r;
  
  public TroopAssistantEmptyItemBuilder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 0;
    b = 0;
    q = 0;
    r = 0;
  }
  
  public View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    int i;
    if (paramView == null)
    {
      paramRecentFaceDecoder = null;
      if (!"TroopAssistantEmptyItemBuilder".equals(paramRecentFaceDecoder))
      {
        paramView = View.inflate(paramContext, 2130904857, null);
        paramView.setTag("TroopAssistantEmptyItemBuilder");
        paramRecentFaceDecoder = paramContext.getResources();
        b = paramRecentFaceDecoder.getDimensionPixelSize(2131493027);
        a = paramRecentFaceDecoder.getDimensionPixelSize(2131493028);
        q = paramRecentFaceDecoder.getDimensionPixelSize(2131493029);
        i = paramRecentFaceDecoder.getDimensionPixelSize(2131493157);
        r = (paramRecentFaceDecoder.getDimensionPixelSize(2131493158) + i);
      }
      i = paramViewGroup.getMeasuredHeight() - a - b - 10 - r;
      if (i <= q) {
        break label210;
      }
      label124:
      paramRecentFaceDecoder = new AbsListView.LayoutParams(-1, -1);
      width = -1;
      height = i;
      paramView.setLayoutParams(paramRecentFaceDecoder);
      if ((paramObject instanceof Integer))
      {
        paramObject = (Integer)paramObject;
        paramRecentFaceDecoder = (TextView)paramView.findViewById(2131304215);
        if (paramObject.intValue() != 4) {
          break label219;
        }
        paramRecentFaceDecoder.setText(2131369611);
      }
    }
    for (;;)
    {
      paramView.setTag(-1, Integer.valueOf(paramInt));
      return paramView;
      paramRecentFaceDecoder = paramView.getTag();
      break;
      label210:
      i = q;
      break label124;
      label219:
      paramRecentFaceDecoder.setText(2131369983);
    }
  }
}
