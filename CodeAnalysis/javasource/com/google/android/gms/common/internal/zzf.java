package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.content.Context;
import android.view.View;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient.Builder;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.signin.zze;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public final class zzf
{
  private final Account zzOY;
  private final String zzQl;
  private final Set<Scope> zzYY;
  private final int zzYZ;
  private final View zzZa;
  private final String zzZb;
  private final Set<Scope> zzadc;
  private final Map<Api<?>, zza> zzadd;
  private final zze zzade;
  private Integer zzadf;
  
  public zzf(Account paramAccount, Set<Scope> paramSet, Map<Api<?>, zza> paramMap, int paramInt, View paramView, String paramString1, String paramString2, zze paramZze)
  {
    zzOY = paramAccount;
    if (paramSet == null) {}
    for (paramAccount = Collections.EMPTY_SET;; paramAccount = Collections.unmodifiableSet(paramSet))
    {
      zzYY = paramAccount;
      paramAccount = paramMap;
      if (paramMap == null) {
        paramAccount = Collections.EMPTY_MAP;
      }
      zzadd = paramAccount;
      zzZa = paramView;
      zzYZ = paramInt;
      zzQl = paramString1;
      zzZb = paramString2;
      zzade = paramZze;
      paramAccount = new HashSet(zzYY);
      paramSet = zzadd.values().iterator();
      while (paramSet.hasNext()) {
        paramAccount.addAll(nextzzZp);
      }
    }
    zzadc = Collections.unmodifiableSet(paramAccount);
  }
  
  public static zzf zzaj(Context paramContext)
  {
    return new GoogleApiClient.Builder(paramContext).zzni();
  }
  
  public Account getAccount()
  {
    return zzOY;
  }
  
  public void zza(Integer paramInteger)
  {
    zzadf = paramInteger;
  }
  
  public Account zzog()
  {
    if (zzOY != null) {
      return zzOY;
    }
    return new Account("<<default account>>", "com.google");
  }
  
  public Set<Scope> zzoi()
  {
    return zzYY;
  }
  
  public Set<Scope> zzoj()
  {
    return zzadc;
  }
  
  public Map<Api<?>, zza> zzok()
  {
    return zzadd;
  }
  
  public String zzol()
  {
    return zzQl;
  }
  
  public String zzom()
  {
    return zzZb;
  }
  
  public zze zzoo()
  {
    return zzade;
  }
  
  public Integer zzop()
  {
    return zzadf;
  }
  
  public static final class zza
  {
    public final Set<Scope> zzZp;
    public final boolean zzadg;
  }
}
