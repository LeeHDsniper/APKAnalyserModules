package com.behance.sdk;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.adobe.creativesdk.foundation.internal.analytics.AdobeAnalyticsSDKReporter;
import com.behance.sdk.dto.BehanceSDKSocialAccountDTO;
import com.behance.sdk.enums.BehanceSDKSocialAccountType;
import com.behance.sdk.exception.BehanceSDKInvalidArgumentException;
import com.behance.sdk.exception.BehanceSDKInvalidImageException;
import com.behance.sdk.exception.BehanceSDKUserNotAuthenticatedException;
import com.behance.sdk.exception.BehanceSDKUserNotEntitledException;
import com.behance.sdk.managers.AddWIPManager;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.ui.activities.BehanceSDKPublishWIPActivity;
import com.behance.sdk.util.BehanceSDKPublishImageValidationResult;
import com.behance.sdk.util.BehanceSDKUtils;

public class BehanceSDK
{
  private static final BehanceSDK INSTANCE = new BehanceSDK();
  private IBehanceSDKUserCredentials credentials;
  
  private BehanceSDK() {}
  
  public static BehanceSDK getInstance()
  {
    return INSTANCE;
  }
  
  private void initializeForPublishWIPWorkflow(Context paramContext, BehanceSDKAbstractPublishOptions paramBehanceSDKAbstractPublishOptions)
  {
    AddWIPManager localAddWIPManager = AddWIPManager.getInstance();
    BehanceSDKSocialAccountManager localBehanceSDKSocialAccountManager = BehanceSDKSocialAccountManager.getInstance(paramContext);
    if ((paramBehanceSDKAbstractPublishOptions.isFacebookShareEnabled()) && (paramBehanceSDKAbstractPublishOptions.getFacebookClientId() != null) && (paramBehanceSDKAbstractPublishOptions.getFacebookClientId().length() > 0))
    {
      BehanceSDKSocialAccountDTO localBehanceSDKSocialAccountDTO = localBehanceSDKSocialAccountManager.getAccount(BehanceSDKSocialAccountType.FACEBOOK);
      paramContext = localBehanceSDKSocialAccountDTO;
      String str;
      if (localBehanceSDKSocialAccountDTO != null)
      {
        str = localBehanceSDKSocialAccountDTO.getAccountClientId();
        paramContext = localBehanceSDKSocialAccountDTO;
        if (!paramBehanceSDKAbstractPublishOptions.getFacebookClientId().equals(str))
        {
          localBehanceSDKSocialAccountManager.removeAccount(BehanceSDKSocialAccountType.FACEBOOK);
          paramContext = null;
        }
      }
      if (paramContext == null)
      {
        paramContext = new BehanceSDKSocialAccountDTO();
        paramContext.setAccountType(BehanceSDKSocialAccountType.FACEBOOK);
        paramContext.setAccountClientId(paramBehanceSDKAbstractPublishOptions.getFacebookClientId());
        localBehanceSDKSocialAccountManager.addAccount(paramContext);
      }
      if ((!paramBehanceSDKAbstractPublishOptions.isTwitterShareEnabled()) || (paramBehanceSDKAbstractPublishOptions.getTwitterConsumerKey() == null) || (paramBehanceSDKAbstractPublishOptions.getTwitterConsumerKey().length() <= 0) || (paramBehanceSDKAbstractPublishOptions.getTwitterConsumerSecretKey() == null) || (paramBehanceSDKAbstractPublishOptions.getTwitterConsumerSecretKey().length() <= 0)) {
        break label288;
      }
      localBehanceSDKSocialAccountDTO = localBehanceSDKSocialAccountManager.getAccount(BehanceSDKSocialAccountType.TWITTER);
      paramContext = localBehanceSDKSocialAccountDTO;
      if (localBehanceSDKSocialAccountDTO != null)
      {
        paramContext = localBehanceSDKSocialAccountDTO.getAccountClientId();
        str = localBehanceSDKSocialAccountDTO.getAccountClientSecret();
        if (paramBehanceSDKAbstractPublishOptions.getTwitterConsumerKey().equals(paramContext))
        {
          paramContext = localBehanceSDKSocialAccountDTO;
          if (paramBehanceSDKAbstractPublishOptions.getTwitterConsumerSecretKey().equals(str)) {}
        }
        else
        {
          localBehanceSDKSocialAccountManager.removeAccount(BehanceSDKSocialAccountType.TWITTER);
          paramContext = null;
        }
      }
      if (paramContext == null)
      {
        paramContext = new BehanceSDKSocialAccountDTO();
        paramContext.setAccountType(BehanceSDKSocialAccountType.TWITTER);
        paramContext.setAccountClientId(paramBehanceSDKAbstractPublishOptions.getTwitterConsumerKey());
        paramContext.setAccountClientSecret(paramBehanceSDKAbstractPublishOptions.getTwitterConsumerSecretKey());
        localBehanceSDKSocialAccountManager.addAccount(paramContext);
      }
    }
    for (;;)
    {
      localAddWIPManager.setUserCredentials(credentials);
      localAddWIPManager.setNotificationHandlerActivityClass(paramBehanceSDKAbstractPublishOptions.getNotificationHandlerActivityClass());
      return;
      localAddWIPManager.setHideFacebookSharing(true);
      break;
      label288:
      localAddWIPManager.setHideTwitterSharing(true);
    }
  }
  
