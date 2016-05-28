package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface zzaf
{
  public static final class zza
    extends zzrr<zza>
  {
    public int level;
    public int zzhN;
    public int zzhO;
    
    public zza()
    {
      zzA();
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              return bool1;
              bool1 = bool2;
            } while (!(paramObject instanceof zza));
            paramObject = (zza)paramObject;
            bool1 = bool2;
          } while (level != level);
          bool1 = bool2;
        } while (zzhN != zzhN);
        bool1 = bool2;
      } while (zzhO != zzhO);
      return zza(paramObject);
    }
    
    public int hashCode()
    {
      return (((level + 527) * 31 + zzhN) * 31 + zzhO) * 31 + zzDk();
    }
    
    public zza zzA()
    {
      level = 1;
      zzhN = 0;
      zzhO = 0;
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    protected int zzB()
    {
      int j = super.zzB();
      int i = j;
      if (level != 1) {
        i = j + zzrq.zzB(1, level);
      }
      j = i;
      if (zzhN != 0) {
        j = i + zzrq.zzB(2, zzhN);
      }
      i = j;
      if (zzhO != 0) {
        i = j + zzrq.zzB(3, zzhO);
      }
      return i;
    }
    
    public zza zza(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        switch (i)
        {
        default: 
          if (zza(paramZzrp, i)) {}
          break;
        case 0: 
          return this;
        case 8: 
          i = paramZzrp.zzCW();
          switch (i)
          {
          default: 
            break;
          case 1: 
          case 2: 
          case 3: 
            level = i;
          }
          break;
        case 16: 
          zzhN = paramZzrp.zzCW();
          break;
        case 24: 
          zzhO = paramZzrp.zzCW();
        }
      }
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      if (level != 1) {
        paramZzrq.zzz(1, level);
      }
      if (zzhN != 0) {
        paramZzrq.zzz(2, zzhN);
      }
      if (zzhO != 0) {
        paramZzrq.zzz(3, zzhO);
      }
      super.zza(paramZzrq);
    }
  }
  
  public static final class zzb
    extends zzrr<zzb>
  {
    private static volatile zzb[] zzhP;
    public int name;
    public int[] zzhQ;
    public int zzhR;
    public boolean zzhS;
    public boolean zzhT;
    
    public zzb()
    {
      zzD();
    }
    
    public static zzb[] zzC()
    {
      if (zzhP == null) {}
      synchronized (zzrv.zzbck)
      {
        if (zzhP == null) {
          zzhP = new zzb[0];
        }
        return zzhP;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  return bool1;
                  bool1 = bool2;
                } while (!(paramObject instanceof zzb));
                paramObject = (zzb)paramObject;
                bool1 = bool2;
              } while (!zzrv.equals(zzhQ, zzhQ));
              bool1 = bool2;
            } while (zzhR != zzhR);
            bool1 = bool2;
          } while (name != name);
          bool1 = bool2;
        } while (zzhS != zzhS);
        bool1 = bool2;
      } while (zzhT != zzhT);
      return zza(paramObject);
    }
    
    public int hashCode()
    {
      int j = 1231;
      int k = zzrv.hashCode(zzhQ);
      int m = zzhR;
      int n = name;
      int i;
      if (zzhS)
      {
        i = 1231;
        if (!zzhT) {
          break label85;
        }
      }
      for (;;)
      {
        return ((i + (((k + 527) * 31 + m) * 31 + n) * 31) * 31 + j) * 31 + zzDk();
        i = 1237;
        break;
        label85:
        j = 1237;
      }
    }
    
    protected int zzB()
    {
      int j = 0;
      int k = super.zzB();
      int i = k;
      if (zzhT) {
        i = k + zzrq.zzc(1, zzhT);
      }
      k = zzrq.zzB(2, zzhR) + i;
      if ((zzhQ != null) && (zzhQ.length > 0))
      {
        i = 0;
        while (i < zzhQ.length)
        {
          j += zzrq.zzls(zzhQ[i]);
          i += 1;
        }
      }
      for (j = k + j + zzhQ.length * 1;; j = k)
      {
        i = j;
        if (name != 0) {
          i = j + zzrq.zzB(4, name);
        }
        j = i;
        if (zzhS) {
          j = i + zzrq.zzc(6, zzhS);
        }
        return j;
      }
    }
    
    public zzb zzD()
    {
      zzhQ = zzsa.zzbcn;
      zzhR = 0;
      name = 0;
      zzhS = false;
      zzhT = false;
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      if (zzhT) {
        paramZzrq.zzb(1, zzhT);
      }
      paramZzrq.zzz(2, zzhR);
      if ((zzhQ != null) && (zzhQ.length > 0))
      {
        int i = 0;
        while (i < zzhQ.length)
        {
          paramZzrq.zzz(3, zzhQ[i]);
          i += 1;
        }
      }
      if (name != 0) {
        paramZzrq.zzz(4, name);
      }
      if (zzhS) {
        paramZzrq.zzb(6, zzhS);
      }
      super.zza(paramZzrq);
    }
    
    public zzb zzc(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        int j;
        int[] arrayOfInt;
        switch (i)
        {
        default: 
          if (zza(paramZzrp, i)) {}
          break;
        case 0: 
          return this;
        case 8: 
          zzhT = paramZzrp.zzCX();
          break;
        case 16: 
          zzhR = paramZzrp.zzCW();
          break;
        case 24: 
          j = zzsa.zzb(paramZzrp, 24);
          if (zzhQ == null) {}
          for (i = 0;; i = zzhQ.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzhQ, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zzhQ = arrayOfInt;
          break;
        case 26: 
          int k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zzhQ == null) {}
          for (i = 0;; i = zzhQ.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzhQ, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zzhQ = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 32: 
          name = paramZzrp.zzCW();
          break;
        case 48: 
          zzhS = paramZzrp.zzCX();
        }
      }
    }
  }
  
  public static final class zzc
    extends zzrr<zzc>
  {
    private static volatile zzc[] zzhU;
    public String key;
    public long zzhV;
    public long zzhW;
    public boolean zzhX;
    public long zzhY;
    
    public zzc()
    {
      zzF();
    }
    
    public static zzc[] zzE()
    {
      if (zzhU == null) {}
      synchronized (zzrv.zzbck)
      {
        if (zzhU == null) {
          zzhU = new zzc[0];
        }
        return zzhU;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          return bool1;
          bool1 = bool2;
        } while (!(paramObject instanceof zzc));
        paramObject = (zzc)paramObject;
        if (key != null) {
          break;
        }
        bool1 = bool2;
      } while (key != null);
      while (key.equals(key))
      {
        bool1 = bool2;
        if (zzhV != zzhV) {
          break;
        }
        bool1 = bool2;
        if (zzhW != zzhW) {
          break;
        }
        bool1 = bool2;
        if (zzhX != zzhX) {
          break;
        }
        bool1 = bool2;
        if (zzhY != zzhY) {
          break;
        }
        return zza(paramObject);
      }
      return false;
    }
    
    public int hashCode()
    {
      int i;
      int k;
      int m;
      if (key == null)
      {
        i = 0;
        k = (int)(zzhV ^ zzhV >>> 32);
        m = (int)(zzhW ^ zzhW >>> 32);
        if (!zzhX) {
          break label107;
        }
      }
      label107:
      for (int j = 1231;; j = 1237)
      {
        return ((j + (((i + 527) * 31 + k) * 31 + m) * 31) * 31 + (int)(zzhY ^ zzhY >>> 32)) * 31 + zzDk();
        i = key.hashCode();
        break;
      }
    }
    
    protected int zzB()
    {
      int j = super.zzB();
      int i = j;
      if (!key.equals("")) {
        i = j + zzrq.zzl(1, key);
      }
      j = i;
      if (zzhV != 0L) {
        j = i + zzrq.zzd(2, zzhV);
      }
      i = j;
      if (zzhW != 2147483647L) {
        i = j + zzrq.zzd(3, zzhW);
      }
      j = i;
      if (zzhX) {
        j = i + zzrq.zzc(4, zzhX);
      }
      i = j;
      if (zzhY != 0L) {
        i = j + zzrq.zzd(5, zzhY);
      }
      return i;
    }
    
    public zzc zzF()
    {
      key = "";
      zzhV = 0L;
      zzhW = 2147483647L;
      zzhX = false;
      zzhY = 0L;
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      if (!key.equals("")) {
        paramZzrq.zzb(1, key);
      }
      if (zzhV != 0L) {
        paramZzrq.zzb(2, zzhV);
      }
      if (zzhW != 2147483647L) {
        paramZzrq.zzb(3, zzhW);
      }
      if (zzhX) {
        paramZzrq.zzb(4, zzhX);
      }
      if (zzhY != 0L) {
        paramZzrq.zzb(5, zzhY);
      }
      super.zza(paramZzrq);
    }
    
    public zzc zzd(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        switch (i)
        {
        default: 
          if (zza(paramZzrp, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          key = paramZzrp.readString();
          break;
        case 16: 
          zzhV = paramZzrp.zzCV();
          break;
        case 24: 
          zzhW = paramZzrp.zzCV();
          break;
        case 32: 
          zzhX = paramZzrp.zzCX();
          break;
        case 40: 
          zzhY = paramZzrp.zzCV();
        }
      }
    }
  }
  
  public static final class zzd
    extends zzrr<zzd>
  {
    public zzag.zza[] zzhZ;
    public zzag.zza[] zzia;
    public zzaf.zzc[] zzib;
    
    public zzd()
    {
      zzG();
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              return bool1;
              bool1 = bool2;
            } while (!(paramObject instanceof zzd));
            paramObject = (zzd)paramObject;
            bool1 = bool2;
          } while (!zzrv.equals(zzhZ, zzhZ));
          bool1 = bool2;
        } while (!zzrv.equals(zzia, zzia));
        bool1 = bool2;
      } while (!zzrv.equals(zzib, zzib));
      return zza(paramObject);
    }
    
    public int hashCode()
    {
      return (((zzrv.hashCode(zzhZ) + 527) * 31 + zzrv.hashCode(zzia)) * 31 + zzrv.hashCode(zzib)) * 31 + zzDk();
    }
    
    protected int zzB()
    {
      int m = 0;
      int i = super.zzB();
      int j = i;
      Object localObject;
      if (zzhZ != null)
      {
        j = i;
        if (zzhZ.length > 0)
        {
          j = 0;
          while (j < zzhZ.length)
          {
            localObject = zzhZ[j];
            k = i;
            if (localObject != null) {
              k = i + zzrq.zzc(1, (zzrx)localObject);
            }
            j += 1;
            i = k;
          }
          j = i;
        }
      }
      i = j;
      if (zzia != null)
      {
        i = j;
        if (zzia.length > 0)
        {
          i = j;
          j = 0;
          while (j < zzia.length)
          {
            localObject = zzia[j];
            k = i;
            if (localObject != null) {
              k = i + zzrq.zzc(2, (zzrx)localObject);
            }
            j += 1;
            i = k;
          }
        }
      }
      int k = i;
      if (zzib != null)
      {
        k = i;
        if (zzib.length > 0)
        {
          j = m;
          for (;;)
          {
            k = i;
            if (j >= zzib.length) {
              break;
            }
            localObject = zzib[j];
            k = i;
            if (localObject != null) {
              k = i + zzrq.zzc(3, (zzrx)localObject);
            }
            j += 1;
            i = k;
          }
        }
      }
      return k;
    }
    
    public zzd zzG()
    {
      zzhZ = zzag.zza.zzQ();
      zzia = zzag.zza.zzQ();
      zzib = zzaf.zzc.zzE();
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      int j = 0;
      int i;
      Object localObject;
      if ((zzhZ != null) && (zzhZ.length > 0))
      {
        i = 0;
        while (i < zzhZ.length)
        {
          localObject = zzhZ[i];
          if (localObject != null) {
            paramZzrq.zza(1, (zzrx)localObject);
          }
          i += 1;
        }
      }
      if ((zzia != null) && (zzia.length > 0))
      {
        i = 0;
        while (i < zzia.length)
        {
          localObject = zzia[i];
          if (localObject != null) {
            paramZzrq.zza(2, (zzrx)localObject);
          }
          i += 1;
        }
      }
      if ((zzib != null) && (zzib.length > 0))
      {
        i = j;
        while (i < zzib.length)
        {
          localObject = zzib[i];
          if (localObject != null) {
            paramZzrq.zza(3, (zzrx)localObject);
          }
          i += 1;
        }
      }
      super.zza(paramZzrq);
    }
    
    public zzd zze(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        int j;
        Object localObject;
        switch (i)
        {
        default: 
          if (zza(paramZzrp, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          j = zzsa.zzb(paramZzrp, 10);
          if (zzhZ == null) {}
          for (i = 0;; i = zzhZ.length)
          {
            localObject = new zzag.zza[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzhZ, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zzag.zza();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zzag.zza();
          paramZzrp.zza(localObject[j]);
          zzhZ = ((zzag.zza[])localObject);
          break;
        case 18: 
          j = zzsa.zzb(paramZzrp, 18);
          if (zzia == null) {}
          for (i = 0;; i = zzia.length)
          {
            localObject = new zzag.zza[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzia, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zzag.zza();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zzag.zza();
          paramZzrp.zza(localObject[j]);
          zzia = ((zzag.zza[])localObject);
          break;
        case 26: 
          j = zzsa.zzb(paramZzrp, 26);
          if (zzib == null) {}
          for (i = 0;; i = zzib.length)
          {
            localObject = new zzaf.zzc[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzib, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zzaf.zzc();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zzaf.zzc();
          paramZzrp.zza(localObject[j]);
          zzib = ((zzaf.zzc[])localObject);
        }
      }
    }
  }
  
  public static final class zze
    extends zzrr<zze>
  {
    private static volatile zze[] zzic;
    public int key;
    public int value;
    
    public zze()
    {
      zzI();
    }
    
    public static zze[] zzH()
    {
      if (zzic == null) {}
      synchronized (zzrv.zzbck)
      {
        if (zzic == null) {
          zzic = new zze[0];
        }
        return zzic;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            return bool1;
            bool1 = bool2;
          } while (!(paramObject instanceof zze));
          paramObject = (zze)paramObject;
          bool1 = bool2;
        } while (key != key);
        bool1 = bool2;
      } while (value != value);
      return zza(paramObject);
    }
    
    public int hashCode()
    {
      return ((key + 527) * 31 + value) * 31 + zzDk();
    }
    
    protected int zzB()
    {
      return super.zzB() + zzrq.zzB(1, key) + zzrq.zzB(2, value);
    }
    
    public zze zzI()
    {
      key = 0;
      value = 0;
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      paramZzrq.zzz(1, key);
      paramZzrq.zzz(2, value);
      super.zza(paramZzrq);
    }
    
    public zze zzf(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        switch (i)
        {
        default: 
          if (zza(paramZzrp, i)) {}
          break;
        case 0: 
          return this;
        case 8: 
          key = paramZzrp.zzCW();
          break;
        case 16: 
          value = paramZzrp.zzCW();
        }
      }
    }
  }
  
  public static final class zzf
    extends zzrr<zzf>
  {
    public String version;
    public String[] zzid;
    public String[] zzie;
    public zzag.zza[] zzif;
    public zzaf.zze[] zzig;
    public zzaf.zzb[] zzih;
    public zzaf.zzb[] zzii;
    public zzaf.zzb[] zzij;
    public zzaf.zzg[] zzik;
    public String zzil;
    public String zzim;
    public String zzin;
    public zzaf.zza zzio;
    public float zzip;
    public boolean zziq;
    public String[] zzir;
    public int zzis;
    
    public zzf()
    {
      zzJ();
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      label169:
      label185:
      label201:
      label217:
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            do
                            {
                              do
                              {
                                do
                                {
                                  return bool1;
                                  bool1 = bool2;
                                } while (!(paramObject instanceof zzf));
                                paramObject = (zzf)paramObject;
                                bool1 = bool2;
                              } while (!zzrv.equals(zzid, zzid));
                              bool1 = bool2;
                            } while (!zzrv.equals(zzie, zzie));
                            bool1 = bool2;
                          } while (!zzrv.equals(zzif, zzif));
                          bool1 = bool2;
                        } while (!zzrv.equals(zzig, zzig));
                        bool1 = bool2;
                      } while (!zzrv.equals(zzih, zzih));
                      bool1 = bool2;
                    } while (!zzrv.equals(zzii, zzii));
                    bool1 = bool2;
                  } while (!zzrv.equals(zzij, zzij));
                  bool1 = bool2;
                } while (!zzrv.equals(zzik, zzik));
                if (zzil != null) {
                  break;
                }
                bool1 = bool2;
              } while (zzil != null);
              if (zzim != null) {
                break label316;
              }
              bool1 = bool2;
            } while (zzim != null);
            if (zzin != null) {
              break label332;
            }
            bool1 = bool2;
          } while (zzin != null);
          if (version != null) {
            break label348;
          }
          bool1 = bool2;
        } while (version != null);
        if (zzio != null) {
          break label364;
        }
        bool1 = bool2;
      } while (zzio != null);
      label316:
      label332:
      label348:
      label364:
      while (zzio.equals(zzio))
      {
        bool1 = bool2;
        if (Float.floatToIntBits(zzip) != Float.floatToIntBits(zzip)) {
          break;
        }
        bool1 = bool2;
        if (zziq != zziq) {
          break;
        }
        bool1 = bool2;
        if (!zzrv.equals(zzir, zzir)) {
          break;
        }
        bool1 = bool2;
        if (zzis != zzis) {
          break;
        }
        return zza(paramObject);
        if (zzil.equals(zzil)) {
          break label169;
        }
        return false;
        if (zzim.equals(zzim)) {
          break label185;
        }
        return false;
        if (zzin.equals(zzin)) {
          break label201;
        }
        return false;
        if (version.equals(version)) {
          break label217;
        }
        return false;
      }
      return false;
    }
    
    public int hashCode()
    {
      int n = 0;
      int i2 = zzrv.hashCode(zzid);
      int i3 = zzrv.hashCode(zzie);
      int i4 = zzrv.hashCode(zzif);
      int i5 = zzrv.hashCode(zzig);
      int i6 = zzrv.hashCode(zzih);
      int i7 = zzrv.hashCode(zzii);
      int i8 = zzrv.hashCode(zzij);
      int i9 = zzrv.hashCode(zzik);
      int i;
      int j;
      label93:
      int k;
      label102:
      int m;
      label112:
      label119:
      int i10;
      if (zzil == null)
      {
        i = 0;
        if (zzim != null) {
          break label266;
        }
        j = 0;
        if (zzin != null) {
          break label277;
        }
        k = 0;
        if (version != null) {
          break label288;
        }
        m = 0;
        if (zzio != null) {
          break label300;
        }
        i10 = Float.floatToIntBits(zzip);
        if (!zziq) {
          break label312;
        }
      }
      label266:
      label277:
      label288:
      label300:
      label312:
      for (int i1 = 1231;; i1 = 1237)
      {
        return (((i1 + (((m + (k + (j + (i + ((((((((i2 + 527) * 31 + i3) * 31 + i4) * 31 + i5) * 31 + i6) * 31 + i7) * 31 + i8) * 31 + i9) * 31) * 31) * 31) * 31) * 31 + n) * 31 + i10) * 31) * 31 + zzrv.hashCode(zzir)) * 31 + zzis) * 31 + zzDk();
        i = zzil.hashCode();
        break;
        j = zzim.hashCode();
        break label93;
        k = zzin.hashCode();
        break label102;
        m = version.hashCode();
        break label112;
        n = zzio.hashCode();
        break label119;
      }
    }
    
    protected int zzB()
    {
      int i2 = 0;
      int i1 = super.zzB();
      int i;
      int k;
      Object localObject;
      int n;
      int m;
      if ((zzie != null) && (zzie.length > 0))
      {
        i = 0;
        j = 0;
        for (k = 0; i < zzie.length; k = m)
        {
          localObject = zzie[i];
          n = j;
          m = k;
          if (localObject != null)
          {
            m = k + 1;
            n = j + zzrq.zzfy((String)localObject);
          }
          i += 1;
          j = n;
        }
      }
      for (int j = i1 + j + k * 1;; j = i1)
      {
        i = j;
        if (zzif != null)
        {
          i = j;
          if (zzif.length > 0)
          {
            i = j;
            j = 0;
            while (j < zzif.length)
            {
              localObject = zzif[j];
              k = i;
              if (localObject != null) {
                k = i + zzrq.zzc(2, (zzrx)localObject);
              }
              j += 1;
              i = k;
            }
          }
        }
        j = i;
        if (zzig != null)
        {
          j = i;
          if (zzig.length > 0)
          {
            j = 0;
            while (j < zzig.length)
            {
              localObject = zzig[j];
              k = i;
              if (localObject != null) {
                k = i + zzrq.zzc(3, (zzrx)localObject);
              }
              j += 1;
              i = k;
            }
            j = i;
          }
        }
        i = j;
        if (zzih != null)
        {
          i = j;
          if (zzih.length > 0)
          {
            i = j;
            j = 0;
            while (j < zzih.length)
            {
              localObject = zzih[j];
              k = i;
              if (localObject != null) {
                k = i + zzrq.zzc(4, (zzrx)localObject);
              }
              j += 1;
              i = k;
            }
          }
        }
        j = i;
        if (zzii != null)
        {
          j = i;
          if (zzii.length > 0)
          {
            j = 0;
            while (j < zzii.length)
            {
              localObject = zzii[j];
              k = i;
              if (localObject != null) {
                k = i + zzrq.zzc(5, (zzrx)localObject);
              }
              j += 1;
              i = k;
            }
            j = i;
          }
        }
        i = j;
        if (zzij != null)
        {
          i = j;
          if (zzij.length > 0)
          {
            i = j;
            j = 0;
            while (j < zzij.length)
            {
              localObject = zzij[j];
              k = i;
              if (localObject != null) {
                k = i + zzrq.zzc(6, (zzrx)localObject);
              }
              j += 1;
              i = k;
            }
          }
        }
        j = i;
        if (zzik != null)
        {
          j = i;
          if (zzik.length > 0)
          {
            j = 0;
            while (j < zzik.length)
            {
              localObject = zzik[j];
              k = i;
              if (localObject != null) {
                k = i + zzrq.zzc(7, (zzrx)localObject);
              }
              j += 1;
              i = k;
            }
            j = i;
          }
        }
        i = j;
        if (!zzil.equals("")) {
          i = j + zzrq.zzl(9, zzil);
        }
        j = i;
        if (!zzim.equals("")) {
          j = i + zzrq.zzl(10, zzim);
        }
        i = j;
        if (!zzin.equals("0")) {
          i = j + zzrq.zzl(12, zzin);
        }
        j = i;
        if (!version.equals("")) {
          j = i + zzrq.zzl(13, version);
        }
        k = j;
        if (zzio != null) {
          k = j + zzrq.zzc(14, zzio);
        }
        i = k;
        if (Float.floatToIntBits(zzip) != Float.floatToIntBits(0.0F)) {
          i = k + zzrq.zzc(15, zzip);
        }
        j = i;
        if (zzir != null)
        {
          j = i;
          if (zzir.length > 0)
          {
            j = 0;
            k = 0;
            for (m = 0; j < zzir.length; m = n)
            {
              localObject = zzir[j];
              i1 = k;
              n = m;
              if (localObject != null)
              {
                n = m + 1;
                i1 = k + zzrq.zzfy((String)localObject);
              }
              j += 1;
              k = i1;
            }
            j = i + k + m * 2;
          }
        }
        k = j;
        if (zzis != 0) {
          k = j + zzrq.zzB(17, zzis);
        }
        i = k;
        if (zziq) {
          i = k + zzrq.zzc(18, zziq);
        }
        j = i;
        if (zzid != null)
        {
          j = i;
          if (zzid.length > 0)
          {
            k = 0;
            m = 0;
            j = i2;
            while (j < zzid.length)
            {
              localObject = zzid[j];
              i1 = k;
              n = m;
              if (localObject != null)
              {
                n = m + 1;
                i1 = k + zzrq.zzfy((String)localObject);
              }
              j += 1;
              k = i1;
              m = n;
            }
            j = i + k + m * 2;
          }
        }
        return j;
      }
    }
    
    public zzf zzJ()
    {
      zzid = zzsa.zzbcs;
      zzie = zzsa.zzbcs;
      zzif = zzag.zza.zzQ();
      zzig = zzaf.zze.zzH();
      zzih = zzaf.zzb.zzC();
      zzii = zzaf.zzb.zzC();
      zzij = zzaf.zzb.zzC();
      zzik = zzaf.zzg.zzK();
      zzil = "";
      zzim = "";
      zzin = "0";
      version = "";
      zzio = null;
      zzip = 0.0F;
      zziq = false;
      zzir = zzsa.zzbcs;
      zzis = 0;
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      int j = 0;
      int i;
      Object localObject;
      if ((zzie != null) && (zzie.length > 0))
      {
        i = 0;
        while (i < zzie.length)
        {
          localObject = zzie[i];
          if (localObject != null) {
            paramZzrq.zzb(1, (String)localObject);
          }
          i += 1;
        }
      }
      if ((zzif != null) && (zzif.length > 0))
      {
        i = 0;
        while (i < zzif.length)
        {
          localObject = zzif[i];
          if (localObject != null) {
            paramZzrq.zza(2, (zzrx)localObject);
          }
          i += 1;
        }
      }
      if ((zzig != null) && (zzig.length > 0))
      {
        i = 0;
        while (i < zzig.length)
        {
          localObject = zzig[i];
          if (localObject != null) {
            paramZzrq.zza(3, (zzrx)localObject);
          }
          i += 1;
        }
      }
      if ((zzih != null) && (zzih.length > 0))
      {
        i = 0;
        while (i < zzih.length)
        {
          localObject = zzih[i];
          if (localObject != null) {
            paramZzrq.zza(4, (zzrx)localObject);
          }
          i += 1;
        }
      }
      if ((zzii != null) && (zzii.length > 0))
      {
        i = 0;
        while (i < zzii.length)
        {
          localObject = zzii[i];
          if (localObject != null) {
            paramZzrq.zza(5, (zzrx)localObject);
          }
          i += 1;
        }
      }
      if ((zzij != null) && (zzij.length > 0))
      {
        i = 0;
        while (i < zzij.length)
        {
          localObject = zzij[i];
          if (localObject != null) {
            paramZzrq.zza(6, (zzrx)localObject);
          }
          i += 1;
        }
      }
      if ((zzik != null) && (zzik.length > 0))
      {
        i = 0;
        while (i < zzik.length)
        {
          localObject = zzik[i];
          if (localObject != null) {
            paramZzrq.zza(7, (zzrx)localObject);
          }
          i += 1;
        }
      }
      if (!zzil.equals("")) {
        paramZzrq.zzb(9, zzil);
      }
      if (!zzim.equals("")) {
        paramZzrq.zzb(10, zzim);
      }
      if (!zzin.equals("0")) {
        paramZzrq.zzb(12, zzin);
      }
      if (!version.equals("")) {
        paramZzrq.zzb(13, version);
      }
      if (zzio != null) {
        paramZzrq.zza(14, zzio);
      }
      if (Float.floatToIntBits(zzip) != Float.floatToIntBits(0.0F)) {
        paramZzrq.zzb(15, zzip);
      }
      if ((zzir != null) && (zzir.length > 0))
      {
        i = 0;
        while (i < zzir.length)
        {
          localObject = zzir[i];
          if (localObject != null) {
            paramZzrq.zzb(16, (String)localObject);
          }
          i += 1;
        }
      }
      if (zzis != 0) {
        paramZzrq.zzz(17, zzis);
      }
      if (zziq) {
        paramZzrq.zzb(18, zziq);
      }
      if ((zzid != null) && (zzid.length > 0))
      {
        i = j;
        while (i < zzid.length)
        {
          localObject = zzid[i];
          if (localObject != null) {
            paramZzrq.zzb(19, (String)localObject);
          }
          i += 1;
        }
      }
      super.zza(paramZzrq);
    }
    
    public zzf zzg(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        int j;
        Object localObject;
        switch (i)
        {
        default: 
          if (zza(paramZzrp, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          j = zzsa.zzb(paramZzrp, 10);
          if (zzie == null) {}
          for (i = 0;; i = zzie.length)
          {
            localObject = new String[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzie, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = paramZzrp.readString();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = paramZzrp.readString();
          zzie = ((String[])localObject);
          break;
        case 18: 
          j = zzsa.zzb(paramZzrp, 18);
          if (zzif == null) {}
          for (i = 0;; i = zzif.length)
          {
            localObject = new zzag.zza[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzif, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zzag.zza();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zzag.zza();
          paramZzrp.zza(localObject[j]);
          zzif = ((zzag.zza[])localObject);
          break;
        case 26: 
          j = zzsa.zzb(paramZzrp, 26);
          if (zzig == null) {}
          for (i = 0;; i = zzig.length)
          {
            localObject = new zzaf.zze[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzig, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zzaf.zze();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zzaf.zze();
          paramZzrp.zza(localObject[j]);
          zzig = ((zzaf.zze[])localObject);
          break;
        case 34: 
          j = zzsa.zzb(paramZzrp, 34);
          if (zzih == null) {}
          for (i = 0;; i = zzih.length)
          {
            localObject = new zzaf.zzb[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzih, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zzaf.zzb();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zzaf.zzb();
          paramZzrp.zza(localObject[j]);
          zzih = ((zzaf.zzb[])localObject);
          break;
        case 42: 
          j = zzsa.zzb(paramZzrp, 42);
          if (zzii == null) {}
          for (i = 0;; i = zzii.length)
          {
            localObject = new zzaf.zzb[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzii, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zzaf.zzb();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zzaf.zzb();
          paramZzrp.zza(localObject[j]);
          zzii = ((zzaf.zzb[])localObject);
          break;
        case 50: 
          j = zzsa.zzb(paramZzrp, 50);
          if (zzij == null) {}
          for (i = 0;; i = zzij.length)
          {
            localObject = new zzaf.zzb[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzij, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zzaf.zzb();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zzaf.zzb();
          paramZzrp.zza(localObject[j]);
          zzij = ((zzaf.zzb[])localObject);
          break;
        case 58: 
          j = zzsa.zzb(paramZzrp, 58);
          if (zzik == null) {}
          for (i = 0;; i = zzik.length)
          {
            localObject = new zzaf.zzg[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzik, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zzaf.zzg();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zzaf.zzg();
          paramZzrp.zza(localObject[j]);
          zzik = ((zzaf.zzg[])localObject);
          break;
        case 74: 
          zzil = paramZzrp.readString();
          break;
        case 82: 
          zzim = paramZzrp.readString();
          break;
        case 98: 
          zzin = paramZzrp.readString();
          break;
        case 106: 
          version = paramZzrp.readString();
          break;
        case 114: 
          if (zzio == null) {
            zzio = new zzaf.zza();
          }
          paramZzrp.zza(zzio);
          break;
        case 125: 
          zzip = paramZzrp.readFloat();
          break;
        case 130: 
          j = zzsa.zzb(paramZzrp, 130);
          if (zzir == null) {}
          for (i = 0;; i = zzir.length)
          {
            localObject = new String[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzir, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = paramZzrp.readString();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = paramZzrp.readString();
          zzir = ((String[])localObject);
          break;
        case 136: 
          zzis = paramZzrp.zzCW();
          break;
        case 144: 
          zziq = paramZzrp.zzCX();
          break;
        case 154: 
          j = zzsa.zzb(paramZzrp, 154);
          if (zzid == null) {}
          for (i = 0;; i = zzid.length)
          {
            localObject = new String[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzid, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = paramZzrp.readString();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = paramZzrp.readString();
          zzid = ((String[])localObject);
        }
      }
    }
  }
  
  public static final class zzg
    extends zzrr<zzg>
  {
    private static volatile zzg[] zzit;
    public int[] zziA;
    public int[] zziB;
    public int[] zziC;
    public int[] zziD;
    public int[] zziu;
    public int[] zziv;
    public int[] zziw;
    public int[] zzix;
    public int[] zziy;
    public int[] zziz;
    
    public zzg()
    {
      zzL();
    }
    
    public static zzg[] zzK()
    {
      if (zzit == null) {}
      synchronized (zzrv.zzbck)
      {
        if (zzit == null) {
          zzit = new zzg[0];
        }
        return zzit;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            return bool1;
                            bool1 = bool2;
                          } while (!(paramObject instanceof zzg));
                          paramObject = (zzg)paramObject;
                          bool1 = bool2;
                        } while (!zzrv.equals(zziu, zziu));
                        bool1 = bool2;
                      } while (!zzrv.equals(zziv, zziv));
                      bool1 = bool2;
                    } while (!zzrv.equals(zziw, zziw));
                    bool1 = bool2;
                  } while (!zzrv.equals(zzix, zzix));
                  bool1 = bool2;
                } while (!zzrv.equals(zziy, zziy));
                bool1 = bool2;
              } while (!zzrv.equals(zziz, zziz));
              bool1 = bool2;
            } while (!zzrv.equals(zziA, zziA));
            bool1 = bool2;
          } while (!zzrv.equals(zziB, zziB));
          bool1 = bool2;
        } while (!zzrv.equals(zziC, zziC));
        bool1 = bool2;
      } while (!zzrv.equals(zziD, zziD));
      return zza(paramObject);
    }
    
    public int hashCode()
    {
      return ((((((((((zzrv.hashCode(zziu) + 527) * 31 + zzrv.hashCode(zziv)) * 31 + zzrv.hashCode(zziw)) * 31 + zzrv.hashCode(zzix)) * 31 + zzrv.hashCode(zziy)) * 31 + zzrv.hashCode(zziz)) * 31 + zzrv.hashCode(zziA)) * 31 + zzrv.hashCode(zziB)) * 31 + zzrv.hashCode(zziC)) * 31 + zzrv.hashCode(zziD)) * 31 + zzDk();
    }
    
    protected int zzB()
    {
      int m = 0;
      int k = super.zzB();
      int i;
      if ((zziu != null) && (zziu.length > 0))
      {
        i = 0;
        j = 0;
        while (i < zziu.length)
        {
          j += zzrq.zzls(zziu[i]);
          i += 1;
        }
      }
      for (int j = k + j + zziu.length * 1;; j = k)
      {
        i = j;
        if (zziv != null)
        {
          i = j;
          if (zziv.length > 0)
          {
            i = 0;
            k = 0;
            while (i < zziv.length)
            {
              k += zzrq.zzls(zziv[i]);
              i += 1;
            }
            i = j + k + zziv.length * 1;
          }
        }
        j = i;
        if (zziw != null)
        {
          j = i;
          if (zziw.length > 0)
          {
            j = 0;
            k = 0;
            while (j < zziw.length)
            {
              k += zzrq.zzls(zziw[j]);
              j += 1;
            }
            j = i + k + zziw.length * 1;
          }
        }
        i = j;
        if (zzix != null)
        {
          i = j;
          if (zzix.length > 0)
          {
            i = 0;
            k = 0;
            while (i < zzix.length)
            {
              k += zzrq.zzls(zzix[i]);
              i += 1;
            }
            i = j + k + zzix.length * 1;
          }
        }
        j = i;
        if (zziy != null)
        {
          j = i;
          if (zziy.length > 0)
          {
            j = 0;
            k = 0;
            while (j < zziy.length)
            {
              k += zzrq.zzls(zziy[j]);
              j += 1;
            }
            j = i + k + zziy.length * 1;
          }
        }
        i = j;
        if (zziz != null)
        {
          i = j;
          if (zziz.length > 0)
          {
            i = 0;
            k = 0;
            while (i < zziz.length)
            {
              k += zzrq.zzls(zziz[i]);
              i += 1;
            }
            i = j + k + zziz.length * 1;
          }
        }
        j = i;
        if (zziA != null)
        {
          j = i;
          if (zziA.length > 0)
          {
            j = 0;
            k = 0;
            while (j < zziA.length)
            {
              k += zzrq.zzls(zziA[j]);
              j += 1;
            }
            j = i + k + zziA.length * 1;
          }
        }
        i = j;
        if (zziB != null)
        {
          i = j;
          if (zziB.length > 0)
          {
            i = 0;
            k = 0;
            while (i < zziB.length)
            {
              k += zzrq.zzls(zziB[i]);
              i += 1;
            }
            i = j + k + zziB.length * 1;
          }
        }
        j = i;
        if (zziC != null)
        {
          j = i;
          if (zziC.length > 0)
          {
            j = 0;
            k = 0;
            while (j < zziC.length)
            {
              k += zzrq.zzls(zziC[j]);
              j += 1;
            }
            j = i + k + zziC.length * 1;
          }
        }
        i = j;
        if (zziD != null)
        {
          i = j;
          if (zziD.length > 0)
          {
            k = 0;
            i = m;
            while (i < zziD.length)
            {
              k += zzrq.zzls(zziD[i]);
              i += 1;
            }
            i = j + k + zziD.length * 1;
          }
        }
        return i;
      }
    }
    
    public zzg zzL()
    {
      zziu = zzsa.zzbcn;
      zziv = zzsa.zzbcn;
      zziw = zzsa.zzbcn;
      zzix = zzsa.zzbcn;
      zziy = zzsa.zzbcn;
      zziz = zzsa.zzbcn;
      zziA = zzsa.zzbcn;
      zziB = zzsa.zzbcn;
      zziC = zzsa.zzbcn;
      zziD = zzsa.zzbcn;
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      int j = 0;
      int i;
      if ((zziu != null) && (zziu.length > 0))
      {
        i = 0;
        while (i < zziu.length)
        {
          paramZzrq.zzz(1, zziu[i]);
          i += 1;
        }
      }
      if ((zziv != null) && (zziv.length > 0))
      {
        i = 0;
        while (i < zziv.length)
        {
          paramZzrq.zzz(2, zziv[i]);
          i += 1;
        }
      }
      if ((zziw != null) && (zziw.length > 0))
      {
        i = 0;
        while (i < zziw.length)
        {
          paramZzrq.zzz(3, zziw[i]);
          i += 1;
        }
      }
      if ((zzix != null) && (zzix.length > 0))
      {
        i = 0;
        while (i < zzix.length)
        {
          paramZzrq.zzz(4, zzix[i]);
          i += 1;
        }
      }
      if ((zziy != null) && (zziy.length > 0))
      {
        i = 0;
        while (i < zziy.length)
        {
          paramZzrq.zzz(5, zziy[i]);
          i += 1;
        }
      }
      if ((zziz != null) && (zziz.length > 0))
      {
        i = 0;
        while (i < zziz.length)
        {
          paramZzrq.zzz(6, zziz[i]);
          i += 1;
        }
      }
      if ((zziA != null) && (zziA.length > 0))
      {
        i = 0;
        while (i < zziA.length)
        {
          paramZzrq.zzz(7, zziA[i]);
          i += 1;
        }
      }
      if ((zziB != null) && (zziB.length > 0))
      {
        i = 0;
        while (i < zziB.length)
        {
          paramZzrq.zzz(8, zziB[i]);
          i += 1;
        }
      }
      if ((zziC != null) && (zziC.length > 0))
      {
        i = 0;
        while (i < zziC.length)
        {
          paramZzrq.zzz(9, zziC[i]);
          i += 1;
        }
      }
      if ((zziD != null) && (zziD.length > 0))
      {
        i = j;
        while (i < zziD.length)
        {
          paramZzrq.zzz(10, zziD[i]);
          i += 1;
        }
      }
      super.zza(paramZzrq);
    }
    
    public zzg zzh(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        int j;
        int[] arrayOfInt;
        int k;
        switch (i)
        {
        default: 
          if (zza(paramZzrp, i)) {}
          break;
        case 0: 
          return this;
        case 8: 
          j = zzsa.zzb(paramZzrp, 8);
          if (zziu == null) {}
          for (i = 0;; i = zziu.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziu, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zziu = arrayOfInt;
          break;
        case 10: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zziu == null) {}
          for (i = 0;; i = zziu.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziu, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zziu = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 16: 
          j = zzsa.zzb(paramZzrp, 16);
          if (zziv == null) {}
          for (i = 0;; i = zziv.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziv, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zziv = arrayOfInt;
          break;
        case 18: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zziv == null) {}
          for (i = 0;; i = zziv.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziv, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zziv = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 24: 
          j = zzsa.zzb(paramZzrp, 24);
          if (zziw == null) {}
          for (i = 0;; i = zziw.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziw, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zziw = arrayOfInt;
          break;
        case 26: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zziw == null) {}
          for (i = 0;; i = zziw.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziw, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zziw = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 32: 
          j = zzsa.zzb(paramZzrp, 32);
          if (zzix == null) {}
          for (i = 0;; i = zzix.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzix, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zzix = arrayOfInt;
          break;
        case 34: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zzix == null) {}
          for (i = 0;; i = zzix.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzix, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zzix = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 40: 
          j = zzsa.zzb(paramZzrp, 40);
          if (zziy == null) {}
          for (i = 0;; i = zziy.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziy, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zziy = arrayOfInt;
          break;
        case 42: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zziy == null) {}
          for (i = 0;; i = zziy.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziy, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zziy = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 48: 
          j = zzsa.zzb(paramZzrp, 48);
          if (zziz == null) {}
          for (i = 0;; i = zziz.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziz, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zziz = arrayOfInt;
          break;
        case 50: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zziz == null) {}
          for (i = 0;; i = zziz.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziz, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zziz = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 56: 
          j = zzsa.zzb(paramZzrp, 56);
          if (zziA == null) {}
          for (i = 0;; i = zziA.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziA, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zziA = arrayOfInt;
          break;
        case 58: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zziA == null) {}
          for (i = 0;; i = zziA.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziA, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zziA = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 64: 
          j = zzsa.zzb(paramZzrp, 64);
          if (zziB == null) {}
          for (i = 0;; i = zziB.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziB, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zziB = arrayOfInt;
          break;
        case 66: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zziB == null) {}
          for (i = 0;; i = zziB.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziB, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zziB = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 72: 
          j = zzsa.zzb(paramZzrp, 72);
          if (zziC == null) {}
          for (i = 0;; i = zziC.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziC, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zziC = arrayOfInt;
          break;
        case 74: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zziC == null) {}
          for (i = 0;; i = zziC.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziC, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zziC = arrayOfInt;
          paramZzrp.zzlm(k);
          break;
        case 80: 
          j = zzsa.zzb(paramZzrp, 80);
          if (zziD == null) {}
          for (i = 0;; i = zziD.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziD, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfInt[j] = paramZzrp.zzCW();
          zziD = arrayOfInt;
          break;
        case 82: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0)
          {
            paramZzrp.zzCW();
            j += 1;
          }
          paramZzrp.zzln(i);
          if (zziD == null) {}
          for (i = 0;; i = zziD.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziD, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramZzrp.zzCW();
              j += 1;
            }
          }
          zziD = arrayOfInt;
          paramZzrp.zzlm(k);
        }
      }
    }
  }
  
  public static final class zzi
    extends zzrr<zzi>
  {
    private static volatile zzi[] zziN;
    public String name;
    public zzag.zza zziO;
    public zzaf.zzd zziP;
    
    public zzi()
    {
      zzO();
    }
    
    public static zzi[] zzN()
    {
      if (zziN == null) {}
      synchronized (zzrv.zzbck)
      {
        if (zziN == null) {
          zziN = new zzi[0];
        }
        return zziN;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      label57:
      do
      {
        do
        {
          do
          {
            do
            {
              return bool1;
              bool1 = bool2;
            } while (!(paramObject instanceof zzi));
            paramObject = (zzi)paramObject;
            if (name != null) {
              break;
            }
            bool1 = bool2;
          } while (name != null);
          if (zziO != null) {
            break label95;
          }
          bool1 = bool2;
        } while (zziO != null);
        if (zziP != null) {
          break label111;
        }
        bool1 = bool2;
      } while (zziP != null);
      label95:
      label111:
      while (zziP.equals(zziP))
      {
        return zza(paramObject);
        if (name.equals(name)) {
          break;
        }
        return false;
        if (zziO.equals(zziO)) {
          break label57;
        }
        return false;
      }
      return false;
    }
    
    public int hashCode()
    {
      int k = 0;
      int i;
      int j;
      if (name == null)
      {
        i = 0;
        if (zziO != null) {
          break label62;
        }
        j = 0;
        label20:
        if (zziP != null) {
          break label73;
        }
      }
      for (;;)
      {
        return ((j + (i + 527) * 31) * 31 + k) * 31 + zzDk();
        i = name.hashCode();
        break;
        label62:
        j = zziO.hashCode();
        break label20;
        label73:
        k = zziP.hashCode();
      }
    }
    
    protected int zzB()
    {
      int j = super.zzB();
      int i = j;
      if (!name.equals("")) {
        i = j + zzrq.zzl(1, name);
      }
      j = i;
      if (zziO != null) {
        j = i + zzrq.zzc(2, zziO);
      }
      i = j;
      if (zziP != null) {
        i = j + zzrq.zzc(3, zziP);
      }
      return i;
    }
    
    public zzi zzO()
    {
      name = "";
      zziO = null;
      zziP = null;
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      if (!name.equals("")) {
        paramZzrq.zzb(1, name);
      }
      if (zziO != null) {
        paramZzrq.zza(2, zziO);
      }
      if (zziP != null) {
        paramZzrq.zza(3, zziP);
      }
      super.zza(paramZzrq);
    }
    
    public zzi zzj(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        switch (i)
        {
        default: 
          if (zza(paramZzrp, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          name = paramZzrp.readString();
          break;
        case 18: 
          if (zziO == null) {
            zziO = new zzag.zza();
          }
          paramZzrp.zza(zziO);
          break;
        case 26: 
          if (zziP == null) {
            zziP = new zzaf.zzd();
          }
          paramZzrp.zza(zziP);
        }
      }
    }
  }
  
  public static final class zzj
    extends zzrr<zzj>
  {
    public zzaf.zzi[] zziQ;
    public zzaf.zzf zziR;
    public String zziS;
    
    public zzj()
    {
      zzP();
    }
    
    public static zzj zzd(byte[] paramArrayOfByte)
      throws zzrw
    {
      return (zzj)zzrx.zza(new zzj(), paramArrayOfByte);
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              return bool1;
              bool1 = bool2;
            } while (!(paramObject instanceof zzj));
            paramObject = (zzj)paramObject;
            bool1 = bool2;
          } while (!zzrv.equals(zziQ, zziQ));
          if (zziR != null) {
            break;
          }
          bool1 = bool2;
        } while (zziR != null);
        if (zziS != null) {
          break label95;
        }
        bool1 = bool2;
      } while (zziS != null);
      label95:
      while (zziS.equals(zziS))
      {
        return zza(paramObject);
        if (zziR.equals(zziR)) {
          break;
        }
        return false;
      }
      return false;
    }
    
    public int hashCode()
    {
      int j = 0;
      int k = zzrv.hashCode(zziQ);
      int i;
      if (zziR == null)
      {
        i = 0;
        if (zziS != null) {
          break label61;
        }
      }
      for (;;)
      {
        return ((i + (k + 527) * 31) * 31 + j) * 31 + zzDk();
        i = zziR.hashCode();
        break;
        label61:
        j = zziS.hashCode();
      }
    }
    
    protected int zzB()
    {
      int i = super.zzB();
      int j = i;
      if (zziQ != null)
      {
        j = i;
        if (zziQ.length > 0)
        {
          int k = 0;
          for (;;)
          {
            j = i;
            if (k >= zziQ.length) {
              break;
            }
            zzaf.zzi localZzi = zziQ[k];
            j = i;
            if (localZzi != null) {
              j = i + zzrq.zzc(1, localZzi);
            }
            k += 1;
            i = j;
          }
        }
      }
      i = j;
      if (zziR != null) {
        i = j + zzrq.zzc(2, zziR);
      }
      j = i;
      if (!zziS.equals("")) {
        j = i + zzrq.zzl(3, zziS);
      }
      return j;
    }
    
    public zzj zzP()
    {
      zziQ = zzaf.zzi.zzN();
      zziR = null;
      zziS = "";
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      if ((zziQ != null) && (zziQ.length > 0))
      {
        int i = 0;
        while (i < zziQ.length)
        {
          zzaf.zzi localZzi = zziQ[i];
          if (localZzi != null) {
            paramZzrq.zza(1, localZzi);
          }
          i += 1;
        }
      }
      if (zziR != null) {
        paramZzrq.zza(2, zziR);
      }
      if (!zziS.equals("")) {
        paramZzrq.zzb(3, zziS);
      }
      super.zza(paramZzrq);
    }
    
    public zzj zzk(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        switch (i)
        {
        default: 
          if (zza(paramZzrp, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          int j = zzsa.zzb(paramZzrp, 10);
          if (zziQ == null) {}
          zzaf.zzi[] arrayOfZzi;
          for (i = 0;; i = zziQ.length)
          {
            arrayOfZzi = new zzaf.zzi[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziQ, 0, arrayOfZzi, 0, i);
              j = i;
            }
            while (j < arrayOfZzi.length - 1)
            {
              arrayOfZzi[j] = new zzaf.zzi();
              paramZzrp.zza(arrayOfZzi[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          arrayOfZzi[j] = new zzaf.zzi();
          paramZzrp.zza(arrayOfZzi[j]);
          zziQ = arrayOfZzi;
          break;
        case 18: 
          if (zziR == null) {
            zziR = new zzaf.zzf();
          }
          paramZzrp.zza(zziR);
          break;
        case 26: 
          zziS = paramZzrp.readString();
        }
      }
    }
  }
}
