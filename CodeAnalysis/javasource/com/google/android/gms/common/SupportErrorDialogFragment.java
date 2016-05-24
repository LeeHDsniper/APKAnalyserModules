package com.google.android.gms.common;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentManager;
import com.google.android.gms.common.internal.zzx;

public class SupportErrorDialogFragment
  extends DialogFragment
{
  private Dialog mDialog = null;
  private DialogInterface.OnCancelListener zzYj = null;
  
  public SupportErrorDialogFragment() {}
  
  public static SupportErrorDialogFragment newInstance(Dialog paramDialog, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    SupportErrorDialogFragment localSupportErrorDialogFragment = new SupportErrorDialogFragment();
    paramDialog = (Dialog)zzx.zzb(paramDialog, "Cannot display null dialog");
    paramDialog.setOnCancelListener(null);
    paramDialog.setOnDismissListener(null);
    mDialog = paramDialog;
    if (paramOnCancelListener != null) {
      zzYj = paramOnCancelListener;
    }
    return localSupportErrorDialogFragment;
  }
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    if (zzYj != null) {
      zzYj.onCancel(paramDialogInterface);
    }
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    if (mDialog == null) {
      setShowsDialog(false);
    }
    return mDialog;
  }
  
  public void show(FragmentManager paramFragmentManager, String paramString)
  {
    super.show(paramFragmentManager, paramString);
  }
}
