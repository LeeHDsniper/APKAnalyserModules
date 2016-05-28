package android.support.v7.internal.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v7.graphics.drawable.DrawableWrapper;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.widget.AbsListView;
import android.widget.ListAdapter;
import android.widget.ListView;
import java.lang.reflect.Field;

public class ListViewCompat
  extends ListView
{
  private static final int[] STATE_SET_NOTHING = { 0 };
  private Field mIsChildViewEnabled;
  int mSelectionBottomPadding = 0;
  int mSelectionLeftPadding = 0;
  int mSelectionRightPadding = 0;
  int mSelectionTopPadding = 0;
  private GateKeeperDrawable mSelector;
  final Rect mSelectorRect = new Rect();
  
  public ListViewCompat(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    try
    {
      mIsChildViewEnabled = AbsListView.class.getDeclaredField("mIsChildViewEnabled");
      mIsChildViewEnabled.setAccessible(true);
      return;
    }
    catch (NoSuchFieldException paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  protected void dispatchDraw(Canvas paramCanvas)
  {
    drawSelectorCompat(paramCanvas);
    super.dispatchDraw(paramCanvas);
  }
  
  protected void drawSelectorCompat(Canvas paramCanvas)
  {
    if (!mSelectorRect.isEmpty())
    {
      Drawable localDrawable = getSelector();
      if (localDrawable != null)
      {
        localDrawable.setBounds(mSelectorRect);
        localDrawable.draw(paramCanvas);
      }
    }
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    setSelectorEnabled(true);
    updateSelectorStateCompat();
  }
  
  public int measureHeightOfChildrenCompat(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    paramInt2 = getListPaddingTop();
    paramInt3 = getListPaddingBottom();
    getListPaddingLeft();
    getListPaddingRight();
    int i = getDividerHeight();
    Object localObject = getDivider();
    ListAdapter localListAdapter = getAdapter();
    if (localListAdapter == null)
    {
      paramInt2 += paramInt3;
      return paramInt2;
    }
    paramInt3 = paramInt2 + paramInt3;
    label63:
    int m;
    int i1;
    int j;
    if ((i > 0) && (localObject != null))
    {
      paramInt2 = 0;
      localObject = null;
      m = 0;
      i1 = localListAdapter.getCount();
      j = 0;
    }
    for (;;)
    {
      if (j >= i1) {
        return paramInt3;
      }
      int n = localListAdapter.getItemViewType(j);
      int k = m;
      if (n != m)
      {
        localObject = null;
        k = n;
      }
      localObject = localListAdapter.getView(j, (View)localObject, this);
      ViewGroup.LayoutParams localLayoutParams = ((View)localObject).getLayoutParams();
      if ((localLayoutParams != null) && (height > 0)) {}
      for (m = View.MeasureSpec.makeMeasureSpec(height, 1073741824);; m = View.MeasureSpec.makeMeasureSpec(0, 0))
      {
        ((View)localObject).measure(paramInt1, m);
        m = paramInt3;
        if (j > 0) {
          m = paramInt3 + i;
        }
        paramInt3 = m + ((View)localObject).getMeasuredHeight();
        if (paramInt3 < paramInt4) {
          break label243;
        }
        if ((paramInt5 >= 0) && (j > paramInt5) && (paramInt2 > 0) && (paramInt3 != paramInt4)) {
          break;
        }
        return paramInt4;
        i = 0;
        break label63;
      }
      label243:
      m = paramInt2;
      if (paramInt5 >= 0)
      {
        m = paramInt2;
        if (j >= paramInt5) {
          m = paramInt3;
        }
      }
      j += 1;
      paramInt2 = m;
      m = k;
    }
    return paramInt3;
  }
  
  protected void positionSelectorCompat(int paramInt, View paramView)
  {
    Rect localRect = mSelectorRect;
    localRect.set(paramView.getLeft(), paramView.getTop(), paramView.getRight(), paramView.getBottom());
    left -= mSelectionLeftPadding;
    top -= mSelectionTopPadding;
    right += mSelectionRightPadding;
    bottom += mSelectionBottomPadding;
    try
    {
      boolean bool = mIsChildViewEnabled.getBoolean(this);
      if (paramView.isEnabled() != bool)
      {
        paramView = mIsChildViewEnabled;
        if (bool) {
          break label134;
        }
      }
      label134:
      for (bool = true;; bool = false)
      {
        paramView.set(this, Boolean.valueOf(bool));
        if (paramInt != -1) {
          refreshDrawableState();
        }
        return;
      }
      return;
    }
    catch (IllegalAccessException paramView)
    {
      paramView.printStackTrace();
    }
  }
  
  protected void positionSelectorLikeFocusCompat(int paramInt, View paramView)
  {
    boolean bool = true;
    Drawable localDrawable = getSelector();
    int i;
    float f1;
    float f2;
    if ((localDrawable != null) && (paramInt != -1))
    {
      i = 1;
      if (i != 0) {
        localDrawable.setVisible(false, false);
      }
      positionSelectorCompat(paramInt, paramView);
      if (i != 0)
      {
        paramView = mSelectorRect;
        f1 = paramView.exactCenterX();
        f2 = paramView.exactCenterY();
        if (getVisibility() != 0) {
          break label93;
        }
      }
    }
    for (;;)
    {
      localDrawable.setVisible(bool, false);
      DrawableCompat.setHotspot(localDrawable, f1, f2);
      return;
      i = 0;
      break;
      label93:
      bool = false;
    }
  }
  
  protected void positionSelectorLikeTouchCompat(int paramInt, View paramView, float paramFloat1, float paramFloat2)
  {
    positionSelectorLikeFocusCompat(paramInt, paramView);
    paramView = getSelector();
    if ((paramView != null) && (paramInt != -1)) {
      DrawableCompat.setHotspot(paramView, paramFloat1, paramFloat2);
    }
  }
  
  public void setSelector(Drawable paramDrawable)
  {
    if (paramDrawable != null) {}
    for (Object localObject = new GateKeeperDrawable(paramDrawable);; localObject = null)
    {
      mSelector = ((GateKeeperDrawable)localObject);
      super.setSelector(mSelector);
      localObject = new Rect();
      if (paramDrawable != null) {
        paramDrawable.getPadding((Rect)localObject);
      }
      mSelectionLeftPadding = left;
      mSelectionTopPadding = top;
      mSelectionRightPadding = right;
      mSelectionBottomPadding = bottom;
      return;
    }
  }
  
  protected void setSelectorEnabled(boolean paramBoolean)
  {
    if (mSelector != null) {
      mSelector.setEnabled(paramBoolean);
    }
  }
  
  protected boolean shouldShowSelectorCompat()
  {
    return (touchModeDrawsInPressedStateCompat()) && (isPressed());
  }
  
  protected boolean touchModeDrawsInPressedStateCompat()
  {
    return false;
  }
  
  protected void updateSelectorStateCompat()
  {
    Drawable localDrawable = getSelector();
    if ((localDrawable != null) && (shouldShowSelectorCompat())) {
      localDrawable.setState(getDrawableState());
    }
  }
  
  private static class GateKeeperDrawable
    extends DrawableWrapper
  {
    private boolean mEnabled = true;
    
    public GateKeeperDrawable(Drawable paramDrawable)
    {
      super();
    }
    
    public void draw(Canvas paramCanvas)
    {
      if (mEnabled) {
        super.draw(paramCanvas);
      }
    }
    
    void setEnabled(boolean paramBoolean)
    {
      mEnabled = paramBoolean;
    }
    
    public void setHotspot(float paramFloat1, float paramFloat2)
    {
      if (mEnabled) {
        super.setHotspot(paramFloat1, paramFloat2);
      }
    }
    
    public void setHotspotBounds(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      if (mEnabled) {
        super.setHotspotBounds(paramInt1, paramInt2, paramInt3, paramInt4);
      }
    }
    
    public boolean setState(int[] paramArrayOfInt)
    {
      if (mEnabled) {
        return super.setState(paramArrayOfInt);
      }
      return false;
    }
    
    public boolean setVisible(boolean paramBoolean1, boolean paramBoolean2)
    {
      if (mEnabled) {
        return super.setVisible(paramBoolean1, paramBoolean2);
      }
      return false;
    }
  }
}
