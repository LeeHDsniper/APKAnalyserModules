package android.support.v4.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;

public abstract interface LayoutInflaterFactory
{
  public abstract View onCreateView(View paramView, String paramString, Context paramContext, AttributeSet paramAttributeSet);
}
