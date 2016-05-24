package org.apache.commons.io;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.util.Collection;
import java.util.LinkedList;
import org.apache.commons.io.filefilter.DirectoryFileFilter;
import org.apache.commons.io.filefilter.FalseFileFilter;
import org.apache.commons.io.filefilter.FileFilterUtils;
import org.apache.commons.io.filefilter.IOFileFilter;

public class FileUtils
{
  public static final File[] EMPTY_FILE_ARRAY = new File[0];
  public static final BigInteger ONE_EB_BI;
  public static final BigInteger ONE_GB_BI;
  public static final BigInteger ONE_KB_BI = BigInteger.valueOf(1024L);
  public static final BigInteger ONE_MB_BI = ONE_KB_BI.multiply(ONE_KB_BI);
  public static final BigInteger ONE_PB_BI;
  public static final BigInteger ONE_TB_BI;
  public static final BigInteger ONE_YB;
  public static final BigInteger ONE_ZB;
  private static final Charset UTF8 = Charset.forName("UTF-8");
  
  static
  {
    ONE_GB_BI = ONE_KB_BI.multiply(ONE_MB_BI);
    ONE_TB_BI = ONE_KB_BI.multiply(ONE_GB_BI);
    ONE_PB_BI = ONE_KB_BI.multiply(ONE_TB_BI);
    ONE_EB_BI = ONE_KB_BI.multiply(ONE_PB_BI);
    ONE_ZB = BigInteger.valueOf(1024L).multiply(BigInteger.valueOf(1152921504606846976L));
    ONE_YB = ONE_KB_BI.multiply(ONE_ZB);
  }
  
  public static void cleanDirectory(File paramFile)
    throws IOException
  {
    if (!paramFile.exists()) {
      throw new IllegalArgumentException(paramFile + " does not exist");
    }
    if (!paramFile.isDirectory()) {
      throw new IllegalArgumentException(paramFile + " is not a directory");
    }
    File[] arrayOfFile = paramFile.listFiles();
    if (arrayOfFile == null) {
      throw new IOException("Failed to list contents of " + paramFile);
    }
    paramFile = null;
    int j = arrayOfFile.length;
    int i = 0;
    for (;;)
    {
      if (i < j)
      {
        File localFile = arrayOfFile[i];
        try
        {
          forceDelete(localFile);
          i += 1;
        }
        catch (IOException paramFile)
        {
          for (;;) {}
        }
      }
    }
    if (paramFile != null) {
      throw paramFile;
    }
  }
  
  public static void deleteDirectory(File paramFile)
    throws IOException
  {
    if (!paramFile.exists()) {}
    do
    {
      return;
      if (!isSymlink(paramFile)) {
        cleanDirectory(paramFile);
      }
    } while (paramFile.delete());
    throw new IOException("Unable to delete directory " + paramFile + ".");
  }
  
  public static void forceDelete(File paramFile)
    throws IOException
  {
    if (paramFile.isDirectory()) {
      deleteDirectory(paramFile);
    }
    boolean bool;
    do
    {
      return;
      bool = paramFile.exists();
    } while (paramFile.delete());
    if (!bool) {
      throw new FileNotFoundException("File does not exist: " + paramFile);
    }
    throw new IOException("Unable to delete file: " + paramFile);
  }
  
  public static String getTempDirectoryPath()
  {
    return System.getProperty("java.io.tmpdir");
  }
  
  private static void innerListFiles(Collection<File> paramCollection, File paramFile, IOFileFilter paramIOFileFilter, boolean paramBoolean)
  {
    paramFile = paramFile.listFiles(paramIOFileFilter);
    if (paramFile != null)
    {
      int j = paramFile.length;
      int i = 0;
      if (i < j)
      {
        Object localObject = paramFile[i];
        if (localObject.isDirectory())
        {
          if (paramBoolean) {
            paramCollection.add(localObject);
          }
          innerListFiles(paramCollection, localObject, paramIOFileFilter, paramBoolean);
        }
        for (;;)
        {
          i += 1;
          break;
          paramCollection.add(localObject);
        }
      }
    }
  }
  
  public static boolean isSymlink(File paramFile)
    throws IOException
  {
    if (paramFile == null) {
      throw new NullPointerException("File must not be null");
    }
    if (FilenameUtils.isSystemWindows()) {}
    for (;;)
    {
      return false;
      if (paramFile.getParent() == null) {}
      while (!paramFile.getCanonicalFile().equals(paramFile.getAbsoluteFile()))
      {
        return true;
        paramFile = new File(paramFile.getParentFile().getCanonicalFile(), paramFile.getName());
      }
    }
  }
  
  public static Collection<File> listFiles(File paramFile, IOFileFilter paramIOFileFilter1, IOFileFilter paramIOFileFilter2)
  {
    validateListFilesParameters(paramFile, paramIOFileFilter1);
    paramIOFileFilter1 = setUpEffectiveFileFilter(paramIOFileFilter1);
    paramIOFileFilter2 = setUpEffectiveDirFilter(paramIOFileFilter2);
    LinkedList localLinkedList = new LinkedList();
    innerListFiles(localLinkedList, paramFile, FileFilterUtils.or(new IOFileFilter[] { paramIOFileFilter1, paramIOFileFilter2 }), false);
    return localLinkedList;
  }
  
  private static IOFileFilter setUpEffectiveDirFilter(IOFileFilter paramIOFileFilter)
  {
    if (paramIOFileFilter == null) {
      return FalseFileFilter.INSTANCE;
    }
    return FileFilterUtils.and(new IOFileFilter[] { paramIOFileFilter, DirectoryFileFilter.INSTANCE });
  }
  
  private static IOFileFilter setUpEffectiveFileFilter(IOFileFilter paramIOFileFilter)
  {
    return FileFilterUtils.and(new IOFileFilter[] { paramIOFileFilter, FileFilterUtils.notFileFilter(DirectoryFileFilter.INSTANCE) });
  }
  
  private static void validateListFilesParameters(File paramFile, IOFileFilter paramIOFileFilter)
  {
    if (!paramFile.isDirectory()) {
      throw new IllegalArgumentException("Parameter 'directory' is not a directory");
    }
    if (paramIOFileFilter == null) {
      throw new NullPointerException("Parameter 'fileFilter' is null");
    }
  }
}
