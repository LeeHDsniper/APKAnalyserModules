package com.behance.sdk.ui.activities;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.asynctasks.result.BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.ui.fragments.BehanceSDKLoginToTwitterFragment;
import com.behance.sdk.ui.fragments.BehanceSDKLoginToTwitterFragment.Callbacks;

public class BehanceSDKLoginToTwitterActivity
  extends FragmentActivity
  implements BehanceSDKLoginToTwitterFragment.Callbacks
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKLoginToTwitterActivity.class);
  
  public BehanceSDKLoginToTwitterActivity() {}
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.bsdk_activity_login_user_to_social_client);
    if (paramBundle == null)
    {
      paramBundle = new Bundle();
      BehanceSDKLoginToTwitterFragment localBehanceSDKLoginToTwitterFragment = new BehanceSDKLoginToTwitterFragment();
      localBehanceSDKLoginToTwitterFragment.setArguments(paramBundle);
      getSupportFragmentManager().beginTransaction().add(R.id.bsdkLoginUserToSocialClientFragmentContainer, localBehanceSDKLoginToTwitterFragment, "FRAGMENT_TAG_LOGIN_TO_SOCIAL_CLIENT").commit();
      localBehanceSDKLoginToTwitterFragment.setCallbacks(this);
    }
  }
  
  public void onTwitterAuthenticationFailure(Exception paramException)
  {
    logger.error("Error while Authenticating User on Twitter. [error: %s]", new Object[] { paramException.getMessage() });
    setResult(0);
    finish();
  }
  
  public void onTwitterAuthenticationSuccess(BehanceSDKRetrieveAccessTokenFromTwitterTaskResult paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult)
  {
    setResult(1);
    finish();
  }
}
