package com.google.android.gms.appdatasearch;

import android.accounts.Account;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zzc.zza;
import com.google.android.gms.common.api.zzc.zzb;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzjc;
import com.google.android.gms.internal.zzje;
import com.google.android.gms.internal.zzjf;
import java.util.List;

public class GetRecentContextCall
{
  public static class Request
    implements SafeParcelable
  {
    public static final zzf CREATOR = new zzf();
    final int mVersionCode;
    public final Account zzPl;
    public final boolean zzPm;
    public final boolean zzPn;
    public final boolean zzPo;
    public final String zzPp;
    
    public Request()
    {
      this(null, false, false, false, null);
    }
    
    Request(int paramInt, Account paramAccount, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString)
    {
      mVersionCode = paramInt;
      zzPl = paramAccount;
      zzPm = paramBoolean1;
      zzPn = paramBoolean2;
      zzPo = paramBoolean3;
      zzPp = paramString;
    }
    
    public Request(Account paramAccount, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString)
    {
      this(1, paramAccount, paramBoolean1, paramBoolean2, paramBoolean3, paramString);
    }
    
    public int describeContents()
    {
      zzf localZzf = CREATOR;
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzf localZzf = CREATOR;
      zzf.zza(this, paramParcel, paramInt);
    }
    
    public static final class zza
    {
      private Account zzPq;
      private boolean zzPr;
      private boolean zzPs;
      private boolean zzPt;
      private String zzPu;
      
      public zza() {}
      
      public zza zzL(boolean paramBoolean)
      {
        zzPs = paramBoolean;
        return this;
      }
      
      public zza zzbw(String paramString)
      {
        zzPu = paramString;
        return this;
      }
      
      public GetRecentContextCall.Request zzlb()
      {
        return new GetRecentContextCall.Request(zzPq, zzPr, zzPs, zzPt, zzPu);
      }
    }
  }
  
  public static class Response
    implements Result, SafeParcelable
  {
    public static final zzg CREATOR = new zzg();
    final int mVersionCode;
    public Status zzPv;
    public List<UsageInfo> zzPw;
    public String[] zzPx;
    
    public Response()
    {
      mVersionCode = 1;
    }
    
    Response(int paramInt, Status paramStatus, List<UsageInfo> paramList, String[] paramArrayOfString)
    {
      mVersionCode = paramInt;
      zzPv = paramStatus;
      zzPw = paramList;
      zzPx = paramArrayOfString;
    }
    
    public int describeContents()
    {
      zzg localZzg = CREATOR;
      return 0;
    }
    
    public Status getStatus()
    {
      return zzPv;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzg localZzg = CREATOR;
      zzg.zza(this, paramParcel, paramInt);
    }
  }
  
  public static class zza
    extends zzc.zza<GetRecentContextCall.Response, zzjf>
  {
    private final GetRecentContextCall.Request zzPj;
    
    public zza(GetRecentContextCall.Request paramRequest, GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
      zzPj = paramRequest;
    }
    
    protected GetRecentContextCall.Response zza(Status paramStatus)
    {
      GetRecentContextCall.Response localResponse = new GetRecentContextCall.Response();
      zzPv = paramStatus;
      return localResponse;
    }
    
    protected void zza(zzjf paramZzjf)
      throws RemoteException
    {
      paramZzjf.zzlg().zza(zzPj, new zzje(this)
      {
        public void zza(GetRecentContextCall.Response paramAnonymousResponse)
        {
          zzPW.zzn(paramAnonymousResponse);
        }
      });
    }
  }
}
