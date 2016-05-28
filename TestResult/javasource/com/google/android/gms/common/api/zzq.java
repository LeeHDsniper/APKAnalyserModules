package com.google.android.gms.common.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
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
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.Loader;
import android.util.Log;
import android.util.SparseArray;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.internal.zzx;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.List;

public class zzq
  extends Fragment
  implements DialogInterface.OnCancelListener, LoaderManager.LoaderCallbacks<ConnectionResult>
{
  private boolean zzaaJ;
  private int zzaaK = -1;
  private ConnectionResult zzaaL;
  private final Handler zzaaM = new Handler(Looper.getMainLooper());
  private final SparseArray<zzb> zzaaN = new SparseArray();
  
  public zzq() {}
  
  private void zza(int paramInt, ConnectionResult paramConnectionResult)
  {
    Log.w("GmsSupportLoaderLifecycleFragment", "Unresolved error while connecting client. Stopping auto-manage.");
    Object localObject = (zzb)zzaaN.get(paramInt);
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
  
  private void zzb(int paramInt, ConnectionResult paramConnectionResult)
  {
    if (!zzaaJ)
    {
      zzaaJ = true;
      zzaaK = paramInt;
      zzaaL = paramConnectionResult;
      zzaaM.post(new zzc(paramInt, paramConnectionResult));
    }
  }
  
  public static zzq zzc(FragmentActivity paramFragmentActivity)
  {
    zzx.zzch("Must be called from main thread of process");
    FragmentManager localFragmentManager = paramFragmentActivity.getSupportFragmentManager();
    try
    {
      zzq localZzq = (zzq)localFragmentManager.findFragmentByTag("GmsSupportLoaderLifecycleFragment");
      if (localZzq != null)
      {
        paramFragmentActivity = localZzq;
        if (!localZzq.isRemoving()) {}
      }
      else
      {
        paramFragmentActivity = new zzq();
        localFragmentManager.beginTransaction().add(paramFragmentActivity, "GmsSupportLoaderLifecycleFragment").commit();
        localFragmentManager.executePendingTransactions();
      }
      return paramFragmentActivity;
    }
    catch (ClassCastException paramFragmentActivity)
    {
      throw new IllegalStateException("Fragment with tag GmsSupportLoaderLifecycleFragment is not a SupportLoaderLifecycleFragment", paramFragmentActivity);
    }
  }
  
  private void zznJ()
  {
    int i = 0;
    zzaaJ = false;
    zzaaK = -1;
    zzaaL = null;
    LoaderManager localLoaderManager = getLoaderManager();
    while (i < zzaaN.size())
    {
      int j = zzaaN.keyAt(i);
      zza localZza = zzbk(j);
      if ((localZza != null) && (localZza.zznL()))
      {
        localLoaderManager.destroyLoader(j);
        localLoaderManager.initLoader(j, null, this);
      }
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
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    int i = 0;
    if (i < zzaaN.size())
    {
      int j = zzaaN.keyAt(i);
      paramActivity = zzbk(j);
      if ((paramActivity != null) && (zzaaN.valueAt(i)).zzaaP != zzaaP)) {
        getLoaderManager().restartLoader(j, null, this);
      }
      for (;;)
      {
        i += 1;
        break;
        getLoaderManager().initLoader(j, null, this);
      }
    }
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
  
  public Loader<ConnectionResult> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new zza(getActivity(), zzaaN.get(paramInt)).zzaaP);
  }
  
  public void onLoaderReset(Loader<ConnectionResult> paramLoader) {}
  
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
    if (!zzaaJ)
    {
      int i = 0;
      while (i < zzaaN.size())
      {
        getLoaderManager().initLoader(zzaaN.keyAt(i), null, this);
        i += 1;
      }
    }
  }
  
  public void zza(int paramInt, GoogleApiClient paramGoogleApiClient, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzx.zzb(paramGoogleApiClient, "GoogleApiClient instance cannot be null");
    if (zzaaN.indexOfKey(paramInt) < 0) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zza(bool, "Already managing a GoogleApiClient with id " + paramInt);
      paramGoogleApiClient = new zzb(paramGoogleApiClient, paramOnConnectionFailedListener, null);
      zzaaN.put(paramInt, paramGoogleApiClient);
      if (getActivity() != null)
      {
        LoaderManager.enableDebugLogging(false);
        getLoaderManager().initLoader(paramInt, null, this);
      }
      return;
    }
  }
  
  public void zza(Loader<ConnectionResult> paramLoader, ConnectionResult paramConnectionResult)
  {
    if (!paramConnectionResult.isSuccess()) {
      zzb(paramLoader.getId(), paramConnectionResult);
    }
  }
  
  public void zzbi(int paramInt)
  {
    zzaaN.remove(paramInt);
    getLoaderManager().destroyLoader(paramInt);
  }
  
  public GoogleApiClient zzbj(int paramInt)
  {
    if (getActivity() != null)
    {
      zza localZza = zzbk(paramInt);
      if (localZza != null) {
        return zzaaP;
      }
    }
    return null;
  }
  
  zza zzbk(int paramInt)
  {
    try
    {
      zza localZza = (zza)getLoaderManager().getLoader(paramInt);
      return localZza;
    }
    catch (ClassCastException localClassCastException)
    {
      throw new IllegalStateException("Unknown loader in SupportLoaderLifecycleFragment", localClassCastException);
    }
  }
  
  static class zza
    extends Loader<ConnectionResult>
    implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
  {
    public final GoogleApiClient zzaaP;
    private boolean zzaaU;
    private ConnectionResult zzaaV;
    
    public zza(Context paramContext, GoogleApiClient paramGoogleApiClient)
    {
      super();
      zzaaP = paramGoogleApiClient;
    }
    
    private void zzh(ConnectionResult paramConnectionResult)
    {
      zzaaV = paramConnectionResult;
      if ((isStarted()) && (!isAbandoned())) {
        deliverResult(paramConnectionResult);
      }
    }
    
    public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
    {
      super.dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
      zzaaP.dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    }
    
    public void onConnected(Bundle paramBundle)
    {
      zzaaU = false;
      zzh(ConnectionResult.zzYi);
    }
    
    public void onConnectionFailed(ConnectionResult paramConnectionResult)
    {
      zzaaU = true;
      zzh(paramConnectionResult);
    }
    
    public void onConnectionSuspended(int paramInt) {}
    
    protected void onReset()
    {
      zzaaV = null;
      zzaaU = false;
      zzaaP.unregisterConnectionCallbacks(this);
      zzaaP.unregisterConnectionFailedListener(this);
      zzaaP.disconnect();
    }
    
    protected void onStartLoading()
    {
      super.onStartLoading();
      zzaaP.registerConnectionCallbacks(this);
      zzaaP.registerConnectionFailedListener(this);
      if (zzaaV != null) {
        deliverResult(zzaaV);
      }
      if ((!zzaaP.isConnected()) && (!zzaaP.isConnecting()) && (!zzaaU)) {
        zzaaP.connect();
      }
    }
    
    protected void onStopLoading()
    {
      zzaaP.disconnect();
    }
    
    public boolean zznL()
    {
      return zzaaU;
    }
  }
  
  private static class zzb
  {
    public final GoogleApiClient zzaaP;
    public final GoogleApiClient.OnConnectionFailedListener zzaaQ;
    
    private zzb(GoogleApiClient paramGoogleApiClient, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      zzaaP = paramGoogleApiClient;
      zzaaQ = paramOnConnectionFailedListener;
    }
  }
  
  private class zzc
    implements Runnable
  {
    private final int zzaaS;
    private final ConnectionResult zzaaT;
    
    public zzc(int paramInt, ConnectionResult paramConnectionResult)
    {
      zzaaS = paramInt;
      zzaaT = paramConnectionResult;
    }
    
    public void run()
    {
      if (zzaaT.hasResolution()) {
        try
        {
          int i = getActivity().getSupportFragmentManager().getFragments().indexOf(zzq.this);
          zzaaT.startResolutionForResult(getActivity(), (i + 1 << 16) + 1);
          return;
        }
        catch (IntentSender.SendIntentException localSendIntentException)
        {
          zzq.zza(zzq.this);
          return;
        }
      }
      if (GooglePlayServicesUtil.isUserRecoverableError(zzaaT.getErrorCode()))
      {
        GooglePlayServicesUtil.showErrorDialogFragment(zzaaT.getErrorCode(), getActivity(), zzq.this, 2, zzq.this);
        return;
      }
      zzq.zza(zzq.this, zzaaS, zzaaT);
    }
  }
}
