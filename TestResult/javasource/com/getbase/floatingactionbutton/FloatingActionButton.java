package com.getbase.floatingactionbutton;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.ShapeDrawable.ShaderFactory;
import android.graphics.drawable.StateListDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.widget.ImageButton;
import android.widget.TextView;

public class FloatingActionButton
  extends ImageButton
{
  private float mCircleSize;
  int mColorDisabled;
  int mColorNormal;
  int mColorPressed;
  private int mDrawableSize;
  private int mIcon;
  private Drawable mIconDrawable;
  private float mShadowOffset;
  private float mShadowRadius;
  private int mSize;
  boolean mStrokeVisible;
  String mTitle;
  
  public FloatingActionButton(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public FloatingActionButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet);
  }
  
  public FloatingActionButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet);
  }
  
  private int adjustColorBrightness(int paramInt, float paramFloat)
  {
    float[] arrayOfFloat = new float[3];
    Color.colorToHSV(paramInt, arrayOfFloat);
    arrayOfFloat[2] = Math.min(arrayOfFloat[2] * paramFloat, 1.0F);
    return Color.HSVToColor(Color.alpha(paramInt), arrayOfFloat);
  }
  
  private Drawable createCircleDrawable(int paramInt, float paramFloat)
  {
    int i = Color.alpha(paramInt);
    paramInt = opaque(paramInt);
    Object localObject1 = new ShapeDrawable(new OvalShape());
    Object localObject2 = ((ShapeDrawable)localObject1).getPaint();
    ((Paint)localObject2).setAntiAlias(true);
    ((Paint)localObject2).setColor(paramInt);
    localObject2 = new Drawable[2];
    localObject2[0] = localObject1;
    localObject2[1] = createInnerStrokesDrawable(paramInt, paramFloat);
    if ((i == 255) || (!mStrokeVisible)) {}
    for (localObject1 = new LayerDrawable((Drawable[])localObject2);; localObject1 = new TranslucentLayerDrawable(i, (Drawable[])localObject2))
    {
      paramInt = (int)(paramFloat / 2.0F);
      ((LayerDrawable)localObject1).setLayerInset(1, paramInt, paramInt, paramInt, paramInt);
      return localObject1;
    }
  }
  
  private StateListDrawable createFillDrawable(float paramFloat)
  {
    StateListDrawable localStateListDrawable = new StateListDrawable();
    Drawable localDrawable = createCircleDrawable(mColorDisabled, paramFloat);
    localStateListDrawable.addState(new int[] { -16842910 }, localDrawable);
    localDrawable = createCircleDrawable(mColorPressed, paramFloat);
    localStateListDrawable.addState(new int[] { 16842919 }, localDrawable);
    localDrawable = createCircleDrawable(mColorNormal, paramFloat);
    localStateListDrawable.addState(new int[0], localDrawable);
    return localStateListDrawable;
  }
  
  private Drawable createInnerStrokesDrawable(final int paramInt, float paramFloat)
  {
    if (!mStrokeVisible) {
      return new ColorDrawable(0);
    }
    ShapeDrawable localShapeDrawable = new ShapeDrawable(new OvalShape());
    final int i = darkenColor(paramInt);
    final int j = halfTransparent(i);
    final int k = lightenColor(paramInt);
    final int m = halfTransparent(k);
    Paint localPaint = localShapeDrawable.getPaint();
    localPaint.setAntiAlias(true);
    localPaint.setStrokeWidth(paramFloat);
    localPaint.setStyle(Paint.Style.STROKE);
    localShapeDrawable.setShaderFactory(new ShapeDrawable.ShaderFactory()
    {
      public Shader resize(int paramAnonymousInt1, int paramAnonymousInt2)
      {
        float f1 = paramAnonymousInt1 / 2;
        float f2 = paramAnonymousInt1 / 2;
        float f3 = paramAnonymousInt2;
        paramAnonymousInt1 = k;
        paramAnonymousInt2 = m;
        int i = paramInt;
        int j = j;
        int k = i;
        Shader.TileMode localTileMode = Shader.TileMode.CLAMP;
        return new LinearGradient(f1, 0.0F, f2, f3, new int[] { paramAnonymousInt1, paramAnonymousInt2, i, j, k }, new float[] { 0.0F, 0.2F, 0.5F, 0.8F, 1.0F }, localTileMode);
      }
    });
    return localShapeDrawable;
  }
  
  private Drawable createOuterStrokeDrawable(float paramFloat)
  {
    ShapeDrawable localShapeDrawable = new ShapeDrawable(new OvalShape());
    Paint localPaint = localShapeDrawable.getPaint();
    localPaint.setAntiAlias(true);
    localPaint.setStrokeWidth(paramFloat);
    localPaint.setStyle(Paint.Style.STROKE);
    localPaint.setColor(-16777216);
    localPaint.setAlpha(opacityToAlpha(0.02F));
    return localShapeDrawable;
  }
  
  private int darkenColor(int paramInt)
  {
    return adjustColorBrightness(paramInt, 0.9F);
  }
  
  private int halfTransparent(int paramInt)
  {
    return Color.argb(Color.alpha(paramInt) / 2, Color.red(paramInt), Color.green(paramInt), Color.blue(paramInt));
  }
  
  private int lightenColor(int paramInt)
  {
    return adjustColorBrightness(paramInt, 1.1F);
  }
  
  private int opacityToAlpha(float paramFloat)
  {
    return (int)(255.0F * paramFloat);
  }
  
  private int opaque(int paramInt)
  {
    return Color.rgb(Color.red(paramInt), Color.green(paramInt), Color.blue(paramInt));
  }
  
  @SuppressLint({"NewApi"})
  private void setBackgroundCompat(Drawable paramDrawable)
  {
    if (Build.VERSION.SDK_INT >= 16)
    {
      setBackground(paramDrawable);
      return;
    }
    setBackgroundDrawable(paramDrawable);
  }
  
  private void updateCircleSize()
  {
    if (mSize == 0) {}
    for (int i = R.dimen.fab_size_normal;; i = R.dimen.fab_size_mini)
    {
      mCircleSize = getDimension(i);
      return;
    }
  }
  
  private void updateDrawableSize()
  {
    mDrawableSize = ((int)(mCircleSize + 2.0F * mShadowRadius));
  }
  
  int getColor(int paramInt)
  {
    return getResources().getColor(paramInt);
  }
  
  public int getColorDisabled()
  {
    return mColorDisabled;
  }
  
  public int getColorNormal()
  {
    return mColorNormal;
  }
  
  public int getColorPressed()
  {
    return mColorPressed;
  }
  
  float getDimension(int paramInt)
  {
    return getResources().getDimension(paramInt);
  }
  
  Drawable getIconDrawable()
  {
    if (mIconDrawable != null) {
      return mIconDrawable;
    }
    if (mIcon != 0) {
      return getResources().getDrawable(mIcon);
    }
    return new ColorDrawable(0);
  }
  
  TextView getLabelView()
  {
    return (TextView)getTag(R.id.fab_label);
  }
  
  public int getSize()
  {
    return mSize;
  }
  
  public String getTitle()
  {
    return mTitle;
  }
  
  void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.FloatingActionButton, 0, 0);
    mColorNormal = paramContext.getColor(R.styleable.FloatingActionButton_fab_colorNormal, getColor(17170451));
    mColorPressed = paramContext.getColor(R.styleable.FloatingActionButton_fab_colorPressed, getColor(17170450));
    mColorDisabled = paramContext.getColor(R.styleable.FloatingActionButton_fab_colorDisabled, getColor(17170432));
    mSize = paramContext.getInt(R.styleable.FloatingActionButton_fab_size, 0);
    mIcon = paramContext.getResourceId(R.styleable.FloatingActionButton_fab_icon, 0);
    mTitle = paramContext.getString(R.styleable.FloatingActionButton_fab_title);
    mStrokeVisible = paramContext.getBoolean(R.styleable.FloatingActionButton_fab_stroke_visible, true);
    paramContext.recycle();
    updateCircleSize();
    mShadowRadius = getDimension(R.dimen.fab_shadow_radius);
    mShadowOffset = getDimension(R.dimen.fab_shadow_offset);
    updateDrawableSize();
    updateBackground();
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    setMeasuredDimension(mDrawableSize, mDrawableSize);
  }
  
  public void setColorDisabled(int paramInt)
  {
    if (mColorDisabled != paramInt)
    {
      mColorDisabled = paramInt;
      updateBackground();
    }
  }
  
  public void setColorDisabledResId(int paramInt)
  {
    setColorDisabled(getColor(paramInt));
  }
  
  public void setColorNormal(int paramInt)
  {
    if (mColorNormal != paramInt)
    {
      mColorNormal = paramInt;
      updateBackground();
    }
  }
  
  public void setColorNormalResId(int paramInt)
  {
    setColorNormal(getColor(paramInt));
  }
  
  public void setColorPressed(int paramInt)
  {
    if (mColorPressed != paramInt)
    {
      mColorPressed = paramInt;
      updateBackground();
    }
  }
  
  public void setColorPressedResId(int paramInt)
  {
    setColorPressed(getColor(paramInt));
  }
  
  public void setIcon(int paramInt)
  {
    if (mIcon != paramInt)
    {
      mIcon = paramInt;
      mIconDrawable = null;
      updateBackground();
    }
  }
  
  public void setIconDrawable(Drawable paramDrawable)
  {
    if (mIconDrawable != paramDrawable)
    {
      mIcon = 0;
      mIconDrawable = paramDrawable;
      updateBackground();
    }
  }
  
  public void setSize(int paramInt)
  {
    if ((paramInt != 1) && (paramInt != 0)) {
      throw new IllegalArgumentException("Use @FAB_SIZE constants only!");
    }
    if (mSize != paramInt)
    {
      mSize = paramInt;
      updateCircleSize();
      updateDrawableSize();
      updateBackground();
    }
  }
  
  public void setStrokeVisible(boolean paramBoolean)
  {
    if (mStrokeVisible != paramBoolean)
    {
      mStrokeVisible = paramBoolean;
      updateBackground();
    }
  }
  
  public void setTitle(String paramString)
  {
    mTitle = paramString;
    TextView localTextView = getLabelView();
    if (localTextView != null) {
      localTextView.setText(paramString);
    }
  }
  
  public void setVisibility(int paramInt)
  {
    TextView localTextView = getLabelView();
    if (localTextView != null) {
      localTextView.setVisibility(paramInt);
    }
    super.setVisibility(paramInt);
  }
  
  void updateBackground()
  {
    float f1 = getDimension(R.dimen.fab_stroke_width);
    float f2 = f1 / 2.0F;
    Object localObject = getResources();
    if (mSize == 0) {}
    for (int i = R.drawable.fab_bg_normal;; i = R.drawable.fab_bg_mini)
    {
      localObject = new LayerDrawable(new Drawable[] { ((Resources)localObject).getDrawable(i), createFillDrawable(f1), createOuterStrokeDrawable(f1), getIconDrawable() });
      i = (int)(mCircleSize - getDimension(R.dimen.fab_icon_size)) / 2;
      int j = (int)mShadowRadius;
      int k = (int)(mShadowRadius - mShadowOffset);
      int m = (int)(mShadowRadius + mShadowOffset);
      ((LayerDrawable)localObject).setLayerInset(1, j, k, j, m);
      ((LayerDrawable)localObject).setLayerInset(2, (int)(j - f2), (int)(k - f2), (int)(j - f2), (int)(m - f2));
      ((LayerDrawable)localObject).setLayerInset(3, j + i, k + i, j + i, m + i);
      setBackgroundCompat((Drawable)localObject);
      return;
    }
  }
  
  private static class TranslucentLayerDrawable
    extends LayerDrawable
  {
    private final int mAlpha;
    
    public TranslucentLayerDrawable(int paramInt, Drawable... paramVarArgs)
    {
      super();
      mAlpha = paramInt;
    }
    
    public void draw(Canvas paramCanvas)
    {
      Rect localRect = getBounds();
      paramCanvas.saveLayerAlpha(left, top, right, bottom, mAlpha, 31);
      super.draw(paramCanvas);
      paramCanvas.restore();
    }
  }
}
