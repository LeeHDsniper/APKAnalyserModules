package com.squareup.okhttp.internal;

import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.ForwardingSink;
import okio.Okio;
import okio.Sink;
import okio.Source;
import okio.Timeout;

public final class DiskLruCache
  implements Closeable
{
  static final Pattern LEGAL_KEY_PATTERN = Pattern.compile("[a-z0-9_-]{1,120}");
  private static final Sink NULL_SINK = new Sink()
  {
    public void close()
      throws IOException
    {}
    
    public void flush()
      throws IOException
    {}
    
    public Timeout timeout()
    {
      return Timeout.NONE;
    }
    
    public void write(Buffer paramAnonymousBuffer, long paramAnonymousLong)
      throws IOException
    {}
  };
  private final int appVersion;
  private final Runnable cleanupRunnable = new Runnable()
  {
    public void run()
    {
      synchronized (DiskLruCache.this)
      {
        if (journalWriter == null) {
          return;
        }
      }
    }
  };
  private final File directory;
  final ThreadPoolExecutor executorService = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), Util.threadFactory("OkHttp DiskLruCache", true));
  private final File journalFile;
  private final File journalFileBackup;
  private final File journalFileTmp;
  private BufferedSink journalWriter;
  private final LinkedHashMap<String, Entry> lruEntries = new LinkedHashMap(0, 0.75F, true);
  private long maxSize;
  private long nextSequenceNumber = 0L;
  private int redundantOpCount;
  private long size = 0L;
  private final int valueCount;
  
  private DiskLruCache(File paramFile, int paramInt1, int paramInt2, long paramLong)
  {
    directory = paramFile;
    appVersion = paramInt1;
    journalFile = new File(paramFile, "journal");
    journalFileTmp = new File(paramFile, "journal.tmp");
    journalFileBackup = new File(paramFile, "journal.bkp");
    valueCount = paramInt2;
    maxSize = paramLong;
  }
  
  private void checkNotClosed()
  {
    if (journalWriter == null) {
      throw new IllegalStateException("cache is closed");
    }
  }
  
  private void completeEdit(Editor paramEditor, boolean paramBoolean)
    throws IOException
  {
    Entry localEntry;
    try
    {
      localEntry = entry;
      if (currentEditor != paramEditor) {
        throw new IllegalStateException();
      }
    }
    finally {}
    if ((paramBoolean) && (!readable))
    {
      i = 0;
      while (i < valueCount)
      {
        if (written[i] == 0)
        {
          paramEditor.abort();
          throw new IllegalStateException("Newly created entry didn't create value for index " + i);
        }
        if (!dirtyFiles[i].exists())
        {
          paramEditor.abort();
          return;
        }
        i += 1;
      }
    }
    int i = 0;
    for (;;)
    {
      long l1;
      if (i < valueCount)
      {
        paramEditor = dirtyFiles[i];
        if (paramBoolean)
        {
          if (paramEditor.exists())
          {
            File localFile = cleanFiles[i];
            paramEditor.renameTo(localFile);
            l1 = lengths[i];
            long l2 = localFile.length();
            lengths[i] = l2;
            size = (size - l1 + l2);
          }
        }
        else {
          deleteIfExists(paramEditor);
        }
      }
      else
      {
        redundantOpCount += 1;
        Entry.access$702(localEntry, null);
        if ((readable | paramBoolean))
        {
          Entry.access$602(localEntry, true);
          journalWriter.writeUtf8("CLEAN").writeByte(32);
          journalWriter.writeUtf8(key);
          journalWriter.writeUtf8(localEntry.getLengths());
          journalWriter.writeByte(10);
          if (paramBoolean)
          {
            l1 = nextSequenceNumber;
            nextSequenceNumber = (1L + l1);
            Entry.access$1402(localEntry, l1);
          }
        }
        for (;;)
        {
          journalWriter.flush();
          if ((size <= maxSize) && (!journalRebuildRequired())) {
            break;
          }
          executorService.execute(cleanupRunnable);
          break;
          lruEntries.remove(key);
          journalWriter.writeUtf8("REMOVE").writeByte(32);
          journalWriter.writeUtf8(key);
          journalWriter.writeByte(10);
        }
      }
      i += 1;
    }
  }
  
  private static void deleteIfExists(File paramFile)
    throws IOException
  {
    if ((!paramFile.delete()) && (paramFile.exists())) {
      throw new IOException("failed to delete " + paramFile);
    }
  }
  
  private Editor edit(String paramString, long paramLong)
    throws IOException
  {
    Editor localEditor1 = null;
    for (;;)
    {
      Entry localEntry;
      try
      {
        checkNotClosed();
        validateKey(paramString);
        localEntry = (Entry)lruEntries.get(paramString);
        if (paramLong != -1L)
        {
          localObject = localEditor1;
          if (localEntry != null)
          {
            long l = sequenceNumber;
            if (l != paramLong) {
              localObject = localEditor1;
            }
          }
          else
          {
            return localObject;
          }
        }
        if (localEntry == null)
        {
          localObject = new Entry(paramString, null);
          lruEntries.put(paramString, localObject);
          localEditor1 = new Editor((Entry)localObject, null);
          Entry.access$702((Entry)localObject, localEditor1);
          journalWriter.writeUtf8("DIRTY").writeByte(32).writeUtf8(paramString).writeByte(10);
          journalWriter.flush();
          localObject = localEditor1;
          continue;
        }
        localEditor2 = currentEditor;
      }
      finally {}
      Editor localEditor2;
      Object localObject = localEntry;
      if (localEditor2 != null) {
        localObject = localEditor1;
      }
    }
  }
  
  private boolean journalRebuildRequired()
  {
    return (redundantOpCount >= 2000) && (redundantOpCount >= lruEntries.size());
  }
  
  public static DiskLruCache open(File paramFile, int paramInt1, int paramInt2, long paramLong)
    throws IOException
  {
    if (paramLong <= 0L) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    if (paramInt2 <= 0) {
      throw new IllegalArgumentException("valueCount <= 0");
    }
    Object localObject = new File(paramFile, "journal.bkp");
    File localFile;
    if (((File)localObject).exists())
    {
      localFile = new File(paramFile, "journal");
      if (!localFile.exists()) {
        break label115;
      }
      ((File)localObject).delete();
    }
    for (;;)
    {
      localObject = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong);
      if (!journalFile.exists()) {
        break label179;
      }
      try
      {
        ((DiskLruCache)localObject).readJournal();
        ((DiskLruCache)localObject).processJournal();
        return localObject;
      }
      catch (IOException localIOException)
      {
        label115:
        Platform.get().logW("DiskLruCache " + paramFile + " is corrupt: " + localIOException.getMessage() + ", removing");
        ((DiskLruCache)localObject).delete();
      }
      renameTo((File)localObject, localFile, false);
    }
    label179:
    paramFile.mkdirs();
    paramFile = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong);
    paramFile.rebuildJournal();
    return paramFile;
  }
  
  private void processJournal()
    throws IOException
  {
    deleteIfExists(journalFileTmp);
    Iterator localIterator = lruEntries.values().iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      int i;
      if (currentEditor == null)
      {
        i = 0;
        while (i < valueCount)
        {
          size += lengths[i];
          i += 1;
        }
      }
      else
      {
        Entry.access$702(localEntry, null);
        i = 0;
        while (i < valueCount)
        {
          deleteIfExists(cleanFiles[i]);
          deleteIfExists(dirtyFiles[i]);
          i += 1;
        }
        localIterator.remove();
      }
    }
  }
  
  private void readJournal()
    throws IOException
  {
    BufferedSource localBufferedSource = Okio.buffer(Okio.source(journalFile));
    label237:
    try
    {
      String str1 = localBufferedSource.readUtf8LineStrict();
      String str2 = localBufferedSource.readUtf8LineStrict();
      String str3 = localBufferedSource.readUtf8LineStrict();
      String str4 = localBufferedSource.readUtf8LineStrict();
      String str5 = localBufferedSource.readUtf8LineStrict();
      if ((!"libcore.io.DiskLruCache".equals(str1)) || (!"1".equals(str2)) || (!Integer.toString(appVersion).equals(str3)) || (!Integer.toString(valueCount).equals(str4)) || (!"".equals(str5))) {
        throw new IOException("unexpected journal header: [" + str1 + ", " + str2 + ", " + str4 + ", " + str5 + "]");
      }
    }
    finally
    {
      Util.closeQuietly(localBufferedSource);
      throw localObject;
      int i = 0;
      try
      {
        for (;;)
        {
          readJournalLine(localBufferedSource.readUtf8LineStrict());
          i += 1;
        }
        rebuildJournal();
      }
      catch (EOFException localEOFException)
      {
        redundantOpCount = (i - lruEntries.size());
        if (localBufferedSource.exhausted()) {
          break label237;
        }
      }
      Util.closeQuietly(localBufferedSource);
      return;
    }
  }
  
  private void readJournalLine(String paramString)
    throws IOException
  {
    int i = paramString.indexOf(' ');
    if (i == -1) {
      throw new IOException("unexpected journal line: " + paramString);
    }
    int j = i + 1;
    int k = paramString.indexOf(' ', j);
    Object localObject2;
    Object localObject1;
    if (k == -1)
    {
      localObject2 = paramString.substring(j);
      localObject1 = localObject2;
      if (i != "REMOVE".length()) {
        break label114;
      }
      localObject1 = localObject2;
      if (!paramString.startsWith("REMOVE")) {
        break label114;
      }
      lruEntries.remove(localObject2);
    }
    label114:
    do
    {
      return;
      localObject1 = paramString.substring(j, k);
      Entry localEntry = (Entry)lruEntries.get(localObject1);
      localObject2 = localEntry;
      if (localEntry == null)
      {
        localObject2 = new Entry((String)localObject1, null);
        lruEntries.put(localObject1, localObject2);
      }
      if ((k != -1) && (i == "CLEAN".length()) && (paramString.startsWith("CLEAN")))
      {
        paramString = paramString.substring(k + 1).split(" ");
        Entry.access$602((Entry)localObject2, true);
        Entry.access$702((Entry)localObject2, null);
        ((Entry)localObject2).setLengths(paramString);
        return;
      }
      if ((k == -1) && (i == "DIRTY".length()) && (paramString.startsWith("DIRTY")))
      {
        Entry.access$702((Entry)localObject2, new Editor((Entry)localObject2, null));
        return;
      }
    } while ((k == -1) && (i == "READ".length()) && (paramString.startsWith("READ")));
    throw new IOException("unexpected journal line: " + paramString);
  }
  
  private void rebuildJournal()
    throws IOException
  {
    for (;;)
    {
      Entry localEntry;
      try
      {
        if (journalWriter != null) {
          journalWriter.close();
        }
        BufferedSink localBufferedSink = Okio.buffer(Okio.sink(journalFileTmp));
        try
        {
          localBufferedSink.writeUtf8("libcore.io.DiskLruCache").writeByte(10);
          localBufferedSink.writeUtf8("1").writeByte(10);
          localBufferedSink.writeUtf8(Integer.toString(appVersion)).writeByte(10);
          localBufferedSink.writeUtf8(Integer.toString(valueCount)).writeByte(10);
          localBufferedSink.writeByte(10);
          Iterator localIterator = lruEntries.values().iterator();
          if (!localIterator.hasNext()) {
            break;
          }
          localEntry = (Entry)localIterator.next();
          if (currentEditor != null)
          {
            localBufferedSink.writeUtf8("DIRTY").writeByte(32);
            localBufferedSink.writeUtf8(key);
            localBufferedSink.writeByte(10);
            continue;
            localObject1 = finally;
          }
        }
        finally
        {
          localBufferedSink.close();
        }
        localObject1.writeUtf8("CLEAN").writeByte(32);
      }
      finally {}
      localObject1.writeUtf8(key);
      localObject1.writeUtf8(localEntry.getLengths());
      localObject1.writeByte(10);
    }
    localObject1.close();
    if (journalFile.exists()) {
      renameTo(journalFile, journalFileBackup, true);
    }
    renameTo(journalFileTmp, journalFile, false);
    journalFileBackup.delete();
    journalWriter = Okio.buffer(Okio.appendingSink(journalFile));
  }
  
  private boolean removeEntry(Entry paramEntry)
    throws IOException
  {
    if (currentEditor != null) {
      Editor.access$1802(currentEditor, true);
    }
    int i = 0;
    while (i < valueCount)
    {
      deleteIfExists(cleanFiles[i]);
      size -= lengths[i];
      lengths[i] = 0L;
      i += 1;
    }
    redundantOpCount += 1;
    journalWriter.writeUtf8("REMOVE").writeByte(32).writeUtf8(key).writeByte(10);
    lruEntries.remove(key);
    if (journalRebuildRequired()) {
      executorService.execute(cleanupRunnable);
    }
    return true;
  }
  
  private static void renameTo(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    if (paramBoolean) {
      deleteIfExists(paramFile2);
    }
    if (!paramFile1.renameTo(paramFile2)) {
      throw new IOException();
    }
  }
  
  private void trimToSize()
    throws IOException
  {
    while (size > maxSize) {
      removeEntry((Entry)lruEntries.values().iterator().next());
    }
  }
  
  private void validateKey(String paramString)
  {
    if (!LEGAL_KEY_PATTERN.matcher(paramString).matches()) {
      throw new IllegalArgumentException("keys must match regex [a-z0-9_-]{1,120}: \"" + paramString + "\"");
    }
  }
  
  public void close()
    throws IOException
  {
    for (;;)
    {
      try
      {
        Object localObject1 = journalWriter;
        if (localObject1 == null) {
          return;
        }
        localObject1 = (Entry[])lruEntries.values().toArray(new Entry[lruEntries.size()]);
        int j = localObject1.length;
        int i = 0;
        if (i < j)
        {
          Entry localEntry = localObject1[i];
          if (currentEditor != null) {
            currentEditor.abort();
          }
        }
        else
        {
          trimToSize();
          journalWriter.close();
          journalWriter = null;
          continue;
        }
        i += 1;
      }
      finally {}
    }
  }
  
  public void delete()
    throws IOException
  {
    close();
    Util.deleteContents(directory);
  }
  
  public Editor edit(String paramString)
    throws IOException
  {
    return edit(paramString, -1L);
  }
  
  /* Error */
  public Snapshot get(String paramString)
    throws IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_0
    //   4: monitorenter
    //   5: aload_0
    //   6: invokespecial 309	com/squareup/okhttp/internal/DiskLruCache:checkNotClosed	()V
    //   9: aload_0
    //   10: aload_1
    //   11: invokespecial 312	com/squareup/okhttp/internal/DiskLruCache:validateKey	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: getfield 78	com/squareup/okhttp/internal/DiskLruCache:lruEntries	Ljava/util/LinkedHashMap;
    //   18: aload_1
    //   19: invokevirtual 315	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   22: checkcast 18	com/squareup/okhttp/internal/DiskLruCache$Entry
    //   25: astore 6
    //   27: aload 6
    //   29: ifnonnull +10 -> 39
    //   32: aload 4
    //   34: astore_3
    //   35: aload_0
    //   36: monitorexit
    //   37: aload_3
    //   38: areturn
    //   39: aload 4
    //   41: astore_3
    //   42: aload 6
    //   44: invokestatic 205	com/squareup/okhttp/internal/DiskLruCache$Entry:access$600	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    //   47: ifeq -12 -> 35
    //   50: aload_0
    //   51: getfield 134	com/squareup/okhttp/internal/DiskLruCache:valueCount	I
    //   54: anewarray 529	okio/Source
    //   57: astore 5
    //   59: iconst_0
    //   60: istore_2
    //   61: iload_2
    //   62: aload_0
    //   63: getfield 134	com/squareup/okhttp/internal/DiskLruCache:valueCount	I
    //   66: if_icmpge +62 -> 128
    //   69: aload 5
    //   71: iload_2
    //   72: aload 6
    //   74: invokestatic 238	com/squareup/okhttp/internal/DiskLruCache$Entry:access$1100	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;
    //   77: iload_2
    //   78: aaload
    //   79: invokestatic 407	okio/Okio:source	(Ljava/io/File;)Lokio/Source;
    //   82: aastore
    //   83: iload_2
    //   84: iconst_1
    //   85: iadd
    //   86: istore_2
    //   87: goto -26 -> 61
    //   90: astore_1
    //   91: iconst_0
    //   92: istore_2
    //   93: aload 4
    //   95: astore_3
    //   96: iload_2
    //   97: aload_0
    //   98: getfield 134	com/squareup/okhttp/internal/DiskLruCache:valueCount	I
    //   101: if_icmpge -66 -> 35
    //   104: aload 4
    //   106: astore_3
    //   107: aload 5
    //   109: iload_2
    //   110: aaload
    //   111: ifnull -76 -> 35
    //   114: aload 5
    //   116: iload_2
    //   117: aaload
    //   118: invokestatic 443	com/squareup/okhttp/internal/Util:closeQuietly	(Ljava/io/Closeable;)V
    //   121: iload_2
    //   122: iconst_1
    //   123: iadd
    //   124: istore_2
    //   125: goto -32 -> 93
    //   128: aload_0
    //   129: aload_0
    //   130: getfield 185	com/squareup/okhttp/internal/DiskLruCache:redundantOpCount	I
    //   133: iconst_1
    //   134: iadd
    //   135: putfield 185	com/squareup/okhttp/internal/DiskLruCache:redundantOpCount	I
    //   138: aload_0
    //   139: getfield 140	com/squareup/okhttp/internal/DiskLruCache:journalWriter	Lokio/BufferedSink;
    //   142: ldc_w 489
    //   145: invokeinterface 270 2 0
    //   150: bipush 32
    //   152: invokeinterface 274 2 0
    //   157: aload_1
    //   158: invokeinterface 270 2 0
    //   163: bipush 10
    //   165: invokeinterface 274 2 0
    //   170: pop
    //   171: aload_0
    //   172: invokespecial 159	com/squareup/okhttp/internal/DiskLruCache:journalRebuildRequired	()Z
    //   175: ifeq +14 -> 189
    //   178: aload_0
    //   179: getfield 106	com/squareup/okhttp/internal/DiskLruCache:executorService	Ljava/util/concurrent/ThreadPoolExecutor;
    //   182: aload_0
    //   183: getfield 111	com/squareup/okhttp/internal/DiskLruCache:cleanupRunnable	Ljava/lang/Runnable;
    //   186: invokevirtual 292	java/util/concurrent/ThreadPoolExecutor:execute	(Ljava/lang/Runnable;)V
    //   189: new 21	com/squareup/okhttp/internal/DiskLruCache$Snapshot
    //   192: dup
    //   193: aload_0
    //   194: aload_1
    //   195: aload 6
    //   197: invokestatic 321	com/squareup/okhttp/internal/DiskLruCache$Entry:access$1400	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)J
    //   200: aload 5
    //   202: aload 6
    //   204: invokestatic 246	com/squareup/okhttp/internal/DiskLruCache$Entry:access$1000	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[J
    //   207: aconst_null
    //   208: invokespecial 532	com/squareup/okhttp/internal/DiskLruCache$Snapshot:<init>	(Lcom/squareup/okhttp/internal/DiskLruCache;Ljava/lang/String;J[Lokio/Source;[JLcom/squareup/okhttp/internal/DiskLruCache$1;)V
    //   211: astore_3
    //   212: goto -177 -> 35
    //   215: astore_1
    //   216: aload_0
    //   217: monitorexit
    //   218: aload_1
    //   219: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	220	0	this	DiskLruCache
    //   0	220	1	paramString	String
    //   60	65	2	i	int
    //   34	178	3	localObject1	Object
    //   1	104	4	localObject2	Object
    //   57	144	5	arrayOfSource	Source[]
    //   25	178	6	localEntry	Entry
    // Exception table:
    //   from	to	target	type
    //   61	83	90	java/io/FileNotFoundException
    //   5	27	215	finally
    //   42	59	215	finally
    //   61	83	215	finally
    //   96	104	215	finally
    //   114	121	215	finally
    //   128	189	215	finally
    //   189	212	215	finally
  }
  
  /* Error */
  public boolean remove(String paramString)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 309	com/squareup/okhttp/internal/DiskLruCache:checkNotClosed	()V
    //   6: aload_0
    //   7: aload_1
    //   8: invokespecial 312	com/squareup/okhttp/internal/DiskLruCache:validateKey	(Ljava/lang/String;)V
    //   11: aload_0
    //   12: getfield 78	com/squareup/okhttp/internal/DiskLruCache:lruEntries	Ljava/util/LinkedHashMap;
    //   15: aload_1
    //   16: invokevirtual 315	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   19: checkcast 18	com/squareup/okhttp/internal/DiskLruCache$Entry
    //   22: astore_1
    //   23: aload_1
    //   24: ifnonnull +9 -> 33
    //   27: iconst_0
    //   28: istore_2
    //   29: aload_0
    //   30: monitorexit
    //   31: iload_2
    //   32: ireturn
    //   33: aload_0
    //   34: aload_1
    //   35: invokespecial 177	com/squareup/okhttp/internal/DiskLruCache:removeEntry	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    //   38: istore_2
    //   39: goto -10 -> 29
    //   42: astore_1
    //   43: aload_0
    //   44: monitorexit
    //   45: aload_1
    //   46: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	47	0	this	DiskLruCache
    //   0	47	1	paramString	String
    //   28	11	2	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	23	42	finally
    //   33	39	42	finally
  }
  
  public final class Editor
  {
    private boolean committed;
    private final DiskLruCache.Entry entry;
    private boolean hasErrors;
    private final boolean[] written;
    
    private Editor(DiskLruCache.Entry paramEntry)
    {
      entry = paramEntry;
      if (DiskLruCache.Entry.access$600(paramEntry)) {}
      for (this$1 = null;; this$1 = new boolean[valueCount])
      {
        written = DiskLruCache.this;
        return;
      }
    }
    
    public void abort()
      throws IOException
    {
      synchronized (DiskLruCache.this)
      {
        DiskLruCache.this.completeEdit(this, false);
        return;
      }
    }
    
    public void commit()
      throws IOException
    {
      synchronized (DiskLruCache.this)
      {
        if (hasErrors)
        {
          DiskLruCache.this.completeEdit(this, false);
          DiskLruCache.this.removeEntry(entry);
          committed = true;
          return;
        }
        DiskLruCache.this.completeEdit(this, true);
      }
    }
    
    public Sink newSink(int paramInt)
      throws IOException
    {
      synchronized (DiskLruCache.this)
      {
        if (DiskLruCache.Entry.access$700(entry) != this) {
          throw new IllegalStateException();
        }
      }
      if (!DiskLruCache.Entry.access$600(entry)) {
        written[paramInt] = true;
      }
      File localFile = DiskLruCache.Entry.access$1200(entry)[paramInt];
      try
      {
        Object localObject2 = Okio.sink(localFile);
        localObject2 = new FaultHidingSink((Sink)localObject2);
        return localObject2;
      }
      catch (FileNotFoundException localFileNotFoundException1)
      {
        for (;;)
        {
          directory.mkdirs();
          try
          {
            Sink localSink1 = Okio.sink(localFile);
          }
          catch (FileNotFoundException localFileNotFoundException2)
          {
            Sink localSink2 = DiskLruCache.NULL_SINK;
            return localSink2;
          }
        }
      }
    }
    
    private class FaultHidingSink
      extends ForwardingSink
    {
      public FaultHidingSink(Sink paramSink)
      {
        super();
      }
      
      public void close()
        throws IOException
      {
        try
        {
          super.close();
          return;
        }
        catch (IOException localIOException)
        {
          synchronized (DiskLruCache.this)
          {
            DiskLruCache.Editor.access$1802(DiskLruCache.Editor.this, true);
            return;
          }
        }
      }
      
      public void flush()
        throws IOException
      {
        try
        {
          super.flush();
          return;
        }
        catch (IOException localIOException)
        {
          synchronized (DiskLruCache.this)
          {
            DiskLruCache.Editor.access$1802(DiskLruCache.Editor.this, true);
            return;
          }
        }
      }
      
      public void write(Buffer arg1, long paramLong)
        throws IOException
      {
        try
        {
          super.write(???, paramLong);
          return;
        }
        catch (IOException ???)
        {
          synchronized (DiskLruCache.this)
          {
            DiskLruCache.Editor.access$1802(DiskLruCache.Editor.this, true);
            return;
          }
        }
      }
    }
  }
  
  private final class Entry
  {
    private final File[] cleanFiles;
    private DiskLruCache.Editor currentEditor;
    private final File[] dirtyFiles;
    private final String key;
    private final long[] lengths;
    private boolean readable;
    private long sequenceNumber;
    
    private Entry(String paramString)
    {
      key = paramString;
      lengths = new long[valueCount];
      cleanFiles = new File[valueCount];
      dirtyFiles = new File[valueCount];
      paramString = new StringBuilder(paramString).append('.');
      int j = paramString.length();
      int i = 0;
      while (i < valueCount)
      {
        paramString.append(i);
        cleanFiles[i] = new File(directory, paramString.toString());
        paramString.append(".tmp");
        dirtyFiles[i] = new File(directory, paramString.toString());
        paramString.setLength(j);
        i += 1;
      }
    }
    
    private IOException invalidLengths(String[] paramArrayOfString)
      throws IOException
    {
      throw new IOException("unexpected journal line: " + Arrays.toString(paramArrayOfString));
    }
    
    private void setLengths(String[] paramArrayOfString)
      throws IOException
    {
      if (paramArrayOfString.length != valueCount) {
        throw invalidLengths(paramArrayOfString);
      }
      int i = 0;
      try
      {
        while (i < paramArrayOfString.length)
        {
          lengths[i] = Long.parseLong(paramArrayOfString[i]);
          i += 1;
        }
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw invalidLengths(paramArrayOfString);
      }
    }
    
    public String getLengths()
      throws IOException
    {
      StringBuilder localStringBuilder = new StringBuilder();
      long[] arrayOfLong = lengths;
      int j = arrayOfLong.length;
      int i = 0;
      while (i < j)
      {
        long l = arrayOfLong[i];
        localStringBuilder.append(' ').append(l);
        i += 1;
      }
      return localStringBuilder.toString();
    }
  }
  
  public final class Snapshot
    implements Closeable
  {
    private final String key;
    private final long[] lengths;
    private final long sequenceNumber;
    private final Source[] sources;
    
    private Snapshot(String paramString, long paramLong, Source[] paramArrayOfSource, long[] paramArrayOfLong)
    {
      key = paramString;
      sequenceNumber = paramLong;
      sources = paramArrayOfSource;
      lengths = paramArrayOfLong;
    }
    
    public void close()
    {
      Source[] arrayOfSource = sources;
      int j = arrayOfSource.length;
      int i = 0;
      while (i < j)
      {
        Util.closeQuietly(arrayOfSource[i]);
        i += 1;
      }
    }
    
    public DiskLruCache.Editor edit()
      throws IOException
    {
      return DiskLruCache.this.edit(key, sequenceNumber);
    }
    
    public Source getSource(int paramInt)
    {
      return sources[paramInt];
    }
  }
}
