package com.google.android.gms.ads;

import android.app.Activity;
import android.os.Bundle;
import android.os.RemoteException;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzfd;
import com.google.android.gms.internal.zzfe;

public class AdActivity
  extends Activity
{
  public static final String CLASS_NAME = "com.google.android.gms.ads.AdActivity";
  public static final String SIMPLE_CLASS_NAME = "AdActivity";
  private zzfe zznJ;
  
  public AdActivity() {}
  
  private void zzaE()
  {
    if (zznJ != null) {}
    try
    {
      zznJ.zzaE();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward setContentViewSet to ad overlay:", localRemoteException);
    }
  }
  
  public void onBackPressed()
  {
    boolean bool2 = true;
    boolean bool1 = bool2;
    try
    {
      if (zznJ != null) {
        bool1 = zznJ.zzez();
      }
      if (bool1) {
        super.onBackPressed();
      }
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        zzb.zzd("Could not forward onBackPressed to ad overlay:", localRemoteException);
        bool1 = bool2;
      }
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    zznJ = zzfd.zzb(this);
    if (zznJ == null)
    {
      zzb.zzaE("Could not create ad overlay.");
      finish();
      return;
    }
    try
    {
      zznJ.onCreate(paramBundle);
      return;
    }
    catch (RemoteException paramBundle)
    {
      zzb.zzd("Could not forward onCreate to ad overlay:", paramBundle);
      finish();
    }
  }
  
  protected void onDestroy()
  {
    try
    {
      if (zznJ != null) {
        zznJ.onDestroy();
      }
      super.onDestroy();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        zzb.zzd("Could not forward onDestroy to ad overlay:", localRemoteException);
      }
    }
  }
  
  protected void onPause()
  {
    try
    {
      if (zznJ != null) {
        zznJ.onPause();
      }
      super.onPause();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        zzb.zzd("Could not forward onPause to ad overlay:", localRemoteException);
        finish();
      }
    }
  }
  
  protected void onRestart()
  {
    super.onRestart();
    try
    {
      if (zznJ != null) {
        zznJ.onRestart();
      }
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward onRestart to ad overlay:", localRemoteException);
      finish();
    }
  }
  
  protected void onResume()
  {
    super.onResume();
    try
    {
      if (zznJ != null) {
        zznJ.onResume();
      }
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward onResume to ad overlay:", localRemoteException);
      finish();
    }
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    try
    {
      if (zznJ != null) {
        zznJ.onSaveInstanceState(paramBundle);
      }
      super.onSaveInstanceState(paramBundle);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        zzb.zzd("Could not forward onSaveInstanceState to ad overlay:", localRemoteException);
        finish();
      }
    }
  }
  
  protected void onStart()
  {
    super.onStart();
    try
    {
      if (zznJ != null) {
        zznJ.onStart();
      }
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward onStart to ad overlay:", localRemoteException);
      finish();
    }
  }
  
  protected void onStop()
  {
    try
    {
      if (zznJ != null) {
        zznJ.onStop();
      }
      super.onStop();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        zzb.zzd("Could not forward onStop to ad overlay:", localRemoteException);
        finish();
      }
    }
  }
  
  public void setContentView(int paramInt)
  {
    super.setContentView(paramInt);
    zzaE();
  }
  
  public void setContentView(View paramView)
  {
    super.setContentView(paramView);
    zzaE();
  }
  
  public void setContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    super.setContentView(paramView, paramLayoutParams);
    zzaE();
  }
}
