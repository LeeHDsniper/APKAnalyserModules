package com.adobe.creativesdk.aviary.dialogs;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.DialogFragment;
import com.aviary.android.feather.sdk.R.string;

public class DownloadErrorDialogFragment
  extends DialogFragment
{
  public DownloadErrorDialogFragment() {}
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    new AlertDialog.Builder(getActivity()).setTitle(R.string.feather_attention).setMessage(R.string.feather_error_download_image_message).setCancelable(false).setPositiveButton(17039370, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        ActivityCompat.finishAfterTransition(getActivity());
      }
    }).create();
  }
}
