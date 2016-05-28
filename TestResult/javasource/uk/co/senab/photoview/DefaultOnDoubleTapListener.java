package uk.co.senab.photoview;

import android.graphics.RectF;
import android.view.GestureDetector.OnDoubleTapListener;
import android.view.MotionEvent;
import android.widget.ImageView;

public class DefaultOnDoubleTapListener
  implements GestureDetector.OnDoubleTapListener
{
  private PhotoViewAttacher photoViewAttacher;
  
  public DefaultOnDoubleTapListener(PhotoViewAttacher paramPhotoViewAttacher)
  {
    setPhotoViewAttacher(paramPhotoViewAttacher);
  }
  
  public boolean onDoubleTap(MotionEvent paramMotionEvent)
  {
    boolean bool = true;
    if (photoViewAttacher == null) {
      bool = false;
    }
    for (;;)
    {
      return bool;
      try
      {
        float f1 = photoViewAttacher.getScale();
        float f2 = paramMotionEvent.getX();
        float f3 = paramMotionEvent.getY();
        if (f1 < photoViewAttacher.getMediumScale())
        {
          photoViewAttacher.setScale(photoViewAttacher.getMediumScale(), f2, f3, true);
          f1 = photoViewAttacher.getMediumScale();
        }
        for (;;)
        {
          paramMotionEvent = photoViewAttacher.getZoomDelegate();
          if (paramMotionEvent == null) {
            break;
          }
          paramMotionEvent.signalZoomHandled(f1, f2, f3);
          return true;
          if ((f1 >= photoViewAttacher.getMediumScale()) && (f1 < photoViewAttacher.getMaximumScale()))
          {
            photoViewAttacher.setScale(photoViewAttacher.getMaximumScale(), f2, f3, true);
            f1 = photoViewAttacher.getMaximumScale();
          }
          else
          {
            photoViewAttacher.setScale(photoViewAttacher.getMinimumScale(), f2, f3, true);
            f1 = photoViewAttacher.getMinimumScale();
          }
        }
        return true;
      }
      catch (ArrayIndexOutOfBoundsException paramMotionEvent) {}
    }
  }
  
  public boolean onDoubleTapEvent(MotionEvent paramMotionEvent)
  {
    return false;
  }
  
  public boolean onSingleTapConfirmed(MotionEvent paramMotionEvent)
  {
    if (photoViewAttacher == null) {}
    ImageView localImageView;
    do
    {
      return false;
      localImageView = photoViewAttacher.getImageView();
      if (photoViewAttacher.getOnPhotoTapListener() != null)
      {
        RectF localRectF = photoViewAttacher.getDisplayRect();
        if (localRectF != null)
        {
          float f2 = paramMotionEvent.getX();
          float f1 = paramMotionEvent.getY();
          if (localRectF.contains(f2, f1))
          {
            f2 = (f2 - left) / localRectF.width();
            f1 = (f1 - top) / localRectF.height();
            photoViewAttacher.getOnPhotoTapListener().onPhotoTap(localImageView, f2, f1);
            return true;
          }
        }
      }
    } while (photoViewAttacher.getOnViewTapListener() == null);
    photoViewAttacher.getOnViewTapListener().onViewTap(localImageView, paramMotionEvent.getX(), paramMotionEvent.getY());
    return false;
  }
  
  public void setPhotoViewAttacher(PhotoViewAttacher paramPhotoViewAttacher)
  {
    photoViewAttacher = paramPhotoViewAttacher;
  }
}
