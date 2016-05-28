package com.adobe.creativesdk.aviary.dialogs;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.aviary.android.feather.sdk.R.string;

public class ConfirmExitDialogFragment
  extends DialogFragment
{
  public ConfirmExitDialogFragment() {}
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    new AlertDialog.Builder(getActivity()).setMessage(R.string.feather_discard_edits).setPositiveButton(R.string.feather_discard, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        ((AdobeImageEditorActivity)getActivity()).onBackPressed(true);
      }
    }).setNegativeButton(17039360, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface.dismiss();
      }
    }).create();
  }
}
