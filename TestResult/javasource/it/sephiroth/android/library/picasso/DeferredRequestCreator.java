package it.sephiroth.android.library.picasso;

import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import android.widget.ImageView;
import java.lang.ref.WeakReference;

class DeferredRequestCreator
  implements ViewTreeObserver.OnPreDrawListener
{
  Callback callback;
  final RequestCreator creator;
  final WeakReference<ImageView> target;
  final boolean targetIsHidden;
  
  DeferredRequestCreator(RequestCreator paramRequestCreator, ImageView paramImageView, Callback paramCallback, boolean paramBoolean)
  {
    creator = paramRequestCreator;
    target = new WeakReference(paramImageView);
    callback = paramCallback;
    targetIsHidden = paramBoolean;
    paramImageView.getViewTreeObserver().addOnPreDrawListener(this);
  }
  
  void cancel()
  {
    callback = null;
    Object localObject = (ImageView)target.get();
    if (localObject == null) {}
    do
    {
      return;
      localObject = ((ImageView)localObject).getViewTreeObserver();
    } while (!((ViewTreeObserver)localObject).isAlive());
    ((ViewTreeObserver)localObject).removeOnPreDrawListener(this);
  }
  
  public boolean onPreDraw()
  {
    ImageView localImageView = (ImageView)target.get();
    if (localImageView == null) {}
    for (;;)
    {
      return true;
      ViewTreeObserver localViewTreeObserver = localImageView.getViewTreeObserver();
      if (localViewTreeObserver.isAlive())
      {
        int j;
        if ((localImageView.getVisibility() == 8) || (targetIsHidden)) {
          j = localImageView.getMeasuredWidth();
        }
        for (int i = localImageView.getMeasuredHeight(); (j > 0) && (i > 0); i = localImageView.getHeight())
        {
          localViewTreeObserver.removeOnPreDrawListener(this);
          creator.unfit().resize(j, i).into(localImageView, callback);
          return true;
          j = localImageView.getWidth();
        }
      }
    }
  }
}
