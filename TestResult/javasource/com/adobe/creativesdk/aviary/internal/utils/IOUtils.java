package com.adobe.creativesdk.aviary.internal.utils;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import android.util.Log;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.OkUrlFactory;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Scanner;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;
import org.apache.commons.io.FileUtils;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

public final class IOUtils
{
  private static final int ASSET_PREFIX_LENGTH = "file:///android_asset/".length();
  static final OkUrlFactory OK_URL_FACTORY = new OkUrlFactory(new OkHttpClient());
  
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
  
  public static void closeSilently(Cursor paramCursor)
  {
    if (paramCursor != null) {}
    try
    {
      if (!paramCursor.isClosed()) {
        paramCursor.close();
      }
      return;
    }
    catch (Throwable paramCursor) {}
  }
  
  public static void closeSilently(ParcelFileDescriptor paramParcelFileDescriptor)
  {
    if (paramParcelFileDescriptor == null) {
      return;
    }
    try
    {
      paramParcelFileDescriptor.close();
      return;
    }
    catch (Throwable paramParcelFileDescriptor) {}
  }
  
  public static void closeSilently(Closeable paramCloseable)
  {
    if (paramCloseable == null) {
      return;
    }
    try
    {
      paramCloseable.close();
      return;
    }
    catch (Throwable paramCloseable) {}
  }
  
  public static void closeSilently(ZipFile paramZipFile)
  {
    if (paramZipFile == null) {
      return;
    }
    try
    {
      paramZipFile.close();
      return;
    }
    catch (Throwable paramZipFile) {}
  }
  
