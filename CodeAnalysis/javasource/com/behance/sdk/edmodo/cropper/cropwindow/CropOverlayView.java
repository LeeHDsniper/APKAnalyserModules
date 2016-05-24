package com.behance.sdk.edmodo.cropper.cropwindow;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Pair;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import com.behance.sdk.edmodo.cropper.cropwindow.edge.Edge;
import com.behance.sdk.edmodo.cropper.cropwindow.handle.Handle;
import com.behance.sdk.edmodo.cropper.util.AspectRatioUtil;
import com.behance.sdk.edmodo.cropper.util.HandleUtil;
import com.behance.sdk.edmodo.cropper.util.PaintUtil;

public class CropOverlayView
  extends View
{
  private static final float DEFAULT_CORNER_EXTENSION_DP = DEFAULT_CORNER_THICKNESS_DP / 2.0F + DEFAULT_CORNER_OFFSET_DP;
  private static final float DEFAULT_CORNER_OFFSET_DP;
  private static final float DEFAULT_CORNER_THICKNESS_DP = ;
  private static final float DEFAULT_LINE_THICKNESS_DP = PaintUtil.getLineThickness();
  private boolean initializedCropWindow = false;
  private int mAspectRatioX = 1;
  private int mAspectRatioY = 1;
  private Paint mBackgroundPaint;
  private Rect mBitmapRect;
  private Paint mBorderPaint;
  private float mCornerExtension;
  private float mCornerLength;
  private float mCornerOffset;
  private Paint mCornerPaint;
  private boolean mFixAspectRatio = false;
  private Paint mGuidelinePaint;
  private int mGuidelines;
  private float mHandleRadius;
  private Handle mPressedHandle;
  private float mSnapRadius;
  private float mTargetAspectRatio = mAspectRatioX / mAspectRatioY;
  private Pair<Float, Float> mTouchOffset;
  
  static
  {
    DEFAULT_CORNER_OFFSET_DP = DEFAULT_CORNER_THICKNESS_DP / 2.0F - DEFAULT_LINE_THICKNESS_DP / 2.0F;
  }
  
  public CropOverlayView(Context paramContext)
  {
    super(paramContext);
    init(paramContext);
  }
  
  public CropOverlayView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext);
  }
  
  private void drawBackground(Canvas paramCanvas, Rect paramRect)
  {
    float f1 = Edge.LEFT.getCoordinate();
    float f2 = Edge.TOP.getCoordinate();
    float f3 = Edge.RIGHT.getCoordinate();
    float f4 = Edge.BOTTOM.getCoordinate();
    paramCanvas.drawRect(left, top, right, f2, mBackgroundPaint);
    paramCanvas.drawRect(left, f4, right, bottom, mBackgroundPaint);
    paramCanvas.drawRect(left, f2, f1, f4, mBackgroundPaint);
    paramCanvas.drawRect(f3, f2, right, f4, mBackgroundPaint);
  }
  
  private void drawCorners(Canvas paramCanvas)
  {
    float f1 = Edge.LEFT.getCoordinate();
    float f2 = Edge.TOP.getCoordinate();
    float f3 = Edge.RIGHT.getCoordinate();
    float f4 = Edge.BOTTOM.getCoordinate();
    paramCanvas.drawLine(f1 - mCornerOffset, f2 - mCornerExtension, f1 - mCornerOffset, f2 + mCornerLength, mCornerPaint);
    paramCanvas.drawLine(f1, f2 - mCornerOffset, f1 + mCornerLength, f2 - mCornerOffset, mCornerPaint);
    paramCanvas.drawLine(f3 + mCornerOffset, f2 - mCornerExtension, f3 + mCornerOffset, f2 + mCornerLength, mCornerPaint);
    paramCanvas.drawLine(f3, f2 - mCornerOffset, f3 - mCornerLength, f2 - mCornerOffset, mCornerPaint);
    paramCanvas.drawLine(f1 - mCornerOffset, f4 + mCornerExtension, f1 - mCornerOffset, f4 - mCornerLength, mCornerPaint);
    paramCanvas.drawLine(f1, f4 + mCornerOffset, f1 + mCornerLength, f4 + mCornerOffset, mCornerPaint);
    paramCanvas.drawLine(f3 + mCornerOffset, f4 + mCornerExtension, f3 + mCornerOffset, f4 - mCornerLength, mCornerPaint);
    paramCanvas.drawLine(f3, f4 + mCornerOffset, f3 - mCornerLength, f4 + mCornerOffset, mCornerPaint);
  }
  
  private void drawRuleOfThirdsGuidelines(Canvas paramCanvas)
  {
    float f1 = Edge.LEFT.getCoordinate();
    float f4 = Edge.TOP.getCoordinate();
    float f2 = Edge.RIGHT.getCoordinate();
    float f3 = Edge.BOTTOM.getCoordinate();
    float f5 = Edge.getWidth() / 3.0F;
    float f6 = f1 + f5;
    paramCanvas.drawLine(f6, f4, f6, f3, mGuidelinePaint);
    f5 = f2 - f5;
    paramCanvas.drawLine(f5, f4, f5, f3, mGuidelinePaint);
    f5 = Edge.getHeight() / 3.0F;
    f4 += f5;
    paramCanvas.drawLine(f1, f4, f2, f4, mGuidelinePaint);
    f3 -= f5;
    paramCanvas.drawLine(f1, f3, f2, f3, mGuidelinePaint);
  }
  
  private void init(Context paramContext)
  {
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    mHandleRadius = HandleUtil.getTargetRadius(paramContext);
    mSnapRadius = TypedValue.applyDimension(1, 6.0F, localDisplayMetrics);
    mBorderPaint = PaintUtil.newBorderPaint(paramContext);
    mGuidelinePaint = PaintUtil.newGuidelinePaint();
    mBackgroundPaint = PaintUtil.newBackgroundPaint(paramContext);
    mCornerPaint = PaintUtil.newCornerPaint(paramContext);
    mCornerOffset = TypedValue.applyDimension(1, DEFAULT_CORNER_OFFSET_DP, localDisplayMetrics);
    mCornerExtension = TypedValue.applyDimension(1, DEFAULT_CORNER_EXTENSION_DP, localDisplayMetrics);
    mCornerLength = TypedValue.applyDimension(1, 20.0F, localDisplayMetrics);
    mGuidelines = 1;
  }
  
  private void initCropWindow(Rect paramRect)
  {
    if (!initializedCropWindow) {
      initializedCropWindow = true;
    }
    if (mFixAspectRatio)
    {
      if (AspectRatioUtil.calculateAspectRatio(paramRect) > mTargetAspectRatio)
      {
        Edge.TOP.setCoordinate(top);
        Edge.BOTTOM.setCoordinate(bottom);
        f1 = getWidth() / 2.0F;
        f2 = AspectRatioUtil.calculateWidth(Edge.TOP.getCoordinate(), Edge.BOTTOM.getCoordinate(), mTargetAspectRatio) / 2.0F;
        Edge.LEFT.setCoordinate(f1 - f2);
        Edge.RIGHT.setCoordinate(f1 + f2);
        return;
      }
      Edge.LEFT.setCoordinate(left);
      Edge.RIGHT.setCoordinate(right);
      f1 = getHeight() / 2.0F;
      f2 = AspectRatioUtil.calculateHeight(Edge.LEFT.getCoordinate(), Edge.RIGHT.getCoordinate(), mTargetAspectRatio) / 2.0F;
      Edge.TOP.setCoordinate(f1 - f2);
      Edge.BOTTOM.setCoordinate(f1 + f2);
      return;
    }
    float f1 = 0.1F * paramRect.width();
    float f2 = 0.1F * paramRect.height();
    Edge.LEFT.setCoordinate(left + f1);
    Edge.TOP.setCoordinate(top + f2);
    Edge.RIGHT.setCoordinate(right - f1);
    Edge.BOTTOM.setCoordinate(bottom - f2);
  }
  
  private void onActionDown(float paramFloat1, float paramFloat2)
  {
    float f1 = Edge.LEFT.getCoordinate();
    float f2 = Edge.TOP.getCoordinate();
    float f3 = Edge.RIGHT.getCoordinate();
    float f4 = Edge.BOTTOM.getCoordinate();
    mPressedHandle = HandleUtil.getPressedHandle(paramFloat1, paramFloat2, f1, f2, f3, f4, mHandleRadius);
    if (mPressedHandle == null) {
      return;
    }
    mTouchOffset = HandleUtil.getOffset(mPressedHandle, paramFloat1, paramFloat2, f1, f2, f3, f4);
    invalidate();
  }
  
  private void onActionMove(float paramFloat1, float paramFloat2)
  {
    if (mPressedHandle == null) {
      return;
    }
    paramFloat1 += ((Float)mTouchOffset.first).floatValue();
    paramFloat2 += ((Float)mTouchOffset.second).floatValue();
    if (mFixAspectRatio) {
      mPressedHandle.updateCropWindow(paramFloat1, paramFloat2, mTargetAspectRatio, mBitmapRect, mSnapRadius);
    }
    for (;;)
    {
      invalidate();
      return;
      mPressedHandle.updateCropWindow(paramFloat1, paramFloat2, mBitmapRect, mSnapRadius);
    }
  }
  
  private void onActionUp()
  {
    if (mPressedHandle == null) {
      return;
    }
    mPressedHandle = null;
    invalidate();
  }
  
  public static boolean showGuidelines()
  {
    return (Math.abs(Edge.LEFT.getCoordinate() - Edge.RIGHT.getCoordinate()) >= 100.0F) && (Math.abs(Edge.TOP.getCoordinate() - Edge.BOTTOM.getCoordinate()) >= 100.0F);
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: invokespecial 274	android/view/View:onDraw	(Landroid/graphics/Canvas;)V
    //   5: aload_0
    //   6: aload_1
    //   7: aload_0
    //   8: getfield 252	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:mBitmapRect	Landroid/graphics/Rect;
    //   11: invokespecial 276	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:drawBackground	(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    //   14: invokestatic 278	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:showGuidelines	()Z
    //   17: ifeq +16 -> 33
    //   20: aload_0
    //   21: getfield 187	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:mGuidelines	I
    //   24: iconst_2
    //   25: if_icmpne +46 -> 71
    //   28: aload_0
    //   29: aload_1
    //   30: invokespecial 280	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:drawRuleOfThirdsGuidelines	(Landroid/graphics/Canvas;)V
    //   33: aload_1
    //   34: getstatic 82	com/behance/sdk/edmodo/cropper/cropwindow/edge/Edge:LEFT	Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    //   37: invokevirtual 85	com/behance/sdk/edmodo/cropper/cropwindow/edge/Edge:getCoordinate	()F
    //   40: getstatic 88	com/behance/sdk/edmodo/cropper/cropwindow/edge/Edge:TOP	Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    //   43: invokevirtual 85	com/behance/sdk/edmodo/cropper/cropwindow/edge/Edge:getCoordinate	()F
    //   46: getstatic 91	com/behance/sdk/edmodo/cropper/cropwindow/edge/Edge:RIGHT	Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    //   49: invokevirtual 85	com/behance/sdk/edmodo/cropper/cropwindow/edge/Edge:getCoordinate	()F
    //   52: getstatic 94	com/behance/sdk/edmodo/cropper/cropwindow/edge/Edge:BOTTOM	Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    //   55: invokevirtual 85	com/behance/sdk/edmodo/cropper/cropwindow/edge/Edge:getCoordinate	()F
    //   58: aload_0
    //   59: getfield 174	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:mBorderPaint	Landroid/graphics/Paint;
    //   62: invokevirtual 113	android/graphics/Canvas:drawRect	(FFFFLandroid/graphics/Paint;)V
    //   65: aload_0
    //   66: aload_1
    //   67: invokespecial 282	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:drawCorners	(Landroid/graphics/Canvas;)V
    //   70: return
    //   71: aload_0
    //   72: getfield 187	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:mGuidelines	I
    //   75: iconst_1
    //   76: if_icmpne +18 -> 94
    //   79: aload_0
    //   80: getfield 226	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:mPressedHandle	Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;
    //   83: ifnull -50 -> 33
    //   86: aload_0
    //   87: aload_1
    //   88: invokespecial 280	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:drawRuleOfThirdsGuidelines	(Landroid/graphics/Canvas;)V
    //   91: goto -58 -> 33
    //   94: aload_0
    //   95: getfield 187	com/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView:mGuidelines	I
    //   98: ifne -65 -> 33
    //   101: goto -68 -> 33
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	104	0	this	CropOverlayView
    //   0	104	1	paramCanvas	Canvas
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    initCropWindow(mBitmapRect);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!isEnabled()) {
      return false;
    }
    switch (paramMotionEvent.getAction())
    {
    default: 
      return false;
    case 0: 
      onActionDown(paramMotionEvent.getX(), paramMotionEvent.getY());
      return true;
    case 1: 
    case 3: 
      getParent().requestDisallowInterceptTouchEvent(false);
      onActionUp();
      return true;
    }
    onActionMove(paramMotionEvent.getX(), paramMotionEvent.getY());
    getParent().requestDisallowInterceptTouchEvent(true);
    return true;
  }
  
  public void resetCropOverlayView()
  {
    if (initializedCropWindow)
    {
      initCropWindow(mBitmapRect);
      invalidate();
    }
  }
  
  public void setAspectRatioX(int paramInt)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException("Cannot set aspect ratio value to a number less than or equal to 0.");
    }
    mAspectRatioX = paramInt;
    mTargetAspectRatio = (mAspectRatioX / mAspectRatioY);
    if (initializedCropWindow)
    {
      initCropWindow(mBitmapRect);
      invalidate();
    }
  }
  
  public void setAspectRatioY(int paramInt)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException("Cannot set aspect ratio value to a number less than or equal to 0.");
    }
    mAspectRatioY = paramInt;
    mTargetAspectRatio = (mAspectRatioX / mAspectRatioY);
    if (initializedCropWindow)
    {
      initCropWindow(mBitmapRect);
      invalidate();
    }
  }
  
  public void setBitmapRect(Rect paramRect)
  {
    mBitmapRect = paramRect;
    initCropWindow(mBitmapRect);
  }
  
  public void setFixedAspectRatio(boolean paramBoolean)
  {
    mFixAspectRatio = paramBoolean;
    if (initializedCropWindow)
    {
      initCropWindow(mBitmapRect);
      invalidate();
    }
  }
  
  public void setGuidelines(int paramInt)
  {
    if ((paramInt < 0) || (paramInt > 2)) {
      throw new IllegalArgumentException("Guideline value must be set between 0 and 2. See documentation.");
    }
    mGuidelines = paramInt;
    if (initializedCropWindow)
    {
      initCropWindow(mBitmapRect);
      invalidate();
    }
  }
  
  public void setInitialAttributeValues(int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3)
  {
    if ((paramInt1 < 0) || (paramInt1 > 2)) {
      throw new IllegalArgumentException("Guideline value must be set between 0 and 2. See documentation.");
    }
    mGuidelines = paramInt1;
    mFixAspectRatio = paramBoolean;
    if (paramInt2 <= 0) {
      throw new IllegalArgumentException("Cannot set aspect ratio value to a number less than or equal to 0.");
    }
    mAspectRatioX = paramInt2;
    mTargetAspectRatio = (mAspectRatioX / mAspectRatioY);
    if (paramInt3 <= 0) {
      throw new IllegalArgumentException("Cannot set aspect ratio value to a number less than or equal to 0.");
    }
    mAspectRatioY = paramInt3;
    mTargetAspectRatio = (mAspectRatioX / mAspectRatioY);
  }
}
