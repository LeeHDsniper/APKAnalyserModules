package com.tencent.mobileqq.activity.qwallet.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.TextSwitcher;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class RollTextView
  extends TextSwitcher
{
  private static final int MSG_UPDATE = 1;
  private Animation animIn;
  private Animation animOut;
  protected Bitmap bitmap;
  protected boolean mAcitive;
  private Context mContext;
  private int mFactor;
  private int mFrom;
  private RollTextView.RollViewHandler mHandler;
  private int mInDuring;
  private RollTextView.OnRollTextChangeListener mListener;
  private int mOutDuring;
  private int mTextColor;
  private int mTextSize;
  private int mTo;
  private int mTotalDuring;
  
  public RollTextView(Context paramContext)
  {
    super(paramContext);
    mHandler = new RollTextView.RollViewHandler(this);
    mContext = null;
    mListener = null;
    mAcitive = true;
    mFactor = 0;
    mOutDuring = 200;
    mInDuring = 200;
    mTextSize = 50;
    init(paramContext);
  }
  
  public RollTextView(Context paramContext, int paramInt1, int paramInt2)
  {
    super(paramContext);
    mHandler = new RollTextView.RollViewHandler(this);
    mContext = null;
    mListener = null;
    mAcitive = true;
    mFactor = 0;
    mOutDuring = 200;
    mInDuring = 200;
    mTextSize = 50;
    mTextSize = paramInt1;
    mTextColor = paramInt2;
    init(paramContext);
  }
  
  public RollTextView(Context paramContext, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super(paramContext);
    mHandler = new RollTextView.RollViewHandler(this);
    mContext = null;
    mListener = null;
    mAcitive = true;
    mFactor = 0;
    mOutDuring = 200;
    mInDuring = 200;
    mTextSize = 50;
    mFrom = paramInt1;
    mTo = paramInt2;
    mTextSize = paramInt3;
    mTextColor = paramInt4;
    init(paramContext);
  }
  
  public RollTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    mHandler = new RollTextView.RollViewHandler(this);
    mContext = null;
    mListener = null;
    mAcitive = true;
    mFactor = 0;
    mOutDuring = 200;
    mInDuring = 200;
    mTextSize = 50;
    init(paramContext);
  }
  
  public static Bitmap loadBitmapFromView(View paramView)
  {
    if (paramView == null) {
      return null;
    }
    Bitmap localBitmap = Bitmap.createBitmap(100, 200, Bitmap.Config.ARGB_8888);
    Canvas localCanvas = new Canvas(localBitmap);
    localCanvas.translate(-paramView.getScrollX(), -paramView.getScrollY());
    paramView.draw(localCanvas);
    return localBitmap;
  }
  
  public void init(Context paramContext)
  {
    if (paramContext == null) {
      return;
    }
    mContext = paramContext;
    animIn = AnimationUtils.loadAnimation(mContext, 2130968714);
    animIn.setFillAfter(true);
    setInAnimation(animIn);
    animOut = AnimationUtils.loadAnimation(mContext, 2130968715);
    animOut.setFillAfter(true);
    setOutAnimation(animOut);
    setFactory(new RollTextView.1(this));
  }
  
  public void setContext(int paramInt1, int paramInt2)
  {
    mFrom = paramInt1;
    mTo = paramInt2;
  }
  
  public void setFactor(int paramInt)
  {
    if (paramInt >= 0) {
      mFactor = paramInt;
    }
  }
  
  public void setListener(RollTextView.OnRollTextChangeListener paramOnRollTextChangeListener)
  {
    mListener = paramOnRollTextChangeListener;
  }
  
  public void setScope(int paramInt1, int paramInt2)
  {
    mFrom = paramInt1;
    mTo = paramInt2;
  }
  
  public void show()
  {
    ThreadManager.a(new RollTextView.ContentSupplyThread(this), null, true);
  }
  
  public void stopRoll()
  {
    mAcitive = false;
  }
}
