package com.facebook.widget;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.SslErrorHandler;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.behance.sdk.R.drawable;
import com.behance.sdk.R.string;
import com.facebook.FacebookDialogException;
import com.facebook.FacebookException;
import com.facebook.FacebookOperationCanceledException;
import com.facebook.FacebookRequestError;
import com.facebook.FacebookServiceException;
import com.facebook.Session;
import com.facebook.android.Util;
import com.facebook.internal.ServerProtocol;
import com.facebook.internal.Utility;
import com.facebook.internal.Validate;

public class WebDialog
  extends Dialog
{
  private FrameLayout contentFrameLayout;
  private ImageView crossImageView;
  private boolean isDetached = false;
  private boolean listenerCalled = false;
  private OnCompleteListener onCompleteListener;
  private ProgressDialog spinner;
  private String url;
  private WebView webView;
  
  public WebDialog(Context paramContext, String paramString, Bundle paramBundle, int paramInt, OnCompleteListener paramOnCompleteListener)
  {
    super(paramContext, paramInt);
    paramContext = paramBundle;
    if (paramBundle == null) {
      paramContext = new Bundle();
    }
    paramContext.putString("redirect_uri", "fbconnect://success");
    paramContext.putString("display", "touch");
    url = Utility.buildUri(ServerProtocol.getDialogAuthority(), ServerProtocol.getAPIVersion() + "/" + "dialog/" + paramString, paramContext).toString();
    onCompleteListener = paramOnCompleteListener;
  }
  
  private void calculateSize()
  {
    Display localDisplay = ((WindowManager)getContext().getSystemService("window")).getDefaultDisplay();
    DisplayMetrics localDisplayMetrics = new DisplayMetrics();
    localDisplay.getMetrics(localDisplayMetrics);
    int i;
    if (widthPixels < heightPixels)
    {
      i = widthPixels;
      if (widthPixels >= heightPixels) {
        break label140;
      }
    }
    label140:
    for (int j = heightPixels;; j = widthPixels)
    {
      i = Math.min(getScaledSize(i, density, 480, 800), widthPixels);
      j = Math.min(getScaledSize(j, density, 800, 1280), heightPixels);
      getWindow().setLayout(i, j);
      return;
      i = heightPixels;
      break;
    }
  }
  
  private void createCrossImage()
  {
    crossImageView = new ImageView(getContext());
    crossImageView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        WebDialog.this.sendCancelToListener();
        dismiss();
      }
    });
    Drawable localDrawable = getContext().getResources().getDrawable(R.drawable.com_facebook_close);
    crossImageView.setImageDrawable(localDrawable);
    crossImageView.setVisibility(4);
  }
  
  private int getScaledSize(int paramInt1, float paramFloat, int paramInt2, int paramInt3)
  {
    int i = (int)(paramInt1 / paramFloat);
    double d;
    if (i <= paramInt2) {
      d = 1.0D;
    }
    for (;;)
    {
      return (int)(paramInt1 * d);
      if (i >= paramInt3) {
        d = 0.5D;
      } else {
        d = 0.5D + (paramInt3 - i) / (paramInt3 - paramInt2) * 0.5D;
      }
    }
  }
  
  private void sendCancelToListener()
  {
    sendErrorToListener(new FacebookOperationCanceledException());
  }
  
  private void sendErrorToListener(Throwable paramThrowable)
  {
    if ((onCompleteListener != null) && (!listenerCalled))
    {
      listenerCalled = true;
      if (!(paramThrowable instanceof FacebookException)) {
        break label43;
      }
    }
    label43:
    for (paramThrowable = (FacebookException)paramThrowable;; paramThrowable = new FacebookException(paramThrowable))
    {
      onCompleteListener.onComplete(null, paramThrowable);
      return;
    }
  }
  
  private void sendSuccessToListener(Bundle paramBundle)
  {
    if ((onCompleteListener != null) && (!listenerCalled))
    {
      listenerCalled = true;
      onCompleteListener.onComplete(paramBundle, null);
    }
  }
  
  @SuppressLint({"SetJavaScriptEnabled"})
  private void setUpWebView(int paramInt)
  {
    LinearLayout localLinearLayout = new LinearLayout(getContext());
    webView = new WebView(getContext());
    webView.setVerticalScrollBarEnabled(false);
    webView.setHorizontalScrollBarEnabled(false);
    webView.setWebViewClient(new DialogWebViewClient(null));
    webView.getSettings().setJavaScriptEnabled(true);
    webView.loadUrl(url);
    webView.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
    webView.setVisibility(4);
    webView.getSettings().setSavePassword(false);
    webView.getSettings().setSaveFormData(false);
    localLinearLayout.setPadding(paramInt, paramInt, paramInt, paramInt);
    localLinearLayout.addView(webView);
    localLinearLayout.setBackgroundColor(getContext().getResources().getColor(17170445));
    contentFrameLayout.setBackgroundColor(getContext().getResources().getColor(17170445));
    contentFrameLayout.addView(localLinearLayout);
  }
  
  public void dismiss()
  {
    if (webView != null) {
      webView.stopLoading();
    }
    if (!isDetached)
    {
      if (spinner.isShowing()) {
        spinner.dismiss();
      }
      super.dismiss();
    }
  }
  
  public void onAttachedToWindow()
  {
    isDetached = false;
    super.onAttachedToWindow();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setOnCancelListener(new DialogInterface.OnCancelListener()
    {
      public void onCancel(DialogInterface paramAnonymousDialogInterface)
      {
        WebDialog.this.sendCancelToListener();
      }
    });
    spinner = new ProgressDialog(getContext());
    spinner.requestWindowFeature(1);
    spinner.setMessage(getContext().getString(R.string.com_facebook_loading));
    spinner.setOnCancelListener(new DialogInterface.OnCancelListener()
    {
      public void onCancel(DialogInterface paramAnonymousDialogInterface)
      {
        WebDialog.this.sendCancelToListener();
        dismiss();
      }
    });
    requestWindowFeature(1);
    contentFrameLayout = new FrameLayout(getContext());
    calculateSize();
    getWindow().setGravity(17);
    getWindow().setSoftInputMode(16);
    createCrossImage();
    setUpWebView(crossImageView.getDrawable().getIntrinsicWidth() / 2 + 1);
    contentFrameLayout.addView(crossImageView, new ViewGroup.LayoutParams(-2, -2));
    setContentView(contentFrameLayout);
  }
  
  public void onDetachedFromWindow()
  {
    isDetached = true;
    super.onDetachedFromWindow();
  }
  
  public static class Builder
    extends WebDialog.BuilderBase<Builder>
  {
    public Builder(Context paramContext, String paramString1, String paramString2, Bundle paramBundle)
    {
      super(paramString1, paramString2, paramBundle);
    }
  }
  
  private static class BuilderBase<CONCRETE extends BuilderBase<?>>
  {
    private String action;
    private String applicationId;
    private Context context;
    private WebDialog.OnCompleteListener listener;
    private Bundle parameters;
    private Session session;
    private int theme = 16973840;
    
    protected BuilderBase(Context paramContext, String paramString1, String paramString2, Bundle paramBundle)
    {
      String str = paramString1;
      if (paramString1 == null) {
        str = Utility.getMetadataApplicationId(paramContext);
      }
      Validate.notNullOrEmpty(str, "applicationId");
      applicationId = str;
      finishInit(paramContext, paramString2, paramBundle);
    }
    
    private void finishInit(Context paramContext, String paramString, Bundle paramBundle)
    {
      context = paramContext;
      action = paramString;
      if (paramBundle != null)
      {
        parameters = paramBundle;
        return;
      }
      parameters = new Bundle();
    }
    
    public WebDialog build()
    {
      if ((session != null) && (session.isOpened()))
      {
        parameters.putString("app_id", session.getApplicationId());
        parameters.putString("access_token", session.getAccessToken());
      }
      for (;;)
      {
        return new WebDialog(context, action, parameters, theme, listener);
        parameters.putString("app_id", applicationId);
      }
    }
    
    protected String getApplicationId()
    {
      return applicationId;
    }
    
    protected Context getContext()
    {
      return context;
    }
    
    protected WebDialog.OnCompleteListener getListener()
    {
      return listener;
    }
    
    protected Bundle getParameters()
    {
      return parameters;
    }
    
    protected int getTheme()
    {
      return theme;
    }
    
    public CONCRETE setOnCompleteListener(WebDialog.OnCompleteListener paramOnCompleteListener)
    {
      listener = paramOnCompleteListener;
      return this;
    }
  }
  
  private class DialogWebViewClient
    extends WebViewClient
  {
    private DialogWebViewClient() {}
    
    public void onPageFinished(WebView paramWebView, String paramString)
    {
      super.onPageFinished(paramWebView, paramString);
      if (!isDetached) {
        spinner.dismiss();
      }
      contentFrameLayout.setBackgroundColor(0);
      webView.setVisibility(0);
      crossImageView.setVisibility(0);
    }
    
    public void onPageStarted(WebView paramWebView, String paramString, Bitmap paramBitmap)
    {
      Utility.logd("FacebookSDK.WebDialog", "Webview loading URL: " + paramString);
      super.onPageStarted(paramWebView, paramString, paramBitmap);
      if (!isDetached) {
        spinner.show();
      }
    }
    
    public void onReceivedError(WebView paramWebView, int paramInt, String paramString1, String paramString2)
    {
      super.onReceivedError(paramWebView, paramInt, paramString1, paramString2);
      WebDialog.this.sendErrorToListener(new FacebookDialogException(paramString1, paramInt, paramString2));
      dismiss();
    }
    
    public void onReceivedSslError(WebView paramWebView, SslErrorHandler paramSslErrorHandler, SslError paramSslError)
    {
      super.onReceivedSslError(paramWebView, paramSslErrorHandler, paramSslError);
      WebDialog.this.sendErrorToListener(new FacebookDialogException(null, -11, null));
      paramSslErrorHandler.cancel();
      dismiss();
    }
    
    public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
    {
      Utility.logd("FacebookSDK.WebDialog", "Redirect URL: " + paramString);
      if (paramString.startsWith("fbconnect://success"))
      {
        Bundle localBundle = Util.parseUrl(paramString);
        paramString = localBundle.getString("error");
        paramWebView = paramString;
        if (paramString == null) {
          paramWebView = localBundle.getString("error_type");
        }
        String str = localBundle.getString("error_msg");
        paramString = str;
        if (str == null) {
          paramString = localBundle.getString("error_description");
        }
        str = localBundle.getString("error_code");
        int i = -1;
        if (!Utility.isNullOrEmpty(str)) {}
        try
        {
          i = Integer.parseInt(str);
          if ((Utility.isNullOrEmpty(paramWebView)) && (Utility.isNullOrEmpty(paramString)) && (i == -1))
          {
            WebDialog.this.sendSuccessToListener(localBundle);
            dismiss();
            return true;
          }
        }
        catch (NumberFormatException localNumberFormatException)
        {
          for (;;)
          {
            i = -1;
            continue;
            if ((paramWebView != null) && ((paramWebView.equals("access_denied")) || (paramWebView.equals("OAuthAccessDeniedException"))))
            {
              WebDialog.this.sendCancelToListener();
            }
            else
            {
              paramWebView = new FacebookRequestError(i, paramWebView, paramString);
              WebDialog.this.sendErrorToListener(new FacebookServiceException(paramWebView, paramString));
            }
          }
        }
      }
      if (paramString.startsWith("fbconnect://cancel"))
      {
        WebDialog.this.sendCancelToListener();
        dismiss();
        return true;
      }
      if (paramString.contains("touch")) {
        return false;
      }
      getContext().startActivity(new Intent("android.intent.action.VIEW", Uri.parse(paramString)));
      return true;
    }
  }
  
  public static abstract interface OnCompleteListener
  {
    public abstract void onComplete(Bundle paramBundle, FacebookException paramFacebookException);
  }
}
