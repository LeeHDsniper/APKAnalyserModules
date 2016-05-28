package android.support.v7.graphics;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.support.v4.graphics.ColorUtils;
import android.util.TimingLogger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.PriorityQueue;

final class ColorCutQuantizer
{
  private static final Comparator<Vbox> VBOX_COMPARATOR_VOLUME = new Comparator()
  {
    public int compare(ColorCutQuantizer.Vbox paramAnonymousVbox1, ColorCutQuantizer.Vbox paramAnonymousVbox2)
    {
      return paramAnonymousVbox2.getVolume() - paramAnonymousVbox1.getVolume();
    }
  };
  final int[] mColors;
  final int[] mHistogram;
  final List<Palette.Swatch> mQuantizedColors;
  private final float[] mTempHsl = new float[3];
  final TimingLogger mTimingLogger = null;
  
  private ColorCutQuantizer(int[] paramArrayOfInt, int paramInt)
  {
    int[] arrayOfInt = new int[32768];
    mHistogram = arrayOfInt;
    int i = 0;
    while (i < paramArrayOfInt.length)
    {
      j = quantizeFromRgb888(paramArrayOfInt[i]);
      paramArrayOfInt[i] = j;
      arrayOfInt[j] += 1;
      i += 1;
    }
    i = 0;
    int j = 0;
    while (j < arrayOfInt.length)
    {
      if ((arrayOfInt[j] > 0) && (shouldIgnoreColor(j))) {
        arrayOfInt[j] = 0;
      }
      k = i;
      if (arrayOfInt[j] > 0) {
        k = i + 1;
      }
      j += 1;
      i = k;
    }
    paramArrayOfInt = new int[i];
    mColors = paramArrayOfInt;
    int k = 0;
    j = 0;
    while (j < arrayOfInt.length)
    {
      int m = k;
      if (arrayOfInt[j] > 0)
      {
        paramArrayOfInt[k] = j;
        m = k + 1;
      }
      j += 1;
      k = m;
    }
    if (i <= paramInt)
    {
      mQuantizedColors = new ArrayList();
      i = paramArrayOfInt.length;
      paramInt = 0;
      while (paramInt < i)
      {
        j = paramArrayOfInt[paramInt];
        mQuantizedColors.add(new Palette.Swatch(approximateToRgb888(j), arrayOfInt[j]));
        paramInt += 1;
      }
    }
    mQuantizedColors = quantizePixels(paramInt);
  }
  
  private static int approximateToRgb888(int paramInt)
  {
    return approximateToRgb888(quantizedRed(paramInt), quantizedGreen(paramInt), quantizedBlue(paramInt));
  }
  
  private static int approximateToRgb888(int paramInt1, int paramInt2, int paramInt3)
  {
    return Color.rgb(modifyWordWidth(paramInt1, 5, 8), modifyWordWidth(paramInt2, 5, 8), modifyWordWidth(paramInt3, 5, 8));
  }
  
  static ColorCutQuantizer fromBitmap(Bitmap paramBitmap, int paramInt)
  {
    int i = paramBitmap.getWidth();
    int j = paramBitmap.getHeight();
    int[] arrayOfInt = new int[i * j];
    paramBitmap.getPixels(arrayOfInt, 0, i, 0, 0, i, j);
    return new ColorCutQuantizer(arrayOfInt, paramInt);
  }
  
