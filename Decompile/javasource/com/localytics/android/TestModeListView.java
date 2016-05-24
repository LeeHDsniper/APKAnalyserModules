package com.localytics.android;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.GradientDrawable.Orientation;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.DisplayMetrics;
import android.util.Log;
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
import android.widget.AbsListView.LayoutParams;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

public class TestModeListView
  extends DialogFragment
{
  private ListAdapter mAdapter;
  private Map<Integer, AmpCallable> mCallbacks;
  private AtomicBoolean mEnterAnimatable = new AtomicBoolean(true);
  
  public TestModeListView() {}
  
  public static TestModeListView newInstance()
  {
    TestModeListView localTestModeListView = new TestModeListView();
    localTestModeListView.setRetainInstance(true);
    return localTestModeListView;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onActivityCreated");
    }
    super.onActivityCreated(paramBundle);
  }
  
  public void onAttach(Activity paramActivity)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onAttach");
    }
    super.onAttach(paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onCreate");
    }
    super.onCreate(paramBundle);
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onCreateDialog");
    }
    return new TestModeDialog(getActivity(), 16973835);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onCreateView");
    }
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDestroy()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onDestroy");
    }
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onDestroyView");
    }
    if ((getDialog() != null) && (getRetainInstance())) {
      getDialog().setOnDismissListener(null);
    }
    super.onDestroyView();
  }
  
  public void onDetach()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onDetach");
    }
    super.onDetach();
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onDismiss");
    }
    super.onDismiss(paramDialogInterface);
  }
  
  public void onPause()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onPause");
    }
    super.onPause();
  }
  
  public void onResume()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onResume");
    }
    super.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onSaveInstanceState");
    }
    super.onSaveInstanceState(paramBundle);
  }
  
  public void onStart()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onStart");
    }
    super.onStart();
  }
  
  public void onStop()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onStop");
    }
    super.onStop();
  }
  
  public void onViewStateRestored(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("TestModeListView", "onViewStateRestored");
    }
    super.onViewStateRestored(paramBundle);
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    mAdapter = paramListAdapter;
  }
  
  public TestModeListView setCallbacks(Map<Integer, AmpCallable> paramMap)
  {
    mCallbacks = paramMap;
    return this;
  }
  
  public void show(FragmentManager paramFragmentManager, String paramString)
  {
    mEnterAnimatable.set(true);
    super.show(paramFragmentManager, paramString);
  }
  
  class CancelItemAdapter
    extends BaseAdapter
  {
    private final String[] MENU_ITEMS = { "Cancel" };
    private Context mContext;
    
    public CancelItemAdapter(Context paramContext)
    {
      mContext = paramContext;
    }
    
    public int getCount()
    {
      return MENU_ITEMS.length;
    }
    
    public String getItem(int paramInt)
    {
      return MENU_ITEMS[paramInt];
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      paramViewGroup = paramView;
      paramView = paramViewGroup;
      if (paramViewGroup == null)
      {
        paramView = new LinearLayout(mContext);
        paramView.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
        paramView.setOrientation(1);
        int i = (int)(mContext.getResources().getDisplayMetrics().density * 6.0F + 0.5F);
        paramView.setPadding(0, i, 0, i);
        paramViewGroup = new TextView(mContext);
        paramViewGroup.setId(1);
        paramViewGroup.setTextSize(26.0F);
        paramViewGroup.setTextColor(Color.argb(255, 0, 91, 255));
        paramViewGroup.setGravity(17);
        paramView.addView(paramViewGroup);
        float f = getResources().getDisplayMetrics().density * 8.0F;
        paramViewGroup = new GradientDrawable(GradientDrawable.Orientation.TL_BR, new int[] { -1, -1, -1 });
        paramViewGroup.setGradientType(0);
        paramViewGroup.setCornerRadii(new float[] { f, f, f, f, f, f, f, f });
        paramView.setBackground(paramViewGroup);
      }
      paramViewGroup = (TextView)paramView.findViewById(1);
      paramViewGroup.setText(MENU_ITEMS[paramInt]);
      paramViewGroup.setTypeface(null, 1);
      return paramView;
    }
  }
  
  class MenuDialog
    extends Dialog
  {
    private LinearLayout mDialogLayout;
    private DisplayMetrics mMetrics;
    
    public MenuDialog(Context paramContext, int paramInt)
    {
      super(paramInt);
      setupViews();
      adjustLayout();
    }
    
    private void adjustLayout()
    {
      mMetrics = new DisplayMetrics();
      ((WindowManager)getActivity().getSystemService("window")).getDefaultDisplay().getMetrics(mMetrics);
      Window localWindow = getWindow();
      localWindow.setBackgroundDrawable(new ColorDrawable(0));
      localWindow.setAttributes(localWindow.getAttributes());
      localWindow.setFlags(1024, 1024);
    }
    
    private void setupViews()
    {
      mDialogLayout = new LinearLayout(getContext());
      mDialogLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
      mDialogLayout.setGravity(16);
      mDialogLayout.setOrientation(1);
      Object localObject = new TestModeListView.MenuItemAdapter(TestModeListView.this, getActivity());
      ListView localListView = new ListView(getActivity());
      localListView.setAdapter((ListAdapter)localObject);
      localListView.setBackground(new ColorDrawable(0));
      localListView.setDividerHeight(1);
      localListView.setOnItemClickListener(new AdapterView.OnItemClickListener()
      {
        @TargetApi(11)
        public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          if (paramAnonymousInt == 0)
          {
            AmpConstants.setTestModeEnabled(false);
            dismiss();
          }
          for (;;)
          {
            dismiss();
            return;
            if (paramAnonymousInt == 1)
            {
              if (mCallbacks != null)
              {
                paramAnonymousAdapterView = (AmpCallable)mCallbacks.get(Integer.valueOf(12));
                if (paramAnonymousAdapterView != null) {
                  paramAnonymousAdapterView.call(null);
                }
              }
            }
            else if (paramAnonymousInt == 2)
            {
              if (mCallbacks != null)
              {
                paramAnonymousAdapterView = (AmpCallable)mCallbacks.get(Integer.valueOf(13));
                if (paramAnonymousAdapterView != null) {
                  paramAnonymousAdapterView.call(null);
                }
              }
            }
            else if ((paramAnonymousInt == 3) && (mCallbacks != null))
            {
              paramAnonymousAdapterView = (AmpCallable)mCallbacks.get(Integer.valueOf(14));
              if (paramAnonymousAdapterView != null) {
                paramAnonymousAdapterView.call(null);
              }
            }
          }
        }
      });
      mDialogLayout.addView(localListView);
      localObject = new View(getActivity());
      ((View)localObject).setBackground(new ColorDrawable(0));
      ((View)localObject).setLayoutParams(new LinearLayout.LayoutParams(-1, (int)(getResources().getDisplayMetrics().density * 10.0F + 0.5F)));
      mDialogLayout.addView((View)localObject);
      localObject = new TestModeListView.CancelItemAdapter(TestModeListView.this, getActivity());
      localListView = new ListView(getActivity());
      localListView.setAdapter((ListAdapter)localObject);
      localListView.setBackground(new ColorDrawable(0));
      localListView.setOnItemClickListener(new AdapterView.OnItemClickListener()
      {
        public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          dismiss();
        }
      });
      mDialogLayout.addView(localListView);
      requestWindowFeature(1);
      setContentView(mDialogLayout);
    }
  }
  
  class MenuItemAdapter
    extends BaseAdapter
  {
    private final String[] MENU_ITEMS = { "Disable Test Mode", "Refresh", "Copy Push Token", "Copy Install ID" };
    private Context mContext;
    
    public MenuItemAdapter(Context paramContext)
    {
      mContext = paramContext;
    }
    
    private Drawable getShape(int paramInt)
    {
      float f = getResources().getDisplayMetrics().density * 8.0F;
      GradientDrawable localGradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TL_BR, new int[] { -1, -1, -1 });
      localGradientDrawable.setGradientType(0);
      switch (paramInt)
      {
      case 1: 
      case 2: 
      default: 
        return localGradientDrawable;
      case 0: 
        localGradientDrawable.setCornerRadii(new float[] { f, f, f, f, 0.0F, 0.0F, 0.0F, 0.0F });
        return localGradientDrawable;
      }
      localGradientDrawable.setCornerRadii(new float[] { 0.0F, 0.0F, 0.0F, 0.0F, f, f, f, f });
      return localGradientDrawable;
    }
    
    public int getCount()
    {
      return MENU_ITEMS.length;
    }
    
    public String getItem(int paramInt)
    {
      return MENU_ITEMS[paramInt];
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      paramViewGroup = paramView;
      paramView = paramViewGroup;
      if (paramViewGroup == null)
      {
        paramView = new LinearLayout(mContext);
        paramView.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
        paramView.setOrientation(1);
        int i = (int)(mContext.getResources().getDisplayMetrics().density * 6.0F + 0.5F);
        paramView.setPadding(0, i, 0, i);
        paramViewGroup = new TextView(mContext);
        paramViewGroup.setId(1);
        paramViewGroup.setTextSize(26.0F);
        paramViewGroup.setTextColor(Color.argb(255, 0, 91, 255));
        paramViewGroup.setGravity(17);
        paramView.addView(paramViewGroup);
        paramView.setBackground(getShape(paramInt));
      }
      paramViewGroup = (TextView)paramView.findViewById(1);
      paramViewGroup.setText(MENU_ITEMS[paramInt]);
      switch (paramInt)
      {
      default: 
        return paramView;
      }
      paramViewGroup.setTextColor(-65536);
      return paramView;
    }
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
      localWindow.setGravity(17);
      WindowManager.LayoutParams localLayoutParams = localWindow.getAttributes();
      dimAmount = 0.0F;
      width = mMetrics.widthPixels;
      localWindow.setAttributes(localLayoutParams);
      if (mEnterAnimatable.getAndSet(false)) {
        mDialogLayout.startAnimation(mAnimIn);
      }
      localWindow.setFlags(1024, 1024);
    }
    
    private void createAnimations()
    {
      mAnimIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 1.0F, 2, 0.0F);
      mAnimIn.setDuration(250L);
      mAnimOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, 1.0F);
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
      float f = getResources().getDisplayMetrics().density;
      mDialogLayout = new RelativeLayout(getContext());
      mDialogLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
      mDialogLayout.setBackgroundColor(-1);
      RelativeLayout localRelativeLayout = new RelativeLayout(getContext());
      Object localObject1 = new RelativeLayout.LayoutParams(-1, -2);
      ((RelativeLayout.LayoutParams)localObject1).addRule(10);
      localRelativeLayout.setId(1);
      localRelativeLayout.setLayoutParams((ViewGroup.LayoutParams)localObject1);
      localRelativeLayout.setBackgroundColor(Color.argb(255, 73, 73, 73));
      localRelativeLayout.setPadding((int)(8.0F * f + 0.5F), (int)(12.0F * f + 0.5F), (int)(8.0F * f + 0.5F), (int)(12.0F * f + 0.5F));
      mDialogLayout.addView(localRelativeLayout);
      localObject1 = new TextView(getContext());
      ((TextView)localObject1).setText("Close");
      ((TextView)localObject1).setTextSize(22.0F);
      Object localObject2 = { 16842919 };
      int[] arrayOfInt1 = { 16842908 };
      int[] arrayOfInt2 = new int[0];
      int i = Color.argb(255, 255, 0, 0);
      int j = Color.argb(255, 0, 91, 255);
      int k = Color.argb(255, 0, 91, 255);
      ((TextView)localObject1).setTextColor(new ColorStateList(new int[][] { localObject2, arrayOfInt1, arrayOfInt2 }, new int[] { i, j, k }));
      ((TextView)localObject1).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          mDialogLayout.startAnimation(mAnimOut);
          if (mCallbacks != null)
          {
            paramAnonymousView = (AmpCallable)mCallbacks.get(Integer.valueOf(10));
            if (paramAnonymousView != null) {
              paramAnonymousView.call(null);
            }
          }
        }
      });
      localObject2 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject2).addRule(9);
      ((TextView)localObject1).setLayoutParams((ViewGroup.LayoutParams)localObject2);
      localRelativeLayout.addView((View)localObject1);
      localObject1 = new TextView(getContext());
      ((TextView)localObject1).setText("Localytics");
      ((TextView)localObject1).setTextSize(22.0F);
      ((TextView)localObject1).setTextColor(-1);
      localObject2 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject2).addRule(13);
      ((TextView)localObject1).setLayoutParams((ViewGroup.LayoutParams)localObject2);
      localRelativeLayout.addView((View)localObject1);
      localObject1 = new TextView(getContext());
      ((TextView)localObject1).setText("Menu");
      ((TextView)localObject1).setTextSize(22.0F);
      localObject2 = new int[] { 16842919 };
      arrayOfInt1 = new int[] { 16842908 };
      arrayOfInt2 = new int[0];
      i = Color.argb(255, 255, 0, 0);
      j = Color.argb(255, 0, 91, 255);
      k = Color.argb(255, 0, 91, 255);
      ((TextView)localObject1).setTextColor(new ColorStateList(new int[][] { localObject2, arrayOfInt1, arrayOfInt2 }, new int[] { i, j, k }));
      ((TextView)localObject1).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          if (mCallbacks != null) {
            new TestModeListView.MenuDialog(TestModeListView.this, getActivity(), 16973835).show();
          }
        }
      });
      localObject2 = new RelativeLayout.LayoutParams(-2, -2);
      ((RelativeLayout.LayoutParams)localObject2).addRule(11);
      ((TextView)localObject1).setLayoutParams((ViewGroup.LayoutParams)localObject2);
      localRelativeLayout.addView((View)localObject1);
      localRelativeLayout = new RelativeLayout(getContext());
      localObject1 = new RelativeLayout.LayoutParams(-1, -1);
      ((RelativeLayout.LayoutParams)localObject1).addRule(3, 1);
      localRelativeLayout.setLayoutParams((ViewGroup.LayoutParams)localObject1);
      mDialogLayout.addView(localRelativeLayout);
      localObject1 = new ListView(getContext());
      ((ListView)localObject1).setAdapter(mAdapter);
      ((ListView)localObject1).setOnItemClickListener(new AdapterView.OnItemClickListener()
      {
        public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          if (mCallbacks != null)
          {
            paramAnonymousView = (AmpCallable)mCallbacks.get(Integer.valueOf(11));
            if (paramAnonymousView != null) {
              paramAnonymousView.call(new Object[] { paramAnonymousAdapterView.getItemAtPosition(paramAnonymousInt) });
            }
          }
        }
      });
      localRelativeLayout.addView((View)localObject1);
      requestWindowFeature(1);
      setContentView(mDialogLayout);
    }
    
    public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
    {
      if (paramInt == 4)
      {
        mDialogLayout.startAnimation(mAnimOut);
        if (mCallbacks != null)
        {
          AmpCallable localAmpCallable = (AmpCallable)mCallbacks.get(Integer.valueOf(10));
          if (localAmpCallable != null) {
            localAmpCallable.call(null);
          }
        }
        return super.onKeyDown(paramInt, paramKeyEvent);
      }
      return super.onKeyDown(paramInt, paramKeyEvent);
    }
  }
}
