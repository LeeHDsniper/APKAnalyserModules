package com.nostra13.universalimageloader.cache.disc.impl.ext;

import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class DiskLruCache
  implements Closeable
{
  static final Pattern LEGAL_KEY_PATTERN = Pattern.compile("[a-z0-9_-]{1,64}");
  private static final OutputStream NULL_OUTPUT_STREAM = new OutputStream()
  {
    public void write(int paramAnonymousInt)
      throws IOException
    {}
  };
  private final int appVersion;
  private final Callable<Void> cleanupCallable = new Callable()
  {
    public Void call()
      throws Exception
    {
      synchronized (DiskLruCache.this)
      {
        if (journalWriter == null) {
          return null;
        }
        DiskLruCache.this.trimToSize();
        DiskLruCache.this.trimToFileCount();
        if (DiskLruCache.this.journalRebuildRequired())
        {
          DiskLruCache.this.rebuildJournal();
          DiskLruCache.access$502(DiskLruCache.this, 0);
        }
        return null;
      }
    }
  };
  private final File directory;
  final ThreadPoolExecutor executorService = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue());
  private int fileCount = 0;
  private final File journalFile;
  private final File journalFileBackup;
  private final File journalFileTmp;
  private Writer journalWriter;
  private final LinkedHashMap<String, Entry> lruEntries = new LinkedHashMap(0, 0.75F, true);
  private int maxFileCount;
  private long maxSize;
  private long nextSequenceNumber = 0L;
  private int redundantOpCount;
  private long size = 0L;
  private final int valueCount;
  
  private DiskLruCache(File paramFile, int paramInt1, int paramInt2, long paramLong, int paramInt3)
  {
    directory = paramFile;
    appVersion = paramInt1;
    journalFile = new File(paramFile, "journal");
    journalFileTmp = new File(paramFile, "journal.tmp");
    journalFileBackup = new File(paramFile, "journal.bkp");
    valueCount = paramInt2;
    maxSize = paramLong;
    maxFileCount = paramInt3;
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
        if (!localEntry.getDirtyFile(i).exists())
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
        paramEditor = localEntry.getDirtyFile(i);
        if (paramBoolean)
        {
          if (paramEditor.exists())
          {
            File localFile = localEntry.getCleanFile(i);
            paramEditor.renameTo(localFile);
            l1 = lengths[i];
            long l2 = localFile.length();
            lengths[i] = l2;
            size = (size - l1 + l2);
            fileCount += 1;
          }
        }
        else {
          deleteIfExists(paramEditor);
        }
      }
      else
      {
        redundantOpCount += 1;
        Entry.access$802(localEntry, null);
        if ((readable | paramBoolean))
        {
          Entry.access$702(localEntry, true);
          journalWriter.write("CLEAN " + key + localEntry.getLengths() + '\n');
          if (paramBoolean)
          {
            l1 = nextSequenceNumber;
            nextSequenceNumber = (1L + l1);
            Entry.access$1302(localEntry, l1);
          }
        }
        for (;;)
        {
          journalWriter.flush();
          if ((size <= maxSize) && (fileCount <= maxFileCount) && (!journalRebuildRequired())) {
            break;
          }
          executorService.submit(cleanupCallable);
          break;
          lruEntries.remove(key);
          journalWriter.write("REMOVE " + key + '\n');
        }
      }
      i += 1;
    }
  }
  
  private static void deleteIfExists(File paramFile)
    throws IOException
  {
    if ((paramFile.exists()) && (!paramFile.delete())) {
      throw new IOException();
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
          Entry.access$802((Entry)localObject, localEditor1);
          journalWriter.write("DIRTY " + paramString + '\n');
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
  
  public static DiskLruCache open(File paramFile, int paramInt1, int paramInt2, long paramLong, int paramInt3)
    throws IOException
  {
    if (paramLong <= 0L) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    if (paramInt3 <= 0) {
      throw new IllegalArgumentException("maxFileCount <= 0");
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
        break label168;
      }
      ((File)localObject).delete();
    }
    for (;;)
    {
      localObject = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong, paramInt3);
      if (!journalFile.exists()) {
        break label232;
      }
      try
      {
        ((DiskLruCache)localObject).readJournal();
        ((DiskLruCache)localObject).processJournal();
        journalWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(journalFile, true), Util.US_ASCII));
        return localObject;
      }
      catch (IOException localIOException)
      {
        label168:
        System.out.println("DiskLruCache " + paramFile + " is corrupt: " + localIOException.getMessage() + ", removing");
        ((DiskLruCache)localObject).delete();
      }
      renameTo((File)localObject, localFile, false);
    }
    label232:
    paramFile.mkdirs();
    paramFile = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong, paramInt3);
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
          fileCount += 1;
          i += 1;
        }
      }
      else
      {
        Entry.access$802(localEntry, null);
        i = 0;
        while (i < valueCount)
        {
          deleteIfExists(localEntry.getCleanFile(i));
          deleteIfExists(localEntry.getDirtyFile(i));
          i += 1;
        }
        localIterator.remove();
      }
    }
  }
  
  private void readJournal()
    throws IOException
  {
    StrictLineReader localStrictLineReader = new StrictLineReader(new FileInputStream(journalFile), Util.US_ASCII);
    int i;
    try
    {
      String str1 = localStrictLineReader.readLine();
      String str2 = localStrictLineReader.readLine();
      String str3 = localStrictLineReader.readLine();
      String str4 = localStrictLineReader.readLine();
      String str5 = localStrictLineReader.readLine();
      if ((!"libcore.io.DiskLruCache".equals(str1)) || (!"1".equals(str2)) || (!Integer.toString(appVersion).equals(str3)) || (!Integer.toString(valueCount).equals(str4)) || (!"".equals(str5))) {
        throw new IOException("unexpected journal header: [" + str1 + ", " + str2 + ", " + str4 + ", " + str5 + "]");
      }
    }
    finally
    {
      Util.closeQuietly(localStrictLineReader);
      throw localObject;
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
        Entry.access$702((Entry)localObject2, true);
        Entry.access$802((Entry)localObject2, null);
        ((Entry)localObject2).setLengths(paramString);
        return;
      }
      if ((k == -1) && (i == "DIRTY".length()) && (paramString.startsWith("DIRTY")))
      {
        Entry.access$802((Entry)localObject2, new Editor((Entry)localObject2, null));
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
      try
      {
        if (journalWriter != null) {
          journalWriter.close();
        }
        BufferedWriter localBufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(journalFileTmp), Util.US_ASCII));
        Entry localEntry;
        try
        {
          localBufferedWriter.write("libcore.io.DiskLruCache");
          localBufferedWriter.write("\n");
          localBufferedWriter.write("1");
          localBufferedWriter.write("\n");
          localBufferedWriter.write(Integer.toString(appVersion));
          localBufferedWriter.write("\n");
          localBufferedWriter.write(Integer.toString(valueCount));
          localBufferedWriter.write("\n");
          localBufferedWriter.write("\n");
          Iterator localIterator = lruEntries.values().iterator();
          if (!localIterator.hasNext()) {
            break;
          }
          localEntry = (Entry)localIterator.next();
          if (currentEditor != null)
          {
            localBufferedWriter.write("DIRTY " + key + '\n');
            continue;
            localObject1 = finally;
          }
        }
        finally
        {
          localBufferedWriter.close();
        }
        localObject1.write("CLEAN " + key + localEntry.getLengths() + '\n');
      }
      finally {}
    }
    localObject1.close();
    if (journalFile.exists()) {
      renameTo(journalFile, journalFileBackup, true);
    }
    renameTo(journalFileTmp, journalFile, false);
    journalFileBackup.delete();
    journalWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(journalFile, true), Util.US_ASCII));
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
  
  private void trimToFileCount()
    throws IOException
  {
    while (fileCount > maxFileCount) {
      remove((String)((Map.Entry)lruEntries.entrySet().iterator().next()).getKey());
    }
  }
  
  private void trimToSize()
    throws IOException
  {
    while (size > maxSize) {
      remove((String)((Map.Entry)lruEntries.entrySet().iterator().next()).getKey());
    }
  }
  
  private void validateKey(String paramString)
  {
    if (!LEGAL_KEY_PATTERN.matcher(paramString).matches()) {
      throw new IllegalArgumentException("keys must match regex [a-z0-9_-]{1,64}: \"" + paramString + "\"");
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
        localObject1 = new ArrayList(lruEntries.values()).iterator();
        if (((Iterator)localObject1).hasNext())
        {
          Entry localEntry = (Entry)((Iterator)localObject1).next();
          if (currentEditor == null) {
            continue;
          }
          currentEditor.abort();
          continue;
        }
        trimToSize();
      }
      finally {}
      trimToFileCount();
      journalWriter.close();
      journalWriter = null;
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
    //   6: invokespecial 296	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:checkNotClosed	()V
    //   9: aload_0
    //   10: aload_1
    //   11: invokespecial 299	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:validateKey	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: getfield 83	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:lruEntries	Ljava/util/LinkedHashMap;
    //   18: aload_1
    //   19: invokevirtual 302	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   22: checkcast 18	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Entry
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
    //   44: invokestatic 197	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Entry:access$700	(Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Entry;)Z
    //   47: ifeq -12 -> 35
    //   50: aload_0
    //   51: getfield 131	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:valueCount	I
    //   54: anewarray 114	java/io/File
    //   57: astore_3
    //   58: aload_0
    //   59: getfield 131	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:valueCount	I
    //   62: anewarray 550	java/io/InputStream
    //   65: astore 5
    //   67: iconst_0
    //   68: istore_2
    //   69: iload_2
    //   70: aload_0
    //   71: getfield 131	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:valueCount	I
    //   74: if_icmpge +74 -> 148
    //   77: aload 6
    //   79: iload_2
    //   80: invokevirtual 230	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Entry:getCleanFile	(I)Ljava/io/File;
    //   83: astore 7
    //   85: aload_3
    //   86: iload_2
    //   87: aload 7
    //   89: aastore
    //   90: aload 5
    //   92: iload_2
    //   93: new 421	java/io/FileInputStream
    //   96: dup
    //   97: aload 7
    //   99: invokespecial 423	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   102: aastore
    //   103: iload_2
    //   104: iconst_1
    //   105: iadd
    //   106: istore_2
    //   107: goto -38 -> 69
    //   110: astore_1
    //   111: iconst_0
    //   112: istore_2
    //   113: aload 4
    //   115: astore_3
    //   116: iload_2
    //   117: aload_0
    //   118: getfield 131	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:valueCount	I
    //   121: if_icmpge -86 -> 35
    //   124: aload 4
    //   126: astore_3
    //   127: aload 5
    //   129: iload_2
    //   130: aaload
    //   131: ifnull -96 -> 35
    //   134: aload 5
    //   136: iload_2
    //   137: aaload
    //   138: invokestatic 457	com/nostra13/universalimageloader/cache/disc/impl/ext/Util:closeQuietly	(Ljava/io/Closeable;)V
    //   141: iload_2
    //   142: iconst_1
    //   143: iadd
    //   144: istore_2
    //   145: goto -32 -> 113
    //   148: aload_0
    //   149: aload_0
    //   150: getfield 176	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:redundantOpCount	I
    //   153: iconst_1
    //   154: iadd
    //   155: putfield 176	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:redundantOpCount	I
    //   158: aload_0
    //   159: getfield 139	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:journalWriter	Ljava/io/Writer;
    //   162: new 206	java/lang/StringBuilder
    //   165: dup
    //   166: invokespecial 207	java/lang/StringBuilder:<init>	()V
    //   169: ldc_w 552
    //   172: invokevirtual 213	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   175: aload_1
    //   176: invokevirtual 213	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   179: bipush 10
    //   181: invokevirtual 266	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   184: invokevirtual 220	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   187: invokevirtual 555	java/io/Writer:append	(Ljava/lang/CharSequence;)Ljava/io/Writer;
    //   190: pop
    //   191: aload_0
    //   192: invokespecial 168	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:journalRebuildRequired	()Z
    //   195: ifeq +15 -> 210
    //   198: aload_0
    //   199: getfield 103	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:executorService	Ljava/util/concurrent/ThreadPoolExecutor;
    //   202: aload_0
    //   203: getfield 108	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache:cleanupCallable	Ljava/util/concurrent/Callable;
    //   206: invokevirtual 282	java/util/concurrent/ThreadPoolExecutor:submit	(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    //   209: pop
    //   210: new 21	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot
    //   213: dup
    //   214: aload_0
    //   215: aload_1
    //   216: aload 6
    //   218: invokestatic 308	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Entry:access$1300	(Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Entry;)J
    //   221: aload_3
    //   222: aload 5
    //   224: aload 6
    //   226: invokestatic 238	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Entry:access$1100	(Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Entry;)[J
    //   229: aconst_null
    //   230: invokespecial 558	com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot:<init>	(Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;Ljava/lang/String;J[Ljava/io/File;[Ljava/io/InputStream;[JLcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$1;)V
    //   233: astore_3
    //   234: goto -199 -> 35
    //   237: astore_1
    //   238: aload_0
    //   239: monitorexit
    //   240: aload_1
    //   241: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	242	0	this	DiskLruCache
    //   0	242	1	paramString	String
    //   68	77	2	i	int
    //   34	200	3	localObject1	Object
    //   1	124	4	localObject2	Object
    //   65	158	5	arrayOfInputStream	InputStream[]
    //   25	200	6	localEntry	Entry
    //   83	15	7	localFile	File
    // Exception table:
    //   from	to	target	type
    //   69	85	110	java/io/FileNotFoundException
    //   90	103	110	java/io/FileNotFoundException
    //   5	27	237	finally
    //   42	67	237	finally
    //   69	85	237	finally
    //   90	103	237	finally
    //   116	124	237	finally
    //   134	141	237	finally
    //   148	210	237	finally
    //   210	234	237	finally
  }
  
  public boolean remove(String paramString)
    throws IOException
  {
    for (;;)
    {
      Entry localEntry;
      int i;
      try
      {
        checkNotClosed();
        validateKey(paramString);
        localEntry = (Entry)lruEntries.get(paramString);
        if (localEntry != null)
        {
          localObject = currentEditor;
          if (localObject == null) {}
        }
        else
        {
          bool = false;
          return bool;
        }
        i = 0;
        if (i >= valueCount) {
          break label156;
        }
        Object localObject = localEntry.getCleanFile(i);
        if ((((File)localObject).exists()) && (!((File)localObject).delete())) {
          throw new IOException("failed to delete " + localObject);
        }
      }
      finally {}
      size -= lengths[i];
      fileCount -= 1;
      lengths[i] = 0L;
      i += 1;
      continue;
      label156:
      redundantOpCount += 1;
      journalWriter.append("REMOVE " + paramString + '\n');
      lruEntries.remove(paramString);
      if (journalRebuildRequired()) {
        executorService.submit(cleanupCallable);
      }
      boolean bool = true;
    }
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
      if (DiskLruCache.Entry.access$700(paramEntry)) {}
      for (this$1 = null;; this$1 = new boolean[valueCount])
      {
        written = DiskLruCache.this;
        return;
      }
    }
    
    public void abort()
      throws IOException
    {
      DiskLruCache.this.completeEdit(this, false);
    }
    
    public void commit()
      throws IOException
    {
      if (hasErrors)
      {
        DiskLruCache.this.completeEdit(this, false);
        remove(DiskLruCache.Entry.access$1200(entry));
      }
      for (;;)
      {
        committed = true;
        return;
        DiskLruCache.this.completeEdit(this, true);
      }
    }
    
    public OutputStream newOutputStream(int paramInt)
      throws IOException
    {
      synchronized (DiskLruCache.this)
      {
        if (DiskLruCache.Entry.access$800(entry) != this) {
          throw new IllegalStateException();
        }
      }
      if (!DiskLruCache.Entry.access$700(entry)) {
        written[paramInt] = true;
      }
      File localFile = entry.getDirtyFile(paramInt);
      try
      {
        Object localObject2 = new FileOutputStream(localFile);
        localObject2 = new FaultHidingOutputStream((OutputStream)localObject2, null);
        return localObject2;
      }
      catch (FileNotFoundException localFileNotFoundException1)
      {
        for (;;)
        {
          directory.mkdirs();
          try
          {
            FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
          }
          catch (FileNotFoundException localFileNotFoundException2)
          {
            OutputStream localOutputStream = DiskLruCache.NULL_OUTPUT_STREAM;
            return localOutputStream;
          }
        }
      }
    }
    
    private class FaultHidingOutputStream
      extends FilterOutputStream
    {
      private FaultHidingOutputStream(OutputStream paramOutputStream)
      {
        super();
      }
      
      public void close()
      {
        try
        {
          out.close();
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$2402(DiskLruCache.Editor.this, true);
        }
      }
      
      public void flush()
      {
        try
        {
          out.flush();
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$2402(DiskLruCache.Editor.this, true);
        }
      }
      
      public void write(int paramInt)
      {
        try
        {
          out.write(paramInt);
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$2402(DiskLruCache.Editor.this, true);
        }
      }
      
      public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      {
        try
        {
          out.write(paramArrayOfByte, paramInt1, paramInt2);
          return;
        }
        catch (IOException paramArrayOfByte)
        {
          DiskLruCache.Editor.access$2402(DiskLruCache.Editor.this, true);
        }
      }
    }
  }
  
  private final class Entry
  {
    private DiskLruCache.Editor currentEditor;
    private final String key;
    private final long[] lengths;
    private boolean readable;
    private long sequenceNumber;
    
    private Entry(String paramString)
    {
      key = paramString;
      lengths = new long[valueCount];
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
    
    public File getCleanFile(int paramInt)
    {
      return new File(directory, key + "." + paramInt);
    }
    
    public File getDirtyFile(int paramInt)
    {
      return new File(directory, key + "." + paramInt + ".tmp");
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
    private File[] files;
    private final InputStream[] ins;
    private final String key;
    private final long[] lengths;
    private final long sequenceNumber;
    
    private Snapshot(String paramString, long paramLong, File[] paramArrayOfFile, InputStream[] paramArrayOfInputStream, long[] paramArrayOfLong)
    {
      key = paramString;
      sequenceNumber = paramLong;
      files = paramArrayOfFile;
      ins = paramArrayOfInputStream;
      lengths = paramArrayOfLong;
    }
    
    public void close()
    {
      InputStream[] arrayOfInputStream = ins;
      int j = arrayOfInputStream.length;
      int i = 0;
      while (i < j)
      {
        Util.closeQuietly(arrayOfInputStream[i]);
        i += 1;
      }
    }
    
    public File getFile(int paramInt)
    {
      return files[paramInt];
    }
  }
}
