package com.facebook.internal;

import android.content.Context;
import com.facebook.LoggingBehavior;
import com.facebook.Settings;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.PriorityQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicLong;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public final class FileLruCache
{
  static final String TAG = FileLruCache.class.getSimpleName();
  private static final AtomicLong bufferIndex = new AtomicLong();
  private final File directory;
  private boolean isTrimInProgress;
  private boolean isTrimPending;
  private AtomicLong lastClearCacheTime = new AtomicLong(0L);
  private final Limits limits;
  private final Object lock;
  private final String tag;
  
  public FileLruCache(Context paramContext, String paramString, Limits paramLimits)
  {
    tag = paramString;
    limits = paramLimits;
    directory = new File(paramContext.getCacheDir(), paramString);
    lock = new Object();
    if ((directory.mkdirs()) || (directory.isDirectory())) {
      BufferFile.deleteAll(directory);
    }
  }
  
  private void postTrim()
  {
    synchronized (lock)
    {
      if (!isTrimPending)
      {
        isTrimPending = true;
        Settings.getExecutor().execute(new Runnable()
        {
          public void run()
          {
            FileLruCache.this.trim();
          }
        });
      }
      return;
    }
  }
  
  private void renameToTargetAndTrim(String paramString, File paramFile)
  {
    if (!paramFile.renameTo(new File(directory, Utility.md5hash(paramString)))) {
      paramFile.delete();
    }
    postTrim();
  }
  
  private void trim()
  {
    synchronized (lock)
    {
      isTrimPending = false;
      isTrimInProgress = true;
      try
      {
        Logger.log(LoggingBehavior.CACHE, TAG, "trim started");
        ??? = new PriorityQueue();
        long l3 = 0L;
        long l4 = 0L;
        File[] arrayOfFile = directory.listFiles(BufferFile.excludeBufferFiles());
        l1 = l4;
        l2 = l3;
        if (arrayOfFile != null)
        {
          j = arrayOfFile.length;
          i = 0;
          l1 = l4;
          l2 = l3;
        }
      }
      finally
      {
        int j;
        int i;
        synchronized (lock)
        {
          for (;;)
          {
            long l1;
            long l2;
            isTrimInProgress = false;
            lock.notifyAll();
            return;
            localObject2 = finally;
            throw localObject2;
            File localFile2 = localObject2[i];
            ModifiedFile localModifiedFile = new ModifiedFile(localFile2);
            ((PriorityQueue)???).add(localModifiedFile);
            Logger.log(LoggingBehavior.CACHE, TAG, "  trim considering time=" + Long.valueOf(localModifiedFile.getModified()) + " name=" + localModifiedFile.getFile().getName());
            l2 += localFile2.length();
            l1 += 1L;
            i += 1;
            break;
            File localFile1 = ((ModifiedFile)((PriorityQueue)???).remove()).getFile();
            Logger.log(LoggingBehavior.CACHE, TAG, "  trim removing " + localFile1.getName());
            l2 -= localFile1.length();
            l1 -= 1L;
            localFile1.delete();
          }
          localObject3 = finally;
        }
        synchronized (lock)
        {
          isTrimInProgress = false;
          lock.notifyAll();
          throw localObject3;
        }
      }
      if (l2 <= limits.getByteCount())
      {
        i = limits.getFileCount();
        if (l1 > i) {}
      }
    }
  }
  
  public void clearCache()
  {
    final File[] arrayOfFile = directory.listFiles(BufferFile.excludeBufferFiles());
    lastClearCacheTime.set(System.currentTimeMillis());
    if (arrayOfFile != null) {
      Settings.getExecutor().execute(new Runnable()
      {
        public void run()
        {
          File[] arrayOfFile = arrayOfFile;
          int j = arrayOfFile.length;
          int i = 0;
          for (;;)
          {
            if (i >= j) {
              return;
            }
            arrayOfFile[i].delete();
            i += 1;
          }
        }
      });
    }
  }
  
  public InputStream get(String paramString)
    throws IOException
  {
    return get(paramString, null);
  }
  
  /* Error */
  public InputStream get(String paramString1, String paramString2)
    throws IOException
  {
    // Byte code:
    //   0: new 81	java/io/File
    //   3: dup
    //   4: aload_0
    //   5: getfield 92	com/facebook/internal/FileLruCache:directory	Ljava/io/File;
    //   8: aload_1
    //   9: invokestatic 143	com/facebook/internal/Utility:md5hash	(Ljava/lang/String;)Ljava/lang/String;
    //   12: invokespecial 90	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   15: astore 6
    //   17: new 261	java/io/FileInputStream
    //   20: dup
    //   21: aload 6
    //   23: invokespecial 262	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   26: astore 7
    //   28: new 264	java/io/BufferedInputStream
    //   31: dup
    //   32: aload 7
    //   34: sipush 8192
    //   37: invokespecial 267	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;I)V
    //   40: astore 7
    //   42: aload 7
    //   44: invokestatic 271	com/facebook/internal/FileLruCache$StreamHeader:readHeader	(Ljava/io/InputStream;)Lorg/json/JSONObject;
    //   47: astore 8
    //   49: aload 8
    //   51: ifnonnull +17 -> 68
    //   54: iconst_0
    //   55: ifne +8 -> 63
    //   58: aload 7
    //   60: invokevirtual 274	java/io/BufferedInputStream:close	()V
    //   63: aconst_null
    //   64: areturn
    //   65: astore_1
    //   66: aconst_null
    //   67: areturn
    //   68: aload 8
    //   70: ldc_w 276
    //   73: invokevirtual 281	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   76: astore 9
    //   78: aload 9
    //   80: ifnull +14 -> 94
    //   83: aload 9
    //   85: aload_1
    //   86: invokevirtual 286	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   89: istore_3
    //   90: iload_3
    //   91: ifne +14 -> 105
    //   94: iconst_0
    //   95: ifne +8 -> 103
    //   98: aload 7
    //   100: invokevirtual 274	java/io/BufferedInputStream:close	()V
    //   103: aconst_null
    //   104: areturn
    //   105: aload 8
    //   107: ldc_w 287
    //   110: aconst_null
    //   111: invokevirtual 290	org/json/JSONObject:optString	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   114: astore_1
    //   115: aload_2
    //   116: ifnonnull +7 -> 123
    //   119: aload_1
    //   120: ifnonnull +17 -> 137
    //   123: aload_2
    //   124: ifnull +24 -> 148
    //   127: aload_2
    //   128: aload_1
    //   129: invokevirtual 286	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   132: istore_3
    //   133: iload_3
    //   134: ifne +14 -> 148
    //   137: iconst_0
    //   138: ifne +8 -> 146
    //   141: aload 7
    //   143: invokevirtual 274	java/io/BufferedInputStream:close	()V
    //   146: aconst_null
    //   147: areturn
    //   148: new 292	java/util/Date
    //   151: dup
    //   152: invokespecial 293	java/util/Date:<init>	()V
    //   155: invokevirtual 296	java/util/Date:getTime	()J
    //   158: lstore 4
    //   160: getstatic 160	com/facebook/LoggingBehavior:CACHE	Lcom/facebook/LoggingBehavior;
    //   163: getstatic 60	com/facebook/internal/FileLruCache:TAG	Ljava/lang/String;
    //   166: new 197	java/lang/StringBuilder
    //   169: dup
    //   170: ldc_w 298
    //   173: invokespecial 202	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   176: lload 4
    //   178: invokestatic 212	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   181: invokevirtual 216	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   184: ldc_w 300
    //   187: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   190: aload 6
    //   192: invokevirtual 227	java/io/File:getName	()Ljava/lang/String;
    //   195: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   198: invokevirtual 230	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   201: invokestatic 168	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V
    //   204: aload 6
    //   206: lload 4
    //   208: invokevirtual 304	java/io/File:setLastModified	(J)Z
    //   211: pop
    //   212: iconst_1
    //   213: ifne +8 -> 221
    //   216: aload 7
    //   218: invokevirtual 274	java/io/BufferedInputStream:close	()V
    //   221: aload 7
    //   223: areturn
    //   224: astore_1
    //   225: iconst_0
    //   226: ifne +8 -> 234
    //   229: aload 7
    //   231: invokevirtual 274	java/io/BufferedInputStream:close	()V
    //   234: aload_1
    //   235: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	236	0	this	FileLruCache
    //   0	236	1	paramString1	String
    //   0	236	2	paramString2	String
    //   89	45	3	bool	boolean
    //   158	49	4	l	long
    //   15	190	6	localFile	File
    //   26	204	7	localObject	Object
    //   47	59	8	localJSONObject	JSONObject
    //   76	8	9	str	String
    // Exception table:
    //   from	to	target	type
    //   17	28	65	java/io/IOException
    //   42	49	224	finally
    //   68	78	224	finally
    //   83	90	224	finally
    //   105	115	224	finally
    //   127	133	224	finally
    //   148	212	224	finally
  }
  
  public InputStream interceptAndPut(String paramString, InputStream paramInputStream)
    throws IOException
  {
    return new CopyingInputStream(paramInputStream, openPutStream(paramString));
  }
  
  OutputStream openPutStream(String paramString)
    throws IOException
  {
    return openPutStream(paramString, null);
  }
  
  /* Error */
  public OutputStream openPutStream(final String paramString1, String paramString2)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 92	com/facebook/internal/FileLruCache:directory	Ljava/io/File;
    //   4: invokestatic 324	com/facebook/internal/FileLruCache$BufferFile:newFile	(Ljava/io/File;)Ljava/io/File;
    //   7: astore_3
    //   8: aload_3
    //   9: invokevirtual 150	java/io/File:delete	()Z
    //   12: pop
    //   13: aload_3
    //   14: invokevirtual 327	java/io/File:createNewFile	()Z
    //   17: ifne +31 -> 48
    //   20: new 255	java/io/IOException
    //   23: dup
    //   24: new 197	java/lang/StringBuilder
    //   27: dup
    //   28: ldc_w 329
    //   31: invokespecial 202	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   34: aload_3
    //   35: invokevirtual 332	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   38: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   41: invokevirtual 230	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   44: invokespecial 333	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   47: athrow
    //   48: new 335	java/io/FileOutputStream
    //   51: dup
    //   52: aload_3
    //   53: invokespecial 336	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   56: astore 4
    //   58: new 338	java/io/BufferedOutputStream
    //   61: dup
    //   62: new 19	com/facebook/internal/FileLruCache$CloseCallbackOutputStream
    //   65: dup
    //   66: aload 4
    //   68: new 6	com/facebook/internal/FileLruCache$1
    //   71: dup
    //   72: aload_0
    //   73: invokestatic 245	java/lang/System:currentTimeMillis	()J
    //   76: aload_3
    //   77: aload_1
    //   78: invokespecial 341	com/facebook/internal/FileLruCache$1:<init>	(Lcom/facebook/internal/FileLruCache;JLjava/io/File;Ljava/lang/String;)V
    //   81: invokespecial 344	com/facebook/internal/FileLruCache$CloseCallbackOutputStream:<init>	(Ljava/io/OutputStream;Lcom/facebook/internal/FileLruCache$StreamCloseCallback;)V
    //   84: sipush 8192
    //   87: invokespecial 347	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;I)V
    //   90: astore_3
    //   91: new 278	org/json/JSONObject
    //   94: dup
    //   95: invokespecial 348	org/json/JSONObject:<init>	()V
    //   98: astore 4
    //   100: aload 4
    //   102: ldc_w 276
    //   105: aload_1
    //   106: invokevirtual 352	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   109: pop
    //   110: aload_2
    //   111: invokestatic 356	com/facebook/internal/Utility:isNullOrEmpty	(Ljava/lang/String;)Z
    //   114: ifne +13 -> 127
    //   117: aload 4
    //   119: ldc_w 287
    //   122: aload_2
    //   123: invokevirtual 352	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   126: pop
    //   127: aload_3
    //   128: aload 4
    //   130: invokestatic 360	com/facebook/internal/FileLruCache$StreamHeader:writeHeader	(Ljava/io/OutputStream;Lorg/json/JSONObject;)V
    //   133: iconst_1
    //   134: ifne +7 -> 141
    //   137: aload_3
    //   138: invokevirtual 361	java/io/BufferedOutputStream:close	()V
    //   141: aload_3
    //   142: areturn
    //   143: astore_1
    //   144: getstatic 160	com/facebook/LoggingBehavior:CACHE	Lcom/facebook/LoggingBehavior;
    //   147: iconst_5
    //   148: getstatic 60	com/facebook/internal/FileLruCache:TAG	Ljava/lang/String;
    //   151: new 197	java/lang/StringBuilder
    //   154: dup
    //   155: ldc_w 363
    //   158: invokespecial 202	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   161: aload_1
    //   162: invokevirtual 216	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   165: invokevirtual 230	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   168: invokestatic 366	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V
    //   171: new 255	java/io/IOException
    //   174: dup
    //   175: aload_1
    //   176: invokevirtual 369	java/io/FileNotFoundException:getMessage	()Ljava/lang/String;
    //   179: invokespecial 333	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   182: athrow
    //   183: astore_1
    //   184: getstatic 160	com/facebook/LoggingBehavior:CACHE	Lcom/facebook/LoggingBehavior;
    //   187: iconst_5
    //   188: getstatic 60	com/facebook/internal/FileLruCache:TAG	Ljava/lang/String;
    //   191: new 197	java/lang/StringBuilder
    //   194: dup
    //   195: ldc_w 371
    //   198: invokespecial 202	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   201: aload_1
    //   202: invokevirtual 216	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   205: invokevirtual 230	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   208: invokestatic 366	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V
    //   211: new 255	java/io/IOException
    //   214: dup
    //   215: aload_1
    //   216: invokevirtual 372	org/json/JSONException:getMessage	()Ljava/lang/String;
    //   219: invokespecial 333	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   222: athrow
    //   223: astore_1
    //   224: iconst_0
    //   225: ifne +7 -> 232
    //   228: aload_3
    //   229: invokevirtual 361	java/io/BufferedOutputStream:close	()V
    //   232: aload_1
    //   233: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	234	0	this	FileLruCache
    //   0	234	1	paramString1	String
    //   0	234	2	paramString2	String
    //   7	222	3	localObject1	Object
    //   56	73	4	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   48	58	143	java/io/FileNotFoundException
    //   91	127	183	org/json/JSONException
    //   127	133	183	org/json/JSONException
    //   91	127	223	finally
    //   127	133	223	finally
    //   184	223	223	finally
  }
  
  public String toString()
  {
    return "{FileLruCache: tag:" + tag + " file:" + directory.getName() + "}";
  }
  
  private static class BufferFile
  {
    private static final FilenameFilter filterExcludeBufferFiles = new FilenameFilter()
    {
      public boolean accept(File paramAnonymousFile, String paramAnonymousString)
      {
        return !paramAnonymousString.startsWith("buffer");
      }
    };
    private static final FilenameFilter filterExcludeNonBufferFiles = new FilenameFilter()
    {
      public boolean accept(File paramAnonymousFile, String paramAnonymousString)
      {
        return paramAnonymousString.startsWith("buffer");
      }
    };
    
    static void deleteAll(File paramFile)
    {
      paramFile = paramFile.listFiles(excludeNonBufferFiles());
      int j;
      int i;
      if (paramFile != null)
      {
        j = paramFile.length;
        i = 0;
      }
      for (;;)
      {
        if (i >= j) {
          return;
        }
        paramFile[i].delete();
        i += 1;
      }
    }
    
    static FilenameFilter excludeBufferFiles()
    {
      return filterExcludeBufferFiles;
    }
    
    static FilenameFilter excludeNonBufferFiles()
    {
      return filterExcludeNonBufferFiles;
    }
    
    static File newFile(File paramFile)
    {
      return new File(paramFile, "buffer" + Long.valueOf(FileLruCache.bufferIndex.incrementAndGet()).toString());
    }
  }
  
  private static class CloseCallbackOutputStream
    extends OutputStream
  {
    final FileLruCache.StreamCloseCallback callback;
    final OutputStream innerStream;
    
    CloseCallbackOutputStream(OutputStream paramOutputStream, FileLruCache.StreamCloseCallback paramStreamCloseCallback)
    {
      innerStream = paramOutputStream;
      callback = paramStreamCloseCallback;
    }
    
    public void close()
      throws IOException
    {
      try
      {
        innerStream.close();
        return;
      }
      finally
      {
        callback.onClose();
      }
    }
    
    public void flush()
      throws IOException
    {
      innerStream.flush();
    }
    
    public void write(int paramInt)
      throws IOException
    {
      innerStream.write(paramInt);
    }
    
    public void write(byte[] paramArrayOfByte)
      throws IOException
    {
      innerStream.write(paramArrayOfByte);
    }
    
    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      innerStream.write(paramArrayOfByte, paramInt1, paramInt2);
    }
  }
  
  private static final class CopyingInputStream
    extends InputStream
  {
    final InputStream input;
    final OutputStream output;
    
    CopyingInputStream(InputStream paramInputStream, OutputStream paramOutputStream)
    {
      input = paramInputStream;
      output = paramOutputStream;
    }
    
    public int available()
      throws IOException
    {
      return input.available();
    }
    
    public void close()
      throws IOException
    {
      try
      {
        input.close();
        return;
      }
      finally
      {
        output.close();
      }
    }
    
    public void mark(int paramInt)
    {
      throw new UnsupportedOperationException();
    }
    
    public boolean markSupported()
    {
      return false;
    }
    
    public int read()
      throws IOException
    {
      int i = input.read();
      if (i >= 0) {
        output.write(i);
      }
      return i;
    }
    
    public int read(byte[] paramArrayOfByte)
      throws IOException
    {
      int i = input.read(paramArrayOfByte);
      if (i > 0) {
        output.write(paramArrayOfByte, 0, i);
      }
      return i;
    }
    
    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      paramInt2 = input.read(paramArrayOfByte, paramInt1, paramInt2);
      if (paramInt2 > 0) {
        output.write(paramArrayOfByte, paramInt1, paramInt2);
      }
      return paramInt2;
    }
    
    public void reset()
    {
      try
      {
        throw new UnsupportedOperationException();
      }
      finally {}
    }
    
    public long skip(long paramLong)
      throws IOException
    {
      byte[] arrayOfByte = new byte['Ѐ'];
      int i;
      for (long l = 0L;; l += i)
      {
        if (l >= paramLong) {}
        do
        {
          return l;
          i = read(arrayOfByte, 0, (int)Math.min(paramLong - l, arrayOfByte.length));
        } while (i < 0);
      }
    }
  }
  
  public static final class Limits
  {
    private int byteCount = 1048576;
    private int fileCount = 1024;
    
    public Limits() {}
    
    int getByteCount()
    {
      return byteCount;
    }
    
    int getFileCount()
    {
      return fileCount;
    }
  }
  
  private static final class ModifiedFile
    implements Comparable<ModifiedFile>
  {
    private final File file;
    private final long modified;
    
    ModifiedFile(File paramFile)
    {
      file = paramFile;
      modified = paramFile.lastModified();
    }
    
    public int compareTo(ModifiedFile paramModifiedFile)
    {
      if (getModified() < paramModifiedFile.getModified()) {
        return -1;
      }
      if (getModified() > paramModifiedFile.getModified()) {
        return 1;
      }
      return getFile().compareTo(paramModifiedFile.getFile());
    }
    
    public boolean equals(Object paramObject)
    {
      return ((paramObject instanceof ModifiedFile)) && (compareTo((ModifiedFile)paramObject) == 0);
    }
    
    File getFile()
    {
      return file;
    }
    
    long getModified()
    {
      return modified;
    }
    
    public int hashCode()
    {
      return (file.hashCode() + 1073) * 37 + (int)(modified % 2147483647L);
    }
  }
  
  private static abstract interface StreamCloseCallback
  {
    public abstract void onClose();
  }
  
  private static final class StreamHeader
  {
    static JSONObject readHeader(InputStream paramInputStream)
      throws IOException
    {
      if (paramInputStream.read() != 0) {
        return null;
      }
      int j = 0;
      int i = 0;
      for (;;)
      {
        byte[] arrayOfByte;
        if (i >= 3)
        {
          arrayOfByte = new byte[j];
          i = 0;
          label25:
          if (i < arrayOfByte.length) {
            break label135;
          }
          paramInputStream = new JSONTokener(new String(arrayOfByte));
        }
        try
        {
          paramInputStream = paramInputStream.nextValue();
          if (!(paramInputStream instanceof JSONObject))
          {
            Logger.log(LoggingBehavior.CACHE, FileLruCache.TAG, "readHeader: expected JSONObject, got " + paramInputStream.getClass().getCanonicalName());
            return null;
            int k = paramInputStream.read();
            if (k == -1)
            {
              Logger.log(LoggingBehavior.CACHE, FileLruCache.TAG, "readHeader: stream.read returned -1 while reading header size");
              return null;
            }
            j = (j << 8) + (k & 0xFF);
            i += 1;
            continue;
            label135:
            j = paramInputStream.read(arrayOfByte, i, arrayOfByte.length - i);
            if (j < 1)
            {
              Logger.log(LoggingBehavior.CACHE, FileLruCache.TAG, "readHeader: stream.read stopped at " + Integer.valueOf(i) + " when expected " + arrayOfByte.length);
              return null;
            }
            i += j;
            break label25;
          }
          paramInputStream = (JSONObject)paramInputStream;
          return paramInputStream;
        }
        catch (JSONException paramInputStream)
        {
          throw new IOException(paramInputStream.getMessage());
        }
      }
    }
    
    static void writeHeader(OutputStream paramOutputStream, JSONObject paramJSONObject)
      throws IOException
    {
      paramJSONObject = paramJSONObject.toString().getBytes();
      paramOutputStream.write(0);
      paramOutputStream.write(paramJSONObject.length >> 16 & 0xFF);
      paramOutputStream.write(paramJSONObject.length >> 8 & 0xFF);
      paramOutputStream.write(paramJSONObject.length >> 0 & 0xFF);
      paramOutputStream.write(paramJSONObject);
    }
  }
}
