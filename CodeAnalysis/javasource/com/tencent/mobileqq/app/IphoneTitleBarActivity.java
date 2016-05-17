package com.tencent.mobileqq.app;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.InflateException;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.widget.BounceScrollView;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.immersive.ImmersiveUtils;
import mza;

public class IphoneTitleBarActivity
  extends FragmentActivity
{
  public static final int LAYER_TYPE_SOFTWARE = 1;
  protected static final String TAG = "IphoneTitleBarActivity";
  private Drawable ad;
  public TextView centerView;
  private boolean isRightHighlightButton;
  public TextView leftView;
  public TextView leftViewNotBack;
  protected View mContentView;
  protected int mContentViewID;
  protected float mDensity;
  private RelativeLayout mLoadingParent;
  private ImageView mLoadingView;
  private Drawable[] mOldDrawables;
  private int mOldPadding;
  public View mTitleContainer;
  protected boolean mUseOptimizMode;
  protected View.OnClickListener onBackListeger;
  public TextView rightHighLView;
  public ImageView rightViewImg;
  public TextView rightViewText;
  public RelativeLayout titleRoot;
  protected ViewGroup vg;
  
  public IphoneTitleBarActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    mTitleContainer = null;
    mContentViewID = -1;
    onBackListeger = new mza(this);
    mUseOptimizMode = false;
  }
  
  public static void setLayerType(View paramView)
  {
    if (paramView == null) {}
    while (Build.VERSION.SDK_INT <= 10) {
      return;
    }
    paramView.setLayerType(0, null);
  }
  
  public void enableLeftBtn(boolean paramBoolean)
  {
    if (leftViewNotBack != null) {
      leftViewNotBack.setEnabled(paramBoolean);
    }
  }
  
  protected void enableRightHighlight(boolean paramBoolean)
  {
    if ((rightHighLView == null) || (!isRightHighlightButton)) {
      return;
    }
    if (paramBoolean)
    {
      rightViewText.setVisibility(8);
      rightHighLView.setVisibility(0);
      return;
    }
    rightViewText.setVisibility(0);
    rightHighLView.setVisibility(8);
  }
  
  public View getRightTextView()
  {
    rightViewText = ((TextView)findViewById(2131297081));
    setLayerType(rightViewText);
    return rightViewText;
  }
  
  public String getTextTitle()
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (centerView != null)
    {
      localObject1 = localObject2;
      if ((centerView instanceof TextView))
      {
        CharSequence localCharSequence = centerView.getText();
        localObject1 = localObject2;
        if (localCharSequence != null) {
          localObject1 = localCharSequence.toString();
        }
      }
    }
    return localObject1;
  }
  
  public View getTitleBarView()
  {
    return findViewById(2131297322);
  }
  
  public void hideTitleBar()
  {
    try
    {
      mTitleContainer = findViewById(2131297322);
      mTitleContainer.setVisibility(8);
      return;
    }
    catch (Throwable localThrowable) {}
  }
  
  public void init(Intent paramIntent)
  {
    ((FrameLayout)findViewById(16908290)).setForeground(getResources().getDrawable(2130842614));
    if (leftView == null)
    {
      vg = ((ViewGroup)findViewById(2131297322));
      setLayerType(vg);
      onCreateLeftView();
      onCreateCenterView();
      onCreateRightView();
      setLeftViewName(paramIntent);
    }
  }
  
  public boolean onBackEvent()
  {
    finish();
    return false;
  }
  
  public View onCreateCenterView()
  {
    centerView = ((TextView)findViewById(2131297034));
    return centerView;
  }
  
  protected View onCreateLeftView()
  {
    leftView = ((TextView)findViewById(2131297035));
    leftView.setOnClickListener(onBackListeger);
    setLayerType(leftView);
    return leftView;
  }
  
  public View onCreateRightView()
  {
    rightViewText = ((TextView)findViewById(2131297081));
    rightViewImg = ((ImageView)findViewById(2131297324));
    setLayerType(rightViewText);
    setLayerType(rightViewImg);
    return rightViewText;
  }
  
  public void removeWebViewLayerType()
  {
    if (Build.VERSION.SDK_INT == 16) {
      vg.setLayerType(0, null);
    }
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(7);
  }
  
  public void setClickableTitle(CharSequence paramCharSequence, View.OnClickListener paramOnClickListener)
  {
    setTitle(paramCharSequence);
    if ((centerView != null) && ((centerView instanceof TextView)))
    {
      paramCharSequence = centerView;
      if (paramOnClickListener == null) {
        break label47;
      }
    }
    label47:
    for (boolean bool = true;; bool = false)
    {
      paramCharSequence.setClickable(bool);
      centerView.setOnClickListener(paramOnClickListener);
      return;
    }
  }
  
  public void setContentView(int paramInt)
  {
    if (!mNeedStatusTrans)
    {
      super.setContentView(paramInt);
      mContentViewID = paramInt;
      getWindow().setFeatureInt(7, 2130903222);
    }
    do
    {
      if (mTitleContainer != null) {
        mTitleContainer.setVisibility(0);
      }
      mDensity = getResourcesgetDisplayMetricsdensity;
      init(getIntent());
      return;
      Object localObject2 = LayoutInflater.from(this);
      Object localObject1 = ((LayoutInflater)localObject2).inflate(2130903223, null);
      try
      {
        localObject2 = ((LayoutInflater)localObject2).inflate(paramInt, (ViewGroup)localObject1, false);
        titleRoot = ((RelativeLayout)((View)localObject1).findViewById(2131297728));
        if (ImmersiveUtils.isSupporImmersive() == 1)
        {
          titleRoot.setFitsSystemWindows(true);
          titleRoot.setPadding(0, ImmersiveUtils.a(this), 0, 0);
        }
        localObject1 = new RelativeLayout.LayoutParams(-1, -1);
        ((RelativeLayout.LayoutParams)localObject1).addRule(3, 2131297322);
        titleRoot.addView((View)localObject2, (ViewGroup.LayoutParams)localObject1);
        mContentView = ((View)localObject2);
        super.setContentView(titleRoot);
        i = 0;
      }
      catch (InflateException localInflateException)
      {
        for (;;)
        {
          localInflateException.printStackTrace();
          i = 1;
        }
      }
      catch (RuntimeException localRuntimeException)
      {
        for (;;)
        {
          localRuntimeException.printStackTrace();
          int i = 1;
        }
      }
    } while (i == 0);
    if (QLog.isColorLevel()) {
      QLog.e("IphoneTitleBarActivity", 2, "layout with merge ,use framelayout to immersive" + getComponentName());
    }
    super.setContentView(paramInt);
    mContentViewID = paramInt;
    getWindow().setFeatureInt(7, 2130903222);
    if (mTitleContainer != null) {
      mTitleContainer.setVisibility(0);
    }
    mDensity = getResourcesgetDisplayMetricsdensity;
    init(getIntent());
  }
  
  public void setContentView(View paramView)
  {
    mContentView = paramView;
    mDensity = getResourcesgetDisplayMetricsdensity;
    if (!mNeedStatusTrans)
    {
      super.setContentView(paramView);
      getWindow().setFeatureInt(7, 2130903222);
    }
    for (;;)
    {
      if (mTitleContainer != null) {
        mTitleContainer.setVisibility(0);
      }
      init(getIntent());
      return;
      titleRoot = ((RelativeLayout)LayoutInflater.from(this).inflate(2130903223, null).findViewById(2131297728));
      if (ImmersiveUtils.isSupporImmersive() == 1)
      {
        titleRoot.setFitsSystemWindows(true);
        titleRoot.setPadding(0, ImmersiveUtils.a(this), 0, 0);
      }
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
      localLayoutParams.addRule(3, 2131297322);
      titleRoot.addView(paramView, localLayoutParams);
      super.setContentView(titleRoot);
    }
  }
  
  public View setContentViewB(int paramInt)
  {
    BounceScrollView localBounceScrollView = (BounceScrollView)View.inflate(this, 2130903145, null);
    View localView = View.inflate(this, paramInt, null);
    localBounceScrollView.addView(localView);
    setContentView(localBounceScrollView);
    return localView;
  }
  
  public void setContentViewC(int paramInt)
  {
    mContentViewID = paramInt;
    super.setContentView(paramInt);
  }
  
  public void setContentViewNoTitle(int paramInt)
  {
    mContentViewID = paramInt;
    mDensity = getResourcesgetDisplayMetricsdensity;
    View localView = LayoutInflater.from(this).inflate(paramInt, null, false);
    if ((mNeedStatusTrans) && (ImmersiveUtils.isSupporImmersive() == 1))
    {
      localView.setFitsSystemWindows(true);
      localView.setPadding(0, ImmersiveUtils.a(this), 0, 0);
    }
    super.setContentView(paramInt);
    getWindow().setFeatureInt(7, 2130903238);
    try
    {
      mTitleContainer = ((View)findViewById(2131297764).getParent());
      mTitleContainer.setVisibility(8);
      return;
    }
    catch (Throwable localThrowable) {}
  }
  
  public String setLastActivityName()
  {
    if ((centerView == null) || (centerView.getText() == null) || (centerView.getText().length() == 0)) {
      return getString(2131367694);
    }
    return centerView.getText().toString();
  }
  
  public void setLeftButton(int paramInt, View.OnClickListener paramOnClickListener)
  {
    leftView.setVisibility(8);
    leftViewNotBack = ((TextView)findViewById(2131297323));
    setLayerType(leftViewNotBack);
    leftViewNotBack.setVisibility(0);
    leftViewNotBack.setText(paramInt);
    if (paramOnClickListener == null)
    {
      leftViewNotBack.setOnClickListener(onBackListeger);
      return;
    }
    leftViewNotBack.setOnClickListener(paramOnClickListener);
  }
  
  public void setLeftViewName(int paramInt)
  {
    if ((leftView != null) && ((leftView instanceof TextView)))
    {
      if (leftViewNotBack != null) {
        leftViewNotBack.setVisibility(8);
      }
      String str2 = getString(paramInt);
      TextView localTextView = leftView;
      String str1;
      if (str2 != null)
      {
        str1 = str2;
        if (!"".equals(str2)) {}
      }
      else
      {
        str1 = getString(2131367694);
      }
      localTextView.setText(str1);
      localTextView.setVisibility(0);
    }
  }
  
  public void setLeftViewName(Intent paramIntent)
  {
    if ((leftView != null) && ((leftView instanceof TextView)) && (paramIntent != null) && (paramIntent.getExtras() != null)) {
      if (leftViewNotBack != null) {
        leftViewNotBack.setVisibility(8);
      }
    }
    try
    {
      TextView localTextView = leftView;
      Object localObject = paramIntent.getExtras().getString("leftViewText");
      int i = paramIntent.getExtras().getInt("individuation_url_type");
      paramIntent = (Intent)localObject;
      if (i >= 40300)
      {
        paramIntent = (Intent)localObject;
        if (i <= 40313)
        {
          paramIntent = (Intent)localObject;
          if (!TextUtils.isEmpty((CharSequence)localObject))
          {
            paramIntent = (Intent)localObject;
            if (((String)localObject).contains("消息")) {
              paramIntent = getString(2131367694);
            }
          }
        }
      }
      localObject = paramIntent;
      if (paramIntent == null) {
        localObject = getString(2131367694);
      }
      localTextView.setText((CharSequence)localObject);
      localTextView.setVisibility(0);
      return;
    }
    catch (Exception paramIntent) {}
  }
  
  public void setRightButton(int paramInt, View.OnClickListener paramOnClickListener)
  {
    isRightHighlightButton = false;
    rightViewText.setVisibility(0);
    rightViewText.setText(paramInt);
    rightViewText.setEnabled(true);
    if (paramOnClickListener != null) {
      rightViewText.setOnClickListener(paramOnClickListener);
    }
    if (AppSetting.i) {
      rightViewText.setContentDescription(rightViewText.getText() + "按钮");
    }
  }
  
  protected void setRightHighlightButton(int paramInt, View.OnClickListener paramOnClickListener)
  {
    isRightHighlightButton = true;
    if (rightViewText != null)
    {
      rightViewText.setVisibility(0);
      rightViewText.setText(paramInt);
      rightViewText.setEnabled(false);
      rightHighLView = ((TextView)getLayoutInflater().inflate(2130903225, null));
      setLayerType(rightHighLView);
      rightHighLView.setText(paramInt);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(11, 1);
      localLayoutParams.addRule(15, 1);
      rightMargin = ((int)(8.0F * mDensity));
      vg.addView(rightHighLView, localLayoutParams);
      rightHighLView.setVisibility(8);
      if (paramOnClickListener != null) {
        rightHighLView.setOnClickListener(paramOnClickListener);
      }
    }
  }
  
  public void setTitle(int paramInt)
  {
    setTitle(getString(paramInt));
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    if ((centerView != null) && ((centerView instanceof TextView)))
    {
      centerView.setText(paramCharSequence);
      super.setTitle(paramCharSequence);
    }
  }
  
  public void setTitle(CharSequence paramCharSequence, String paramString)
  {
    if ((centerView != null) && ((centerView instanceof TextView)))
    {
      TextView localTextView = centerView;
      localTextView.setText(paramCharSequence);
      if (AppSetting.i) {
        localTextView.setContentDescription(paramString);
      }
      super.setTitle(paramString);
    }
  }
  
  public void showContentViewTitle(boolean paramBoolean)
  {
    try
    {
      View localView = (View)findViewById(2131297322).getParent();
      if (paramBoolean) {}
      for (int i = 0;; i = 8)
      {
        localView.setVisibility(i);
        return;
      }
      return;
    }
    catch (Throwable localThrowable) {}
  }
  
  public boolean startTitleProgress()
  {
    if (centerView == null) {
      return false;
    }
    Object localObject1;
    if (mUseOptimizMode)
    {
      localObject1 = (RelativeLayout)findViewById(2131297033);
      if (centerView.getVisibility() == 0)
      {
        localObject1 = centerView;
        localObject2 = centerView.getParent();
        if ((mLoadingParent != null) && (mLoadingParent != localObject2))
        {
          if ((mLoadingView != null) && (mLoadingView.getParent() == mLoadingParent))
          {
            mLoadingParent.removeView(mLoadingView);
            mLoadingView = null;
          }
          mLoadingParent = null;
        }
        if ((mLoadingParent == null) && ((localObject2 instanceof RelativeLayout))) {
          mLoadingParent = ((RelativeLayout)localObject2);
        }
        localObject2 = localObject1;
        if (localObject1 != null)
        {
          localObject2 = localObject1;
          if (mLoadingView != null)
          {
            int i = ((View)localObject1).getId();
            RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)mLoadingView.getLayoutParams();
            localObject2 = localObject1;
            if (localLayoutParams.getRules()[0] != i)
            {
              localObject2 = (RelativeLayout.LayoutParams)((View)localObject1).getLayoutParams();
              rightMargin = 0;
              leftMargin = 0;
              ((View)localObject1).setLayoutParams((ViewGroup.LayoutParams)localObject2);
              localLayoutParams.addRule(0, i);
              mLoadingView.setLayoutParams(localLayoutParams);
            }
          }
        }
      }
    }
    for (Object localObject2 = localObject1;; localObject2 = null)
    {
      if ((mUseOptimizMode) && (mLoadingParent != null))
      {
        if ((mLoadingView != null) && (mLoadingView.getVisibility() == 0)) {
          break label521;
        }
        if (mLoadingView == null)
        {
          localObject1 = (RelativeLayout.LayoutParams)((View)localObject2).getLayoutParams();
          rightMargin = 0;
          leftMargin = 0;
          ((View)localObject2).setLayoutParams((ViewGroup.LayoutParams)localObject1);
          mLoadingView = new ImageView(this);
          mLoadingView.setId(2131298642);
          localObject1 = new RelativeLayout.LayoutParams(-2, -2);
          ((RelativeLayout.LayoutParams)localObject1).addRule(0, ((View)localObject2).getId());
          ((RelativeLayout.LayoutParams)localObject1).addRule(15);
          rightMargin = ((int)(7.0F * DeviceInfoUtil.a()));
          mLoadingParent.addView(mLoadingView, (ViewGroup.LayoutParams)localObject1);
          localObject1 = getActivity().getResources().getDrawable(2130838191);
          mLoadingView.setImageDrawable((Drawable)localObject1);
          if ((localObject1 instanceof Animatable)) {
            ((Animatable)localObject1).start();
          }
        }
        if (mLoadingView.getVisibility() != 0) {
          mLoadingView.setVisibility(0);
        }
        return true;
        if ((localObject1 == null) || (((RelativeLayout)localObject1).getVisibility() != 0)) {
          break label523;
        }
        localObject2 = ((RelativeLayout)localObject1).getParent();
        break;
      }
      if (ad == null)
      {
        ad = getResources().getDrawable(2130838191);
        mOldDrawables = centerView.getCompoundDrawables();
        mOldPadding = centerView.getCompoundDrawablePadding();
        centerView.setCompoundDrawablePadding(10);
        centerView.setCompoundDrawablesWithIntrinsicBounds(ad, mOldDrawables[1], mOldDrawables[2], mOldDrawables[3]);
        ((Animatable)ad).start();
        return true;
      }
      label521:
      return false;
      label523:
      localObject2 = null;
      localObject1 = null;
      break;
    }
  }
  
  public boolean stopTitleProgress()
  {
    if ((mUseOptimizMode) && (mLoadingParent != null))
    {
      if ((mLoadingView != null) && (mLoadingView.getVisibility() != 8))
      {
        mLoadingView.setVisibility(8);
        return true;
      }
    }
    else if (ad != null)
    {
      ((Animatable)ad).stop();
      ad = null;
      centerView.setCompoundDrawablePadding(mOldPadding);
      centerView.setCompoundDrawablesWithIntrinsicBounds(mOldDrawables[0], mOldDrawables[1], mOldDrawables[2], mOldDrawables[3]);
      return true;
    }
    return false;
  }
}