  public static void copyFile(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte['က'];
    for (;;)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (i == -1) {
        break;
      }
      paramOutputStream.write(arrayOfByte, 0, i);
    }
  }
  
  public static void createNoMediaFile(File paramFile)
  {
    if ((paramFile != null) && (paramFile.isDirectory()))
    {
      paramFile = new File(paramFile, ".nomedia");
      if (paramFile.exists()) {}
    }
    try
    {
      paramFile.createNewFile();
      return;
    }
    catch (Exception paramFile)
    {
      paramFile.printStackTrace();
    }
  }
  
  public static void deleteDirectory(File paramFile)
    throws IOException
  {
    if (!paramFile.exists()) {}
    do
    {
      return;
      if (!FileUtils.isSymlink(paramFile)) {
        cleanDirectory(paramFile);
      }
    } while (paramFile.delete());
    throw new IOException("Unable to delete directory " + paramFile + ".");
  }
  
  public static boolean deleteQuietly(File paramFile)
  {
    if (paramFile == null) {
      return false;
    }
    try
    {
      if (paramFile.isDirectory()) {
        cleanDirectory(paramFile);
      }
      try
      {
        boolean bool = paramFile.delete();
        return bool;
      }
      catch (Exception paramFile)
      {
        return false;
      }
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public static ByteArrayInputStream download(String paramString, List<NameValuePair> paramList)
    throws IOException
  {
    String str = paramString;
    if (paramList != null) {
      str = paramString + URLEncodedUtils.format(paramList, "utf-8");
    }
    Log.i("io-utils", "download: " + str);
    paramString = OK_URL_FACTORY.open(new URL(str));
    int i = paramString.getResponseCode();
    if (i >= 300)
    {
      paramList = paramString.getResponseMessage();
      paramString.disconnect();
      throw new IOException(i + ":" + paramList);
    }
    paramString = paramString.getInputStream();
    paramList = org.apache.commons.io.IOUtils.toByteArray(paramString);
    closeSilently(paramString);
    return new ByteArrayInputStream(paramList);
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
  
  public static String getRealFilePath(Context paramContext, Uri paramUri)
  {
    if (paramUri == null) {}
    for (;;)
    {
      return null;
      String str = paramUri.getScheme();
      Object localObject = null;
      if (str == null) {
        return paramUri.getPath();
      }
      if ("file".equals(str)) {
        return paramUri.getPath();
      }
      if ("content".equals(str)) {
        try
        {
          paramUri = paramContext.getContentResolver().query(paramUri, new String[] { "_data" }, null, null, null);
          if (paramUri != null)
          {
            paramContext = localObject;
            if (paramUri.moveToFirst())
            {
              int i = paramUri.getColumnIndex("_data");
              paramContext = localObject;
              if (i > -1) {
                paramContext = paramUri.getString(i);
              }
            }
            paramUri.close();
            return paramContext;
          }
        }
        catch (IllegalArgumentException paramContext) {}
      }
    }
    return null;
  }
  
  public static InputStream hunt(Context paramContext, String paramString)
    throws IOException
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IOException("url cannot be null");
    }
    Log.i("io-utils", "hunt: " + paramString);
    Uri localUri = Uri.parse(paramString);
    String str = localUri.getScheme();
    if ("content".equals(str)) {
      return paramContext.getContentResolver().openInputStream(localUri);
    }
    if (("file".equals(str)) || (str == null))
    {
      if ((!localUri.getPathSegments().isEmpty()) && ("android_asset".equals(localUri.getPathSegments().get(0))))
      {
        paramString = localUri.toString().substring(ASSET_PREFIX_LENGTH);
        return paramContext.getAssets().open(paramString);
      }
      return paramContext.getContentResolver().openInputStream(localUri);
    }
    return download(paramString, null);
  }
  
  private static boolean mkdir(File paramFile)
  {
    if (paramFile.exists()) {
      return true;
    }
    return paramFile.mkdirs();
  }
  
  public static File mkdirs(File paramFile, String paramString)
  {
    if ((paramFile.exists()) && (paramFile.isDirectory()))
    {
      File localFile = paramFile.getAbsoluteFile();
      if (File.separatorChar == '\\') {}
      String[] arrayOfString;
      for (paramFile = "\\\\";; paramFile = File.separator)
      {
        arrayOfString = paramString.split(paramFile);
        if (arrayOfString.length <= 1) {
          break;
        }
        int i = 0;
        paramString = localFile;
        for (;;)
        {
          paramFile = paramString;
          if (i >= arrayOfString.length) {
            break;
          }
          paramString = new File(paramString, arrayOfString[i]);
          Log.d("io-utils", "file: " + paramString.getAbsolutePath());
          i += 1;
        }
      }
      paramFile = localFile;
      if (arrayOfString.length == 1) {
        paramFile = new File(localFile, paramString);
      }
      if (!paramFile.exists()) {
        if (!paramFile.mkdirs()) {}
      }
      while (paramFile.isDirectory())
      {
        do
        {
          return paramFile;
        } while (paramFile.isDirectory());
        return null;
      }
    }
    return null;
  }
  
  public static String readFully(InputStream paramInputStream)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    paramInputStream = new Scanner(paramInputStream);
    while (paramInputStream.hasNextLine()) {
      localStringBuilder.append(paramInputStream.nextLine());
    }
    return localStringBuilder.toString();
  }
  
  public static void unzip(InputStream paramInputStream, File paramFile)
    throws IOException
  {
    if (paramFile == null) {
      throw new IOException("destination folder is null");
    }
    if (paramInputStream == null) {
      throw new IOException("Input is null");
    }
    int i = 0;
    paramInputStream = new ZipInputStream(paramInputStream);
    for (;;)
    {
      ZipEntry localZipEntry = paramInputStream.getNextEntry();
      if (localZipEntry == null) {
        break;
      }
      unzipEntry(localZipEntry, paramInputStream, paramFile);
      i = 1;
      paramInputStream.closeEntry();
    }
    closeSilently(paramInputStream);
    if (i == 0) {
      throw new IOException("invalid zip file");
    }
  }
  
  private static void unzipEntry(ZipEntry paramZipEntry, ZipInputStream paramZipInputStream, File paramFile)
    throws IOException
  {
    if (paramZipEntry.isDirectory())
    {
      mkdirs(paramFile, paramZipEntry.getName());
      return;
    }
    paramZipEntry = new File(paramFile, paramZipEntry.getName());
    if (!paramZipEntry.getParentFile().exists()) {
      mkdir(paramZipEntry.getParentFile());
    }
    paramZipEntry = new BufferedOutputStream(new FileOutputStream(paramZipEntry));
    copyFile(paramZipInputStream, paramZipEntry);
    paramZipEntry.flush();
    closeSilently(paramZipEntry);
  }
}
