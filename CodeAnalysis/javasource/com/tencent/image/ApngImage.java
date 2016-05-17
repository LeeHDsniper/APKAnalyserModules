package com.tencent.image;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.SystemClock;
import com.tencent.qphone.base.util.QLog;
import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.io.RandomAccessFile;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.RejectedExecutionException;
import java.util.zip.CRC32;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;

public class ApngImage
  implements Runnable
{
  private static final byte COLOR_GREYALPHA = 4;
  private static final byte COLOR_GREYSCALE = 0;
  private static final byte COLOR_INDEXED = 3;
  private static final byte COLOR_TRUEALPHA = 6;
  private static final byte COLOR_TRUECOLOR = 2;
  public static final int DENSITY_NONE = 0;
  private static final int IDAT = 1229209940;
  private static final int IEND = 1229278788;
  private static final int IHDR = 1229472850;
  protected static final int MaxStackSize = 4096;
  private static final int PENDING_ACTION_CAPACITY = 100;
  private static final int PLTE = 1347179589;
  private static final byte[] SIGNATURE;
  private static final String TAG = "ApngImage";
  private static final int acTL = 1633899596;
  private static final int fcTL = 1717785676;
  private static final int fdAT = 1717846356;
  private static ArgumentsRunnable<WeakReference<ApngImage>> sAccumulativeRunnable;
  private static Handler sHandler;
  protected static boolean sPaused = false;
  protected static final ArrayList<WeakReference<ApngImage>> sPendingActions;
  private static final int tRNS = 1951551059;
  private int bitdepth = 0;
  private byte[] buffer;
  private int bytesPerPixel = 0;
  private boolean cacheFirstFrame;
  private Vector<WeakReference<AnimationCallback>> callbacks = new Vector();
  private int chunkLength;
  private int chunkRemaining;
  private int chunkType;
  private int colorType = 0;
  protected long contentIndex;
  private CRC32 crc;
  private Bitmap curFrame;
  private int cur_blend_op = 0;
  private int cur_ch_height = 0;
  private int cur_ch_width = 0;
  private int cur_delay_den = 0;
  private int cur_delay_num = 0;
  private int cur_dispose_op = 0;
  private int cur_x_offset = 0;
  private int cur_y_offset = 0;
  protected int currentFrameDelay;
  private int delay = 0;
  protected RandomAccessFile file;
  public Bitmap firstFrame;
  private int height = 0;
  private boolean mDecodeNextFrameEnd = true;
  protected boolean mIsInPendingAction = false;
  private int mTaskType;
  private Bitmap nextFrame;
  private int next_blend_op = 0;
  private int next_ch_height = 0;
  private int next_ch_width = 0;
  private int next_delay_den = 0;
  private int next_delay_num = 0;
  private int next_dispose_op = 0;
  private int next_x_offset = 0;
  private int next_y_offset = 0;
  private int numFrames = 0;
  private int numPlays = 0;
  private boolean onlyOneFrame = false;
  private Paint paint = new Paint();
  private Paint paintTransparentBlack = new Paint();
  private byte[] palette;
  private byte[] paletteA;
  private int[] prev_data;
  private byte[] transPixel;
  private int width = 0;
  
  static
  {
    if (!ApngImage.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      SIGNATURE = new byte[] { -119, 80, 78, 71, 13, 10, 26, 10 };
      sPaused = false;
      sPendingActions = new ArrayList(105)
      {
        private void ensureCapacity()
        {
          int i = size();
          if (i > 100) {
            removeRange(0, i - 100 - 1);
          }
        }
        
        public boolean add(WeakReference<ApngImage> paramAnonymousWeakReference)
        {
          boolean bool = super.add(paramAnonymousWeakReference);
          ensureCapacity();
          return bool;
        }
      };
      return;
    }
  }
  
  public ApngImage(File paramFile, boolean paramBoolean)
    throws IOException
  {
    try
    {
      file = new RandomAccessFile(paramFile, "r");
      init(paramBoolean);
      return;
    }
    catch (IOException paramFile)
    {
      if (file == null) {}
    }
    try
    {
      file.close();
      throw paramFile;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public ApngImage(RandomAccessFile paramRandomAccessFile, boolean paramBoolean)
    throws IOException
  {
    try
    {
      file = paramRandomAccessFile;
      init(paramBoolean);
      return;
    }
    catch (IOException paramRandomAccessFile)
    {
      if (file == null) {}
    }
    try
    {
      file.close();
      throw paramRandomAccessFile;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  private int ARGBtoColor(byte paramByte1, byte paramByte2, byte paramByte3, byte paramByte4)
  {
    return paramByte1 << 24 | (paramByte2 & 0xFF) << 16 | (paramByte3 & 0xFF) << 8 | paramByte4 & 0xFF;
  }
  
  private void checkChunkLength(int paramInt)
    throws IOException
  {
    if (chunkLength != paramInt) {
      throw new IOException("Chunk has wrong size");
    }
  }
  
  private static boolean checkSignature(byte[] paramArrayOfByte)
  {
    int i = 0;
    while (i < SIGNATURE.length)
    {
      if (paramArrayOfByte[i] != SIGNATURE[i]) {
        return false;
      }
      i += 1;
    }
    return true;
  }
  
  private void closeChunk()
    throws IOException
  {
    if (chunkRemaining > 0) {
      file.seek(file.getFilePointer() + chunkRemaining + 4L);
    }
    int i;
    do
    {
      chunkRemaining = 0;
      chunkLength = 0;
      chunkType = 0;
      return;
      readFully(buffer, 0, 4);
      i = readInt(buffer, 0);
    } while ((int)crc.getValue() == i);
    throw new IOException("Invalid CRC");
  }
  
  private void expand1(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    int i = 1;
    int j = paramArrayOfByte2.length;
    while (i < j)
    {
      int k = paramArrayOfByte1[((i >> 3) + 1)] & 0xFF;
      switch (j - i)
      {
      default: 
        paramArrayOfByte2[(i + 7)] = ((byte)(k & 0x1));
      case 7: 
        paramArrayOfByte2[(i + 6)] = ((byte)(k >> 1 & 0x1));
      case 6: 
        paramArrayOfByte2[(i + 5)] = ((byte)(k >> 2 & 0x1));
      case 5: 
        paramArrayOfByte2[(i + 4)] = ((byte)(k >> 3 & 0x1));
      case 4: 
        paramArrayOfByte2[(i + 3)] = ((byte)(k >> 4 & 0x1));
      case 3: 
        paramArrayOfByte2[(i + 2)] = ((byte)(k >> 5 & 0x1));
      case 2: 
        paramArrayOfByte2[(i + 1)] = ((byte)(k >> 6 & 0x1));
      }
      paramArrayOfByte2[i] = ((byte)(k >> 7));
      i += 8;
    }
  }
  
  private void expand2(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    int i = 1;
    int j = paramArrayOfByte2.length;
    while (i < j)
    {
      int k = paramArrayOfByte1[((i >> 2) + 1)] & 0xFF;
      switch (j - i)
      {
      default: 
        paramArrayOfByte2[(i + 3)] = ((byte)(k & 0x3));
      case 3: 
        paramArrayOfByte2[(i + 2)] = ((byte)(k >> 2 & 0x3));
      case 2: 
        paramArrayOfByte2[(i + 1)] = ((byte)(k >> 4 & 0x3));
      }
      paramArrayOfByte2[i] = ((byte)(k >> 6));
      i += 4;
    }
  }
  
  private void expand4(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    int i = 1;
    int j = paramArrayOfByte2.length;
    while (i < j)
    {
      int k = paramArrayOfByte1[((i >> 1) + 1)] & 0xFF;
      switch (j - i)
      {
      default: 
        paramArrayOfByte2[(i + 1)] = ((byte)(k & 0xF));
      }
      paramArrayOfByte2[i] = ((byte)(k >> 4));
      i += 2;
    }
  }
  
  private void init(boolean paramBoolean)
    throws IOException
  {
    crc = new CRC32();
    buffer = new byte['က'];
    paint.setAntiAlias(true);
    paintTransparentBlack.setAntiAlias(true);
    paintTransparentBlack.setColor(0);
    readFully(buffer, 0, SIGNATURE.length);
    if (!checkSignature(buffer)) {
      throw new IOException("Not a valid PNG file");
    }
    cacheFirstFrame = paramBoolean;
    getNextFrame();
    applyNextFrame();
    if (paramBoolean) {
      firstFrame = curFrame;
    }
    if (onlyOneFrame)
    {
      firstFrame = curFrame;
      nextFrame = null;
    }
  }
  
  private void invalidateSelf()
  {
    int i = 0;
    if (i < callbacks.size())
    {
      WeakReference localWeakReference = (WeakReference)callbacks.get(i);
      if ((localWeakReference == null) || (localWeakReference.get() == null))
      {
        callbacks.remove(i);
        i -= 1;
      }
      for (;;)
      {
        i += 1;
        break;
        ((AnimationCallback)localWeakReference.get()).invalidateSelf();
      }
    }
  }
  
  /* Error */
  public static boolean needDecodeAnimation(File paramFile)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aconst_null
    //   3: astore_3
    //   4: new 222	java/io/RandomAccessFile
    //   7: dup
    //   8: aload_0
    //   9: ldc -32
    //   11: invokespecial 227	java/io/RandomAccessFile:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   14: astore_0
    //   15: getstatic 138	com/tencent/image/ApngImage:SIGNATURE	[B
    //   18: arraylength
    //   19: newarray byte
    //   21: astore_2
    //   22: aload_0
    //   23: aload_2
    //   24: invokevirtual 344	java/io/RandomAccessFile:read	([B)I
    //   27: pop
    //   28: iconst_0
    //   29: istore_1
    //   30: iload_1
    //   31: getstatic 138	com/tencent/image/ApngImage:SIGNATURE	[B
    //   34: arraylength
    //   35: if_icmpge +35 -> 70
    //   38: aload_2
    //   39: iload_1
    //   40: baload
    //   41: getstatic 138	com/tencent/image/ApngImage:SIGNATURE	[B
    //   44: iload_1
    //   45: baload
    //   46: if_icmpeq +17 -> 63
    //   49: aload_0
    //   50: invokevirtual 236	java/io/RandomAccessFile:close	()V
    //   53: aload_0
    //   54: ifnull +7 -> 61
    //   57: aload_0
    //   58: invokevirtual 236	java/io/RandomAccessFile:close	()V
    //   61: iconst_0
    //   62: ireturn
    //   63: iload_1
    //   64: iconst_1
    //   65: iadd
    //   66: istore_1
    //   67: goto -37 -> 30
    //   70: aload_0
    //   71: invokevirtual 236	java/io/RandomAccessFile:close	()V
    //   74: aload_0
    //   75: ifnull +7 -> 82
    //   78: aload_0
    //   79: invokevirtual 236	java/io/RandomAccessFile:close	()V
    //   82: iconst_1
    //   83: ireturn
    //   84: astore_0
    //   85: aload_3
    //   86: astore_0
    //   87: aload_0
    //   88: ifnull -27 -> 61
    //   91: aload_0
    //   92: invokevirtual 236	java/io/RandomAccessFile:close	()V
    //   95: iconst_0
    //   96: ireturn
    //   97: astore_0
    //   98: iconst_0
    //   99: ireturn
    //   100: astore_0
    //   101: aload_2
    //   102: ifnull +7 -> 109
    //   105: aload_2
    //   106: invokevirtual 236	java/io/RandomAccessFile:close	()V
    //   109: aload_0
    //   110: athrow
    //   111: astore_0
    //   112: goto -51 -> 61
    //   115: astore_0
    //   116: goto -34 -> 82
    //   119: astore_2
    //   120: goto -11 -> 109
    //   123: astore_3
    //   124: aload_0
    //   125: astore_2
    //   126: aload_3
    //   127: astore_0
    //   128: goto -27 -> 101
    //   131: astore_2
    //   132: goto -45 -> 87
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	135	0	paramFile	File
    //   29	38	1	i	int
    //   1	105	2	arrayOfByte	byte[]
    //   119	1	2	localIOException	IOException
    //   125	1	2	localFile	File
    //   131	1	2	localException	Exception
    //   3	83	3	localObject1	Object
    //   123	4	3	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   4	15	84	java/lang/Exception
    //   91	95	97	java/io/IOException
    //   4	15	100	finally
    //   57	61	111	java/io/IOException
    //   78	82	115	java/io/IOException
    //   105	109	119	java/io/IOException
    //   15	28	123	finally
    //   30	53	123	finally
    //   70	74	123	finally
    //   15	28	131	java/lang/Exception
    //   30	53	131	java/lang/Exception
    //   70	74	131	java/lang/Exception
  }
  
  private void openChunk()
    throws IOException
  {
    readFully(buffer, 0, 8);
    chunkLength = readInt(buffer, 0);
    chunkType = readInt(buffer, 4);
    chunkRemaining = chunkLength;
    crc.reset();
    crc.update(buffer, 4, 4);
  }
  
  private void openChunk(int paramInt)
    throws IOException
  {
    openChunk();
    if (chunkType != paramInt) {
      throw new IOException("Expected chunk: " + Integer.toHexString(paramInt));
    }
  }
  
  public static final void pauseAll()
  {
    sPaused = true;
  }
  
  private void reDraw()
  {
    invalidateSelf();
    mIsInPendingAction = false;
  }
  
  private int readChunk(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = paramInt2;
    if (paramInt2 > chunkRemaining) {
      i = chunkRemaining;
    }
    readFully(paramArrayOfByte, paramInt1, i);
    crc.update(paramArrayOfByte, paramInt1, i);
    chunkRemaining -= i;
    return i;
  }
  
  private void readChunkUnzip(Inflater paramInflater, byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
    throws IOException
  {
    int j = paramInt1;
    int i = paramInt2;
    if (!$assertionsDisabled)
    {
      j = paramInt1;
      i = paramInt2;
      if (paramArrayOfByte == buffer) {
        throw new AssertionError();
      }
    }
    label142:
    do
    {
      try
      {
        paramInt1 = paramInflater.inflate(paramArrayOfByte, j, i);
        if (paramInt1 > 0) {
          break label142;
        }
        if (paramInflater.finished()) {
          throw new EOFException();
        }
      }
      catch (DataFormatException paramInflater)
      {
        throw ((IOException)new IOException("inflate error").initCause(paramInflater));
      }
      if (paramInflater.needsInput())
      {
        refillInflater(paramInflater, paramInt3);
        paramInt1 = i;
      }
      else
      {
        throw new IOException("Can't inflate " + i + " bytes");
        j += paramInt1;
        paramInt1 = i - paramInt1;
      }
      i = paramInt1;
    } while (paramInt1 > 0);
  }
  
  private void readFully(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i;
    do
    {
      i = file.read(paramArrayOfByte, paramInt1, paramInt2);
      if ((i < 0) && (i != -1)) {
        throw new EOFException();
      }
      paramInt1 += i;
      i = paramInt2 - i;
      paramInt2 = i;
    } while (i > 0);
  }
  
  private void readIDAT()
    throws IOException
  {
    nextFrame = Bitmap.createBitmap(Bitmap.createBitmap(decodeChunk(1229209940, width, height), width, height, Bitmap.Config.ARGB_8888));
    if (cacheFirstFrame) {
      firstFrame = nextFrame;
    }
  }
  
  private void readIEND()
    throws IOException
  {}
  
  private void readIHDR()
    throws IOException
  {
    checkChunkLength(13);
    readChunk(buffer, 0, 13);
    width = readInt(buffer, 0);
    height = readInt(buffer, 4);
    bitdepth = (buffer[8] & 0xFF);
    colorType = (buffer[9] & 0xFF);
    prev_data = new int[width * height];
    switch (colorType)
    {
    case 1: 
    case 5: 
    default: 
      throw new IOException("unsupported color format: " + colorType);
    case 0: 
      if (bitdepth != 8) {
        throw new IOException("Unsupported bit depth: " + bitdepth);
      }
      bytesPerPixel = 1;
    }
    while (buffer[10] != 0)
    {
      throw new IOException("unsupported compression method");
      if (bitdepth != 8) {
        throw new IOException("Unsupported bit depth: " + bitdepth);
      }
      bytesPerPixel = 2;
      continue;
      if (bitdepth != 8) {
        throw new IOException("Unsupported bit depth: " + bitdepth);
      }
      bytesPerPixel = 3;
      continue;
      if (bitdepth != 8) {
        throw new IOException("Unsupported bit depth: " + bitdepth);
      }
      bytesPerPixel = 4;
      continue;
      switch (bitdepth)
      {
      case 3: 
      case 5: 
      case 6: 
      case 7: 
      default: 
        throw new IOException("Unsupported bit depth: " + bitdepth);
      }
      bytesPerPixel = 1;
    }
    if (buffer[11] != 0) {
      throw new IOException("unsupported filtering method");
    }
    if (buffer[12] != 0) {
      throw new IOException("unsupported interlace method");
    }
  }
  
  private int readInt(byte[] paramArrayOfByte, int paramInt)
  {
    return paramArrayOfByte[paramInt] << 24 | (paramArrayOfByte[(paramInt + 1)] & 0xFF) << 16 | (paramArrayOfByte[(paramInt + 2)] & 0xFF) << 8 | paramArrayOfByte[(paramInt + 3)] & 0xFF;
  }
  
  private void readPLTE()
    throws IOException
  {
    int i = chunkLength / 3;
    if ((i < 1) || (i > 256) || (chunkLength % 3 != 0)) {
      throw new IOException("PLTE chunk has wrong length");
    }
    palette = new byte[i * 3];
    readChunk(palette, 0, palette.length);
  }
  
  private int readShort(byte[] paramArrayOfByte, int paramInt)
  {
    return paramArrayOfByte[paramInt] << 8 | paramArrayOfByte[(paramInt + 1)] & 0xFF;
  }
  
  private void readacTL()
    throws IOException
  {
    contentIndex = file.getFilePointer();
    checkChunkLength(8);
    readChunk(buffer, 0, 8);
    numFrames = readInt(buffer, 0);
    if (numFrames == 1) {
      onlyOneFrame = true;
    }
    numPlays = readInt(buffer, 4);
  }
  
  private void readfcTL()
    throws IOException
  {
    checkChunkLength(26);
    readChunk(buffer, 0, 26);
    next_ch_width = readInt(buffer, 4);
    next_ch_height = readInt(buffer, 8);
    next_x_offset = readInt(buffer, 12);
    next_y_offset = readInt(buffer, 16);
    next_delay_num = readShort(buffer, 20);
    next_delay_den = readShort(buffer, 22);
    next_dispose_op = buffer[24];
    next_blend_op = buffer[25];
    if (next_delay_den == 0)
    {
      delay = 100;
      return;
    }
    delay = (next_delay_num * 1000 / next_delay_den);
  }
  
  private void readfdAT()
    throws IOException
  {
    readChunk(buffer, 0, 4);
    int[] arrayOfInt1 = decodeChunk(1717846356, next_ch_width, next_ch_height);
    Bitmap localBitmap1 = Bitmap.createBitmap(arrayOfInt1, next_ch_width, next_ch_height, Bitmap.Config.ARGB_8888);
    Bitmap localBitmap2 = curFrame.copy(Bitmap.Config.ARGB_8888, true);
    if ((next_dispose_op != 0) && (next_dispose_op != 1) && (next_dispose_op != 2)) {
      throw new IOException("Incorrect frame dispose: " + Integer.toHexString(next_dispose_op));
    }
    localBitmap2.getPixels(prev_data, 0, cur_ch_width, cur_x_offset, cur_y_offset, cur_ch_width, cur_ch_height);
    int[] arrayOfInt2;
    if (next_blend_op == 0) {
      if (next_dispose_op == 0) {
        if (cur_dispose_op == 1)
        {
          arrayOfInt2 = new int[cur_ch_width * cur_ch_height];
          Arrays.fill(arrayOfInt2, 0);
          localBitmap2.setPixels(arrayOfInt2, 0, cur_ch_width, cur_x_offset, cur_y_offset, cur_ch_width, cur_ch_height);
          localBitmap2.setPixels(arrayOfInt1, 0, next_ch_width, next_x_offset, next_y_offset, next_ch_width, next_ch_height);
        }
      }
    }
    for (;;)
    {
      new Canvas(localBitmap2).drawBitmap(localBitmap1, next_x_offset, next_y_offset, paint);
      nextFrame = Bitmap.createBitmap(localBitmap2);
      return;
      if (cur_dispose_op != 2) {
        break;
      }
      localBitmap2.setPixels(prev_data, 0, cur_ch_width, cur_x_offset, cur_y_offset, cur_ch_width, cur_ch_height);
      break;
      if (next_dispose_op == 1)
      {
        arrayOfInt2 = new int[cur_ch_width * cur_ch_height];
        Arrays.fill(arrayOfInt2, 0);
        localBitmap2.setPixels(arrayOfInt2, 0, cur_ch_width, cur_x_offset, cur_y_offset, cur_ch_width, cur_ch_height);
        break;
      }
      if ((next_dispose_op != 2) || (cur_dispose_op != 1)) {
        break;
      }
      arrayOfInt2 = new int[cur_ch_width * cur_ch_height];
      Arrays.fill(arrayOfInt2, 0);
      localBitmap2.setPixels(arrayOfInt2, 0, cur_ch_width, cur_x_offset, cur_y_offset, cur_ch_width, cur_ch_height);
      break;
      if (next_blend_op == 1) {
        if (next_dispose_op == 0)
        {
          new Canvas(localBitmap2).drawBitmap(localBitmap1, next_x_offset, next_y_offset, paint);
        }
        else if (next_dispose_op == 1)
        {
          Arrays.fill(arrayOfInt1, 0);
          localBitmap2.setPixels(arrayOfInt1, 0, next_ch_width, next_x_offset, next_y_offset, next_ch_width, next_ch_height);
          new Canvas(localBitmap2).drawBitmap(localBitmap1, next_x_offset, next_y_offset, paint);
        }
        else if (next_dispose_op == 2)
        {
          new Canvas(localBitmap2).drawBitmap(localBitmap1, next_x_offset, next_y_offset, paint);
        }
      }
    }
  }
  
  private void readtRNS()
    throws IOException
  {
    switch (colorType)
    {
    case 1: 
    default: 
      return;
    case 0: 
      checkChunkLength(2);
      transPixel = new byte[2];
      readChunk(transPixel, 0, 2);
      return;
    case 2: 
      checkChunkLength(6);
      transPixel = new byte[6];
      readChunk(transPixel, 0, 6);
      return;
    }
    if (palette == null) {
      throw new IOException("tRNS chunk without PLTE chunk");
    }
    paletteA = new byte[palette.length / 3];
    Arrays.fill(paletteA, (byte)-1);
    readChunk(paletteA, 0, paletteA.length);
  }
  
  private void refillInflater(Inflater paramInflater, int paramInt)
    throws IOException
  {
    int i = 0;
    while (chunkRemaining == 0)
    {
      closeChunk();
      openChunk(paramInt);
      if (paramInt == 1717846356) {
        i = 4;
      }
    }
    paramInt = readChunk(buffer, 0, buffer.length);
    paramInflater.setInput(buffer, i, paramInt - i);
  }
  
  public static final void resumeAll()
  {
    sPaused = false;
    int i = sPendingActions.size() - 1;
    while (i >= 0)
    {
      ApngImage localApngImage = (ApngImage)((WeakReference)sPendingActions.get(i)).get();
      if (localApngImage != null) {
        localApngImage.reDraw();
      }
      i -= 1;
    }
    sPendingActions.clear();
  }
  
  public static int scaleFromDensity(int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramInt2 == 0) || (paramInt2 == paramInt3)) {
      return paramInt1;
    }
    return (paramInt1 * paramInt3 + (paramInt2 >> 1)) / paramInt2;
  }
  
  private void scheduleSelf(Runnable paramRunnable, long paramLong)
  {
    int i = 0;
    if (i < callbacks.size())
    {
      WeakReference localWeakReference = (WeakReference)callbacks.get(i);
      if ((localWeakReference == null) || (localWeakReference.get() == null))
      {
        callbacks.remove(i);
        i -= 1;
      }
      for (;;)
      {
        i += 1;
        break;
        ((AnimationCallback)localWeakReference.get()).scheduleSelf(paramRunnable, paramLong);
      }
    }
  }
  
  private void unfilter(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
    throws IOException
  {
    switch (paramArrayOfByte1[0])
    {
    default: 
      throw new IOException("invalide filter type in scanline: " + paramArrayOfByte1[0]);
    case 1: 
      unfilterSub(paramArrayOfByte1);
    case 0: 
      return;
    case 2: 
      unfilterUp(paramArrayOfByte1, paramArrayOfByte2);
      return;
    case 3: 
      unfilterAverage(paramArrayOfByte1, paramArrayOfByte2);
      return;
    }
    unfilterPaeth(paramArrayOfByte1, paramArrayOfByte2);
  }
  
  private void unfilterAverage(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    int j = bytesPerPixel;
    int i = 1;
    while (i <= j)
    {
      paramArrayOfByte1[i] = ((byte)(paramArrayOfByte1[i] + (byte)((paramArrayOfByte2[i] & 0xFF) >>> 1)));
      i += 1;
    }
    int k = paramArrayOfByte1.length;
    while (i < k)
    {
      paramArrayOfByte1[i] = ((byte)(paramArrayOfByte1[i] + (byte)((paramArrayOfByte2[i] & 0xFF) + (paramArrayOfByte1[(i - j)] & 0xFF) >>> 1)));
      i += 1;
    }
  }
  
  private void unfilterPaeth(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    int i4 = bytesPerPixel;
    int i = 1;
    while (i <= i4)
    {
      paramArrayOfByte1[i] = ((byte)(paramArrayOfByte1[i] + paramArrayOfByte2[i]));
      i += 1;
    }
    int i5 = paramArrayOfByte1.length;
    int j = i;
    if (j < i5)
    {
      int i1 = paramArrayOfByte1[(j - i4)] & 0xFF;
      int n = paramArrayOfByte2[j] & 0xFF;
      int i2 = paramArrayOfByte2[(j - i4)] & 0xFF;
      int i3 = i1 + n - i2;
      int k = i3 - i1;
      i = k;
      if (k < 0) {
        i = -k;
      }
      int m = i3 - n;
      k = m;
      if (m < 0) {
        k = -m;
      }
      i3 -= i2;
      m = i3;
      if (i3 < 0) {
        m = -i3;
      }
      if ((i <= k) && (i <= m)) {
        i = i1;
      }
      for (;;)
      {
        paramArrayOfByte1[j] = ((byte)(paramArrayOfByte1[j] + (byte)i));
        j += 1;
        break;
        i = i2;
        if (k <= m) {
          i = n;
        }
      }
    }
  }
  
  private void unfilterSub(byte[] paramArrayOfByte)
  {
    int j = bytesPerPixel;
    int i = j + 1;
    int k = paramArrayOfByte.length;
    while (i < k)
    {
      paramArrayOfByte[i] = ((byte)(paramArrayOfByte[i] + paramArrayOfByte[(i - j)]));
      i += 1;
    }
  }
  
  private void unfilterUp(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    int i = 1;
    int j = paramArrayOfByte1.length;
    while (i < j)
    {
      paramArrayOfByte1[i] = ((byte)(paramArrayOfByte1[i] + paramArrayOfByte2[i]));
      i += 1;
    }
  }
  
  public void addCallBack(AnimationCallback paramAnimationCallback)
  {
    if (paramAnimationCallback != null) {
      callbacks.add(new WeakReference(paramAnimationCallback));
    }
  }
  
  public void applyNextFrame()
  {
    try
    {
      curFrame = nextFrame;
      cur_ch_width = next_ch_width;
      cur_ch_height = next_ch_height;
      cur_x_offset = next_x_offset;
      cur_y_offset = next_y_offset;
      cur_delay_num = next_delay_num;
      cur_delay_den = next_delay_den;
      cur_dispose_op = next_dispose_op;
      cur_blend_op = next_blend_op;
      System.out.println("delay:" + delay);
      currentFrameDelay = delay;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int[] decodeChunk(int paramInt1, int paramInt2, int paramInt3)
    throws IOException
  {
    int k = (bitdepth * paramInt2 + 7) / 8 * bytesPerPixel;
    int m = 0;
    Object localObject4 = new byte[k + 1];
    byte[] arrayOfByte = new byte[k + 1];
    Object localObject5;
    label54:
    int[] arrayOfInt;
    Inflater localInflater;
    if (bitdepth < 8)
    {
      localObject5 = new byte[paramInt2 + 1];
      arrayOfInt = new int[paramInt2 * paramInt3];
      localInflater = new Inflater();
      k = 0;
      paramInt2 = m;
      if (k >= paramInt3) {
        break label775;
      }
    }
    label148:
    label161:
    label775:
    label791:
    label818:
    label854:
    label911:
    try
    {
      readChunkUnzip(localInflater, (byte[])localObject4, 0, localObject4.length, paramInt1);
      unfilter((byte[])localObject4, arrayOfByte);
      switch (colorType)
      {
      case 1: 
      case 5: 
        throw new UnsupportedOperationException("Not yet implemented");
      }
    }
    finally
    {
      localInflater.end();
      throw localObject1;
      localObject5 = null;
      break label54;
      int i1;
      int i2;
      byte b2;
      byte b1;
      if (transPixel != null)
      {
        n = transPixel[1];
        i1 = transPixel[3];
        i2 = transPixel[5];
        m = 1;
        int i3 = localObject4.length;
        while (m < i3)
        {
          int i = localObject4[m];
          int j = localObject4[(m + 1)];
          byte b5 = localObject4[(m + 2)];
          b2 = -1;
          b1 = b2;
          if (i == n)
          {
            b1 = b2;
            if (j == i1)
            {
              b1 = b2;
              if (b5 == i2) {
                b1 = 0;
              }
            }
          }
          arrayOfInt[paramInt2] = ARGBtoColor(b1, i, j, b5);
          m += 3;
          paramInt2 += 1;
        }
      }
      m = 1;
      int n = localObject4.length;
      for (;;)
      {
        if (m < n)
        {
          arrayOfInt[paramInt2] = ARGBtoColor(-1, localObject4[m], localObject4[(m + 1)], localObject4[(m + 2)]);
          m += 3;
          paramInt2 += 1;
          continue;
          m = 1;
          n = localObject4.length;
          while (m < n)
          {
            arrayOfInt[paramInt2] = ARGBtoColor(localObject4[(m + 3)], localObject4[m], localObject4[(m + 1)], localObject4[(m + 2)]);
            m += 4;
            paramInt2 += 1;
            continue;
            m = 1;
            n = localObject4.length;
            break label818;
            m = 1;
            n = localObject4.length;
            break label854;
            switch (bitdepth)
            {
            }
          }
        }
      }
      for (;;)
      {
        throw new UnsupportedOperationException("Unsupported bitdepth for this image");
        while (paletteA != null)
        {
          n = 1;
          i1 = localObject4.length;
          for (;;)
          {
            if (n >= i1) {
              break label911;
            }
            i2 = localObject4[n] & 0xFF;
            m = paramInt2;
            byte b3;
            try
            {
              b1 = palette[(i2 * 3 + 0)];
              m = paramInt2;
              b2 = palette[(i2 * 3 + 1)];
              m = paramInt2;
              b3 = palette[(i2 * 3 + 2)];
              m = paramInt2;
              byte b4 = paletteA[i2];
              arrayOfInt[paramInt2] = ARGBtoColor(b4, b1, b2, b3);
              n += 1;
              paramInt2 += 1;
            }
            finally {}
          }
          expand4((byte[])localObject4, (byte[])localObject5);
          continue;
          expand2((byte[])localObject4, (byte[])localObject5);
          continue;
          expand1((byte[])localObject4, (byte[])localObject5);
        }
        n = 1;
        i1 = localObject4.length;
        while (n < i1)
        {
          i2 = localObject4[n] & 0xFF;
          m = paramInt2;
          b1 = palette[(i2 * 3 + 0)];
          m = paramInt2;
          b2 = palette[(i2 * 3 + 1)];
          m = paramInt2;
          b3 = palette[(i2 * 3 + 2)];
          arrayOfInt[paramInt2] = ARGBtoColor(-1, b1, b2, b3);
          n += 1;
          paramInt2 += 1;
        }
        break label791;
        localInflater.end();
        return arrayOfInt;
        break label161;
        break label148;
        for (;;)
        {
          Object localObject6 = localObject2;
          Object localObject3 = localObject4;
          k += 1;
          localObject4 = localObject6;
          break;
          continue;
          continue;
          while (m < n)
          {
            localObject4[m] *= 65793;
            m += 1;
            paramInt2 += 1;
          }
          continue;
          while (m < n)
          {
            arrayOfInt[paramInt2] = (localObject4[m] * 65793 + (localObject4[(m + 1)] << 6));
            m += 2;
            paramInt2 += 1;
          }
        }
      }
      localObject5 = localObject4;
    }
  }
  
  protected void doApplyNextFrame()
  {
    applyNextFrame();
    mDecodeNextFrameEnd = true;
    if (!sPaused) {
      invalidateSelf();
    }
    while (mIsInPendingAction) {
      return;
    }
    sPendingActions.add(new WeakReference(this));
    mIsInPendingAction = true;
  }
  
  public void draw(Canvas paramCanvas, Rect paramRect, Paint paramPaint, boolean paramBoolean)
  {
    if (sHandler == null)
    {
      sHandler = new Handler();
      sAccumulativeRunnable = new DoAccumulativeRunnable(null);
    }
    if ((onlyOneFrame) || ((!paramBoolean) && (firstFrame != null))) {
      paramCanvas.drawBitmap(firstFrame, null, paramRect, paramPaint);
    }
    do
    {
      return;
      if (curFrame != null) {
        paramCanvas.drawBitmap(curFrame, null, paramRect, paramPaint);
      }
      if (!sPaused)
      {
        executeNewTask();
        return;
      }
    } while (mIsInPendingAction);
    sPendingActions.add(new WeakReference(this));
    mIsInPendingAction = true;
  }
  
  public void drawFrame(Canvas paramCanvas) {}
  
  protected void executeNewTask()
  {
    long l1;
    long l2;
    if (mDecodeNextFrameEnd)
    {
      mDecodeNextFrameEnd = false;
      l1 = SystemClock.uptimeMillis();
      l2 = getDelay();
    }
    try
    {
      Utils.executeAsyncTaskOnSerialExcuter(new DecodeNextFrameAsyncTask(l1 + l2), new Void[] { (Void)null });
      return;
    }
    catch (RejectedExecutionException localRejectedExecutionException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("URLDrawable_", 2, "executeNewTask()", localRejectedExecutionException);
    }
  }
  
  public int getByteSize()
  {
    if (onlyOneFrame) {
      return Utils.getBitmapSize(firstFrame);
    }
    int j = width;
    int k = height;
    if (firstFrame != null) {}
    for (int i = Utils.getBitmapSize(firstFrame);; i = 0) {
      return i + (j * k * 4 * 2 + 4096);
    }
  }
  
  public Bitmap getCurrentFrame()
  {
    return curFrame;
  }
  
  public int getDelay()
  {
    System.out.println("currentFrameDelay:" + currentFrameDelay);
    return currentFrameDelay;
  }
  
  public int getHeight()
  {
    return height;
  }
  
  public int getLoopCount()
  {
    return numPlays;
  }
  
  protected boolean getNextFrame()
    throws IOException
  {
    boolean bool = true;
    int i = 0;
    for (;;)
    {
      if (i < 10000) {}
      for (;;)
      {
        try
        {
          openChunk();
          switch (chunkType)
          {
          case 1229472850: 
            if (chunkType == 1229278788) {
              break label242;
            }
            closeChunk();
          }
        }
        finally {}
        readIHDR();
        continue;
        readIDAT();
        closeChunk();
        for (;;)
        {
          return bool;
          readPLTE();
          break;
          readtRNS();
          break;
          readacTL();
          contentIndex = file.getFilePointer();
          break;
          readfcTL();
          break;
          readfdAT();
          closeChunk();
          continue;
          readIEND();
          file.seek(contentIndex + 4L);
          break;
          if ((colorType == 3) && (palette == null)) {
            throw new IOException("Missing PLTE chunk");
          }
          bool = false;
        }
      }
      label242:
      i += 1;
    }
  }
  
  public int getScaledHeight(int paramInt)
  {
    return scaleFromDensity(height, 160, paramInt);
  }
  
  public int getScaledWidth(int paramInt)
  {
    return scaleFromDensity(width, 160, paramInt);
  }
  
  public int getWidth()
  {
    return width;
  }
  
  public boolean hasAlpha()
  {
    return (hasAlphaChannel()) || (paletteA != null) || (transPixel != null);
  }
  
  public boolean hasAlphaChannel()
  {
    return (colorType == 6) || (colorType == 4);
  }
  
  protected void initHandlerAndRunnable()
  {
    if (sHandler == null)
    {
      sHandler = new Handler();
      sAccumulativeRunnable = new DoAccumulativeRunnable(null);
    }
  }
  
  public boolean isRGB()
  {
    return (colorType == 6) || (colorType == 2) || (colorType == 3);
  }
  
  void onDecodeNextFrameCanceled()
  {
    if (QLog.isColorLevel()) {
      QLog.e("URLDrawable_", 2, "apng decode canceled. " + file);
    }
    mDecodeNextFrameEnd = true;
  }
  
  void onDecodeNextFrameFailed(Throwable paramThrowable)
  {
    if (QLog.isColorLevel()) {
      QLog.e("URLDrawable_", 2, "apng decode error. " + file, paramThrowable);
    }
    mDecodeNextFrameEnd = true;
  }
  
  void onDecodeNextFrameSuccessed(boolean paramBoolean, long paramLong)
  {
    if (paramBoolean)
    {
      long l = SystemClock.uptimeMillis();
      if (l < paramLong) {
        sHandler.postDelayed(this, paramLong - l);
      }
    }
    else
    {
      return;
    }
    sHandler.post(this);
  }
  
  public void overwriteTRNS(byte paramByte1, byte paramByte2, byte paramByte3)
  {
    if (hasAlphaChannel()) {
      throw new UnsupportedOperationException("image has an alpha channel");
    }
    byte[] arrayOfByte = palette;
    if (arrayOfByte == null) {
      transPixel = new byte[] { 0, paramByte1, 0, paramByte2, 0, paramByte3 };
    }
    for (;;)
    {
      return;
      paletteA = new byte[arrayOfByte.length / 3];
      int j = 0;
      int i = 0;
      while (j < arrayOfByte.length)
      {
        if ((arrayOfByte[j] != paramByte1) || (arrayOfByte[(j + 1)] != paramByte2) || (arrayOfByte[(j + 2)] != paramByte3)) {
          paletteA[i] = -1;
        }
        j += 3;
        i += 1;
      }
    }
  }
  
  public void removeCallBack(AnimationCallback paramAnimationCallback)
  {
    int i = 0;
    if (i < callbacks.size())
    {
      WeakReference localWeakReference = (WeakReference)callbacks.get(i);
      int j;
      if ((localWeakReference == null) || (localWeakReference.get() == null))
      {
        callbacks.remove(i);
        j = i - 1;
      }
      do
      {
        i = j + 1;
        break;
        j = i;
      } while (localWeakReference.get() != paramAnimationCallback);
      callbacks.remove(i);
    }
  }
  
  public void run()
  {
    sAccumulativeRunnable.add(new WeakReference[] { new WeakReference(this) });
  }
  
  class DecodeNextFrameAsyncTask
    extends AsyncTask<Void, Void, Object>
  {
    long nextFrameDrawingTime;
    
    public DecodeNextFrameAsyncTask(long paramLong)
    {
      nextFrameDrawingTime = paramLong;
    }
    
    protected Object doInBackground(Void... paramVarArgs)
    {
      try
      {
        boolean bool = getNextFrame();
        onDecodeNextFrameSuccessed(bool, nextFrameDrawingTime);
        return null;
      }
      catch (Throwable paramVarArgs) {}
      return paramVarArgs;
    }
    
    protected void onCancelled()
    {
      onDecodeNextFrameCanceled();
    }
    
    protected void onPostExecute(Object paramObject)
    {
      if ((paramObject instanceof Throwable)) {
        onDecodeNextFrameFailed((Throwable)paramObject);
      }
    }
  }
  
  private class DoAccumulativeRunnable
    extends ArgumentsRunnable<WeakReference<ApngImage>>
  {
    private long lastRefreshTime = 0L;
    
    private DoAccumulativeRunnable() {}
    
    protected void run(List<WeakReference<ApngImage>> paramList)
    {
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        Object localObject = (WeakReference)paramList.next();
        if (localObject != null)
        {
          localObject = (ApngImage)((WeakReference)localObject).get();
          if (localObject != null) {
            ((ApngImage)localObject).doApplyNextFrame();
          }
        }
      }
      lastRefreshTime = SystemClock.uptimeMillis();
    }
    
    protected void submit()
    {
      long l = SystemClock.uptimeMillis();
      if ((lastRefreshTime == 0L) || (l - lastRefreshTime > 100L))
      {
        run();
        lastRefreshTime = l;
        return;
      }
      ApngImage.sHandler.postDelayed(this, 100L - (l - lastRefreshTime));
    }
  }
}
