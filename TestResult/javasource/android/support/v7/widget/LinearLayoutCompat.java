package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.widget.TintTypedArray;
import android.support.v7.internal.widget.ViewUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

public class LinearLayoutCompat
  extends ViewGroup
{
  private boolean mBaselineAligned = true;
  private int mBaselineAlignedChildIndex = -1;
  private int mBaselineChildTop = 0;
  private Drawable mDivider;
  private int mDividerHeight;
  private int mDividerPadding;
  private int mDividerWidth;
  private int mGravity = 8388659;
  private int[] mMaxAscent;
  private int[] mMaxDescent;
  private int mOrientation;
  private int mShowDividers;
  private int mTotalLength;
  private boolean mUseLargestChild;
  private float mWeightSum;
  
  public LinearLayoutCompat(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public LinearLayoutCompat(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public LinearLayoutCompat(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    paramContext = TintTypedArray.obtainStyledAttributes(paramContext, paramAttributeSet, R.styleable.LinearLayoutCompat, paramInt, 0);
    paramInt = paramContext.getInt(R.styleable.LinearLayoutCompat_android_orientation, -1);
    if (paramInt >= 0) {
      setOrientation(paramInt);
    }
    paramInt = paramContext.getInt(R.styleable.LinearLayoutCompat_android_gravity, -1);
    if (paramInt >= 0) {
      setGravity(paramInt);
    }
    boolean bool = paramContext.getBoolean(R.styleable.LinearLayoutCompat_android_baselineAligned, true);
    if (!bool) {
      setBaselineAligned(bool);
    }
    mWeightSum = paramContext.getFloat(R.styleable.LinearLayoutCompat_android_weightSum, -1.0F);
    mBaselineAlignedChildIndex = paramContext.getInt(R.styleable.LinearLayoutCompat_android_baselineAlignedChildIndex, -1);
    mUseLargestChild = paramContext.getBoolean(R.styleable.LinearLayoutCompat_measureWithLargestChild, false);
    setDividerDrawable(paramContext.getDrawable(R.styleable.LinearLayoutCompat_divider));
    mShowDividers = paramContext.getInt(R.styleable.LinearLayoutCompat_showDividers, 0);
    mDividerPadding = paramContext.getDimensionPixelSize(R.styleable.LinearLayoutCompat_dividerPadding, 0);
    paramContext.recycle();
  }
  
  private void forceUniformHeight(int paramInt1, int paramInt2)
  {
    int j = View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 1073741824);
    int i = 0;
    while (i < paramInt1)
    {
      View localView = getVirtualChildAt(i);
      if (localView.getVisibility() != 8)
      {
        LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
        if (height == -1)
        {
          int k = width;
          width = localView.getMeasuredWidth();
          measureChildWithMargins(localView, paramInt2, 0, j, 0);
          width = k;
        }
      }
      i += 1;
    }
  }
  
  private void forceUniformWidth(int paramInt1, int paramInt2)
  {
    int j = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
    int i = 0;
    while (i < paramInt1)
    {
      View localView = getVirtualChildAt(i);
      if (localView.getVisibility() != 8)
      {
        LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
        if (width == -1)
        {
          int k = height;
          height = localView.getMeasuredHeight();
          measureChildWithMargins(localView, j, 0, paramInt2, 0);
          height = k;
        }
      }
      i += 1;
    }
  }
  
  private void setChildFrame(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramView.layout(paramInt1, paramInt2, paramInt1 + paramInt3, paramInt2 + paramInt4);
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return paramLayoutParams instanceof LayoutParams;
  }
  
  void drawDividersHorizontal(Canvas paramCanvas)
  {
    int k = getVirtualChildCount();
    boolean bool = ViewUtils.isLayoutRtl(this);
    int i = 0;
    View localView;
    LayoutParams localLayoutParams;
    if (i < k)
    {
      localView = getVirtualChildAt(i);
      if ((localView != null) && (localView.getVisibility() != 8) && (hasDividerBeforeChildAt(i)))
      {
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        if (!bool) {
          break label90;
        }
      }
      label90:
      for (int j = localView.getRight() + rightMargin;; j = localView.getLeft() - leftMargin - mDividerWidth)
      {
        drawVerticalDivider(paramCanvas, j);
        i += 1;
        break;
      }
    }
    if (hasDividerBeforeChildAt(k))
    {
      localView = getVirtualChildAt(k - 1);
      if (localView != null) {
        break label169;
      }
      if (!bool) {
        break label151;
      }
      i = getPaddingLeft();
    }
    for (;;)
    {
      drawVerticalDivider(paramCanvas, i);
      return;
      label151:
      i = getWidth() - getPaddingRight() - mDividerWidth;
      continue;
      label169:
      localLayoutParams = (LayoutParams)localView.getLayoutParams();
      if (bool) {
        i = localView.getLeft() - leftMargin - mDividerWidth;
      } else {
        i = localView.getRight() + rightMargin;
      }
    }
  }
  
  void drawDividersVertical(Canvas paramCanvas)
  {
    int j = getVirtualChildCount();
    int i = 0;
    View localView;
    LayoutParams localLayoutParams;
    while (i < j)
    {
      localView = getVirtualChildAt(i);
      if ((localView != null) && (localView.getVisibility() != 8) && (hasDividerBeforeChildAt(i)))
      {
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        drawHorizontalDivider(paramCanvas, localView.getTop() - topMargin - mDividerHeight);
      }
      i += 1;
    }
    if (hasDividerBeforeChildAt(j))
    {
      localView = getVirtualChildAt(j - 1);
      if (localView != null) {
        break label124;
      }
    }
    for (i = getHeight() - getPaddingBottom() - mDividerHeight;; i = localView.getBottom() + bottomMargin)
    {
      drawHorizontalDivider(paramCanvas, i);
      return;
      label124:
      localLayoutParams = (LayoutParams)localView.getLayoutParams();
    }
  }
  
  void drawHorizontalDivider(Canvas paramCanvas, int paramInt)
  {
    mDivider.setBounds(getPaddingLeft() + mDividerPadding, paramInt, getWidth() - getPaddingRight() - mDividerPadding, mDividerHeight + paramInt);
    mDivider.draw(paramCanvas);
  }
  
  void drawVerticalDivider(Canvas paramCanvas, int paramInt)
  {
    mDivider.setBounds(paramInt, getPaddingTop() + mDividerPadding, mDividerWidth + paramInt, getHeight() - getPaddingBottom() - mDividerPadding);
    mDivider.draw(paramCanvas);
  }
  
  protected LayoutParams generateDefaultLayoutParams()
  {
    if (mOrientation == 0) {
      return new LayoutParams(-2, -2);
    }
    if (mOrientation == 1) {
      return new LayoutParams(-1, -2);
    }
    return null;
  }
  
  public LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return new LayoutParams(paramLayoutParams);
  }
  
  public int getBaseline()
  {
    int i = -1;
    if (mBaselineAlignedChildIndex < 0) {
      i = super.getBaseline();
    }
    View localView;
    int k;
    do
    {
      return i;
      if (getChildCount() <= mBaselineAlignedChildIndex) {
        throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout set to an index that is out of bounds.");
      }
      localView = getChildAt(mBaselineAlignedChildIndex);
      k = localView.getBaseline();
      if (k != -1) {
        break;
      }
    } while (mBaselineAlignedChildIndex == 0);
    throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout points to a View that doesn't know how to get its baseline.");
    int j = mBaselineChildTop;
    i = j;
    if (mOrientation == 1)
    {
      int m = mGravity & 0x70;
      i = j;
      if (m != 48) {
        switch (m)
        {
        default: 
          i = j;
        }
      }
    }
    for (;;)
    {
      return getLayoutParamstopMargin + i + k;
      i = getBottom() - getTop() - getPaddingBottom() - mTotalLength;
      continue;
      i = j + (getBottom() - getTop() - getPaddingTop() - getPaddingBottom() - mTotalLength) / 2;
    }
  }
  
  public int getBaselineAlignedChildIndex()
  {
    return mBaselineAlignedChildIndex;
  }
  
  int getChildrenSkipCount(View paramView, int paramInt)
  {
    return 0;
  }
  
  public Drawable getDividerDrawable()
  {
    return mDivider;
  }
  
  public int getDividerPadding()
  {
    return mDividerPadding;
  }
  
  public int getDividerWidth()
  {
    return mDividerWidth;
  }
  
  int getLocationOffset(View paramView)
  {
    return 0;
  }
  
  int getNextLocationOffset(View paramView)
  {
    return 0;
  }
  
  public int getOrientation()
  {
    return mOrientation;
  }
  
  public int getShowDividers()
  {
    return mShowDividers;
  }
  
  View getVirtualChildAt(int paramInt)
  {
    return getChildAt(paramInt);
  }
  
  int getVirtualChildCount()
  {
    return getChildCount();
  }
  
  public float getWeightSum()
  {
    return mWeightSum;
  }
  
  protected boolean hasDividerBeforeChildAt(int paramInt)
  {
    if (paramInt == 0) {
      if ((mShowDividers & 0x1) == 0) {}
    }
    do
    {
      return true;
      return false;
      if (paramInt != getChildCount()) {
        break;
      }
    } while ((mShowDividers & 0x4) != 0);
    return false;
    if ((mShowDividers & 0x2) != 0)
    {
      boolean bool2 = false;
      paramInt -= 1;
      for (;;)
      {
        boolean bool1 = bool2;
        if (paramInt >= 0)
        {
          if (getChildAt(paramInt).getVisibility() != 8) {
            bool1 = true;
          }
        }
        else {
          return bool1;
        }
        paramInt -= 1;
      }
    }
    return false;
  }
  
  void layoutHorizontal(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool1 = ViewUtils.isLayoutRtl(this);
    int k = getPaddingTop();
    int n = paramInt4 - paramInt2;
    int i1 = getPaddingBottom();
    int i2 = getPaddingBottom();
    int i3 = getVirtualChildCount();
    paramInt2 = mGravity;
    int i4 = mGravity;
    boolean bool2 = mBaselineAligned;
    int[] arrayOfInt1 = mMaxAscent;
    int[] arrayOfInt2 = mMaxDescent;
    label133:
    int i5;
    View localView;
    switch (GravityCompat.getAbsoluteGravity(paramInt2 & 0x800007, ViewCompat.getLayoutDirection(this)))
    {
    default: 
      paramInt1 = getPaddingLeft();
      int i = 0;
      paramInt4 = 1;
      if (bool1)
      {
        i = i3 - 1;
        paramInt4 = -1;
      }
      paramInt2 = 0;
      paramInt3 = paramInt1;
      if (paramInt2 >= i3) {
        return;
      }
      i5 = i + paramInt4 * paramInt2;
      localView = getVirtualChildAt(i5);
      if (localView == null)
      {
        paramInt1 = paramInt3 + measureNullChild(i5);
        j = paramInt2;
      }
      break;
    }
    do
    {
      paramInt2 = j + 1;
      paramInt3 = paramInt1;
      break label133;
      paramInt1 = getPaddingLeft() + paramInt3 - paramInt1 - mTotalLength;
      break;
      paramInt1 = getPaddingLeft() + (paramInt3 - paramInt1 - mTotalLength) / 2;
      break;
      paramInt1 = paramInt3;
      j = paramInt2;
    } while (localView.getVisibility() == 8);
    int i6 = localView.getMeasuredWidth();
    int i7 = localView.getMeasuredHeight();
    paramInt1 = -1;
    LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
    int j = paramInt1;
    if (bool2)
    {
      j = paramInt1;
      if (height != -1) {
        j = localView.getBaseline();
      }
    }
    int m = gravity;
    paramInt1 = m;
    if (m < 0) {
      paramInt1 = i4 & 0x70;
    }
    switch (paramInt1 & 0x70)
    {
    default: 
      paramInt1 = k;
    }
    for (;;)
    {
      j = paramInt3;
      if (hasDividerBeforeChildAt(i5)) {
        j = paramInt3 + mDividerWidth;
      }
      paramInt3 = j + leftMargin;
      setChildFrame(localView, paramInt3 + getLocationOffset(localView), paramInt1, i6, i7);
      paramInt1 = paramInt3 + (rightMargin + i6 + getNextLocationOffset(localView));
      j = paramInt2 + getChildrenSkipCount(localView, i5);
      break;
      m = k + topMargin;
      paramInt1 = m;
      if (j != -1)
      {
        paramInt1 = m + (arrayOfInt1[1] - j);
        continue;
        paramInt1 = (n - k - i2 - i7) / 2 + k + topMargin - bottomMargin;
        continue;
        m = n - i1 - i7 - bottomMargin;
        paramInt1 = m;
        if (j != -1)
        {
          paramInt1 = localView.getMeasuredHeight();
          paramInt1 = m - (arrayOfInt2[2] - (paramInt1 - j));
        }
      }
    }
  }
  
  void layoutVertical(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = getPaddingLeft();
    int j = paramInt3 - paramInt1;
    int k = getPaddingRight();
    int m = getPaddingRight();
    int n = getVirtualChildCount();
    paramInt1 = mGravity;
    int i1 = mGravity;
    label79:
    View localView;
    switch (paramInt1 & 0x70)
    {
    default: 
      paramInt1 = getPaddingTop();
      paramInt2 = 0;
      if (paramInt2 >= n) {
        return;
      }
      localView = getVirtualChildAt(paramInt2);
      if (localView == null)
      {
        paramInt3 = paramInt1 + measureNullChild(paramInt2);
        paramInt4 = paramInt2;
      }
      break;
    }
    do
    {
      paramInt2 = paramInt4 + 1;
      paramInt1 = paramInt3;
      break label79;
      paramInt1 = getPaddingTop() + paramInt4 - paramInt2 - mTotalLength;
      break;
      paramInt1 = getPaddingTop() + (paramInt4 - paramInt2 - mTotalLength) / 2;
      break;
      paramInt3 = paramInt1;
      paramInt4 = paramInt2;
    } while (localView.getVisibility() == 8);
    int i2 = localView.getMeasuredWidth();
    int i3 = localView.getMeasuredHeight();
    LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
    paramInt4 = gravity;
    paramInt3 = paramInt4;
    if (paramInt4 < 0) {
      paramInt3 = i1 & 0x800007;
    }
    switch (GravityCompat.getAbsoluteGravity(paramInt3, ViewCompat.getLayoutDirection(this)) & 0x7)
    {
    default: 
      paramInt3 = i + leftMargin;
    }
    for (;;)
    {
      paramInt4 = paramInt1;
      if (hasDividerBeforeChildAt(paramInt2)) {
        paramInt4 = paramInt1 + mDividerHeight;
      }
      paramInt1 = paramInt4 + topMargin;
      setChildFrame(localView, paramInt3, paramInt1 + getLocationOffset(localView), i2, i3);
      paramInt3 = paramInt1 + (bottomMargin + i3 + getNextLocationOffset(localView));
      paramInt4 = paramInt2 + getChildrenSkipCount(localView, paramInt2);
      break;
      paramInt3 = (j - i - m - i2) / 2 + i + leftMargin - rightMargin;
      continue;
      paramInt3 = j - k - i2 - rightMargin;
    }
  }
  
  void measureChildBeforeLayout(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    measureChildWithMargins(paramView, paramInt2, paramInt3, paramInt4, paramInt5);
  }
  
  void measureHorizontal(int paramInt1, int paramInt2)
  {
    mTotalLength = 0;
    int i3 = 0;
    int k = 0;
    int i = 0;
    int n = 0;
    int j = 1;
    float f1 = 0.0F;
    int i11 = getVirtualChildCount();
    int i13 = View.MeasureSpec.getMode(paramInt1);
    int i12 = View.MeasureSpec.getMode(paramInt2);
    int m = 0;
    int i4 = 0;
    if ((mMaxAscent == null) || (mMaxDescent == null))
    {
      mMaxAscent = new int[4];
      mMaxDescent = new int[4];
    }
    Object localObject = mMaxAscent;
    int[] arrayOfInt = mMaxDescent;
    localObject[3] = -1;
    localObject[2] = -1;
    localObject[1] = -1;
    localObject[0] = -1;
    arrayOfInt[3] = -1;
    arrayOfInt[2] = -1;
    arrayOfInt[1] = -1;
    arrayOfInt[0] = -1;
    boolean bool1 = mBaselineAligned;
    boolean bool2 = mUseLargestChild;
    int i7;
    int i2;
    int i1;
    label156:
    View localView;
    if (i13 == 1073741824)
    {
      i7 = 1;
      i2 = Integer.MIN_VALUE;
      i1 = 0;
      if (i1 >= i11) {
        break label885;
      }
      localView = getVirtualChildAt(i1);
      if (localView != null) {
        break label214;
      }
      mTotalLength += measureNullChild(i1);
    }
    for (int i6 = i2;; i6 = i2)
    {
      i1 += 1;
      i2 = i6;
      break label156;
      i7 = 0;
      break;
      label214:
      if (localView.getVisibility() != 8) {
        break label244;
      }
      i1 += getChildrenSkipCount(localView, i1);
    }
    label244:
    if (hasDividerBeforeChildAt(i1)) {
      mTotalLength += mDividerWidth;
    }
    LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
    f1 += weight;
    label334:
    int i5;
    label363:
    int i8;
    int i9;
    int i10;
    if ((i13 == 1073741824) && (width == 0) && (weight > 0.0F)) {
      if (i7 != 0)
      {
        mTotalLength += leftMargin + rightMargin;
        if (!bool1) {
          break label628;
        }
        i5 = View.MeasureSpec.makeMeasureSpec(0, 0);
        localView.measure(i5, i5);
        i5 = i4;
        i6 = i2;
        i8 = 0;
        i2 = m;
        i4 = i8;
        if (i12 != 1073741824)
        {
          i2 = m;
          i4 = i8;
          if (height == -1)
          {
            i2 = 1;
            i4 = 1;
          }
        }
        m = topMargin + bottomMargin;
        i8 = localView.getMeasuredHeight() + m;
        i9 = ViewUtils.combineMeasuredStates(k, ViewCompat.getMeasuredState(localView));
        if (bool1)
        {
          i10 = localView.getBaseline();
          if (i10 != -1)
          {
            if (gravity >= 0) {
              break label838;
            }
            k = mGravity;
            label471:
            k = ((k & 0x70) >> 4 & 0xFFFFFFFE) >> 1;
            localObject[k] = Math.max(localObject[k], i10);
            arrayOfInt[k] = Math.max(arrayOfInt[k], i8 - i10);
          }
        }
        i3 = Math.max(i3, i8);
        if ((j == 0) || (height != -1)) {
          break label848;
        }
        j = 1;
        label544:
        if (weight <= 0.0F) {
          break label861;
        }
        if (i4 == 0) {
          break label854;
        }
      }
    }
    for (;;)
    {
      n = Math.max(n, m);
      i1 += getChildrenSkipCount(localView, i1);
      k = i9;
      m = i2;
      i4 = i5;
      break;
      i5 = mTotalLength;
      mTotalLength = Math.max(i5, leftMargin + i5 + rightMargin);
      break label334;
      label628:
      i5 = 1;
      i6 = i2;
      break label363;
      i6 = Integer.MIN_VALUE;
      i5 = i6;
      if (width == 0)
      {
        i5 = i6;
        if (weight > 0.0F)
        {
          i5 = 0;
          width = -2;
        }
      }
      if (f1 == 0.0F)
      {
        i6 = mTotalLength;
        label691:
        measureChildBeforeLayout(localView, i1, paramInt1, i6, paramInt2, 0);
        if (i5 != Integer.MIN_VALUE) {
          width = i5;
        }
        i8 = localView.getMeasuredWidth();
        if (i7 == 0) {
          break label796;
        }
      }
      for (mTotalLength += leftMargin + i8 + rightMargin + getNextLocationOffset(localView);; mTotalLength = Math.max(i5, i5 + i8 + leftMargin + rightMargin + getNextLocationOffset(localView)))
      {
        i6 = i2;
        i5 = i4;
        if (!bool2) {
          break;
        }
        i6 = Math.max(i8, i2);
        i5 = i4;
        break;
        i6 = 0;
        break label691;
        label796:
        i5 = mTotalLength;
      }
      label838:
      k = gravity;
      break label471;
      label848:
      j = 0;
      break label544;
      label854:
      m = i8;
    }
    label861:
    if (i4 != 0) {}
    for (;;)
    {
      i = Math.max(i, m);
      break;
      m = i8;
    }
    label885:
    if ((mTotalLength > 0) && (hasDividerBeforeChildAt(i11))) {
      mTotalLength += mDividerWidth;
    }
    if ((localObject[1] == -1) && (localObject[0] == -1) && (localObject[2] == -1))
    {
      i1 = i3;
      if (localObject[3] == -1) {}
    }
    else
    {
      i1 = Math.max(i3, Math.max(localObject[3], Math.max(localObject[0], Math.max(localObject[1], localObject[2]))) + Math.max(arrayOfInt[3], Math.max(arrayOfInt[0], Math.max(arrayOfInt[1], arrayOfInt[2]))));
    }
    if ((bool2) && ((i13 == Integer.MIN_VALUE) || (i13 == 0)))
    {
      mTotalLength = 0;
      i3 = 0;
      if (i3 < i11)
      {
        localView = getVirtualChildAt(i3);
        if (localView == null) {
          mTotalLength += measureNullChild(i3);
        }
        for (;;)
        {
          i3 += 1;
          break;
          if (localView.getVisibility() == 8)
          {
            i3 += getChildrenSkipCount(localView, i3);
          }
          else
          {
            localLayoutParams = (LayoutParams)localView.getLayoutParams();
            if (i7 != 0)
            {
              mTotalLength += leftMargin + i2 + rightMargin + getNextLocationOffset(localView);
            }
            else
            {
              i5 = mTotalLength;
              mTotalLength = Math.max(i5, i5 + i2 + leftMargin + rightMargin + getNextLocationOffset(localView));
            }
          }
        }
      }
    }
    mTotalLength += getPaddingLeft() + getPaddingRight();
    int i14 = ViewCompat.resolveSizeAndState(Math.max(mTotalLength, getSuggestedMinimumWidth()), paramInt1, 0);
    i3 = (i14 & 0xFFFFFF) - mTotalLength;
    if ((i4 != 0) || ((i3 != 0) && (f1 > 0.0F)))
    {
      label1328:
      float f3;
      if (mWeightSum > 0.0F)
      {
        f1 = mWeightSum;
        localObject[3] = -1;
        localObject[2] = -1;
        localObject[1] = -1;
        localObject[0] = -1;
        arrayOfInt[3] = -1;
        arrayOfInt[2] = -1;
        arrayOfInt[1] = -1;
        arrayOfInt[0] = -1;
        i1 = -1;
        mTotalLength = 0;
        i4 = 0;
        n = i;
        if (i4 >= i11) {
          break label1985;
        }
        localView = getVirtualChildAt(i4);
        i5 = j;
        i6 = n;
        i8 = k;
        i9 = i3;
        i10 = i1;
        f3 = f1;
        if (localView != null)
        {
          if (localView.getVisibility() != 8) {
            break label1439;
          }
          f3 = f1;
          i10 = i1;
          i9 = i3;
          i8 = k;
          i6 = n;
          i5 = j;
        }
      }
      label1439:
      float f2;
      label1643:
      label1662:
      label1703:
      label1729:
      int i15;
      do
      {
        do
        {
          i4 += 1;
          j = i5;
          n = i6;
          k = i8;
          i3 = i9;
          i1 = i10;
          f1 = f3;
          break label1328;
          break;
          localLayoutParams = (LayoutParams)localView.getLayoutParams();
          f3 = weight;
          i2 = k;
          i = i3;
          f2 = f1;
          if (f3 > 0.0F)
          {
            i = (int)(i3 * f3 / f1);
            f2 = f1 - f3;
            i2 = i3 - i;
            i5 = getChildMeasureSpec(paramInt2, getPaddingTop() + getPaddingBottom() + topMargin + bottomMargin, height);
            if ((width == 0) && (i13 == 1073741824)) {
              break label1883;
            }
            i3 = localView.getMeasuredWidth() + i;
            i = i3;
            if (i3 < 0) {
              i = 0;
            }
            localView.measure(View.MeasureSpec.makeMeasureSpec(i, 1073741824), i5);
            k = ViewUtils.combineMeasuredStates(k, ViewCompat.getMeasuredState(localView) & 0xFF000000);
            i = i2;
            i2 = k;
          }
          if (i7 == 0) {
            break label1911;
          }
          mTotalLength += localView.getMeasuredWidth() + leftMargin + rightMargin + getNextLocationOffset(localView);
          if ((i12 == 1073741824) || (height != -1)) {
            break label1956;
          }
          k = 1;
          i5 = topMargin + bottomMargin;
          i3 = localView.getMeasuredHeight() + i5;
          i1 = Math.max(i1, i3);
          if (k == 0) {
            break label1962;
          }
          k = i5;
          n = Math.max(n, k);
          if ((j == 0) || (height != -1)) {
            break label1969;
          }
          j = 1;
          i5 = j;
          i6 = n;
          i8 = i2;
          i9 = i;
          i10 = i1;
          f3 = f2;
        } while (!bool1);
        i15 = localView.getBaseline();
        i5 = j;
        i6 = n;
        i8 = i2;
        i9 = i;
        i10 = i1;
        f3 = f2;
      } while (i15 == -1);
      if (gravity < 0) {}
      for (k = mGravity;; k = gravity)
      {
        k = ((k & 0x70) >> 4 & 0xFFFFFFFE) >> 1;
        localObject[k] = Math.max(localObject[k], i15);
        arrayOfInt[k] = Math.max(arrayOfInt[k], i3 - i15);
        i5 = j;
        i6 = n;
        i8 = i2;
        i9 = i;
        i10 = i1;
        f3 = f2;
        break;
        label1883:
        if (i > 0) {}
        for (;;)
        {
          localView.measure(View.MeasureSpec.makeMeasureSpec(i, 1073741824), i5);
          break;
          i = 0;
        }
        label1911:
        k = mTotalLength;
        mTotalLength = Math.max(k, localView.getMeasuredWidth() + k + leftMargin + rightMargin + getNextLocationOffset(localView));
        break label1643;
        label1956:
        k = 0;
        break label1662;
        label1962:
        k = i3;
        break label1703;
        label1969:
        j = 0;
        break label1729;
      }
      label1985:
      mTotalLength += getPaddingLeft() + getPaddingRight();
      if ((localObject[1] == -1) && (localObject[0] == -1) && (localObject[2] == -1))
      {
        i5 = j;
        i3 = n;
        i4 = k;
        i = i1;
        if (localObject[3] == -1) {}
      }
      else
      {
        i = Math.max(i1, Math.max(localObject[3], Math.max(localObject[0], Math.max(localObject[1], localObject[2]))) + Math.max(arrayOfInt[3], Math.max(arrayOfInt[0], Math.max(arrayOfInt[1], arrayOfInt[2]))));
        i4 = k;
        i3 = n;
        i5 = j;
      }
    }
    do
    {
      do
      {
        do
        {
          j = i;
          if (i5 == 0)
          {
            j = i;
            if (i12 != 1073741824) {
              j = i3;
            }
          }
          setMeasuredDimension(0xFF000000 & i4 | i14, ViewCompat.resolveSizeAndState(Math.max(j + (getPaddingTop() + getPaddingBottom()), getSuggestedMinimumHeight()), paramInt2, i4 << 16));
          if (m != 0) {
            forceUniformHeight(i11, paramInt1);
          }
          return;
          i6 = Math.max(i, n);
          i5 = j;
          i3 = i6;
          i4 = k;
          i = i1;
        } while (!bool2);
        i5 = j;
        i3 = i6;
        i4 = k;
        i = i1;
      } while (i13 == 1073741824);
      n = 0;
      i5 = j;
      i3 = i6;
      i4 = k;
      i = i1;
    } while (n >= i11);
    localObject = getVirtualChildAt(n);
    if ((localObject == null) || (((View)localObject).getVisibility() == 8)) {}
    for (;;)
    {
      n += 1;
      break;
      if (getLayoutParamsweight > 0.0F) {
        ((View)localObject).measure(View.MeasureSpec.makeMeasureSpec(i2, 1073741824), View.MeasureSpec.makeMeasureSpec(((View)localObject).getMeasuredHeight(), 1073741824));
      }
    }
  }
  
  int measureNullChild(int paramInt)
  {
    return 0;
  }
  
  void measureVertical(int paramInt1, int paramInt2)
  {
    mTotalLength = 0;
    int m = 0;
    int k = 0;
    int i = 0;
    int i1 = 0;
    int j = 1;
    float f1 = 0.0F;
    int i8 = getVirtualChildCount();
    int i9 = View.MeasureSpec.getMode(paramInt1);
    int i10 = View.MeasureSpec.getMode(paramInt2);
    int n = 0;
    int i4 = 0;
    int i11 = mBaselineAlignedChildIndex;
    boolean bool = mUseLargestChild;
    int i3 = Integer.MIN_VALUE;
    int i2 = 0;
    int i6;
    label148:
    LayoutParams localLayoutParams;
    int i5;
    if (i2 < i8)
    {
      localView = getVirtualChildAt(i2);
      if (localView == null) {
        mTotalLength += measureNullChild(i2);
      }
      for (i6 = i3;; i6 = i3)
      {
        i2 += 1;
        i3 = i6;
        break;
        if (localView.getVisibility() != 8) {
          break label148;
        }
        i2 += getChildrenSkipCount(localView, i2);
      }
      if (hasDividerBeforeChildAt(i2)) {
        mTotalLength += mDividerHeight;
      }
      localLayoutParams = (LayoutParams)localView.getLayoutParams();
      f1 += weight;
      if ((i10 == 1073741824) && (height == 0) && (weight > 0.0F))
      {
        i4 = mTotalLength;
        mTotalLength = Math.max(i4, topMargin + i4 + bottomMargin);
        i5 = 1;
        i6 = i3;
        if ((i11 >= 0) && (i11 == i2 + 1)) {
          mBaselineChildTop = mTotalLength;
        }
        if ((i2 < i11) && (weight > 0.0F)) {
          throw new RuntimeException("A child of LinearLayout with index less than mBaselineAlignedChildIndex has weight > 0, which won't work.  Either remove the weight, or don't set mBaselineAlignedChildIndex.");
        }
      }
      else
      {
        i6 = Integer.MIN_VALUE;
        i5 = i6;
        if (height == 0)
        {
          i5 = i6;
          if (weight > 0.0F)
          {
            i5 = 0;
            height = -2;
          }
        }
        if (f1 == 0.0F) {}
        for (i6 = mTotalLength;; i6 = 0)
        {
          measureChildBeforeLayout(localView, i2, paramInt1, 0, paramInt2, i6);
          if (i5 != Integer.MIN_VALUE) {
            height = i5;
          }
          i7 = localView.getMeasuredHeight();
          i5 = mTotalLength;
          mTotalLength = Math.max(i5, i5 + i7 + topMargin + bottomMargin + getNextLocationOffset(localView));
          i6 = i3;
          i5 = i4;
          if (!bool) {
            break;
          }
          i6 = Math.max(i7, i3);
          i5 = i4;
          break;
        }
      }
      i7 = 0;
      i3 = n;
      i4 = i7;
      if (i9 != 1073741824)
      {
        i3 = n;
        i4 = i7;
        if (width == -1)
        {
          i3 = 1;
          i4 = 1;
        }
      }
      n = leftMargin + rightMargin;
      i7 = localView.getMeasuredWidth() + n;
      m = Math.max(m, i7);
      k = ViewUtils.combineMeasuredStates(k, ViewCompat.getMeasuredState(localView));
      if ((j != 0) && (width == -1))
      {
        j = 1;
        label563:
        if (weight <= 0.0F) {
          break label624;
        }
        if (i4 == 0) {
          break label617;
        }
      }
      for (;;)
      {
        i1 = Math.max(i1, n);
        i2 += getChildrenSkipCount(localView, i2);
        n = i3;
        i4 = i5;
        break;
        j = 0;
        break label563;
        label617:
        n = i7;
      }
      label624:
      if (i4 != 0) {}
      for (;;)
      {
        i = Math.max(i, n);
        break;
        n = i7;
      }
    }
    if ((mTotalLength > 0) && (hasDividerBeforeChildAt(i8))) {
      mTotalLength += mDividerHeight;
    }
    if ((bool) && ((i10 == Integer.MIN_VALUE) || (i10 == 0)))
    {
      mTotalLength = 0;
      i2 = 0;
      if (i2 < i8)
      {
        localView = getVirtualChildAt(i2);
        if (localView == null) {
          mTotalLength += measureNullChild(i2);
        }
        for (;;)
        {
          i2 += 1;
          break;
          if (localView.getVisibility() == 8)
          {
            i2 += getChildrenSkipCount(localView, i2);
          }
          else
          {
            localLayoutParams = (LayoutParams)localView.getLayoutParams();
            i5 = mTotalLength;
            mTotalLength = Math.max(i5, i5 + i3 + topMargin + bottomMargin + getNextLocationOffset(localView));
          }
        }
      }
    }
    mTotalLength += getPaddingTop() + getPaddingBottom();
    int i7 = ViewCompat.resolveSizeAndState(Math.max(mTotalLength, getSuggestedMinimumHeight()), paramInt2, 0);
    i2 = (i7 & 0xFFFFFF) - mTotalLength;
    if ((i4 != 0) || ((i2 != 0) && (f1 > 0.0F)))
    {
      if (mWeightSum > 0.0F) {
        f1 = mWeightSum;
      }
      for (;;)
      {
        mTotalLength = 0;
        i4 = 0;
        i1 = m;
        for (i3 = i2;; i3 = m)
        {
          if (i4 >= i8) {
            break label1336;
          }
          localView = getVirtualChildAt(i4);
          if (localView.getVisibility() != 8) {
            break;
          }
          m = i3;
          i2 = k;
          k = i;
          i = j;
          i4 += 1;
          j = i;
          i = k;
          k = i2;
        }
      }
      localLayoutParams = (LayoutParams)localView.getLayoutParams();
      float f3 = weight;
      i2 = k;
      m = i3;
      float f2 = f1;
      if (f3 > 0.0F)
      {
        m = (int)(i3 * f3 / f1);
        f2 = f1 - f3;
        i2 = i3 - m;
        i5 = getChildMeasureSpec(paramInt1, getPaddingLeft() + getPaddingRight() + leftMargin + rightMargin, width);
        if ((height != 0) || (i10 != 1073741824))
        {
          i3 = localView.getMeasuredHeight() + m;
          m = i3;
          if (i3 < 0) {
            m = 0;
          }
          localView.measure(i5, View.MeasureSpec.makeMeasureSpec(m, 1073741824));
          k = ViewUtils.combineMeasuredStates(k, ViewCompat.getMeasuredState(localView) & 0xFF00);
          m = i2;
          i2 = k;
        }
      }
      else
      {
        i3 = leftMargin + rightMargin;
        i5 = localView.getMeasuredWidth() + i3;
        i1 = Math.max(i1, i5);
        if ((i9 == 1073741824) || (width != -1)) {
          break label1317;
        }
        k = 1;
        label1206:
        if (k == 0) {
          break label1323;
        }
        k = i3;
        label1215:
        k = Math.max(i, k);
        if ((j == 0) || (width != -1)) {
          break label1330;
        }
      }
      label1317:
      label1323:
      label1330:
      for (i = 1;; i = 0)
      {
        j = mTotalLength;
        mTotalLength = Math.max(j, localView.getMeasuredHeight() + j + topMargin + bottomMargin + getNextLocationOffset(localView));
        f1 = f2;
        break;
        if (m > 0) {}
        for (;;)
        {
          localView.measure(i5, View.MeasureSpec.makeMeasureSpec(m, 1073741824));
          break;
          m = 0;
        }
        k = 0;
        break label1206;
        k = i5;
        break label1215;
      }
      label1336:
      mTotalLength += getPaddingTop() + getPaddingBottom();
      i2 = k;
      i4 = j;
    }
    do
    {
      do
      {
        do
        {
          j = i1;
          if (i4 == 0)
          {
            j = i1;
            if (i9 != 1073741824) {
              j = i;
            }
          }
          setMeasuredDimension(ViewCompat.resolveSizeAndState(Math.max(j + (getPaddingLeft() + getPaddingRight()), getSuggestedMinimumWidth()), paramInt1, i2), i7);
          if (n != 0) {
            forceUniformWidth(i8, paramInt2);
          }
          return;
          i6 = Math.max(i, i1);
          i4 = j;
          i = i6;
          i2 = k;
          i1 = m;
        } while (!bool);
        i4 = j;
        i = i6;
        i2 = k;
        i1 = m;
      } while (i10 == 1073741824);
      i5 = 0;
      i4 = j;
      i = i6;
      i2 = k;
      i1 = m;
    } while (i5 >= i8);
    View localView = getVirtualChildAt(i5);
    if ((localView == null) || (localView.getVisibility() == 8)) {}
    for (;;)
    {
      i5 += 1;
      break;
      if (getLayoutParamsweight > 0.0F) {
        localView.measure(View.MeasureSpec.makeMeasureSpec(localView.getMeasuredWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(i3, 1073741824));
      }
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if (mDivider == null) {
      return;
    }
    if (mOrientation == 1)
    {
      drawDividersVertical(paramCanvas);
      return;
    }
    drawDividersHorizontal(paramCanvas);
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    if (Build.VERSION.SDK_INT >= 14)
    {
      super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
      paramAccessibilityEvent.setClassName(LinearLayoutCompat.class.getName());
    }
  }
  
  public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo paramAccessibilityNodeInfo)
  {
    if (Build.VERSION.SDK_INT >= 14)
    {
      super.onInitializeAccessibilityNodeInfo(paramAccessibilityNodeInfo);
      paramAccessibilityNodeInfo.setClassName(LinearLayoutCompat.class.getName());
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (mOrientation == 1)
    {
      layoutVertical(paramInt1, paramInt2, paramInt3, paramInt4);
      return;
    }
    layoutHorizontal(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (mOrientation == 1)
    {
      measureVertical(paramInt1, paramInt2);
      return;
    }
    measureHorizontal(paramInt1, paramInt2);
  }
  
  public void setBaselineAligned(boolean paramBoolean)
  {
    mBaselineAligned = paramBoolean;
  }
  
  public void setBaselineAlignedChildIndex(int paramInt)
  {
    if ((paramInt < 0) || (paramInt >= getChildCount())) {
      throw new IllegalArgumentException("base aligned child index out of range (0, " + getChildCount() + ")");
    }
    mBaselineAlignedChildIndex = paramInt;
  }
  
  public void setDividerDrawable(Drawable paramDrawable)
  {
    boolean bool = false;
    if (paramDrawable == mDivider) {
      return;
    }
    mDivider = paramDrawable;
    if (paramDrawable != null) {
      mDividerWidth = paramDrawable.getIntrinsicWidth();
    }
    for (mDividerHeight = paramDrawable.getIntrinsicHeight();; mDividerHeight = 0)
    {
      if (paramDrawable == null) {
        bool = true;
      }
      setWillNotDraw(bool);
      requestLayout();
      return;
      mDividerWidth = 0;
    }
  }
  
  public void setDividerPadding(int paramInt)
  {
    mDividerPadding = paramInt;
  }
  
  public void setGravity(int paramInt)
  {
    if (mGravity != paramInt)
    {
      int i = paramInt;
      if ((0x800007 & paramInt) == 0) {
        i = paramInt | 0x800003;
      }
      paramInt = i;
      if ((i & 0x70) == 0) {
        paramInt = i | 0x30;
      }
      mGravity = paramInt;
      requestLayout();
    }
  }
  
  public void setHorizontalGravity(int paramInt)
  {
    paramInt &= 0x800007;
    if ((mGravity & 0x800007) != paramInt)
    {
      mGravity = (mGravity & 0xFF7FFFF8 | paramInt);
      requestLayout();
    }
  }
  
  public void setMeasureWithLargestChildEnabled(boolean paramBoolean)
  {
    mUseLargestChild = paramBoolean;
  }
  
  public void setOrientation(int paramInt)
  {
    if (mOrientation != paramInt)
    {
      mOrientation = paramInt;
      requestLayout();
    }
  }
  
  public void setShowDividers(int paramInt)
  {
    if (paramInt != mShowDividers) {
      requestLayout();
    }
    mShowDividers = paramInt;
  }
  
  public void setVerticalGravity(int paramInt)
  {
    paramInt &= 0x70;
    if ((mGravity & 0x70) != paramInt)
    {
      mGravity = (mGravity & 0xFFFFFF8F | paramInt);
      requestLayout();
    }
  }
  
  public void setWeightSum(float paramFloat)
  {
    mWeightSum = Math.max(0.0F, paramFloat);
  }
  
  public boolean shouldDelayChildPressedState()
  {
    return false;
  }
  
  public static class LayoutParams
    extends ViewGroup.MarginLayoutParams
  {
    public int gravity = -1;
    public float weight;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
      weight = 0.0F;
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.LinearLayoutCompat_Layout);
      weight = paramContext.getFloat(R.styleable.LinearLayoutCompat_Layout_android_layout_weight, 0.0F);
      gravity = paramContext.getInt(R.styleable.LinearLayoutCompat_Layout_android_layout_gravity, -1);
      paramContext.recycle();
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
  }
}
