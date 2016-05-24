package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.android.ui.view.AdobeTextView;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils.PackOption;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils.PackOptionWithPrice;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.string;
import com.aviary.android.feather.sdk.R.styleable;

public class IAPBuyButton
  extends RelativeLayout
{
  Runnable checkDownloadStatus = new Runnable()
  {
    public void run()
    {
      if ((mPackId > -1L) && (getContext() != null) && (mOption != null))
      {
        Pair localPair = CdsUtils.getPackOptionDownloadStatus(getContext(), mPackId);
        if ((localPair != null) && (getContext() != null)) {
          setPackOption(new CdsUtils.PackOptionWithPrice((CdsUtils.PackOption)first), mPackId);
        }
      }
    }
  };
  CdsUtils.PackOptionWithPrice mOption;
  private ColorStateList mOriginalTextColor;
  long mPackId;
  View mProgress;
  Drawable[] mTextDrawablesCurrent;
  Drawable[] mTextDrawablesFreeWithLogin;
  Drawable[] mTextDrawablesOther;
  TextView mTextView;
  
  public IAPBuyButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public IAPBuyButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.getTheme().obtainStyledAttributes(paramAttributeSet, R.styleable.AdobeImageBuyButton, paramInt, 0);
    int i = localTypedArray.getResourceId(R.styleable.AdobeImageBuyButton_adobe_buttonStyle, 0);
    int j = localTypedArray.getResourceId(R.styleable.AdobeImageBuyButton_adobe_progressStyle, 0);
    paramAttributeSet = new AdobeTextView(new ContextThemeWrapper(paramContext, i), paramAttributeSet, paramInt, i);
    paramAttributeSet.setDuplicateParentStateEnabled(true);
    paramAttributeSet.setId(16908308);
    mTextDrawablesFreeWithLogin = paramAttributeSet.getCompoundDrawables();
    mTextDrawablesCurrent = mTextDrawablesFreeWithLogin;
    mTextDrawablesOther = new Drawable[] { null, mTextDrawablesFreeWithLogin[1], mTextDrawablesFreeWithLogin[2], mTextDrawablesFreeWithLogin[3] };
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
    localLayoutParams.addRule(15, -1);
    addView(paramAttributeSet, localLayoutParams);
    paramContext = new ProgressBar(paramContext, null, 0, j);
    paramContext.setIndeterminate(true);
    paramContext.setId(R.id.progress);
    paramAttributeSet = new RelativeLayout.LayoutParams(-2, -2);
    paramAttributeSet.addRule(13, -1);
    addView(paramContext, paramAttributeSet);
    localTypedArray.recycle();
  }
  
  private void restoreFreeWithLoginDrawableTint()
  {
    Drawable localDrawable = mTextDrawablesFreeWithLogin[0];
    if (localDrawable != null) {
      UIUtils.clearDrawableTint(localDrawable.mutate());
    }
  }
  
  public long getPackId()
  {
    return mPackId;
  }
  
  public CdsUtils.PackOptionWithPrice getPackOption()
  {
    return mOption;
  }
  
  public TextView getTextView()
  {
    return mTextView;
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    getHandler().removeCallbacks(checkDownloadStatus);
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    mTextView = ((TextView)findViewById(16908308));
    mProgress = findViewById(R.id.progress);
    mOriginalTextColor = getTextView().getTextColors();
  }
  
  public void restoreTintColor()
  {
    getTextView().getBackground().setColorFilter(-1, PorterDuff.Mode.MULTIPLY);
    getTextView().setTextColor(mOriginalTextColor);
    restoreFreeWithLoginDrawableTint();
    postInvalidate();
  }
  
  public void setFreeWithLoginDrawableTint(int paramInt)
  {
    Drawable localDrawable = mTextDrawablesFreeWithLogin[0];
    if (localDrawable != null) {
      UIUtils.setDrawableTint(localDrawable.mutate(), paramInt);
    }
  }
  
  public void setPackOption(CdsUtils.PackOptionWithPrice paramPackOptionWithPrice, long paramLong)
  {
    if ((paramPackOptionWithPrice != null) && (paramPackOptionWithPrice.equals(mOption))) {}
    do
    {
      do
      {
        do
        {
          return;
          mOption = paramPackOptionWithPrice;
          mPackId = paramLong;
          if (getHandler() != null) {
            getHandler().removeCallbacks(checkDownloadStatus);
          }
        } while (paramPackOptionWithPrice == null);
        boolean bool = isEnabled();
        int i = mProgress.getVisibility();
        int j = mTextView.getVisibility();
        paramPackOptionWithPrice = new InnerVisibility(paramPackOptionWithPrice, true, 4, 0).invoke();
        if (bool != paramPackOptionWithPrice.isNewEnableStatus()) {
          setEnabled(newEnableStatus);
        }
        if (i != newProgressVisibility) {
          mProgress.setVisibility(newProgressVisibility);
        }
        if (j != newTextVisibility) {
          mTextView.setVisibility(newTextVisibility);
        }
      } while (mOption == null);
      if ((mOption.option == CdsUtils.PackOption.FREE_WITH_LOGIN) && (mTextDrawablesCurrent != mTextDrawablesFreeWithLogin))
      {
        mTextDrawablesCurrent = mTextDrawablesFreeWithLogin;
        getTextView().setCompoundDrawables(mTextDrawablesCurrent[0], mTextDrawablesCurrent[1], mTextDrawablesCurrent[2], mTextDrawablesCurrent[3]);
        return;
      }
    } while (mTextDrawablesCurrent == mTextDrawablesOther);
    mTextDrawablesCurrent = mTextDrawablesOther;
    getTextView().setCompoundDrawables(mTextDrawablesCurrent[0], mTextDrawablesCurrent[1], mTextDrawablesCurrent[2], mTextDrawablesCurrent[3]);
  }
  
  public void setTintColor(int paramInt1, int paramInt2)
  {
    getTextView().getBackground().setColorFilter(paramInt1, PorterDuff.Mode.ADD);
    getTextView().setTextColor(ColorStateList.valueOf(paramInt2));
    setFreeWithLoginDrawableTint(paramInt2);
  }
  
  private class InnerVisibility
  {
    private boolean newEnableStatus;
    private int newProgressVisibility;
    private int newTextVisibility;
    private final CdsUtils.PackOptionWithPrice option;
    
    public InnerVisibility(CdsUtils.PackOptionWithPrice paramPackOptionWithPrice, boolean paramBoolean, int paramInt1, int paramInt2)
    {
      option = paramPackOptionWithPrice;
      newEnableStatus = paramBoolean;
      newProgressVisibility = paramInt1;
      newTextVisibility = paramInt2;
    }
    
    public InnerVisibility invoke()
    {
      switch (IAPBuyButton.2.$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption[option.option.ordinal()])
      {
      default: 
      case 1: 
      case 2: 
      case 3: 
      case 4: 
      case 5: 
      case 6: 
      case 7: 
      case 8: 
      case 9: 
        do
        {
          return this;
          mTextView.setText(R.string.feather_iap_restore);
          return this;
          mTextView.setVisibility(0);
          if (option.price != null)
          {
            mTextView.setText(option.price);
            return this;
          }
          mTextView.setText(R.string.feather_iap_unavailable);
          return this;
          mTextView.setText(R.string.feather_iap_owned);
          newEnableStatus = false;
          return this;
          mTextView.setText(R.string.feather_iap_uninstall);
          return this;
          mTextView.setText(R.string.feather_iap_retry);
          return this;
          mTextView.setText(R.string.feather_iap_download);
          return this;
          mTextView.setText(R.string.feather_iap_installing);
          newEnableStatus = false;
          return this;
          newProgressVisibility = 0;
          mTextView.setText("");
          newEnableStatus = false;
        } while (getHandler() == null);
        getHandler().postDelayed(checkDownloadStatus, (Math.random() * 100.0D + 900.0D));
        return this;
      case 10: 
        newProgressVisibility = 0;
        newTextVisibility = 0;
        mTextView.setText("");
        newEnableStatus = false;
        return this;
      }
      mTextView.setText(R.string.feather_iap_retry);
      return this;
    }
    
    public boolean isNewEnableStatus()
    {
      return newEnableStatus;
    }
  }
}
