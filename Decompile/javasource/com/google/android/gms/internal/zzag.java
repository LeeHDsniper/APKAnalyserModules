package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface zzag
{
  public static final class zza
    extends zzrr<zza>
  {
    private static volatile zza[] zziT;
    public int type;
    public String zziU;
    public zza[] zziV;
    public zza[] zziW;
    public zza[] zziX;
    public String zziY;
    public String zziZ;
    public long zzja;
    public boolean zzjb;
    public zza[] zzjc;
    public int[] zzjd;
    public boolean zzje;
    
    public zza()
    {
      zzR();
    }
    
    public static zza[] zzQ()
    {
      if (zziT == null) {}
      synchronized (zzrv.zzbck)
      {
        if (zziT == null) {
          zziT = new zza[0];
        }
        return zziT;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      label54:
      label118:
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
                    } while (!(paramObject instanceof zza));
                    paramObject = (zza)paramObject;
                    bool1 = bool2;
                  } while (type != type);
                  if (zziU != null) {
                    break;
                  }
                  bool1 = bool2;
                } while (zziU != null);
                bool1 = bool2;
              } while (!zzrv.equals(zziV, zziV));
              bool1 = bool2;
            } while (!zzrv.equals(zziW, zziW));
            bool1 = bool2;
          } while (!zzrv.equals(zziX, zziX));
          if (zziY != null) {
            break label228;
          }
          bool1 = bool2;
        } while (zziY != null);
        if (zziZ != null) {
          break label244;
        }
        bool1 = bool2;
      } while (zziZ != null);
      label228:
      label244:
      while (zziZ.equals(zziZ))
      {
        bool1 = bool2;
        if (zzja != zzja) {
          break;
        }
        bool1 = bool2;
        if (zzjb != zzjb) {
          break;
        }
        bool1 = bool2;
        if (!zzrv.equals(zzjc, zzjc)) {
          break;
        }
        bool1 = bool2;
        if (!zzrv.equals(zzjd, zzjd)) {
          break;
        }
        bool1 = bool2;
        if (zzje != zzje) {
          break;
        }
        return zza(paramObject);
        if (zziU.equals(zziU)) {
          break label54;
        }
        return false;
        if (zziY.equals(zziY)) {
          break label118;
        }
        return false;
      }
      return false;
    }
    
    public int hashCode()
    {
      int n = 1231;
      int k = 0;
      int i1 = type;
      int i;
      int i2;
      int i3;
      int i4;
      int j;
      label58:
      label65:
      int i5;
      int m;
      label92:
      int i6;
      int i7;
      if (zziU == null)
      {
        i = 0;
        i2 = zzrv.hashCode(zziV);
        i3 = zzrv.hashCode(zziW);
        i4 = zzrv.hashCode(zziX);
        if (zziY != null) {
          break label206;
        }
        j = 0;
        if (zziZ != null) {
          break label217;
        }
        i5 = (int)(zzja ^ zzja >>> 32);
        if (!zzjb) {
          break label228;
        }
        m = 1231;
        i6 = zzrv.hashCode(zzjc);
        i7 = zzrv.hashCode(zzjd);
        if (!zzje) {
          break label236;
        }
      }
      for (;;)
      {
        return ((((m + (((j + ((((i + (i1 + 527) * 31) * 31 + i2) * 31 + i3) * 31 + i4) * 31) * 31 + k) * 31 + i5) * 31) * 31 + i6) * 31 + i7) * 31 + n) * 31 + zzDk();
        i = zziU.hashCode();
        break;
        label206:
        j = zziY.hashCode();
        break label58;
        label217:
        k = zziZ.hashCode();
        break label65;
        label228:
        m = 1237;
        break label92;
        label236:
        n = 1237;
      }
    }
    
    protected int zzB()
    {
      int m = 0;
      int j = super.zzB() + zzrq.zzB(1, type);
      int i = j;
      if (!zziU.equals("")) {
        i = j + zzrq.zzl(2, zziU);
      }
      j = i;
      zza localZza;
      int k;
      if (zziV != null)
      {
        j = i;
        if (zziV.length > 0)
        {
          j = 0;
          while (j < zziV.length)
          {
            localZza = zziV[j];
            k = i;
            if (localZza != null) {
              k = i + zzrq.zzc(3, localZza);
            }
            j += 1;
            i = k;
          }
          j = i;
        }
      }
      i = j;
      if (zziW != null)
      {
        i = j;
        if (zziW.length > 0)
        {
          i = j;
          j = 0;
          while (j < zziW.length)
          {
            localZza = zziW[j];
            k = i;
            if (localZza != null) {
              k = i + zzrq.zzc(4, localZza);
            }
            j += 1;
            i = k;
          }
        }
      }
      j = i;
      if (zziX != null)
      {
        j = i;
        if (zziX.length > 0)
        {
          j = 0;
          while (j < zziX.length)
          {
            localZza = zziX[j];
            k = i;
            if (localZza != null) {
              k = i + zzrq.zzc(5, localZza);
            }
            j += 1;
            i = k;
          }
          j = i;
        }
      }
      i = j;
      if (!zziY.equals("")) {
        i = j + zzrq.zzl(6, zziY);
      }
      j = i;
      if (!zziZ.equals("")) {
        j = i + zzrq.zzl(7, zziZ);
      }
      i = j;
      if (zzja != 0L) {
        i = j + zzrq.zzd(8, zzja);
      }
      j = i;
      if (zzje) {
        j = i + zzrq.zzc(9, zzje);
      }
      i = j;
      if (zzjd != null)
      {
        i = j;
        if (zzjd.length > 0)
        {
          i = 0;
          k = 0;
          while (i < zzjd.length)
          {
            k += zzrq.zzls(zzjd[i]);
            i += 1;
          }
          i = j + k + zzjd.length * 1;
        }
      }
      j = i;
      if (zzjc != null)
      {
        j = i;
        if (zzjc.length > 0)
        {
          k = m;
          for (;;)
          {
            j = i;
            if (k >= zzjc.length) {
              break;
            }
            localZza = zzjc[k];
            j = i;
            if (localZza != null) {
              j = i + zzrq.zzc(11, localZza);
            }
            k += 1;
            i = j;
          }
        }
      }
      i = j;
      if (zzjb) {
        i = j + zzrq.zzc(12, zzjb);
      }
      return i;
    }
    
    public zza zzR()
    {
      type = 1;
      zziU = "";
      zziV = zzQ();
      zziW = zzQ();
      zziX = zzQ();
      zziY = "";
      zziZ = "";
      zzja = 0L;
      zzjb = false;
      zzjc = zzQ();
      zzjd = zzsa.zzbcn;
      zzje = false;
      zzbca = null;
      zzbcl = -1;
      return this;
    }
    
    public void zza(zzrq paramZzrq)
      throws IOException
    {
      int j = 0;
      paramZzrq.zzz(1, type);
      if (!zziU.equals("")) {
        paramZzrq.zzb(2, zziU);
      }
      int i;
      zza localZza;
      if ((zziV != null) && (zziV.length > 0))
      {
        i = 0;
        while (i < zziV.length)
        {
          localZza = zziV[i];
          if (localZza != null) {
            paramZzrq.zza(3, localZza);
          }
          i += 1;
        }
      }
      if ((zziW != null) && (zziW.length > 0))
      {
        i = 0;
        while (i < zziW.length)
        {
          localZza = zziW[i];
          if (localZza != null) {
            paramZzrq.zza(4, localZza);
          }
          i += 1;
        }
      }
      if ((zziX != null) && (zziX.length > 0))
      {
        i = 0;
        while (i < zziX.length)
        {
          localZza = zziX[i];
          if (localZza != null) {
            paramZzrq.zza(5, localZza);
          }
          i += 1;
        }
      }
      if (!zziY.equals("")) {
        paramZzrq.zzb(6, zziY);
      }
      if (!zziZ.equals("")) {
        paramZzrq.zzb(7, zziZ);
      }
      if (zzja != 0L) {
        paramZzrq.zzb(8, zzja);
      }
      if (zzje) {
        paramZzrq.zzb(9, zzje);
      }
      if ((zzjd != null) && (zzjd.length > 0))
      {
        i = 0;
        while (i < zzjd.length)
        {
          paramZzrq.zzz(10, zzjd[i]);
          i += 1;
        }
      }
      if ((zzjc != null) && (zzjc.length > 0))
      {
        i = j;
        while (i < zzjc.length)
        {
          localZza = zzjc[i];
          if (localZza != null) {
            paramZzrq.zza(11, localZza);
          }
          i += 1;
        }
      }
      if (zzjb) {
        paramZzrq.zzb(12, zzjb);
      }
      super.zza(paramZzrq);
    }
    
    public zza zzl(zzrp paramZzrp)
      throws IOException
    {
      for (;;)
      {
        int i = paramZzrp.zzCT();
        int j;
        Object localObject;
        int k;
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
          case 4: 
          case 5: 
          case 6: 
          case 7: 
          case 8: 
            type = i;
          }
          break;
        case 18: 
          zziU = paramZzrp.readString();
          break;
        case 26: 
          j = zzsa.zzb(paramZzrp, 26);
          if (zziV == null) {}
          for (i = 0;; i = zziV.length)
          {
            localObject = new zza[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziV, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zza();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zza();
          paramZzrp.zza(localObject[j]);
          zziV = ((zza[])localObject);
          break;
        case 34: 
          j = zzsa.zzb(paramZzrp, 34);
          if (zziW == null) {}
          for (i = 0;; i = zziW.length)
          {
            localObject = new zza[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziW, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zza();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zza();
          paramZzrp.zza(localObject[j]);
          zziW = ((zza[])localObject);
          break;
        case 42: 
          j = zzsa.zzb(paramZzrp, 42);
          if (zziX == null) {}
          for (i = 0;; i = zziX.length)
          {
            localObject = new zza[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zziX, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zza();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zza();
          paramZzrp.zza(localObject[j]);
          zziX = ((zza[])localObject);
          break;
        case 50: 
          zziY = paramZzrp.readString();
          break;
        case 58: 
          zziZ = paramZzrp.readString();
          break;
        case 64: 
          zzja = paramZzrp.zzCV();
          break;
        case 72: 
          zzje = paramZzrp.zzCX();
          break;
        case 80: 
          int m = zzsa.zzb(paramZzrp, 80);
          localObject = new int[m];
          j = 0;
          i = 0;
          if (j < m)
          {
            if (j != 0) {
              paramZzrp.zzCT();
            }
            int n = paramZzrp.zzCW();
            switch (n)
            {
            }
            for (;;)
            {
              j += 1;
              break;
              k = i + 1;
              localObject[i] = n;
              i = k;
            }
          }
          if (i != 0)
          {
            if (zzjd == null) {}
            for (j = 0;; j = zzjd.length)
            {
              if ((j != 0) || (i != localObject.length)) {
                break label810;
              }
              zzjd = ((int[])localObject);
              break;
            }
            int[] arrayOfInt = new int[j + i];
            if (j != 0) {
              System.arraycopy(zzjd, 0, arrayOfInt, 0, j);
            }
            System.arraycopy(localObject, 0, arrayOfInt, j, i);
            zzjd = arrayOfInt;
          }
          break;
        case 82: 
          k = paramZzrp.zzll(paramZzrp.zzDa());
          i = paramZzrp.getPosition();
          j = 0;
          while (paramZzrp.zzDf() > 0) {
            switch (paramZzrp.zzCW())
            {
            default: 
              break;
            case 1: 
            case 2: 
            case 3: 
            case 4: 
            case 5: 
            case 6: 
            case 7: 
            case 8: 
            case 9: 
            case 10: 
            case 11: 
            case 12: 
            case 13: 
            case 14: 
            case 15: 
            case 16: 
            case 17: 
              j += 1;
            }
          }
          if (j != 0)
          {
            paramZzrp.zzln(i);
            if (zzjd == null) {}
            for (i = 0;; i = zzjd.length)
            {
              localObject = new int[j + i];
              j = i;
              if (i != 0)
              {
                System.arraycopy(zzjd, 0, localObject, 0, i);
                j = i;
              }
              while (paramZzrp.zzDf() > 0)
              {
                i = paramZzrp.zzCW();
                switch (i)
                {
                default: 
                  break;
                case 1: 
                case 2: 
                case 3: 
                case 4: 
                case 5: 
                case 6: 
                case 7: 
                case 8: 
                case 9: 
                case 10: 
                case 11: 
                case 12: 
                case 13: 
                case 14: 
                case 15: 
                case 16: 
                case 17: 
                  localObject[j] = i;
                  j += 1;
                }
              }
            }
            zzjd = ((int[])localObject);
          }
          paramZzrp.zzlm(k);
          break;
        case 90: 
          j = zzsa.zzb(paramZzrp, 90);
          if (zzjc == null) {}
          for (i = 0;; i = zzjc.length)
          {
            localObject = new zza[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(zzjc, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new zza();
              paramZzrp.zza(localObject[j]);
              paramZzrp.zzCT();
              j += 1;
            }
          }
          localObject[j] = new zza();
          paramZzrp.zza(localObject[j]);
          zzjc = ((zza[])localObject);
          break;
        case 96: 
          label810:
          zzjb = paramZzrp.zzCX();
        }
      }
    }
  }
}
