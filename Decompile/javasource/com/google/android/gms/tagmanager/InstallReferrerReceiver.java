package com.google.android.gms.tagmanager;

import com.google.android.gms.analytics.CampaignTrackingReceiver;
import com.google.android.gms.analytics.CampaignTrackingService;

public final class InstallReferrerReceiver
  extends CampaignTrackingReceiver
{
  public InstallReferrerReceiver() {}
  
  protected void zzaQ(String paramString)
  {
    zzax.zzeM(paramString);
  }
  
  protected Class<? extends CampaignTrackingService> zzht()
  {
    return InstallReferrerService.class;
  }
}
