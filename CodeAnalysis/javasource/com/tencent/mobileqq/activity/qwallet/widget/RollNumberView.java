package com.tencent.mobileqq.activity.qwallet.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.R.styleable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Random;

public class RollNumberView
  extends LinearLayout
  implements RollTextView.OnRollTextChangeListener
{
  private int count;
  private int index;
  private Context mContext;
  private int mFactor;
  private RollNumberView.OnRollListener mListener;
  private int mTextColor;
  private int mTextSize;
  private int mViewRolledCount;
  private int max;
  
  public RollNumberView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    mContext = null;
    index = 0;
    mViewRolledCount = 0;
    mContext = paramContext;
  }
  
  public RollNumberView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    mContext = null;
    index = 0;
    mViewRolledCount = 0;
    mContext = paramContext;
    getAttrs(paramContext, paramAttributeSet);
  }
  
  public RollNumberView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    mContext = null;
    index = 0;
    mViewRolledCount = 0;
    mContext = paramContext;
    getAttrs(paramContext, paramAttributeSet);
  }
  
  private void getAttrs(Context paramContext, AttributeSet paramAttributeSet)
  {
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.aF);
    mTextSize = ((int)paramContext.getDimension(1, 12.0F));
    mTextColor = paramContext.getColor(0, 0);
    paramContext.recycle();
  }
  
  public int init(int paramInt)
  {
    if (paramInt < 0) {
      throw new Exception("no must be positive");
    }
    int i = paramInt % 10;
    RollTextView localRollTextView = new RollTextView(mContext, mTextSize, mTextColor);
    localRollTextView.setListener(this);
    int j = mFactor;
    mFactor = (j + 1);
    localRollTextView.setFactor(j);
    addView(localRollTextView, 0);
    j = 4 - new Random().nextInt(3);
    localRollTextView.setScope(i + j, i);
    paramInt /= 10;
    i = 0;
    while (paramInt > 0)
    {
      i += 1;
      localRollTextView = new RollTextView(mContext, mTextSize, mTextColor);
      localRollTextView.setListener(this);
      int k = mFactor;
      mFactor = (k + 1);
      localRollTextView.setFactor(k);
      k = paramInt % 10;
      localRollTextView.setScope(k + j + i, k);
      addView(localRollTextView, 0);
      paramInt /= 10;
    }
    return j;
  }
  
  public void init(double paramDouble)
  {
    if (paramDouble <= 0.0D) {
      throw new Exception("no must be positive");
    }
    TextView localTextView = new TextView(mContext);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    localTextView.setIncludeFontPadding(false);
    localTextView.setLayoutParams(localLayoutParams);
    localTextView.setGravity(80);
    localTextView.setTextSize(0, mTextSize);
    localTextView.setTextColor(mTextColor);
    int i = (int)paramDouble;
    int j = (int)Math.round((paramDouble - i) * 1000.0D) / 10;
    max = init(j);
    if (j < 10) {
      init(0);
    }
    localTextView.setText(".");
    addView(localTextView, 0);
    i = init(i);
    if (i > max) {}
    for (;;)
    {
      max = i;
      return;
      i = max;
    }
  }
  
  public void onRollTextChanged(Bitmap paramBitmap) {}
  
  public void onRollTextComplete()
  {
    if (mViewRolledCount == count - 2) {
      mListener.complete();
    }
    mViewRolledCount += 1;
  }
  
  public void reset(double paramDouble)
  {
    int i = 0;
    while (i < count)
    {
      View localView = getChildAt(i);
      if ((localView != null) && ((localView instanceof RollTextView))) {
        ((RollTextView)localView).stopRoll();
      }
      i += 1;
    }
    mFactor = 0;
    removeAllViews();
    try
    {
      mViewRolledCount = 0;
      init(paramDouble);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void roll()
  {
    count = getChildCount();
    int i = 0;
    while (i < count)
    {
      View localView = getChildAt(i);
      if ((localView != null) && ((localView instanceof RollTextView))) {
        ((RollTextView)localView).show();
      }
      i += 1;
    }
  }
  
  public void setFactor(int paramInt)
  {
    if (paramInt >= 0) {
      mFactor = paramInt;
    }
  }
  
  public void setLisener(RollNumberView.OnRollListener paramOnRollListener)
  {
    if (paramOnRollListener != null) {
      mListener = paramOnRollListener;
    }
  }
}
