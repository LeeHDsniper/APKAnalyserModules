package uk.co.senab.photoview;

public abstract interface IPhotoViewZoomDelegate
{
  public abstract void signalDragDetected(float paramFloat1, float paramFloat2);
  
  public abstract void signalZoomHandled(float paramFloat1, float paramFloat2, float paramFloat3);
}
