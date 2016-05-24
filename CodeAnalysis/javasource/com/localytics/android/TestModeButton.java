package com.localytics.android;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import android.view.Display;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.TranslateAnimation;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

public class TestModeButton
  extends DialogFragment
{
  private Map<Integer, AmpCallable> mCallbacks;
  private AtomicBoolean mEnterAnimatable = new AtomicBoolean(true);
  
  public TestModeButton() {}
  
  public static TestModeButton newInstance()
  {
    TestModeButton localTestModeButton = new TestModeButton();
    localTestModeButton.setRetainInstance(true);
    return localTestModeButton;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onActivityCreated");
    }
    super.onActivityCreated(paramBundle);
  }
  
  public void onAttach(Activity paramActivity)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onAttach");
    }
    super.onAttach(paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onCreate");
    }
    super.onCreate(paramBundle);
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onCreateDialog");
    }
    return new TestModeDialog(getActivity(), 16973835);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onCreateView");
    }
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDestroy()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onDestroy");
    }
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onDestroyView");
    }
    if ((getDialog() != null) && (getRetainInstance())) {
      getDialog().setOnDismissListener(null);
    }
    super.onDestroyView();
  }
  
  public void onDetach()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onDetach");
    }
    super.onDetach();
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onDismiss");
    }
    super.onDismiss(paramDialogInterface);
  }
  
  public void onPause()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onPause");
    }
    super.onPause();
  }
  
  public void onResume()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpTestButtonFragment", "onResume");
    }
    super.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onSaveInstanceState");
    }
    super.onSaveInstanceState(paramBundle);
  }
  
  public void onStart()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onStart");
    }
    super.onStart();
  }
  
  public void onStop()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onStop");
    }
    super.onStop();
  }
  
  public void onViewStateRestored(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeButton", "onViewStateRestored");
    }
    super.onViewStateRestored(paramBundle);
  }
  
  public TestModeButton setCallbacks(Map<Integer, AmpCallable> paramMap)
  {
    mCallbacks = paramMap;
    return this;
  }
  
  public void show(FragmentManager paramFragmentManager, String paramString)
  {
    mEnterAnimatable.set(true);
    super.show(paramFragmentManager, paramString);
  }
  
  class TestModeDialog
    extends Dialog
  {
    private TranslateAnimation mAnimIn;
    private TranslateAnimation mAnimOut;
    private RelativeLayout mDialogLayout;
    private DisplayMetrics mMetrics;
    
    public TestModeDialog(Context paramContext, int paramInt)
    {
      super(paramInt);
      setupViews();
      createAnimations();
      adjustLayout();
    }
    
    @SuppressLint({"NewApi"})
    private void adjustLayout()
    {
      mMetrics = new DisplayMetrics();
      ((WindowManager)getActivity().getSystemService("window")).getDefaultDisplay().getMetrics(mMetrics);
      Window localWindow = getWindow();
      localWindow.setBackgroundDrawable(new ColorDrawable(0));
      localWindow.setGravity(51);
      WindowManager.LayoutParams localLayoutParams = localWindow.getAttributes();
      x = ((int)TypedValue.applyDimension(1, 0.0F, mMetrics));
      y = ((int)TypedValue.applyDimension(1, 85.0F, mMetrics));
      dimAmount = 0.0F;
      localWindow.setAttributes(localLayoutParams);
      localWindow.clearFlags(2);
      localWindow.setFlags(32, 32);
      if (mEnterAnimatable.getAndSet(false)) {
        mDialogLayout.startAnimation(mAnimIn);
      }
      localWindow.setFlags(1024, 1024);
    }
    
    private void createAnimations()
    {
      mAnimIn = new TranslateAnimation(2, -1.0F, 2, 0.0F, 2, 0.0F, 2, 0.0F);
      mAnimIn.setDuration(250L);
      mAnimOut = new TranslateAnimation(2, 0.0F, 2, -1.0F, 2, 0.0F, 2, 0.0F);
      mAnimOut.setDuration(250L);
      mAnimOut.setAnimationListener(new Animation.AnimationListener()
      {
        public void onAnimationEnd(Animation paramAnonymousAnimation)
        {
          dismiss();
        }
        
        public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
        
        public void onAnimationStart(Animation paramAnonymousAnimation) {}
      });
    }
    
    private void setupViews()
    {
      mDialogLayout = new RelativeLayout(getContext());
      Object localObject = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject).addRule(13);
      mDialogLayout.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localObject = new Button(getContext(), null);
      ((Button)localObject).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          mDialogLayout.startAnimation(mAnimOut);
          if (mCallbacks != null)
          {
            paramAnonymousView = (AmpCallable)mCallbacks.get(Integer.valueOf(9));
            if (paramAnonymousView != null) {
              paramAnonymousView.call(null);
            }
          }
        }
      });
      mDialogLayout.addView((View)localObject);
      requestWindowFeature(1);
      setContentView(mDialogLayout);
    }
    
    public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
    {
      if (paramInt == 4) {
        mDialogLayout.startAnimation(mAnimOut);
      }
      return super.onKeyDown(paramInt, paramKeyEvent);
    }
    
    class Button
      extends View
    {
      private final int BACKGROUND_COLOR = Color.argb(255, 51, 51, 51);
      private final int BAR1_COLOR = Color.argb(255, 138, 138, 138);
      private final int BAR2_COLOR = Color.argb(255, 217, 217, 217);
      private final int BAR3_COLOR = Color.argb(255, 220, 220, 220);
      private final int OVAL_COLOR = Color.argb(255, 70, 70, 70);
      private Paint mPaint;
      private RectF mRectF;
      
      @TargetApi(11)
      public Button(Context paramContext, AttributeSet paramAttributeSet)
      {
        super(paramAttributeSet);
        if (DatapointHelper.getApiLevel() >= 19) {
          setLayerType(1, null);
        }
        float f = getResourcesgetDisplayMetricsdensity;
        mRectF = new RectF(55.0F * f, 0.0F, 65.0F * f, 60.0F * f);
        setLayoutParams(new RelativeLayout.LayoutParams((int)(65.0F * f + 0.5F), (int)(60.0F * f + 0.5F)));
        mPaint = new Paint(1);
        mPaint.setColor(BACKGROUND_COLOR);
        mPaint.setStyle(Paint.Style.FILL);
      }
      
      protected void onDraw(Canvas paramCanvas)
      {
        super.onDraw(paramCanvas);
        float f = getResourcesgetDisplayMetricsdensity;
        mPaint.setColor(BACKGROUND_COLOR);
        paramCanvas.drawRect(0.0F, 0.0F, 60.0F * f, 60.0F * f, mPaint);
        paramCanvas.drawRoundRect(mRectF, 5.0F * f, 5.0F * f, mPaint);
        mPaint.setColor(BAR1_COLOR);
        paramCanvas.drawRect(7.0F * f, 42.0F * f, 13.0F * f, 48.0F * f, mPaint);
        mPaint.setColor(BAR2_COLOR);
        paramCanvas.drawRect(16.0F * f, 36.0F * f, 22.0F * f, 48.0F * f, mPaint);
        mPaint.setColor(BAR3_COLOR);
        paramCanvas.drawRect(25.0F * f, 27.0F * f, 31.0F * f, 48.0F * f, mPaint);
        mPaint.setColor(-1);
        paramCanvas.drawRect(34.0F * f, 12.0F * f, 40.0F * f, 48.0F * f, mPaint);
        mPaint.setColor(-1);
        paramCanvas.drawRect(37.0F * f, 42.0F * f, 55.0F * f, 48.0F * f, mPaint);
        mPaint.setColor(OVAL_COLOR);
        paramCanvas.drawOval(new RectF(59.0F * f, 40.0F * f, 63.0F * f, 44.0F * f), mPaint);
        paramCanvas.drawOval(new RectF(59.0F * f, 30.0F * f, 63.0F * f, 34.0F * f), mPaint);
        paramCanvas.drawOval(new RectF(59.0F * f, 20.0F * f, 63.0F * f, 24.0F * f), mPaint);
        paramCanvas.drawOval(new RectF(59.0F * f, 10.0F * f, 63.0F * f, 14.0F * f), mPaint);
        paramCanvas.drawOval(new RectF(54.0F * f, 35.0F * f, 58.0F * f, 39.0F * f), mPaint);
        paramCanvas.drawOval(new RectF(54.0F * f, 25.0F * f, 58.0F * f, 29.0F * f), mPaint);
        paramCanvas.drawOval(new RectF(54.0F * f, 15.0F * f, 58.0F * f, 19.0F * f), mPaint);
      }
    }
  }
}