  private void validateIfUserIsEntitledForBehanceWorkflow()
    throws BehanceSDKUserNotEntitledException, BehanceSDKUserNotAuthenticatedException
  {
    BehanceSDKUserManager localBehanceSDKUserManager = BehanceSDKUserManager.getInstance();
    if (!localBehanceSDKUserManager.isUserAuthenticatedWithAdobe()) {
      throw new BehanceSDKUserNotAuthenticatedException("No logged in user found.");
    }
    if (!localBehanceSDKUserManager.isUserEntitledToUseBehance()) {
      throw new BehanceSDKUserNotEntitledException("User is not entitled to use Behance services");
    }
  }
  
  public void initialize(IBehanceSDKUserCredentials paramIBehanceSDKUserCredentials)
  {
    credentials = paramIBehanceSDKUserCredentials;
  }
  
  public void launchPublishWIPView(Context paramContext, BehanceSDKPublishWIPOptions paramBehanceSDKPublishWIPOptions)
    throws BehanceSDKInvalidImageException, BehanceSDKInvalidImageException, BehanceSDKInvalidArgumentException, BehanceSDKUserNotEntitledException, BehanceSDKUserNotAuthenticatedException
  {
    validateIfUserIsEntitledForBehanceWorkflow();
    initializeForPublishWIPWorkflow(paramContext, paramBehanceSDKPublishWIPOptions);
    Object localObject = paramBehanceSDKPublishWIPOptions.getWipRevisionImageModule();
    if (BehanceSDKPublishImageValidationResult.VALID != validateImageForWIP((ImageModule)localObject)) {
      throw new BehanceSDKInvalidImageException(((ImageModule)localObject).getFile());
    }
    localObject = paramBehanceSDKPublishWIPOptions.getWipTitle();
    if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((String)localObject).length() > 55)) {
      throw new BehanceSDKInvalidArgumentException("Behance WIP title cannot be more than 55 characters in length");
    }
    localObject = new Intent(paramContext, BehanceSDKPublishWIPActivity.class);
    ((Intent)localObject).setFlags(268435456);
    ((Intent)localObject).putExtra("INTENT_INT_EXTRA_EXISTING_WIP_ID", paramBehanceSDKPublishWIPOptions.getExistingWIPId());
    ((Intent)localObject).putExtra("INTENT_STRING_EXTRA_WIP_DESCRIPTION", paramBehanceSDKPublishWIPOptions.getWipDescription());
    ((Intent)localObject).putExtra("INTENT_STRING_EXTRA_WIP_TAGS", paramBehanceSDKPublishWIPOptions.getWipTags());
    ((Intent)localObject).putExtra("INTENT_STRING_EXTRA_WIP_TITLE", paramBehanceSDKPublishWIPOptions.getWipTitle());
    ((Intent)localObject).putExtra("INTENT_SERIALIZABLE_EXTRA_WIP_REVISION_IMAGE_MODULE", paramBehanceSDKPublishWIPOptions.getWipRevisionImageModule());
    AdobeAnalyticsSDKReporter.trackSharingAction(AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTypePublishUXStart, AdobeAnalyticsSDKReporter.AdobeAnalyticsShareTargetBehanceWIP);
    paramContext.startActivity((Intent)localObject);
  }
  
  public BehanceSDKPublishImageValidationResult validateImageForWIP(ImageModule paramImageModule)
  {
    return BehanceSDKUtils.validateImageForWIP(paramImageModule);
  }
}
