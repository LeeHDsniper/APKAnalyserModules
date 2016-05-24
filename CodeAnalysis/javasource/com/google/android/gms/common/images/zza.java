package com.google.android.gms.common.images;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.internal.zzks;
import com.google.android.gms.internal.zzku;
import com.google.android.gms.internal.zzku.zza;
import java.lang.ref.WeakReference;

public abstract class zza
{
  final zza zzabQ;
  protected int zzabS;
  protected ImageManager.OnImageLoadedListener zzabU;
  protected int zzabY;
  
  private Drawable zza(Context paramContext, zzku paramZzku, int paramInt)
  {
    Resources localResources = paramContext.getResources();
    if (zzabY > 0)
    {
      zzku.zza localZza = new zzku.zza(paramInt, zzabY);
      Drawable localDrawable = (Drawable)paramZzku.get(localZza);
      paramContext = localDrawable;
      if (localDrawable == null)
      {
        localDrawable = localResources.getDrawable(paramInt);
        paramContext = localDrawable;
        if ((zzabY & 0x1) != 0) {
          paramContext = zza(localResources, localDrawable);
        }
        paramZzku.put(localZza, paramContext);
      }
      return paramContext;
    }
    return localResources.getDrawable(paramInt);
  }
  
  protected Drawable zza(Resources paramResources, Drawable paramDrawable)
  {
    return zzks.zza(paramResources, paramDrawable);
  }
  
  void zza(Context paramContext, Bitmap paramBitmap, boolean paramBoolean)
  {
    zzb.zzr(paramBitmap);
    Bitmap localBitmap = paramBitmap;
    if ((zzabY & 0x1) != 0) {
      localBitmap = zzks.zza(paramBitmap);
    }
    paramContext = new BitmapDrawable(paramContext.getResources(), localBitmap);
    if (zzabU != null) {
      zzabU.onImageLoaded(zzabQ.uri, paramContext, true);
    }
    zza(paramContext, paramBoolean, false, true);
  }
  
  void zza(Context paramContext, zzku paramZzku, boolean paramBoolean)
  {
    Drawable localDrawable = null;
    if (zzabS != 0) {
      localDrawable = zza(paramContext, paramZzku, zzabS);
    }
    if (zzabU != null) {
      zzabU.onImageLoaded(zzabQ.uri, localDrawable, false);
    }
    zza(localDrawable, paramBoolean, false, false);
  }
  
  protected abstract void zza(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3);
  
  static final class zza
  {
    public final Uri uri;
    
    public zza(Uri paramUri)
    {
      uri = paramUri;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zza)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      return zzw.equal(uri, uri);
    }
    
    public int hashCode()
    {
      return zzw.hashCode(new Object[] { uri });
    }
  }
  
  public static final class zzc
    extends zza
  {
    private WeakReference<ImageManager.OnImageLoadedListener> zzaca;
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zzc)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      paramObject = (zzc)paramObject;
      ImageManager.OnImageLoadedListener localOnImageLoadedListener1 = (ImageManager.OnImageLoadedListener)zzaca.get();
      ImageManager.OnImageLoadedListener localOnImageLoadedListener2 = (ImageManager.OnImageLoadedListener)zzaca.get();
      if ((localOnImageLoadedListener2 != null) && (localOnImageLoadedListener1 != null) && (zzw.equal(localOnImageLoadedListener2, localOnImageLoadedListener1)) && (zzw.equal(zzabQ, zzabQ))) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public int hashCode()
    {
      return zzw.hashCode(new Object[] { zzabQ });
    }
    
    protected void zza(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      if (!paramBoolean2)
      {
        ImageManager.OnImageLoadedListener localOnImageLoadedListener = (ImageManager.OnImageLoadedListener)zzaca.get();
        if (localOnImageLoadedListener != null) {
          localOnImageLoadedListener.onImageLoaded(zzabQ.uri, paramDrawable, paramBoolean3);
        }
      }
    }
  }
}