  private List<Palette.Swatch> generateAverageColors(Collection<Vbox> paramCollection)
  {
    ArrayList localArrayList = new ArrayList(paramCollection.size());
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext())
    {
      Palette.Swatch localSwatch = ((Vbox)paramCollection.next()).getAverageColor();
      if (!shouldIgnoreColor(localSwatch)) {
        localArrayList.add(localSwatch);
      }
    }
    return localArrayList;
  }
  
  private static boolean isBlack(float[] paramArrayOfFloat)
  {
    return paramArrayOfFloat[2] <= 0.05F;
  }
  
  private static boolean isNearRedILine(float[] paramArrayOfFloat)
  {
    return (paramArrayOfFloat[0] >= 10.0F) && (paramArrayOfFloat[0] <= 37.0F) && (paramArrayOfFloat[1] <= 0.82F);
  }
  
  private static boolean isWhite(float[] paramArrayOfFloat)
  {
    return paramArrayOfFloat[2] >= 0.95F;
  }
  
  private static void modifySignificantOctet(int[] paramArrayOfInt, int paramInt1, int paramInt2, int paramInt3)
  {
    switch (paramInt1)
    {
    }
    for (;;)
    {
      return;
      paramInt1 = paramInt2;
      while (paramInt1 <= paramInt3)
      {
        paramInt2 = paramArrayOfInt[paramInt1];
        paramArrayOfInt[paramInt1] = (quantizedGreen(paramInt2) << 10 | quantizedRed(paramInt2) << 5 | quantizedBlue(paramInt2));
        paramInt1 += 1;
      }
      continue;
      paramInt1 = paramInt2;
      while (paramInt1 <= paramInt3)
      {
        paramInt2 = paramArrayOfInt[paramInt1];
        paramArrayOfInt[paramInt1] = (quantizedBlue(paramInt2) << 10 | quantizedGreen(paramInt2) << 5 | quantizedRed(paramInt2));
        paramInt1 += 1;
      }
    }
  }
  
  private static int modifyWordWidth(int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt3 > paramInt2) {
      paramInt1 = ((1 << paramInt3) - 1) * paramInt1 / ((1 << paramInt2) - 1);
    }
    for (;;)
    {
      return (1 << paramInt3) - 1 & paramInt1;
      paramInt1 >>= paramInt2 - paramInt3;
    }
  }
  
  private static int quantizeFromRgb888(int paramInt)
  {
    return modifyWordWidth(Color.red(paramInt), 8, 5) << 10 | modifyWordWidth(Color.green(paramInt), 8, 5) << 5 | modifyWordWidth(Color.blue(paramInt), 8, 5);
  }
  
  private List<Palette.Swatch> quantizePixels(int paramInt)
  {
    PriorityQueue localPriorityQueue = new PriorityQueue(paramInt, VBOX_COMPARATOR_VOLUME);
    localPriorityQueue.offer(new Vbox(0, mColors.length - 1));
    splitBoxes(localPriorityQueue, paramInt);
    return generateAverageColors(localPriorityQueue);
  }
  
  private static int quantizedBlue(int paramInt)
  {
    return paramInt & 0x1F;
  }
  
  private static int quantizedGreen(int paramInt)
  {
    return paramInt >> 5 & 0x1F;
  }
  
  private static int quantizedRed(int paramInt)
  {
    return paramInt >> 10 & 0x1F;
  }
  
  private boolean shouldIgnoreColor(int paramInt)
  {
    ColorUtils.colorToHSL(approximateToRgb888(paramInt), mTempHsl);
    return shouldIgnoreColor(mTempHsl);
  }
  
  private static boolean shouldIgnoreColor(Palette.Swatch paramSwatch)
  {
    return shouldIgnoreColor(paramSwatch.getHsl());
  }
  
  private static boolean shouldIgnoreColor(float[] paramArrayOfFloat)
  {
    return (isWhite(paramArrayOfFloat)) || (isBlack(paramArrayOfFloat)) || (isNearRedILine(paramArrayOfFloat));
  }
  
  private void splitBoxes(PriorityQueue<Vbox> paramPriorityQueue, int paramInt)
  {
    while (paramPriorityQueue.size() < paramInt)
    {
      Vbox localVbox = (Vbox)paramPriorityQueue.poll();
      if ((localVbox == null) || (!localVbox.canSplit())) {
        break;
      }
      paramPriorityQueue.offer(localVbox.splitBox());
      paramPriorityQueue.offer(localVbox);
    }
  }
  
  List<Palette.Swatch> getQuantizedColors()
  {
    return mQuantizedColors;
  }
  
  private class Vbox
  {
    private int mLowerIndex;
    private int mMaxBlue;
    private int mMaxGreen;
    private int mMaxRed;
    private int mMinBlue;
    private int mMinGreen;
    private int mMinRed;
    private int mPopulation;
    private int mUpperIndex;
    
    Vbox(int paramInt1, int paramInt2)
    {
      mLowerIndex = paramInt1;
      mUpperIndex = paramInt2;
      fitBox();
    }
    
    final boolean canSplit()
    {
      return getColorCount() > 1;
    }
    
    final int findSplitPoint()
    {
      int i = getLongestColorDimension();
      int[] arrayOfInt1 = mColors;
      int[] arrayOfInt2 = mHistogram;
      ColorCutQuantizer.modifySignificantOctet(arrayOfInt1, i, mLowerIndex, mUpperIndex);
      Arrays.sort(arrayOfInt1, mLowerIndex, mUpperIndex + 1);
      ColorCutQuantizer.modifySignificantOctet(arrayOfInt1, i, mLowerIndex, mUpperIndex);
      int k = mPopulation / 2;
      i = mLowerIndex;
      int j = 0;
      while (i <= mUpperIndex)
      {
        j += arrayOfInt2[arrayOfInt1[i]];
        if (j >= k) {
          return i;
        }
        i += 1;
      }
      return mLowerIndex;
    }
    
    final void fitBox()
    {
      int[] arrayOfInt1 = mColors;
      int[] arrayOfInt2 = mHistogram;
      int i = Integer.MAX_VALUE;
      int k = Integer.MAX_VALUE;
      int i2 = Integer.MAX_VALUE;
      int m = Integer.MIN_VALUE;
      int i1 = Integer.MIN_VALUE;
      int i5 = Integer.MIN_VALUE;
      int i4 = 0;
      int j = mLowerIndex;
      while (j <= mUpperIndex)
      {
        int n = arrayOfInt1[j];
        int i8 = i4 + arrayOfInt2[n];
        int i7 = ColorCutQuantizer.quantizedRed(n);
        int i6 = ColorCutQuantizer.quantizedGreen(n);
        i4 = ColorCutQuantizer.quantizedBlue(n);
        n = i5;
        if (i7 > i5) {
          n = i7;
        }
        int i3 = i2;
        if (i7 < i2) {
          i3 = i7;
        }
        i2 = i1;
        if (i6 > i1) {
          i2 = i6;
        }
        i7 = k;
        if (i6 < k) {
          i7 = i6;
        }
        i1 = m;
        if (i4 > m) {
          i1 = i4;
        }
        k = i;
        if (i4 < i) {
          k = i4;
        }
        j += 1;
        i4 = i8;
        m = i1;
        i1 = i2;
        i5 = n;
        i = k;
        k = i7;
        i2 = i3;
      }
      mMinRed = i2;
      mMaxRed = i5;
      mMinGreen = k;
      mMaxGreen = i1;
      mMinBlue = i;
      mMaxBlue = m;
      mPopulation = i4;
    }
    
    final Palette.Swatch getAverageColor()
    {
      int[] arrayOfInt1 = mColors;
      int[] arrayOfInt2 = mHistogram;
      int m = 0;
      int k = 0;
      int j = 0;
      int n = 0;
      int i = mLowerIndex;
      while (i <= mUpperIndex)
      {
        int i1 = arrayOfInt1[i];
        int i2 = arrayOfInt2[i1];
        n += i2;
        m += ColorCutQuantizer.quantizedRed(i1) * i2;
        k += ColorCutQuantizer.quantizedGreen(i1) * i2;
        j += ColorCutQuantizer.quantizedBlue(i1) * i2;
        i += 1;
      }
      return new Palette.Swatch(ColorCutQuantizer.approximateToRgb888(Math.round(m / n), Math.round(k / n), Math.round(j / n)), n);
    }
    
    final int getColorCount()
    {
      return mUpperIndex + 1 - mLowerIndex;
    }
    
    final int getLongestColorDimension()
    {
      int i = mMaxRed - mMinRed;
      int j = mMaxGreen - mMinGreen;
      int k = mMaxBlue - mMinBlue;
      if ((i >= j) && (i >= k)) {
        return -3;
      }
      if ((j >= i) && (j >= k)) {
        return -2;
      }
      return -1;
    }
    
    final int getVolume()
    {
      return (mMaxRed - mMinRed + 1) * (mMaxGreen - mMinGreen + 1) * (mMaxBlue - mMinBlue + 1);
    }
    
    final Vbox splitBox()
    {
      if (!canSplit()) {
        throw new IllegalStateException("Can not split a box with only 1 color");
      }
      int i = findSplitPoint();
      Vbox localVbox = new Vbox(ColorCutQuantizer.this, i + 1, mUpperIndex);
      mUpperIndex = i;
      fitBox();
      return localVbox;
    }
  }
}
