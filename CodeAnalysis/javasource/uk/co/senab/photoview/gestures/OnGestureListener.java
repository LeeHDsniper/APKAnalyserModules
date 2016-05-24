package uk.co.senab.photoview.gestures;

public abstract interface OnGestureListener
{
  public abstract void onDrag(float paramFloat1, float paramFloat2);
  
  public abstract void onFling(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  public abstract void onScale(float paramFloat1, float paramFloat2, float paramFloat3);
}
