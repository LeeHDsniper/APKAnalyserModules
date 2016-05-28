package com.google.android.gms.common.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public abstract class zze
{
  public static final zze zzacG = zza("\t\n\013\f\r     　 ᠎ ").zza(zza(' ', ' '));
  public static final zze zzacH = zza("\t\n\013\f\r     　").zza(zza(' ', ' ')).zza(zza(' ', ' '));
  public static final zze zzacI = zza('\000', '');
  public static final zze zzacJ;
  public static final zze zzacK = zza('\t', '\r').zza(zza('\034', ' ')).zza(zzc(' ')).zza(zzc('᠎')).zza(zza(' ', ' ')).zza(zza(' ', '​')).zza(zza(' ', ' ')).zza(zzc(' ')).zza(zzc('　'));
  public static final zze zzacL = new zze()
  {
    public boolean zzd(char paramAnonymousChar)
    {
      return Character.isDigit(paramAnonymousChar);
    }
  };
  public static final zze zzacM = new zze()
  {
    public boolean zzd(char paramAnonymousChar)
    {
      return Character.isLetter(paramAnonymousChar);
    }
  };
  public static final zze zzacN = new zze()
  {
    public boolean zzd(char paramAnonymousChar)
    {
      return Character.isLetterOrDigit(paramAnonymousChar);
    }
  };
  public static final zze zzacO = new zze()
  {
    public boolean zzd(char paramAnonymousChar)
    {
      return Character.isUpperCase(paramAnonymousChar);
    }
  };
  public static final zze zzacP = new zze()
  {
    public boolean zzd(char paramAnonymousChar)
    {
      return Character.isLowerCase(paramAnonymousChar);
    }
  };
  public static final zze zzacQ = zza('\000', '\037').zza(zza('', ''));
  public static final zze zzacR = zza('\000', ' ').zza(zza('', ' ')).zza(zzc('­')).zza(zza('؀', '؃')).zza(zza("۝܏ ឴឵᠎")).zza(zza(' ', '‏')).zza(zza(' ', ' ')).zza(zza(' ', '⁤')).zza(zza('⁪', '⁯')).zza(zzc('　')).zza(zza(55296, 63743)).zza(zza("﻿￹￺￻"));
  public static final zze zzacS = zza('\000', 'ӹ').zza(zzc('־')).zza(zza('א', 'ת')).zza(zzc('׳')).zza(zzc('״')).zza(zza('؀', 'ۿ')).zza(zza('ݐ', 'ݿ')).zza(zza('฀', '๿')).zza(zza('Ḁ', '₯')).zza(zza('℀', '℺')).zza(zza(64336, 65023)).zza(zza(65136, 65279)).zza(zza(65377, 65500));
  public static final zze zzacT = new zze()
  {
    public zze zza(zze paramAnonymousZze)
    {
      zzx.zzv(paramAnonymousZze);
      return this;
    }
    
    public boolean zzb(CharSequence paramAnonymousCharSequence)
    {
      zzx.zzv(paramAnonymousCharSequence);
      return true;
    }
    
    public boolean zzd(char paramAnonymousChar)
    {
      return true;
    }
  };
  public static final zze zzacU = new zze()
  {
    public zze zza(zze paramAnonymousZze)
    {
      return (zze)zzx.zzv(paramAnonymousZze);
    }
    
    public boolean zzb(CharSequence paramAnonymousCharSequence)
    {
      return paramAnonymousCharSequence.length() == 0;
    }
    
    public boolean zzd(char paramAnonymousChar)
    {
      return false;
    }
  };
  
  static
  {
    zze localZze = zza('0', '9');
    char[] arrayOfChar = "٠۰߀०০੦૦୦௦౦೦൦๐໐༠၀႐០᠐᥆᧐᭐᮰᱀᱐꘠꣐꤀꩐０".toCharArray();
    int j = arrayOfChar.length;
    int i = 0;
    while (i < j)
    {
      char c = arrayOfChar[i];
      localZze = localZze.zza(zza(c, (char)(c + '\t')));
      i += 1;
    }
    zzacJ = localZze;
  }
  
  public zze() {}
  
  public static zze zza(char paramChar1, final char paramChar2)
  {
    if (paramChar2 >= paramChar1) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zzZ(bool);
      new zze()
      {
        public boolean zzd(char paramAnonymousChar)
        {
          return (zzacY <= paramAnonymousChar) && (paramAnonymousChar <= paramChar2);
        }
      };
    }
  }
  
  public static zze zza(CharSequence paramCharSequence)
  {
    switch (paramCharSequence.length())
    {
    default: 
      paramCharSequence = paramCharSequence.toString().toCharArray();
      Arrays.sort(paramCharSequence);
      new zze()
      {
        public boolean zzd(char paramAnonymousChar)
        {
          return Arrays.binarySearch(zzacX, paramAnonymousChar) >= 0;
        }
      };
    case 0: 
      return zzacU;
    case 1: 
      return zzc(paramCharSequence.charAt(0));
    }
    new zze()
    {
      public boolean zzd(char paramAnonymousChar)
      {
        return (paramAnonymousChar == zzacV) || (paramAnonymousChar == zzacW);
      }
    };
  }
  
  public static zze zzc(char paramChar)
  {
    new zze()
    {
      public zze zza(zze paramAnonymousZze)
      {
        if (paramAnonymousZze.zzd(zzada)) {
          return paramAnonymousZze;
        }
        return super.zza(paramAnonymousZze);
      }
      
      public boolean zzd(char paramAnonymousChar)
      {
        return paramAnonymousChar == zzada;
      }
    };
  }
  
  public zze zza(zze paramZze)
  {
    return new zza(Arrays.asList(new zze[] { this, (zze)zzx.zzv(paramZze) }));
  }
  
  public boolean zzb(CharSequence paramCharSequence)
  {
    int i = paramCharSequence.length() - 1;
    while (i >= 0)
    {
      if (!zzd(paramCharSequence.charAt(i))) {
        return false;
      }
      i -= 1;
    }
    return true;
  }
  
  public abstract boolean zzd(char paramChar);
  
  private static class zza
    extends zze
  {
    List<zze> zzadb;
    
    zza(List<zze> paramList)
    {
      zzadb = paramList;
    }
    
    public zze zza(zze paramZze)
    {
      ArrayList localArrayList = new ArrayList(zzadb);
      localArrayList.add(zzx.zzv(paramZze));
      return new zza(localArrayList);
    }
    
    public boolean zzd(char paramChar)
    {
      Iterator localIterator = zzadb.iterator();
      while (localIterator.hasNext()) {
        if (((zze)localIterator.next()).zzd(paramChar)) {
          return true;
        }
      }
      return false;
    }
  }
}
