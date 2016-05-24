package com.localytics.android;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BlurMaskFilter;
import android.graphics.BlurMaskFilter.Blur;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.TranslateAnimation;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicBoolean;

public class AmpDialogFragment
  extends DialogFragment
{
  private static Bitmap sDismissButtonImage;
  private AmpDialog mAmpDialog;
  private Map<String, Object> mAmpMessage;
  private Map<Integer, AmpCallable> mCallbacks;
  private AtomicBoolean mEnterAnimatable = new AtomicBoolean(true);
  private AtomicBoolean mExitAnimatable = new AtomicBoolean(true);
  private JavaScriptClient mJavaScriptClient;
  private AtomicBoolean mUploadedViewEvent = new AtomicBoolean(false);
  
  public AmpDialogFragment() {}
  
  private String getValueByQueryKey(String paramString, URI paramURI)
  {
    Object localObject = paramURI.getQuery();
    if ((TextUtils.isEmpty(paramString)) || (TextUtils.isEmpty((CharSequence)localObject))) {}
    for (;;)
    {
      return null;
      paramURI = paramURI.getQuery().split("[&]");
      int j = paramURI.length;
      int i = 0;
      while (i < j)
      {
        localObject = paramURI[i].split("[=]");
        if ((localObject[0].compareTo(paramString) == 0) && (2 == localObject.length)) {
          try
          {
            paramString = URLDecoder.decode(localObject[1], "UTF-8");
            return paramString;
          }
          catch (UnsupportedEncodingException paramString)
          {
            return null;
          }
        }
        i += 1;
      }
    }
  }
  
  private String getValueByQueryKey(String paramString, URL paramURL)
  {
    try
    {
      paramString = getValueByQueryKey(paramString, paramURL.toURI());
      return paramString;
    }
    catch (URISyntaxException paramString) {}
    return null;
  }
  
  private int handleCustomProtocolRequest(String paramString, Activity paramActivity)
  {
    paramString = new Intent("android.intent.action.VIEW", Uri.parse(paramString));
    if (mAmpDialog.getContext().getPackageManager().queryIntentActivities(paramString, 0).size() > 0)
    {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", "[AMP Nav Handler]: An app on this device is registered to handle this protocol scheme. Opening...");
      }
      paramString.setFlags(131072);
      paramActivity.startActivity(paramString);
      return 2;
    }
    return -2;
  }
  
  private int handleCustomProtocolRequest(URL paramURL, Activity paramActivity)
  {
    return handleCustomProtocolRequest(paramURL.toString(), paramActivity);
  }
  
  private int handleFileProtocolRequest(URL paramURL)
  {
    if (!paramURL.getProtocol().equals("file")) {
      return -1;
    }
    if (Constants.IS_LOGGABLE) {
      Log.w("Localytics", String.format("[AMP Nav Handler]: Displaying content from your local creatives.", new Object[0]));
    }
    return 1;
  }
  
  private int handleHttpProtocolRequest(URL paramURL, Activity paramActivity)
  {
    int i = 1;
    String str = paramURL.getProtocol();
    if ((!str.equals("http")) && (!str.equals("https"))) {
      i = -1;
    }
    do
    {
      return i;
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", "[AMP Nav Handler]: Handling a request for an external HTTP address.");
      }
      str = getValueByQueryKey("ampExternalOpen", paramURL);
      if ((!TextUtils.isEmpty(str)) && (str.toLowerCase(Locale.US).equals("true")))
      {
        if (Constants.IS_LOGGABLE) {
          Log.w("Localytics", String.format("[AMP Nav Handler]: Query string hook [%s] set to true. Opening the URL in chrome", new Object[] { "ampExternalOpen" }));
        }
        paramURL = new Intent("android.intent.action.VIEW", Uri.parse(paramURL.toString()));
        if (mAmpDialog.getContext().getPackageManager().queryIntentActivities(paramURL, 0).size() > 0)
        {
          paramActivity.startActivity(paramURL);
          return 2;
        }
      }
    } while (!Constants.IS_LOGGABLE);
    Log.w("Localytics", "[AMP Nav Handler]: Loading HTTP request inside the current AMP view");
    return 1;
  }
  
  public static AmpDialogFragment newInstance()
  {
    AmpDialogFragment localAmpDialogFragment = new AmpDialogFragment();
    localAmpDialogFragment.setRetainInstance(true);
    return localAmpDialogFragment;
  }
  
  private void tagAmpActionEventWithAction(String paramString)
  {
    if (mUploadedViewEvent.getAndSet(true)) {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", String.format("The AMP action for this message has already been set. Ignoring AMP Action: [%s]", new Object[] { paramString }));
      }
    }
    do
    {
      do
      {
        return;
        localObject = new TreeMap();
        ((TreeMap)localObject).put("ampAction", paramString);
        ((TreeMap)localObject).put("ampCampaignId", mAmpMessage.get("campaign_id").toString());
        ((TreeMap)localObject).put("ampCampaign", mAmpMessage.get("rule_name").toString());
        paramString = (String)mAmpMessage.get("ab_test");
        if (!TextUtils.isEmpty(paramString)) {
          ((TreeMap)localObject).put("ampAB", paramString);
        }
      } while ((LocalyticsAmpSession.isTestModeEnabled()) || (mCallbacks == null));
      paramString = (AmpCallable)mCallbacks.get(Integer.valueOf(2));
      if (paramString != null) {
        paramString.call(new Object[] { "ampView", localObject });
      }
    } while (!Constants.IS_LOGGABLE);
    paramString = new StringBuilder();
    Object localObject = ((TreeMap)localObject).entrySet().iterator();
    while (((Iterator)localObject).hasNext())
    {
      Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
      paramString.append("Key = " + (String)localEntry.getKey() + ", Value = " + (String)localEntry.getValue());
    }
    Log.w("Localytics", String.format("AMP event tagged successfully.\n   Attributes Dictionary = \n%s", new Object[] { paramString.toString() }));
  }
  
  private void tagAmpActionForURL(URI paramURI)
  {
    String str = getValueByQueryKey("ampAction", paramURI);
    if (!TextUtils.isEmpty(str))
    {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", String.format("Attempting to tag event with custom AMP action.[Action: %s]", new Object[] { str }));
      }
      tagAmpActionEventWithAction(str);
    }
    do
    {
      return;
      paramURI = paramURI.getScheme();
    } while ((paramURI.equals("file")) || (paramURI.equals("http")) || (paramURI.equals("https")));
    tagAmpActionEventWithAction("click");
  }
  
  boolean handleUrl(String paramString, Activity paramActivity)
  {
    bool1 = true;
    boolean bool3 = true;
    bool4 = true;
    bool2 = true;
    Object localObject2 = paramString;
    if (Constants.IS_LOGGABLE) {
      Log.w("Localytics", String.format("[AMP Nav Handler]: Evaluating AMP URL:\n\tURL:%s", new Object[] { localObject2 }));
    }
    int m = 0;
    int k = 0;
    Object localObject1 = localObject2;
    j = k;
    localObject3 = localObject2;
    i = m;
    for (;;)
    {
      try
      {
        if (((String)localObject2).endsWith("://"))
        {
          j = k;
          localObject3 = localObject2;
          i = m;
          localObject1 = ((String)localObject2).substring(0, ((String)localObject2).length() - 1);
        }
        j = k;
        localObject3 = localObject1;
        i = m;
        tagAmpActionForURL(new URI((String)localObject1));
        j = k;
        localObject3 = localObject1;
        i = m;
        localObject2 = new URL((String)localObject1);
        j = k;
        localObject3 = localObject1;
        i = m;
        k = handleFileProtocolRequest((URL)localObject2);
        i = k;
        if (i <= 0) {
          continue;
        }
        if (i != 2) {
          continue;
        }
        bool1 = bool2;
        if (i == 2)
        {
          dismiss();
          bool1 = bool2;
        }
      }
      catch (Exception localException)
      {
        i = j;
        j = handleCustomProtocolRequest(localObject3, paramActivity);
        if (j <= 0) {
          continue;
        }
        if (j != 2) {
          continue;
        }
        bool2 = bool4;
        bool1 = bool2;
        return bool2;
        bool2 = false;
        continue;
        i = j;
        if (!Constants.IS_LOGGABLE) {
          continue;
        }
        i = j;
        Log.w("Localytics", String.format("[AMP Nav Handler]: Invalid url %s", new Object[] { paramString }));
        i = j;
        dismiss();
        if (j != 2) {
          continue;
        }
        dismiss();
        continue;
      }
      finally
      {
        if (i != 2) {
          continue;
        }
        dismiss();
      }
      return bool1;
      bool2 = false;
    }
    j = i;
    localObject3 = localObject1;
    k = handleHttpProtocolRequest((URL)localObject2, paramActivity);
    i = k;
    if (i > 0)
    {
      if (i == 2) {}
      for (bool2 = bool1;; bool2 = false)
      {
        bool1 = bool2;
        if (i != 2) {
          break;
        }
        dismiss();
        return bool2;
      }
    }
    j = i;
    localObject3 = localObject1;
    k = handleCustomProtocolRequest((URL)localObject2, paramActivity);
    if (k > 0)
    {
      if (k == 2) {}
      for (bool2 = bool3;; bool2 = false)
      {
        bool1 = bool2;
        if (k != 2) {
          break;
        }
        dismiss();
        return bool2;
      }
    }
    j = k;
    localObject3 = localObject1;
    i = k;
    if (Constants.IS_LOGGABLE)
    {
      j = k;
      localObject3 = localObject1;
      i = k;
      Log.w("Localytics", String.format("[AMP Nav Handler]: Protocol handler scheme not recognized. Attempting to load the URL... [Scheme: %s]", new Object[] { ((URL)localObject2).getProtocol() }));
    }
    if (k == 2) {
      dismiss();
    }
    return false;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onActivityCreated");
    }
    super.onActivityCreated(paramBundle);
  }
  
  public void onAttach(Activity paramActivity)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onAttach");
    }
    super.onAttach(paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onCreate");
    }
    super.onCreate(paramBundle);
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onCreateDialog");
    }
    paramBundle = new AmpDialog(getActivity(), 16973835);
    mAmpDialog = paramBundle;
    return paramBundle;
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onCreateView");
    }
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDestroy()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onDestroy");
    }
    if (mCallbacks != null)
    {
      AmpCallable localAmpCallable = (AmpCallable)mCallbacks.get(Integer.valueOf(1));
      if ((!AmpConstants.isTestModeEnabled()) && (localAmpCallable != null)) {
        localAmpCallable.call(new Object[] { mAmpMessage });
      }
    }
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onDestroyView");
    }
    if ((getDialog() != null) && (getRetainInstance())) {
      getDialog().setOnDismissListener(null);
    }
    super.onDestroyView();
  }
  
  public void onDetach()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onDetach");
    }
    super.onDetach();
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onDismiss");
    }
    if (mAmpMessage != null) {
      tagAmpActionEventWithAction("X");
    }
    super.onDismiss(paramDialogInterface);
  }
  
  public void onPause()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onPause");
    }
    super.onPause();
  }
  
  public void onResume()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onResume");
    }
    super.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onSaveInstanceState");
    }
    super.onSaveInstanceState(paramBundle);
  }
  
  public void onStart()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onStart");
    }
    super.onStart();
  }
  
  public void onStop()
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onStop");
    }
    super.onStop();
  }
  
  public void onViewStateRestored(Bundle paramBundle)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("AmpDialogFragment", "onViewStateRestored");
    }
    super.onViewStateRestored(paramBundle);
  }
  
  public AmpDialogFragment setCallbacks(Map<Integer, AmpCallable> paramMap)
  {
    mCallbacks = paramMap;
    return this;
  }
  
  public AmpDialogFragment setData(Map<String, Object> paramMap)
  {
    mAmpMessage = paramMap;
    return this;
  }
  
  public AmpDialogFragment setJavaScriptClient(JavaScriptClient paramJavaScriptClient)
  {
    mJavaScriptClient = paramJavaScriptClient;
    paramJavaScriptClient = mJavaScriptClient.getCallbacks();
    paramJavaScriptClient.put(Integer.valueOf(15), new AmpCallable()
    {
      Object call(final Object[] paramAnonymousArrayOfObject)
      {
        paramAnonymousArrayOfObject = (String)paramAnonymousArrayOfObject[0];
        final AmpDialogFragment.AmpDialog.AmpWebView localAmpWebView = AmpDialogFragment.AmpDialog.access$100(mAmpDialog);
        if (handleUrl(paramAnonymousArrayOfObject, getActivity())) {
          new Handler(Looper.getMainLooper()).post(new Runnable()
          {
            public void run()
            {
              localAmpWebView.loadUrl(paramAnonymousArrayOfObject);
            }
          });
        }
        return null;
      }
    });
    paramJavaScriptClient.put(Integer.valueOf(4), new AmpCallable()
    {
      Object call(Object[] paramAnonymousArrayOfObject)
      {
        dismiss();
        return null;
      }
    });
    return this;
  }
  
  class AmpDialog
    extends Dialog
  {
    private TranslateAnimation mAnimBottomIn;
    private TranslateAnimation mAnimBottomOut;
    private TranslateAnimation mAnimCenterIn;
    private TranslateAnimation mAnimCenterOut;
    private TranslateAnimation mAnimFullIn;
    private TranslateAnimation mAnimFullOut;
    private TranslateAnimation mAnimTopIn;
    private TranslateAnimation mAnimTopOut;
    private CloseButton mBtnClose;
    private RelativeLayout mDialogLayout;
    private float mHeight;
    private String mLocation;
    private DisplayMetrics mMetrics;
    private RelativeLayout mRootLayout;
    private AmpWebView mWebView;
    private float mWidth;
    
    public AmpDialog(Context paramContext, int paramInt)
    {
      super(paramInt);
      if (mAmpMessage == null) {
        dismiss();
      }
      do
      {
        return;
        mLocation = ((String)mAmpMessage.get("location"));
        setupViews();
        createAnimations();
        adjustLayout();
        this$1 = (String)mAmpMessage.get("html_url");
      } while (AmpDialogFragment.this == null);
      mWebView.loadUrl(AmpDialogFragment.this);
    }
    
    @SuppressLint({"NewApi"})
    private void adjustLayout()
    {
      mMetrics = new DisplayMetrics();
      ((WindowManager)getActivity().getSystemService("window")).getDefaultDisplay().getMetrics(mMetrics);
      mWidth = ((Float)mAmpMessage.get("display_width")).floatValue();
      mHeight = ((Float)mAmpMessage.get("display_height")).floatValue();
      float f1 = mHeight / mWidth;
      float f2 = Math.min(360.0F * mMetrics.density, Math.min(mMetrics.widthPixels, mMetrics.heightPixels));
      Window localWindow = getWindow();
      Object localObject = localWindow.getAttributes();
      localWindow.setBackgroundDrawable(new ColorDrawable(0));
      localWindow.setFlags(32, 32);
      if (mLocation.equals("center"))
      {
        localWindow.setLayout(mMetrics.widthPixels, mMetrics.heightPixels);
        int i = (int)(10.0F * mMetrics.density + 0.5F);
        localObject = (ViewGroup.MarginLayoutParams)mWebView.getLayoutParams();
        width = ((int)Math.min(f2 - (i << 1), (int)(mWidth * mMetrics.density + 0.5F)) + (i << 1));
        height = ((int)(Math.min(f2 - (i << 1), (int)(mWidth * mMetrics.density + 0.5F)) * f1) + (i << 1));
        ((ViewGroup.MarginLayoutParams)localObject).setMargins(i, i, i, i);
        mWebView.setLayoutParams((ViewGroup.LayoutParams)localObject);
        mWebView.requestLayout();
      }
      for (;;)
      {
        if (mEnterAnimatable.getAndSet(false)) {
          enterWithAnimation();
        }
        localWindow.setFlags(1024, 1024);
        return;
        if (mLocation.equals("full"))
        {
          localWindow.setLayout(mMetrics.widthPixels, mMetrics.heightPixels);
        }
        else if (mLocation.equals("top"))
        {
          y = -268435455;
          dimAmount = 0.0F;
          localWindow.setLayout((int)f2, (int)(f2 * f1 + 0.5F));
        }
        else if (mLocation.equals("bottom"))
        {
          y = 268435455;
          dimAmount = 0.0F;
          localWindow.setLayout((int)f2, (int)(f2 * f1 + 0.5F));
        }
      }
    }
    
    private void createAnimations()
    {
      mAnimCenterIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 1.0F, 2, 0.0F);
      mAnimCenterIn.setDuration(500L);
      mAnimCenterOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, 1.0F);
      mAnimCenterOut.setDuration(500L);
      mAnimTopIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, -1.0F, 2, 0.0F);
      mAnimTopIn.setDuration(500L);
      mAnimTopOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, -1.0F);
      mAnimTopOut.setDuration(500L);
      mAnimBottomIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 1.0F, 2, 0.0F);
      mAnimBottomIn.setDuration(500L);
      mAnimBottomOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, 1.0F);
      mAnimBottomOut.setDuration(500L);
      mAnimFullIn = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 1.0F, 2, 0.0F);
      mAnimFullIn.setDuration(500L);
      mAnimFullOut = new TranslateAnimation(2, 0.0F, 2, 0.0F, 2, 0.0F, 2, 1.0F);
      mAnimFullOut.setDuration(500L);
      Animation.AnimationListener local2 = new Animation.AnimationListener()
      {
        public void onAnimationEnd(Animation paramAnonymousAnimation)
        {
          dismiss();
        }
        
        public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
        
        public void onAnimationStart(Animation paramAnonymousAnimation) {}
      };
      mAnimCenterOut.setAnimationListener(local2);
      mAnimTopOut.setAnimationListener(local2);
      mAnimBottomOut.setAnimationListener(local2);
      mAnimFullOut.setAnimationListener(local2);
    }
    
    private void setupViews()
    {
      mRootLayout = new RelativeLayout(getContext());
      mRootLayout.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
      mDialogLayout = new RelativeLayout(getContext());
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(13);
      mDialogLayout.setLayoutParams(localLayoutParams);
      mRootLayout.addView(mDialogLayout);
      mWebView = new AmpWebView(getContext(), null);
      mDialogLayout.addView(mWebView);
      mBtnClose = new CloseButton(getContext(), null);
      mBtnClose.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          if (mExitAnimatable.getAndSet(false)) {
            dismissWithAnimation();
          }
        }
      });
      mDialogLayout.addView(mBtnClose);
      requestWindowFeature(1);
      setContentView(mRootLayout);
    }
    
    public void dismissWithAnimation()
    {
      String str = (String)mAmpMessage.get("location");
      if (str.equals("center")) {
        mRootLayout.startAnimation(mAnimCenterOut);
      }
      do
      {
        return;
        if (str.equals("full"))
        {
          mRootLayout.startAnimation(mAnimFullOut);
          return;
        }
        if (str.equals("top"))
        {
          mRootLayout.startAnimation(mAnimTopOut);
          return;
        }
      } while (!str.equals("bottom"));
      mRootLayout.startAnimation(mAnimBottomOut);
    }
    
    public void enterWithAnimation()
    {
      String str = (String)mAmpMessage.get("location");
      if (str.equals("center")) {
        mRootLayout.startAnimation(mAnimCenterIn);
      }
      do
      {
        return;
        if (str.equals("full"))
        {
          mRootLayout.startAnimation(mAnimFullIn);
          return;
        }
        if (str.equals("top"))
        {
          mRootLayout.startAnimation(mAnimTopIn);
          return;
        }
      } while (!str.equals("bottom"));
      mRootLayout.startAnimation(mAnimBottomIn);
    }
    
    public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
    {
      if (paramInt == 4)
      {
        if (mExitAnimatable.getAndSet(false)) {
          dismissWithAnimation();
        }
        return true;
      }
      return super.onKeyDown(paramInt, paramKeyEvent);
    }
    
    protected void onStop()
    {
      if (mBtnClose != null) {
        mBtnClose.release();
      }
      super.onStop();
    }
    
    class AmpWebView
      extends WebView
    {
      private AmpWebViewClient mClient;
      
      @SuppressLint({"SetJavaScriptEnabled"})
      @TargetApi(11)
      public AmpWebView(Context paramContext, AttributeSet paramAttributeSet)
      {
        super(paramAttributeSet);
        if (DatapointHelper.getApiLevel() >= 19) {
          setLayerType(1, null);
        }
        paramContext = new LinearLayout.LayoutParams(-1, -1);
        gravity = 17;
        setLayoutParams(paramContext);
        setBackgroundColor(0);
        setInitialScale(1);
        setHorizontalScrollBarEnabled(false);
        setVerticalScrollBarEnabled(false);
        paramContext = new AmpWebViewClient(getActivity());
        mClient = paramContext;
        setWebViewClient(paramContext);
        paramContext = getSettings();
        paramContext.setJavaScriptEnabled(true);
        addJavascriptInterface(mJavaScriptClient, "localytics");
        paramContext.setUseWideViewPort(true);
      }
      
      public class AmpWebViewClient
        extends WebViewClient
      {
        private Activity mActivity;
        
        public AmpWebViewClient(Activity paramActivity)
        {
          mActivity = paramActivity;
        }
        
        public void onPageFinished(WebView paramWebView, String paramString)
        {
          if (((String)mAmpMessage.get("location")).equals("center")) {}
          for (int i = (int)(10.0F * mMetrics.density + 0.5F) << 1;; i = 0)
          {
            int j = Math.min(mMetrics.widthPixels, mMetrics.heightPixels);
            int k = Math.max(mMetrics.widthPixels, mMetrics.heightPixels);
            paramWebView.loadUrl(String.format("javascript:(function() {  var viewportNode = document.createElement('meta');  viewportNode.name    = 'viewport';  viewportNode.content = 'width=%f, height=%f, user-scalable=no, minimum-scale=.25, maximum-scale=1';  viewportNode.id      = 'metatag';  document.getElementsByTagName('head')[0].appendChild(viewportNode);})()", new Object[] { Float.valueOf(Math.min(j - i, (int)(mWidth * mMetrics.density + 0.5F)) / mMetrics.density), Float.valueOf(Math.min(k - i, (int)(mHeight * mMetrics.density + 0.5F)) / mMetrics.density) }));
            paramWebView.loadUrl(mJavaScriptClient.getJsGlueCode());
            return;
          }
        }
        
        public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
        {
          return handleUrl(paramString, mActivity);
        }
      }
    }
    
    class CloseButton
      extends View
    {
      private Bitmap mBitmap;
      private float mCenterX;
      private float mCenterY;
      private float mInnerRadius;
      private float mOffset;
      private Paint mPaint;
      private float mRadius;
      private Paint mShadowInnerPaint;
      private Paint mShadowOuterPaint;
      private float mStrokeWidth;
      
      @TargetApi(11)
      public CloseButton(Context paramContext, AttributeSet paramAttributeSet)
      {
        super(paramAttributeSet);
        setId(1);
        if (DatapointHelper.getApiLevel() >= 14) {
          setLayerType(1, null);
        }
        float f = getResourcesgetDisplayMetricsdensity;
        mCenterX = (13.0F * f);
        mCenterY = (13.0F * f);
        mRadius = (13.0F * f);
        mOffset = (5.0F * f);
        mStrokeWidth = (2.5F * f);
        mInnerRadius = (mRadius - mStrokeWidth * 0.5F);
        mPaint = new Paint(1);
        mShadowInnerPaint = new Paint(1);
        mShadowInnerPaint.setMaskFilter(new BlurMaskFilter(mRadius - f, BlurMaskFilter.Blur.INNER));
        mShadowOuterPaint = new Paint(1);
        mShadowOuterPaint.setMaskFilter(new BlurMaskFilter(2.0F * f, BlurMaskFilter.Blur.OUTER));
        if (AmpDialogFragment.sDismissButtonImage == null) {
          setLayoutParams(new RelativeLayout.LayoutParams((int)(30.0F * f + 0.5F), (int)(30.0F * f + 0.5F)));
        }
        for (;;)
        {
          mBitmap = Bitmap.createBitmap((int)(26.0F * f + 0.5F), (int)(26.0F * f + 0.5F), Bitmap.Config.ARGB_8888);
          this$1 = new Canvas(mBitmap);
          mPaint.setColor(-16777216);
          mPaint.setStyle(Paint.Style.FILL);
          drawCircle(mCenterX, mCenterY, mRadius, mPaint);
          mPaint.setColor(-1);
          mPaint.setStyle(Paint.Style.STROKE);
          mPaint.setStrokeWidth(mStrokeWidth);
          drawCircle(mCenterX, mCenterY, mInnerRadius, mPaint);
          mPaint.setStrokeWidth(4.5F * f);
          drawLine(mCenterX - mOffset, mCenterY - mOffset, mCenterX + mOffset, mCenterY + mOffset, mPaint);
          drawLine(mCenterX - mOffset, mCenterY + mOffset, mCenterX + mOffset, mCenterY - mOffset, mPaint);
          return;
          setLayoutParams(new RelativeLayout.LayoutParams((int)(40.0F * f + 0.5F), (int)(40.0F * f + 0.5F)));
        }
      }
      
      protected void onDraw(Canvas paramCanvas)
      {
        super.onDraw(paramCanvas);
        if (AmpDialogFragment.sDismissButtonImage != null) {
          paramCanvas.drawBitmap(AmpDialogFragment.sDismissButtonImage, 0.0F, 0.0F, mPaint);
        }
        do
        {
          return;
          float f = getResourcesgetDisplayMetricsdensity;
          paramCanvas.drawCircle(mCenterX + f, mCenterY + f, mRadius - f, mShadowInnerPaint);
          paramCanvas.drawCircle(mCenterX + f, mCenterY + f, mRadius - f, mShadowOuterPaint);
        } while (mBitmap == null);
        paramCanvas.drawBitmap(mBitmap, 0.0F, 0.0F, mPaint);
      }
      
      public void release()
      {
        if (mBitmap != null)
        {
          mBitmap.recycle();
          mBitmap = null;
        }
      }
    }
  }
}
