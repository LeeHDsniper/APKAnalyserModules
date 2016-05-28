package android.support.v7.internal.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;

public class TintTypedArray
{
  private final Context mContext;
  private TintManager mTintManager;
  private final TypedArray mWrapped;
  
  private TintTypedArray(Context paramContext, TypedArray paramTypedArray)
  {
    mContext = paramContext;
    mWrapped = paramTypedArray;
  }
  
  public static TintTypedArray obtainStyledAttributes(Context paramContext, AttributeSet paramAttributeSet, int[] paramArrayOfInt)
  {
    return new TintTypedArray(paramContext, paramContext.obtainStyledAttributes(paramAttributeSet, paramArrayOfInt));
  }
  
  public static TintTypedArray obtainStyledAttributes(Context paramContext, AttributeSet paramAttributeSet, int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    return new TintTypedArray(paramContext, paramContext.obtainStyledAttributes(paramAttributeSet, paramArrayOfInt, paramInt1, paramInt2));
  }
  
  public boolean getBoolean(int paramInt, boolean paramBoolean)
  {
    return mWrapped.getBoolean(paramInt, paramBoolean);
  }
  
  public int getDimensionPixelOffset(int paramInt1, int paramInt2)
  {
    return mWrapped.getDimensionPixelOffset(paramInt1, paramInt2);
  }
  
  public int getDimensionPixelSize(int paramInt1, int paramInt2)
  {
    return mWrapped.getDimensionPixelSize(paramInt1, paramInt2);
  }
  
  public Drawable getDrawable(int paramInt)
  {
    if (mWrapped.hasValue(paramInt))
    {
      int i = mWrapped.getResourceId(paramInt, 0);
      if (i != 0) {
        return getTintManager().getDrawable(i);
      }
    }
    return mWrapped.getDrawable(paramInt);
  }
  
  public Drawable getDrawableIfKnown(int paramInt)
  {
    if (mWrapped.hasValue(paramInt))
    {
      paramInt = mWrapped.getResourceId(paramInt, 0);
      if (paramInt != 0) {
        return getTintManager().getDrawable(paramInt, true);
      }
    }
    return null;
  }
  
  public float getFloat(int paramInt, float paramFloat)
  {
    return mWrapped.getFloat(paramInt, paramFloat);
  }
  
  public int getInt(int paramInt1, int paramInt2)
  {
    return mWrapped.getInt(paramInt1, paramInt2);
  }
  
  public int getInteger(int paramInt1, int paramInt2)
  {
    return mWrapped.getInteger(paramInt1, paramInt2);
  }
  
  public int getLayoutDimension(int paramInt1, int paramInt2)
  {
    return mWrapped.getLayoutDimension(paramInt1, paramInt2);
  }
  
  public int getResourceId(int paramInt1, int paramInt2)
  {
    return mWrapped.getResourceId(paramInt1, paramInt2);
  }
  
  public String getString(int paramInt)
  {
    return mWrapped.getString(paramInt);
  }
  
  public CharSequence getText(int paramInt)
  {
    return mWrapped.getText(paramInt);
  }
  
  public TintManager getTintManager()
  {
    if (mTintManager == null) {
      mTintManager = TintManager.get(mContext);
    }
    return mTintManager;
  }
  
  public boolean hasValue(int paramInt)
  {
    return mWrapped.hasValue(paramInt);
  }
  
  public int length()
  {
    return mWrapped.length();
  }
  
  public void recycle()
  {
    mWrapped.recycle();
  }
}
