package com.behance.sdk.ui.activities;

import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import com.behance.sdk.BehanceSDKSocialAccountManager;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.string;
import com.behance.sdk.enums.BehanceSDKSocialAccountType;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.ui.dialogs.BehanceSDKGenericAlertDialog;

public class BehanceSDKUnlinkSocialAccountActivity
  extends FragmentActivity
  implements View.OnClickListener
{
  public static String INTENT_EXTRA_ACCOUNT_TYPE_NAME = "INTENT_PARAMS_ACCOUNT_TYPE_NAME";
  public static int RESULT_CODE_ACCOUNT_UNLINK_CANCELLED = 21;
  public static int RESULT_CODE_ACCOUNT_UNLINK_FAILED = 22;
  public static int RESULT_CODE_ACCOUNT_UNLINK_SUCCESSFUL = 20;
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKUnlinkSocialAccountActivity.class);
  private BehanceSDKGenericAlertDialog confirmationDialog;
  private BehanceSDKSocialAccountType socialAccountType;
  
  public BehanceSDKUnlinkSocialAccountActivity() {}
  
  private void closeConfirmationDialog(int paramInt)
  {
    if (confirmationDialog != null) {
      confirmationDialog.dismiss();
    }
    closeThisActivity(paramInt);
  }
  
  private void closeThisActivity(int paramInt)
  {
    setResult(paramInt, getIntent());
    finish();
  }
  
  private void displayConfirmationDialog()
  {
    int m = R.string.bsdk_social_account_unlink_twitter_account_confirmation_title;
    int i = R.string.bsdk_social_account_unlink_twitter_account_confirmation_body;
    int k = R.string.bsdk_social_account_unlink_twitter_account_confirmation_ok_btn_label;
    int j = R.string.bsdk_social_account_unlink_twitter_account_confirmation_cancel_btn_label;
    if (socialAccountType == BehanceSDKSocialAccountType.FACEBOOK)
    {
      m = R.string.bsdk_social_account_unlink_facebook_account_confirmation_title;
      i = R.string.bsdk_social_account_unlink_facebook_account_confirmation_body;
      k = R.string.bsdk_social_account_unlink_facebook_account_confirmation_ok_btn_label;
      j = R.string.bsdk_social_account_unlink_facebook_account_confirmation_cancel_btn_label;
    }
    confirmationDialog = BehanceSDKGenericAlertDialog.getInstance(this, m, i, k, j);
    confirmationDialog.setOnNotOKBtnClickListener(this);
    confirmationDialog.setOnOKBtnClickListener(this);
    confirmationDialog.setOnCancelListener(new DialogInterface.OnCancelListener()
    {
      public void onCancel(DialogInterface paramAnonymousDialogInterface)
      {
        BehanceSDKUnlinkSocialAccountActivity.this.closeThisActivity(BehanceSDKUnlinkSocialAccountActivity.RESULT_CODE_ACCOUNT_UNLINK_CANCELLED);
      }
    });
    confirmationDialog.show();
  }
  
  private boolean unlinkSocialAccount()
  {
    try
    {
      BehanceSDKSocialAccountManager.getInstance(this).revokeAccountAccess(socialAccountType);
      logger.debug("Unlinked social account. [Account Type - %s]", new Object[] { socialAccountType.name() });
      return true;
    }
    catch (Throwable localThrowable)
    {
      logger.error(localThrowable, "Problem unlinking social account. [Account Type - %s]", new Object[] { socialAccountType.name() });
    }
    return false;
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == R.id.bsdkGenericAlertDialogOKBtn) {
      if (unlinkSocialAccount()) {
        closeConfirmationDialog(RESULT_CODE_ACCOUNT_UNLINK_SUCCESSFUL);
      }
    }
    while (paramView.getId() != R.id.bsdkGenericAlertDialogNotOKBtn)
    {
      return;
      closeConfirmationDialog(RESULT_CODE_ACCOUNT_UNLINK_FAILED);
      return;
    }
    closeConfirmationDialog(RESULT_CODE_ACCOUNT_UNLINK_CANCELLED);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.bsdk_activity_unlink_social_account);
    socialAccountType = BehanceSDKSocialAccountType.fromName(getIntent().getStringExtra(INTENT_EXTRA_ACCOUNT_TYPE_NAME));
    if (socialAccountType != null)
    {
      displayConfirmationDialog();
      return;
    }
    closeThisActivity(RESULT_CODE_ACCOUNT_UNLINK_CANCELLED);
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
  }
}
