package com.adobe.creativesdk.aviary.utils;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v7.graphics.Palette;
import android.support.v7.graphics.Palette.Builder;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import it.sephiroth.android.library.picasso.Transformation;
import java.lang.ref.SoftReference;

public class PackIconTransformer
  implements Transformation
{
  private boolean generatePalette;
  private String imagePath;
  private int overlayGravity;
  private int overlayPadding;
  private int overlayResId;
  private String packType;
  private Palette palette;
  SoftReference<Resources> resourcesRef;
  
  PackIconTransformer() {}
  
  Bitmap generate(Resources paramResources, Bitmap paramBitmap)
  {
    if (paramResources == null) {
      return paramBitmap;
    }
    Object localObject = paramBitmap;
    int i;
    int j;
    if (overlayResId != 0)
    {
      localObject = paramResources.getDrawable(overlayResId);
      if (localObject == null) {
        break label256;
      }
      i = ((Drawable)localObject).getIntrinsicWidth();
      j = ((Drawable)localObject).getIntrinsicHeight();
      paramResources = new Rect(0, 0, i, j);
      if ((overlayGravity & 0x3) != 3) {
        break label128;
      }
      if ((overlayGravity & 0x30) != 48) {
        break label189;
      }
      label79:
      ((Drawable)localObject).setBounds(paramResources);
      paramResources = BitmapUtils.copy(paramBitmap, paramBitmap.getConfig());
      ((Drawable)localObject).draw(new Canvas(paramResources));
      localObject = paramBitmap;
      if (!paramResources.equals(paramBitmap)) {
        paramBitmap.recycle();
      }
    }
    for (localObject = paramResources;; localObject = paramBitmap)
    {
      return localObject;
      label128:
      if ((overlayGravity & 0x5) == 5)
      {
        paramResources.offsetTo(paramBitmap.getWidth() - i - overlayPadding, top);
        break;
      }
      if ((overlayGravity & 0x1) != 1) {
        break;
      }
      paramResources.offsetTo((paramBitmap.getWidth() - i) / 2, top);
      break;
      label189:
      if ((overlayGravity & 0x50) == 80)
      {
        paramResources.offsetTo(left, paramBitmap.getHeight() - j - overlayPadding);
        break label79;
      }
      if ((overlayGravity & 0x10) != 16) {
        break label79;
      }
      paramResources.offsetTo(left, (paramBitmap.getHeight() - j) / 2);
      break label79;
      label256:
      Log.w("PackIconTransformer", "drawable is null");
    }
  }
  
  public String key()
  {
    return imagePath + "_" + packType + overlayResId;
  }
  
  public Bitmap transform(Bitmap paramBitmap)
  {
    Object localObject2 = (Resources)resourcesRef.get();
    if (localObject2 == null) {
      return null;
    }
    Object localObject1 = paramBitmap;
    if (paramBitmap != null)
    {
      localObject2 = generate((Resources)localObject2, paramBitmap);
      localObject1 = paramBitmap;
      if (localObject2 != null)
      {
        localObject1 = paramBitmap;
        if (localObject2 != paramBitmap)
        {
          paramBitmap.recycle();
          localObject1 = localObject2;
        }
      }
    }
    if ((generatePalette) && (localObject1 != null))
    {
      SystemUtils.throwIfUiThread();
      palette = Palette.from((Bitmap)localObject1).generate();
    }
    return localObject1;
  }
  
  public static class Builder
  {
    boolean generatePalette;
    int overlayGravity;
    int overlayPadding = 0;
    int overlayResId = 0;
    String packType;
    String path;
    Resources resources;
    
    public Builder() {}
    
    public PackIconTransformer build()
    {
      PackIconTransformer localPackIconTransformer = new PackIconTransformer();
      if (path == null) {
        throw new IllegalArgumentException("path is required");
      }
      if (packType == null) {
        throw new IllegalArgumentException("packType cannot be null");
      }
      if (resources == null) {
        throw new IllegalArgumentException("resources cannot be null");
      }
      PackIconTransformer.access$002(localPackIconTransformer, path);
      PackIconTransformer.access$102(localPackIconTransformer, packType);
      resourcesRef = new SoftReference(resources);
      PackIconTransformer.access$202(localPackIconTransformer, generatePalette);
      PackIconTransformer.access$302(localPackIconTransformer, overlayResId);
      PackIconTransformer.access$402(localPackIconTransformer, overlayPadding);
      PackIconTransformer.access$502(localPackIconTransformer, overlayGravity);
      return localPackIconTransformer;
    }
    
    public Builder withOverlay(int paramInt1, int paramInt2, int paramInt3)
    {
      overlayResId = paramInt1;
      overlayPadding = paramInt3;
      overlayGravity = paramInt2;
      return this;
    }
    
    public Builder withPackType(String paramString)
    {
      packType = paramString;
      return this;
    }
    
    public Builder withPalette(boolean paramBoolean)
    {
      generatePalette = paramBoolean;
      return this;
    }
    
    public Builder withPath(String paramString)
    {
      path = paramString;
      return this;
    }
    
    public Builder withResources(Resources paramResources)
    {
      resources = paramResources;
      return this;
    }
  }
}
