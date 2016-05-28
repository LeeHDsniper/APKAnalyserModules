package com.adobe.android.ui.widget;

import android.content.Context;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import com.adobe.android.ui.R.style;

public class AdobeCustomToast
{
  Context mContext;
  int mDuration;
  int mGravity = 17;
  final Handler mHandler = new Handler();
  float mHorizontalMargin;
  private LayoutListener mLayoutListener;
  View mNextView;
  final TN mTN;
  float mVerticalMargin;
  View mView;
  WindowManager mWindowManager;
  int mX;
  int mY;
  
  public AdobeCustomToast(Context paramContext)
  {
    mContext = paramContext;
    mWindowManager = ((WindowManager)paramContext.getSystemService("window"));
    mTN = new TN();
    mTN.mWm = mWindowManager;
    mY = 0;
    mX = 0;
  }
  
  public static AdobeCustomToast make(Context paramContext, int paramInt1, int paramInt2)
  {
    AdobeCustomToast localAdobeCustomToast = new AdobeCustomToast(paramContext);
    mNextView = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(paramInt1, null);
    mDuration = paramInt2;
    return localAdobeCustomToast;
  }
  
  public void hide()
  {
    mTN.hide();
  }
  
  public void show()
  {
    if (mNextView == null) {
      throw new RuntimeException("setView must be called first");
    }
    mTN.show();
  }
  
  public static abstract interface LayoutListener
  {
    public abstract void onHidden();
    
    public abstract void onShown(View paramView);
  }
  
  private class TN
  {
    final Runnable mHide = new Runnable()
    {
      public void run()
      {
        handleHide();
      }
    };
    WindowManager.LayoutParams mParams = new WindowManager.LayoutParams();
    final Runnable mShow = new Runnable()
    {
      public void run()
      {
        handleShow();
      }
    };
    WindowManager mWm;
    
    TN()
    {
      this$1 = mParams;
      height = -2;
      width = -2;
      flags = 152;
      format = -3;
      type = 2005;
      windowAnimations = R.style.AdobeToast;
      setTitle("Toast");
    }
    
    public void handleHide()
    {
      removeView();
      if (mLayoutListener != null) {
        mLayoutListener.onHidden();
      }
    }
    
    public void handleShow()
    {
      if (mView != mNextView)
      {
        handleHide();
        mView = mNextView;
        int i = mGravity;
        mParams.gravity = i;
        if ((i & 0x7) == 7) {
          mParams.horizontalWeight = 1.0F;
        }
        if ((i & 0x70) == 112) {
          mParams.verticalWeight = 1.0F;
        }
        mParams.x = mX;
        mParams.y = mY;
        mParams.verticalMargin = mVerticalMargin;
        mParams.horizontalMargin = mHorizontalMargin;
        if (mView.getParent() != null)
        {
          mView.setVisibility(8);
          mWm.removeView(mView);
        }
        mWm.addView(mView, mParams);
        mView.setVisibility(0);
        if (mLayoutListener != null) {
          mLayoutListener.onShown(mView);
        }
      }
    }
    
    public void hide()
    {
      mHandler.post(mHide);
    }
    
    void removeView()
    {
      if (mView != null)
      {
        if (mView.getParent() != null)
        {
          mView.setVisibility(8);
          mWm.removeView(mView);
        }
        mView = null;
      }
    }
    
    public void show()
    {
      mHandler.post(mShow);
    }
  }
}
