package android.support.v7.graphics;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.AsyncTask;
import android.support.v4.graphics.ColorUtils;
import android.support.v4.os.AsyncTaskCompat;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class Palette
{
  private final Generator mGenerator;
  private final List<Swatch> mSwatches;
  
  private Palette(List<Swatch> paramList, Generator paramGenerator)
  {
    mSwatches = paramList;
    mGenerator = paramGenerator;
  }
  
  public static Builder from(Bitmap paramBitmap)
  {
    return new Builder(paramBitmap);
  }
  
  private static Bitmap scaleBitmapDown(Bitmap paramBitmap, int paramInt)
  {
    int i = Math.max(paramBitmap.getWidth(), paramBitmap.getHeight());
    if (i <= paramInt) {
      return paramBitmap;
    }
    float f = paramInt / i;
    return Bitmap.createScaledBitmap(paramBitmap, Math.round(paramBitmap.getWidth() * f), Math.round(paramBitmap.getHeight() * f), false);
  }
  
  public List<Swatch> getSwatches()
  {
    return Collections.unmodifiableList(mSwatches);
  }
  
  public int getVibrantColor(int paramInt)
  {
    Swatch localSwatch = getVibrantSwatch();
    if (localSwatch != null) {
      paramInt = localSwatch.getRgb();
    }
    return paramInt;
  }
  
  public Swatch getVibrantSwatch()
  {
    return mGenerator.getVibrantSwatch();
  }
  
  public static final class Builder
  {
    private Bitmap mBitmap;
    private Palette.Generator mGenerator;
    private int mMaxColors = 16;
    private int mResizeMaxDimension = 192;
    private List<Palette.Swatch> mSwatches;
    
    public Builder(Bitmap paramBitmap)
    {
      if ((paramBitmap == null) || (paramBitmap.isRecycled())) {
        throw new IllegalArgumentException("Bitmap is not valid");
      }
      mBitmap = paramBitmap;
    }
    
    public AsyncTask<Bitmap, Void, Palette> generate(final Palette.PaletteAsyncListener paramPaletteAsyncListener)
    {
      if (paramPaletteAsyncListener == null) {
        throw new IllegalArgumentException("listener can not be null");
      }
      AsyncTaskCompat.executeParallel(new AsyncTask()
      {
        protected Palette doInBackground(Bitmap... paramAnonymousVarArgs)
        {
          return generate();
        }
        
        protected void onPostExecute(Palette paramAnonymousPalette)
        {
          paramPaletteAsyncListener.onGenerated(paramAnonymousPalette);
        }
      }, new Bitmap[] { mBitmap });
    }
    
    public Palette generate()
    {
      Object localObject;
      if (mBitmap != null)
      {
        if (mResizeMaxDimension <= 0) {
          throw new IllegalArgumentException("Minimum dimension size for resizing should should be >= 1");
        }
        localObject = Palette.scaleBitmapDown(mBitmap, mResizeMaxDimension);
        if (0 != 0) {
          throw new NullPointerException();
        }
        ColorCutQuantizer localColorCutQuantizer = ColorCutQuantizer.fromBitmap((Bitmap)localObject, mMaxColors);
        if (localObject != mBitmap) {
          ((Bitmap)localObject).recycle();
        }
        localObject = localColorCutQuantizer.getQuantizedColors();
        if (0 != 0) {
          throw new NullPointerException();
        }
      }
      for (;;)
      {
        if (mGenerator == null) {
          mGenerator = new DefaultGenerator();
        }
        mGenerator.generate((List)localObject);
        if (0 != 0) {
          throw new NullPointerException();
        }
        localObject = new Palette((List)localObject, mGenerator, null);
        if (0 != 0) {
          throw new NullPointerException();
        }
        return localObject;
        localObject = mSwatches;
      }
    }
    
    public Builder resizeBitmapSize(int paramInt)
    {
      mResizeMaxDimension = paramInt;
      return this;
    }
  }
  
  static abstract class Generator
  {
    Generator() {}
    
    public abstract void generate(List<Palette.Swatch> paramList);
    
    public Palette.Swatch getVibrantSwatch()
    {
      return null;
    }
  }
  
  public static abstract interface PaletteAsyncListener
  {
    public abstract void onGenerated(Palette paramPalette);
  }
  
  public static final class Swatch
  {
    private final int mBlue;
    private int mBodyTextColor;
    private boolean mGeneratedTextColors;
    private final int mGreen;
    private float[] mHsl;
    private final int mPopulation;
    private final int mRed;
    private final int mRgb;
    private int mTitleTextColor;
    
    public Swatch(int paramInt1, int paramInt2)
    {
      mRed = Color.red(paramInt1);
      mGreen = Color.green(paramInt1);
      mBlue = Color.blue(paramInt1);
      mRgb = paramInt1;
      mPopulation = paramInt2;
    }
    
    private void ensureTextColorsGenerated()
    {
      int j;
      if (!mGeneratedTextColors)
      {
        i = ColorUtils.calculateMinimumAlpha(-1, mRgb, 4.5F);
        j = ColorUtils.calculateMinimumAlpha(-1, mRgb, 3.0F);
        if ((i != -1) && (j != -1))
        {
          mBodyTextColor = ColorUtils.setAlphaComponent(-1, i);
          mTitleTextColor = ColorUtils.setAlphaComponent(-1, j);
          mGeneratedTextColors = true;
        }
      }
      else
      {
        return;
      }
      int m = ColorUtils.calculateMinimumAlpha(-16777216, mRgb, 4.5F);
      int k = ColorUtils.calculateMinimumAlpha(-16777216, mRgb, 3.0F);
      if ((m != -1) && (m != -1))
      {
        mBodyTextColor = ColorUtils.setAlphaComponent(-16777216, m);
        mTitleTextColor = ColorUtils.setAlphaComponent(-16777216, k);
        mGeneratedTextColors = true;
        return;
      }
      if (i != -1)
      {
        i = ColorUtils.setAlphaComponent(-1, i);
        mBodyTextColor = i;
        if (j == -1) {
          break label176;
        }
      }
      label176:
      for (int i = ColorUtils.setAlphaComponent(-1, j);; i = ColorUtils.setAlphaComponent(-16777216, k))
      {
        mTitleTextColor = i;
        mGeneratedTextColors = true;
        return;
        i = ColorUtils.setAlphaComponent(-16777216, m);
        break;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      if (this == paramObject) {}
      do
      {
        return true;
        if ((paramObject == null) || (getClass() != paramObject.getClass())) {
          return false;
        }
        paramObject = (Swatch)paramObject;
      } while ((mPopulation == mPopulation) && (mRgb == mRgb));
      return false;
    }
    
    public int getBodyTextColor()
    {
      ensureTextColorsGenerated();
      return mBodyTextColor;
    }
    
    public float[] getHsl()
    {
      if (mHsl == null)
      {
        mHsl = new float[3];
        ColorUtils.RGBToHSL(mRed, mGreen, mBlue, mHsl);
      }
      return mHsl;
    }
    
    public int getPopulation()
    {
      return mPopulation;
    }
    
    public int getRgb()
    {
      return mRgb;
    }
    
    public int getTitleTextColor()
    {
      ensureTextColorsGenerated();
      return mTitleTextColor;
    }
    
    public int hashCode()
    {
      return mRgb * 31 + mPopulation;
    }
    
    public String toString()
    {
      return getClass().getSimpleName() + " [RGB: #" + Integer.toHexString(getRgb()) + ']' + " [HSL: " + Arrays.toString(getHsl()) + ']' + " [Population: " + mPopulation + ']' + " [Title Text: #" + Integer.toHexString(getTitleTextColor()) + ']' + " [Body Text: #" + Integer.toHexString(getBodyTextColor()) + ']';
    }
  }
}
