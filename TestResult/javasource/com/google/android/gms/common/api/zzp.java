package com.google.android.gms.common.api;

import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.IntentSender.SendIntentException;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.Log;
import android.util.SparseArray;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.internal.zzx;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.List;

public class zzp
  extends Fragment
  implements DialogInterface.OnCancelListener
{
  private boolean mStarted;
  private boolean zzaaJ;
  private int zzaaK = -1;
  private ConnectionResult zzaaL;
  private final Handler zzaaM = new Handler(Looper.getMainLooper());
  private final SparseArray<zza> zzaaN = new SparseArray();
  
  public zzp() {}
  
  public static zzp zza(FragmentActivity paramFragmentActivity)
  {
    zzx.zzch("Must be called from main thread of process");
    paramFragmentActivity = paramFragmentActivity.getSupportFragmentManager();
    try
    {
      zzp localZzp = (zzp)paramFragmentActivity.findFragmentByTag("GmsSupportLifecycleFragment");
      if (localZzp != null)
      {
        paramFragmentActivity = localZzp;
        if (!localZzp.isRemoving()) {}
      }
      else
      {
        paramFragmentActivity = null;
      }
      return paramFragmentActivity;
    }
    catch (ClassCastException paramFragmentActivity)
    {
      throw new IllegalStateException("Fragment with tag GmsSupportLifecycleFragment is not a SupportLifecycleFragment", paramFragmentActivity);
    }
  }
  
  private void zza(int paramInt, ConnectionResult paramConnectionResult)
  {
    Log.w("GmsSupportLifecycleFragment", "Unresolved error while connecting client. Stopping auto-manage.");
    Object localObject = (zza)zzaaN.get(paramInt);
    if (localObject != null)
    {
      zzbi(paramInt);
      localObject = zzaaQ;
      if (localObject != null) {
        ((GoogleApiClient.OnConnectionFailedListener)localObject).onConnectionFailed(paramConnectionResult);
      }
    }
    zznJ();
  }
  
  public static zzp zzb(FragmentActivity paramFragmentActivity)
  {
    zzp localZzp = zza(paramFragmentActivity);
    FragmentManager localFragmentManager = paramFragmentActivity.getSupportFragmentManager();
    paramFragmentActivity = localZzp;
    if (localZzp == null)
    {
      paramFragmentActivity = new zzp();
      localFragmentManager.beginTransaction().add(paramFragmentActivity, "GmsSupportLifecycleFragment").commitAllowingStateLoss();
      localFragmentManager.executePendingTransactions();
    }
    return paramFragmentActivity;
  }
  
  private void zznJ()
  {
    zzaaJ = false;
    zzaaK = -1;
    zzaaL = null;
    int i = 0;
    while (i < zzaaN.size())
    {
      zzaaN.valueAt(i)).zzaaP.connect();
      i += 1;
    }
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    super.dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    int i = 0;
    while (i < zzaaN.size())
    {
      ((zza)zzaaN.valueAt(i)).dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
      i += 1;
    }
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    int i = 1;
    switch (paramInt1)
    {
    default: 
      paramInt1 = 0;
    }
    for (;;)
    {
      if (paramInt1 == 0) {
        break label66;
      }
      zznJ();
      return;
      if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(getActivity()) != 0) {
        break;
      }
      paramInt1 = i;
      continue;
      if (paramInt2 != -1) {
        break;
      }
      paramInt1 = i;
    }
    label66:
    zza(zzaaK, zzaaL);
  }
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    zza(zzaaK, new ConnectionResult(13, null));
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (paramBundle != null)
    {
      zzaaJ = paramBundle.getBoolean("resolving_error", false);
      zzaaK = paramBundle.getInt("failed_client_id", -1);
      if (zzaaK >= 0) {
        zzaaL = new ConnectionResult(paramBundle.getInt("failed_status"), (PendingIntent)paramBundle.getParcelable("failed_resolution"));
      }
    }
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putBoolean("resolving_error", zzaaJ);
    if (zzaaK >= 0)
    {
      paramBundle.putInt("failed_client_id", zzaaK);
      paramBundle.putInt("failed_status", zzaaL.getErrorCode());
      paramBundle.putParcelable("failed_resolution", zzaaL.getResolution());
    }
  }
  
  public void onStart()
  {
    super.onStart();
    mStarted = true;
    if (!zzaaJ)
    {
      int i = 0;
      while (i < zzaaN.size())
      {
        zzaaN.valueAt(i)).zzaaP.connect();
        i += 1;
      }
    }
  }
  
  public void onStop()
  {
    super.onStop();
    mStarted = false;
    int i = 0;
    while (i < zzaaN.size())
    {
      zzaaN.valueAt(i)).zzaaP.disconnect();
      i += 1;
    }
  }
  
  public void zza(int paramInt, GoogleApiClient paramGoogleApiClient, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzx.zzb(paramGoogleApiClient, "GoogleApiClient instance cannot be null");
    if (zzaaN.indexOfKey(paramInt) < 0) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zza(bool, "Already managing a GoogleApiClient with id " + paramInt);
      paramOnConnectionFailedListener = new zza(paramInt, paramGoogleApiClient, paramOnConnectionFailedListener);
      zzaaN.put(paramInt, paramOnConnectionFailedListener);
      if ((mStarted) && (!zzaaJ)) {
        paramGoogleApiClient.connect();
      }
      return;
    }
  }
  
  public void zzbi(int paramInt)
  {
    zza localZza = (zza)zzaaN.get(paramInt);
    zzaaN.remove(paramInt);
    if (localZza != null) {
      localZza.zznK();
    }
  }
  
  private class zza
    implements GoogleApiClient.OnConnectionFailedListener
  {
    public final int zzaaO;
    public final GoogleApiClient zzaaP;
    public final GoogleApiClient.OnConnectionFailedListener zzaaQ;
    
    public zza(int paramInt, GoogleApiClient paramGoogleApiClient, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      zzaaO = paramInt;
      zzaaP = paramGoogleApiClient;
      zzaaQ = paramOnConnectionFailedListener;
      paramGoogleApiClient.registerConnectionFailedListener(this);
    }
    
    public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
    {
      paramPrintWriter.append(paramString).append("GoogleApiClient #").print(zzaaO);
      paramPrintWriter.println(":");
      zzaaP.dump(paramString + "  ", paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    }
    
    public void onConnectionFailed(ConnectionResult paramConnectionResult)
    {
      zzp.zzd(zzp.this).post(new zzp.zzb(zzp.this, zzaaO, paramConnectionResult));
    }
    
    public void zznK()
    {
      zzaaP.unregisterConnectionFailedListener(this);
      zzaaP.disconnect();
    }
  }
  
  private class zzb
    implements Runnable
  {
    private final int zzaaS;
    private final ConnectionResult zzaaT;
    
    public zzb(int paramInt, ConnectionResult paramConnectionResult)
    {
      zzaaS = paramInt;
      zzaaT = paramConnectionResult;
    }
    
    public void run()
    {
      if ((!zzp.zza(zzp.this)) || (zzp.zzb(zzp.this))) {
        return;
      }
      zzp.zza(zzp.this, true);
      zzp.zza(zzp.this, zzaaS);
      zzp.zza(zzp.this, zzaaT);
      if (zzaaT.hasResolution()) {
        try
        {
          int i = getActivity().getSupportFragmentManager().getFragments().indexOf(zzp.this);
          zzaaT.startResolutionForResult(getActivity(), (i + 1 << 16) + 1);
          return;
        }
        catch (IntentSender.SendIntentException localSendIntentException)
        {
          zzp.zzc(zzp.this);
          return;
        }
      }
      if (GooglePlayServicesUtil.isUserRecoverableError(zzaaT.getErrorCode()))
      {
        GooglePlayServicesUtil.showErrorDialogFragment(zzaaT.getErrorCode(), getActivity(), zzp.this, 2, zzp.this);
        return;
      }
      zzp.zza(zzp.this, zzaaS, zzaaT);
    }
  }
}
