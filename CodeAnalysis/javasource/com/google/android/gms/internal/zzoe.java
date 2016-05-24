package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public abstract class zzoe<T extends zzoe>
{
  private final zzof zzaIa;
  protected final zzob zzaIb;
  private final List<zzoc> zzaIc;
  
  protected zzoe(zzof paramZzof, zzlm paramZzlm)
  {
    zzx.zzv(paramZzof);
    zzaIa = paramZzof;
    zzaIc = new ArrayList();
    paramZzof = new zzob(this, paramZzlm);
    paramZzof.zzxr();
    zzaIb = paramZzof;
  }
  
  protected void zza(zzob paramZzob) {}
  
  protected void zzd(zzob paramZzob)
  {
    Iterator localIterator = zzaIc.iterator();
    while (localIterator.hasNext()) {
      ((zzoc)localIterator.next()).zza(this, paramZzob);
    }
  }
  
  public zzob zzhq()
  {
    zzob localZzob = zzaIb.zzxh();
    zzd(localZzob);
    return localZzob;
  }
  
  protected zzof zzxp()
  {
    return zzaIa;
  }
  
  public zzob zzxs()
  {
    return zzaIb;
  }
  
  public List<zzoh> zzxt()
  {
    return zzaIb.zzxj();
  }
}
