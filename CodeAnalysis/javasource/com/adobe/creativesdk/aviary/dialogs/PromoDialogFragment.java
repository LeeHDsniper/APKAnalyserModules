package com.adobe.creativesdk.aviary.dialogs;

import android.app.Activity;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.Html;
import android.text.TextUtils;
import android.text.method.ScrollingMovementMethod;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ViewSwitcher;
import com.adobe.creativesdk.aviary.AdobeImageBillingService;
import com.adobe.creativesdk.aviary.internal.AdobeAccountUserStatus;
import com.adobe.creativesdk.aviary.internal.AdobeAccountUserStatus.Type;
import com.adobe.creativesdk.aviary.internal.account.AccountResult;
import com.adobe.creativesdk.aviary.internal.account.AdobeImageAccountDelegate;
import com.adobe.creativesdk.aviary.internal.cds.util.IabResult;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.aviary.android.feather.sdk.R.anim;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import com.aviary.android.feather.sdk.R.style;
import rx.Observable;
import rx.android.app.AppObservable;
import rx.functions.Action1;

public class PromoDialogFragment
  extends DialogFragment
  implements View.OnClickListener
{
  Button closeButton;
  private final LoggerFactory.Logger logger = LoggerFactory.getLogger("PromoActivity");
  ProgressBar mProgress;
  AdobeImageAnalyticsTracker mTracker;
  private Bundle options;
  String packIdentifier;
  boolean showOutroOnly;
  Button signInButton;
  Button signUpButton;
  TextView text1;
  TextView title2;
  ViewSwitcher viewFlipper;
  String whereFrom;
  
  public PromoDialogFragment() {}
  
  public static PromoDialogFragment newInstance(boolean paramBoolean, Bundle paramBundle)
  {
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("showOutroOnly", paramBoolean);
    localBundle.putBundle("options", paramBundle);
    paramBundle = new PromoDialogFragment();
    paramBundle.setArguments(localBundle);
    return paramBundle;
  }
  
  private void onSetupError(Throwable paramThrowable)
  {
    logger.error("Failed to setup");
    if (paramThrowable != null) {
      Toast.makeText(getActivity(), paramThrowable.getMessage(), 0).show();
    }
    for (;;)
    {
      dismiss();
      return;
      Toast.makeText(getActivity(), "Woops, an error occurred, please try again later!", 0).show();
    }
  }
  
  public static void showInActivity(FragmentActivity paramFragmentActivity, boolean paramBoolean, Bundle paramBundle)
  {
    paramBundle = newInstance(paramBoolean, paramBundle);
    FragmentTransaction localFragmentTransaction = paramFragmentActivity.getSupportFragmentManager().beginTransaction();
    localFragmentTransaction.setCustomAnimations(R.anim.abc_slide_in_top, R.anim.abc_slide_out_top);
    paramFragmentActivity = paramFragmentActivity.getSupportFragmentManager().findFragmentByTag("dialog");
    if (paramFragmentActivity != null) {
      localFragmentTransaction.remove(paramFragmentActivity);
    }
    paramBundle.show(localFragmentTransaction, "dialog");
  }
  
  private void showIntroMessage()
  {
    updateIntroMessage();
    viewFlipper.setDisplayedChild(0);
    viewFlipper.setVisibility(0);
    mProgress.setVisibility(4);
  }
  
  private void showOutroMessage()
  {
    updateOutroMessage();
    viewFlipper.setDisplayedChild(1);
    viewFlipper.setVisibility(0);
    mProgress.setVisibility(4);
  }
  
  private void updateIntroMessage()
  {
    updateMessage(text1, R.string.feather_promo_text1);
    if ((!TextUtils.isEmpty(packIdentifier)) && (!TextUtils.isEmpty(whereFrom))) {
      mTracker.tagEvent("adobeid_message: opened", new String[] { "from", whereFrom, "pack", packIdentifier });
    }
    while (TextUtils.isEmpty(whereFrom)) {
      return;
    }
    mTracker.tagEvent("adobeid_message: opened", new String[] { "from", whereFrom });
  }
  
  private void updateMessage(TextView paramTextView, int paramInt)
  {
    paramTextView.setText(Html.fromHtml(getString(paramInt)));
    paramTextView.setMovementMethod(new ScrollingMovementMethod());
  }
  
  private void updateOutroMessage()
  {
    updateMessage(title2, R.string.feather_promo_title2);
    mTracker.tagEvent("adobeid_confirmation: initiated");
  }
  
  AdobeImageBillingService getContentService()
  {
    return ((AdobeImageAccountDelegate)getActivity()).getContentService();
  }
  
  boolean isContentServiceConnected()
  {
    return ((AdobeImageAccountDelegate)getActivity()).isContentServiceConnected();
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    mTracker = AdobeImageAnalyticsTracker.getInstance(paramActivity);
  }
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    super.onCancel(paramDialogInterface);
    if (!TextUtils.isEmpty(packIdentifier))
    {
      mTracker.tagEvent("adobeid_message: cancelled", new String[] { "pack", packIdentifier });
      return;
    }
    mTracker.tagEvent("adobeid_message: cancelled");
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (i == R.id.button1)
    {
      getContentService().requestLogin(getActivity(), options);
      if (!TextUtils.isEmpty(packIdentifier)) {
        mTracker.tagEvent("adobeid_message: succeeded", new String[] { "action", "signin", "pack", packIdentifier });
      }
    }
    do
    {
      return;
      mTracker.tagEvent("adobeid_message: succeeded", new String[] { "action", "signin" });
      return;
      if (i == R.id.button2)
      {
        getContentService().requestSignUp(getActivity(), options);
        if (!TextUtils.isEmpty(packIdentifier))
        {
          mTracker.tagEvent("adobeid_message: succeeded", new String[] { "action", "signup", "pack", packIdentifier });
          return;
        }
        mTracker.tagEvent("adobeid_message: succeeded", new String[] { "action", "signup" });
        return;
      }
    } while (i != R.id.button3);
    dismiss();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    paramBundle = getArguments();
    options = paramBundle.getBundle("options");
    whereFrom = options.getString("from");
    if (TextUtils.isEmpty(whereFrom)) {
      whereFrom = "message";
    }
    showOutroOnly = paramBundle.getBoolean("showOutroOnly", false);
    packIdentifier = options.getString("identifier");
    setStyle(2, R.style.AdobeImageBaseTheme_Promo);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_promo_dialog, paramViewGroup, false);
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
  }
  
  public void onSetupDone(Pair<AccountResult, IabResult> paramPair)
  {
    logger.info("onSetupFinished: %s", new Object[] { paramPair });
    getContentService().subscribeToUserStatusChange(this, new Action1()
    {
      public void call(AdobeAccountUserStatus paramAnonymousAdobeAccountUserStatus)
      {
        onUserAuthenticated(paramAnonymousAdobeAccountUserStatus);
      }
    });
    mProgress.setVisibility(4);
    viewFlipper.setVisibility(0);
    showIntroMessage();
  }
  
  public void onUserAuthenticated(AdobeAccountUserStatus paramAdobeAccountUserStatus)
  {
    logger.info("onUserAuthenticated(%s)", new Object[] { paramAdobeAccountUserStatus });
    if (paramAdobeAccountUserStatus.getType() == AdobeAccountUserStatus.Type.LOGOUT)
    {
      showIntroMessage();
      return;
    }
    if (paramAdobeAccountUserStatus.isSuccess())
    {
      showOutroMessage();
      return;
    }
    showIntroMessage();
    paramAdobeAccountUserStatus = paramAdobeAccountUserStatus.getErrorMessage(getActivity());
    Toast.makeText(getActivity(), paramAdobeAccountUserStatus, 0).show();
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    text1 = ((TextView)paramView.findViewById(R.id.text));
    title2 = ((TextView)paramView.findViewById(R.id.text2));
    signInButton = ((Button)paramView.findViewById(R.id.button1));
    signUpButton = ((Button)paramView.findViewById(R.id.button2));
    closeButton = ((Button)paramView.findViewById(R.id.button3));
    viewFlipper = ((ViewSwitcher)paramView.findViewById(R.id.view_switcher));
    mProgress = ((ProgressBar)paramView.findViewById(R.id.progress));
    signInButton.setOnClickListener(this);
    signUpButton.setOnClickListener(this);
    closeButton.setOnClickListener(this);
    if (showOutroOnly)
    {
      showOutroMessage();
      return;
    }
    if (isContentServiceConnected())
    {
      AppObservable.bindSupportFragment(this, getContentService().startSetup()).subscribe(new Action1()new Action1
      {
        public void call(Pair<AccountResult, IabResult> paramAnonymousPair)
        {
          onSetupDone(paramAnonymousPair);
        }
      }, new Action1()
      {
        public void call(Throwable paramAnonymousThrowable)
        {
          paramAnonymousThrowable.printStackTrace();
          PromoDialogFragment.this.onSetupError(paramAnonymousThrowable);
        }
      });
      return;
    }
    logger.warn("content service not connected");
  }
}
