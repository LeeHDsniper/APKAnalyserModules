package it.sephiroth.android.library.picasso;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import java.lang.ref.WeakReference;

class ImageViewAction
  extends Action<ImageView>
{
  Callback callback;
  
  ImageViewAction(Picasso paramPicasso, ImageView paramImageView, Request paramRequest, int paramInt1, int paramInt2, int paramInt3, Drawable paramDrawable, String paramString, Object paramObject, Callback paramCallback, long paramLong)
  {
    super(paramPicasso, paramImageView, paramRequest, paramInt1, paramInt2, paramInt3, paramDrawable, paramString, paramObject, paramLong);
    callback = paramCallback;
  }
  
  void cancel()
  {
    super.cancel();
    if (callback != null) {
      callback = null;
    }
  }
  
  public void complete(Bitmap paramBitmap, Picasso.LoadedFrom paramLoadedFrom)
  {
    if (paramBitmap == null) {
      throw new AssertionError(String.format("Attempted to complete action with no result!\n%s", new Object[] { this }));
    }
    ImageView localImageView = (ImageView)target.get();
    if (localImageView == null) {}
    do
    {
      return;
      Context localContext = picasso.context;
      boolean bool = picasso.indicatorsEnabled;
      PicassoDrawable.setBitmap(localImageView, localContext, paramBitmap, paramLoadedFrom, fadeTime, bool);
    } while (callback == null);
    callback.onSuccess();
  }
  
  public void error()
  {
    ImageView localImageView = (ImageView)target.get();
    if (localImageView == null) {}
    for (;;)
    {
      return;
      if (errorResId != 0) {
        localImageView.setImageResource(errorResId);
      }
      while (callback != null)
      {
        callback.onError();
        return;
        if (errorDrawable != null) {
          localImageView.setImageDrawable(errorDrawable);
        }
      }
    }
  }
}
