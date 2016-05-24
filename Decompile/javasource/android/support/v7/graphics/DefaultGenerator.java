package android.support.v7.graphics;

import android.support.v4.graphics.ColorUtils;
import java.util.Iterator;
import java.util.List;

class DefaultGenerator
  extends Palette.Generator
{
  private Palette.Swatch mDarkMutedSwatch;
  private Palette.Swatch mDarkVibrantSwatch;
  private int mHighestPopulation;
  private Palette.Swatch mLightMutedSwatch;
  private Palette.Swatch mLightVibrantSwatch;
  private Palette.Swatch mMutedSwatch;
  private List<Palette.Swatch> mSwatches;
  private Palette.Swatch mVibrantSwatch;
  
  DefaultGenerator() {}
  
  private static float[] copyHslValues(Palette.Swatch paramSwatch)
  {
    float[] arrayOfFloat = new float[3];
    System.arraycopy(paramSwatch.getHsl(), 0, arrayOfFloat, 0, 3);
    return arrayOfFloat;
  }
  
  private static float createComparisonValue(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, int paramInt1, int paramInt2, float paramFloat7)
  {
    return weightedMean(new float[] { invertDiff(paramFloat1, paramFloat2), paramFloat3, invertDiff(paramFloat4, paramFloat5), paramFloat6, paramInt1 / paramInt2, paramFloat7 });
  }
  
  private static float createComparisonValue(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt1, int paramInt2)
  {
    return createComparisonValue(paramFloat1, paramFloat2, 3.0F, paramFloat3, paramFloat4, 6.0F, paramInt1, paramInt2, 1.0F);
  }
  
  private Palette.Swatch findColorVariation(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    Object localObject = null;
    float f1 = 0.0F;
    Iterator localIterator = mSwatches.iterator();
    while (localIterator.hasNext())
    {
      Palette.Swatch localSwatch = (Palette.Swatch)localIterator.next();
      float f2 = localSwatch.getHsl()[1];
      float f3 = localSwatch.getHsl()[2];
      if ((f2 >= paramFloat5) && (f2 <= paramFloat6) && (f3 >= paramFloat2) && (f3 <= paramFloat3) && (!isAlreadySelected(localSwatch)))
      {
        f2 = createComparisonValue(f2, paramFloat4, f3, paramFloat1, localSwatch.getPopulation(), mHighestPopulation);
        if ((localObject == null) || (f2 > f1))
        {
          localObject = localSwatch;
          f1 = f2;
        }
      }
    }
    return localObject;
  }
  
  private int findMaxPopulation()
  {
    int i = 0;
    Iterator localIterator = mSwatches.iterator();
    while (localIterator.hasNext()) {
      i = Math.max(i, ((Palette.Swatch)localIterator.next()).getPopulation());
    }
    return i;
  }
  
  private void generateEmptySwatches()
  {
    float[] arrayOfFloat;
    if ((mVibrantSwatch == null) && (mDarkVibrantSwatch != null))
    {
      arrayOfFloat = copyHslValues(mDarkVibrantSwatch);
      arrayOfFloat[2] = 0.5F;
      mVibrantSwatch = new Palette.Swatch(ColorUtils.HSLToColor(arrayOfFloat), 0);
    }
    if ((mDarkVibrantSwatch == null) && (mVibrantSwatch != null))
    {
      arrayOfFloat = copyHslValues(mVibrantSwatch);
      arrayOfFloat[2] = 0.26F;
      mDarkVibrantSwatch = new Palette.Swatch(ColorUtils.HSLToColor(arrayOfFloat), 0);
    }
  }
  
  private void generateVariationColors()
  {
    mVibrantSwatch = findColorVariation(0.5F, 0.3F, 0.7F, 1.0F, 0.35F, 1.0F);
    mLightVibrantSwatch = findColorVariation(0.74F, 0.55F, 1.0F, 1.0F, 0.35F, 1.0F);
    mDarkVibrantSwatch = findColorVariation(0.26F, 0.0F, 0.45F, 1.0F, 0.35F, 1.0F);
    mMutedSwatch = findColorVariation(0.5F, 0.3F, 0.7F, 0.3F, 0.0F, 0.4F);
    mLightMutedSwatch = findColorVariation(0.74F, 0.55F, 1.0F, 0.3F, 0.0F, 0.4F);
    mDarkMutedSwatch = findColorVariation(0.26F, 0.0F, 0.45F, 0.3F, 0.0F, 0.4F);
  }
  
  private static float invertDiff(float paramFloat1, float paramFloat2)
  {
    return 1.0F - Math.abs(paramFloat1 - paramFloat2);
  }
  
  private boolean isAlreadySelected(Palette.Swatch paramSwatch)
  {
    return (mVibrantSwatch == paramSwatch) || (mDarkVibrantSwatch == paramSwatch) || (mLightVibrantSwatch == paramSwatch) || (mMutedSwatch == paramSwatch) || (mDarkMutedSwatch == paramSwatch) || (mLightMutedSwatch == paramSwatch);
  }
  
  private static float weightedMean(float... paramVarArgs)
  {
    float f2 = 0.0F;
    float f1 = 0.0F;
    int i = 0;
    while (i < paramVarArgs.length)
    {
      float f4 = paramVarArgs[i];
      float f3 = paramVarArgs[(i + 1)];
      f2 += f4 * f3;
      f1 += f3;
      i += 2;
    }
    return f2 / f1;
  }
  
  public void generate(List<Palette.Swatch> paramList)
  {
    mSwatches = paramList;
    mHighestPopulation = findMaxPopulation();
    generateVariationColors();
    generateEmptySwatches();
  }
  
  public Palette.Swatch getVibrantSwatch()
  {
    return mVibrantSwatch;
  }
}
