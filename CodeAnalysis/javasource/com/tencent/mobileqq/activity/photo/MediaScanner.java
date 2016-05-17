package com.tencent.mobileqq.activity.photo;

import android.content.Context;
import android.media.MediaMetadataRetriever;
import android.os.Build.VERSION;
import android.os.Environment;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;
import maq;

public class MediaScanner
{
  private static MediaScanner jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner;
  public static final String a;
  public static AtomicBoolean a;
  private static AtomicBoolean jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean;
  private MediaDatabaseHelper jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper;
  private HashSet jdField_a_of_type_JavaUtilHashSet = new HashSet();
  private String jdField_b_of_type_JavaLangString = null;
  private HashSet jdField_b_of_type_JavaUtilHashSet = new HashSet();
  private HashSet c;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = MediaScanner.class.getSimpleName();
    jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner = null;
    jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
  }
  
  private MediaScanner() {}
  
  private MediaScanner(Context paramContext)
  {
    jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper = MediaDatabaseHelper.a(paramContext);
    paramContext = Environment.getExternalStorageDirectory();
    if (paramContext != null) {
      jdField_b_of_type_JavaLangString = paramContext.getAbsolutePath();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper != null) {
      c = jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.b();
    }
  }
  
  public static MediaScanner a(Context paramContext)
  {
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner == null) {
        jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner = new MediaScanner(paramContext);
      }
      paramContext = jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner;
      return paramContext;
    }
    finally {}
  }
  
  private MediaScannerInfo a(MediaMetadataRetriever paramMediaMetadataRetriever, String paramString1, String paramString2)
  {
    paramMediaMetadataRetriever = new File(paramString2);
    if (paramMediaMetadataRetriever.exists()) {
      try
      {
        MediaScannerInfo localMediaScannerInfo = new MediaScannerInfo();
        jdField_c_of_type_Long = 0L;
        jdField_b_of_type_Long = (paramMediaMetadataRetriever.lastModified() / 1000L);
        jdField_a_of_type_Long = paramMediaMetadataRetriever.length();
        jdField_a_of_type_JavaLangString = paramString2.substring(paramString2.lastIndexOf("/") + 1);
        jdField_c_of_type_JavaLangString = paramString2;
        jdField_b_of_type_JavaLangString = paramString1;
        d = "video/mp4";
        e = String.valueOf(jdField_a_of_type_Long);
        return localMediaScannerInfo;
      }
      catch (Exception paramMediaMetadataRetriever)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "createMediaScannerInfo() error=" + paramMediaMetadataRetriever.getMessage());
        }
      }
    }
    return null;
  }
  
  private void a(String paramString)
  {
    File localFile = new File(paramString);
    if ((localFile == null) || (!localFile.exists())) {}
    while (jdField_b_of_type_JavaUtilHashSet.contains(paramString)) {
      return;
    }
    jdField_b_of_type_JavaUtilHashSet.add(paramString);
    paramString = new MediaScannerFileObserver(jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner, paramString);
    paramString.startWatching();
    jdField_a_of_type_JavaUtilHashSet.add(paramString);
  }
  
  private void a(String paramString, boolean paramBoolean)
  {
    Object localObject = new File(paramString);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "doScanFolder() folderPath=" + paramString);
    }
    if (localObject == null) {}
    label47:
    label296:
    label331:
    do
    {
      do
      {
        do
        {
          break label47;
          do
          {
            return;
          } while (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper == null);
          if ((!((File)localObject).exists()) || (!((File)localObject).isDirectory())) {
            break label331;
          }
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "doScanFolder() videoFolder.exists()=true");
          }
          if ((!paramBoolean) || (a(paramString))) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.d(jdField_a_of_type_JavaLangString, 2, "doScanFolder() isNomediaFileExisit()=false, return");
        return;
      } while (b(paramString) != true);
      localObject = ((File)localObject).listFiles();
      HashSet localHashSet = jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.a(paramString);
      ArrayList localArrayList = new ArrayList();
      if (localObject != null)
      {
        int j = localObject.length;
        int i = 0;
        if (i < j)
        {
          MediaScannerInfo localMediaScannerInfo = localObject[i];
          String str;
          if (localMediaScannerInfo.getName().endsWith(".mp4"))
          {
            str = paramString + "/" + localMediaScannerInfo.getName();
            if ((localHashSet.contains(str)) || (c == null) || (c.contains(String.valueOf(localMediaScannerInfo.length())))) {
              break label296;
            }
            localMediaScannerInfo = a(null, paramString, str);
            if (localMediaScannerInfo != null)
            {
              localArrayList.add(localMediaScannerInfo);
              c.add(String.valueOf(jdField_a_of_type_Long));
            }
          }
          for (;;)
          {
            i += 1;
            break;
            localHashSet.remove(str);
          }
        }
      }
      jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.b(localHashSet);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.b(localArrayList);
      b(paramString);
      return;
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "doScanFolder() videoFolder.exists() = false");
  }
  
  private boolean a(String paramString)
  {
    boolean bool = true;
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "isNomediaFileExisit() folderpath=" + paramString + ", mExternalStorageDirectoryPath=" + jdField_b_of_type_JavaLangString);
    }
    if (new File(jdField_b_of_type_JavaLangString).equals(new File(paramString)))
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "isNomediaFileExisit() root folder, return false");
      }
      bool = false;
    }
    File localFile;
    do
    {
      return bool;
      localFile = new File(paramString + "/.nomedia");
      if (localFile.exists() != true) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "isNomediaFileExisit() nomediaFile=" + localFile + " exist, return true");
    return true;
    return a(new File(paramString).getParent());
  }
  
  private void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper == null) {}
    HashSet localHashSet;
    Iterator localIterator;
    do
    {
      return;
      localHashSet = jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.c();
      localIterator = localHashSet.iterator();
    } while ((localHashSet == null) || (localIterator == null));
    while (localIterator.hasNext())
    {
      File localFile = new File((String)localIterator.next());
      if ((localFile != null) && (localFile.exists())) {
        localIterator.remove();
      }
    }
    jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.a(localHashSet);
  }
  
  private void b(String paramString)
  {
    Object localObject = new File(paramString);
    if (localObject == null) {}
    do
    {
      long l;
      do
      {
        do
        {
          return;
          l = ((File)localObject).lastModified();
          localObject = jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.a(paramString);
          if (localObject == null) {
            break;
          }
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "needScanFolder() lastModified=" + l + ", info.modifiedDate=" + jdField_a_of_type_Long);
          }
        } while (l <= jdField_a_of_type_Long);
        jdField_a_of_type_Long = l;
        jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.a((MediaScannerFolderInfo)localObject);
      } while (!QLog.isColorLevel());
      QLog.d(jdField_a_of_type_JavaLangString, 2, "needScanFolder() lastModified > info.modifiedDate , run updateMediaScnnerFolderInfo()");
      return;
      localObject = new MediaScannerFolderInfo();
      jdField_a_of_type_JavaLangString = paramString;
      jdField_a_of_type_Long = l;
      jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.b((MediaScannerFolderInfo)localObject);
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "updateScanFolderInfo() run insertMediaScnnerFolderInfo()");
  }
  
  private boolean b(String paramString)
  {
    File localFile = new File(paramString);
    if (localFile == null) {}
    long l;
    do
    {
      return false;
      l = localFile.lastModified();
      paramString = jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.a(paramString);
      if (paramString == null) {
        break;
      }
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "needScanFolder() lastModified=" + l + ", info.modifiedDate=" + jdField_a_of_type_Long);
      }
    } while (l == jdField_a_of_type_Long);
    return true;
  }
  
  private void c()
  {
    if ((jdField_b_of_type_JavaLangString == null) || (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper == null)) {}
    for (;;)
    {
      return;
      String str = jdField_b_of_type_JavaLangString + "/tencent/MicroMsg";
      File[] arrayOfFile = new File(str).listFiles();
      if (arrayOfFile != null)
      {
        int j = arrayOfFile.length;
        int i = 0;
        while (i < j)
        {
          Object localObject = arrayOfFile[i];
          if ((((File)localObject).isDirectory()) && (((File)localObject).getName().length() == 32))
          {
            localObject = str + "/" + ((File)localObject).getName() + "/" + "video";
            a((String)localObject, true);
            a((String)localObject);
          }
          i += 1;
        }
      }
    }
  }
  
  /* Error */
  public int a()
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 60	com/tencent/mobileqq/activity/photo/MediaScanner:jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper	Lcom/tencent/mobileqq/activity/photo/MediaDatabaseHelper;
    //   8: astore_2
    //   9: aload_2
    //   10: ifnonnull +7 -> 17
    //   13: aload_0
    //   14: monitorexit
    //   15: iload_1
    //   16: ireturn
    //   17: ldc_w 301
    //   20: invokestatic 304	android/os/Environment:getExternalStorageState	()Ljava/lang/String;
    //   23: invokevirtual 305	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   26: ifeq -13 -> 13
    //   29: aload_0
    //   30: getfield 60	com/tencent/mobileqq/activity/photo/MediaScanner:jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper	Lcom/tencent/mobileqq/activity/photo/MediaDatabaseHelper;
    //   33: invokevirtual 307	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	()I
    //   36: istore_1
    //   37: goto -24 -> 13
    //   40: astore_2
    //   41: aload_0
    //   42: monitorexit
    //   43: aload_2
    //   44: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	45	0	this	MediaScanner
    //   1	36	1	i	int
    //   8	2	2	localMediaDatabaseHelper	MediaDatabaseHelper
    //   40	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   4	9	40	finally
    //   17	37	40	finally
  }
  
  /* Error */
  public ArrayList a(boolean paramBoolean, int paramInt)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aconst_null
    //   4: astore_3
    //   5: aload_0
    //   6: monitorenter
    //   7: aload_0
    //   8: getfield 60	com/tencent/mobileqq/activity/photo/MediaScanner:jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper	Lcom/tencent/mobileqq/activity/photo/MediaDatabaseHelper;
    //   11: astore 5
    //   13: aload 5
    //   15: ifnonnull +7 -> 22
    //   18: aload_0
    //   19: monitorexit
    //   20: aload_3
    //   21: areturn
    //   22: ldc_w 301
    //   25: invokestatic 304	android/os/Environment:getExternalStorageState	()Ljava/lang/String;
    //   28: invokevirtual 305	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   31: ifeq -13 -> 18
    //   34: aload 4
    //   36: astore_3
    //   37: iload_2
    //   38: iconst_m1
    //   39: if_icmpeq +8 -> 47
    //   42: iload_2
    //   43: invokestatic 310	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   46: astore_3
    //   47: iload_1
    //   48: ifne +15 -> 63
    //   51: aload_0
    //   52: getfield 60	com/tencent/mobileqq/activity/photo/MediaScanner:jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper	Lcom/tencent/mobileqq/activity/photo/MediaDatabaseHelper;
    //   55: aload_3
    //   56: invokevirtual 313	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:b	(Ljava/lang/String;)Ljava/util/ArrayList;
    //   59: astore_3
    //   60: goto -42 -> 18
    //   63: aload_0
    //   64: getfield 60	com/tencent/mobileqq/activity/photo/MediaScanner:jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper	Lcom/tencent/mobileqq/activity/photo/MediaDatabaseHelper;
    //   67: aload_3
    //   68: invokevirtual 315	com/tencent/mobileqq/activity/photo/MediaDatabaseHelper:a	(Ljava/lang/String;)Ljava/util/ArrayList;
    //   71: astore_3
    //   72: goto -54 -> 18
    //   75: astore_3
    //   76: aload_0
    //   77: monitorexit
    //   78: aload_3
    //   79: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	80	0	this	MediaScanner
    //   0	80	1	paramBoolean	boolean
    //   0	80	2	paramInt	int
    //   4	68	3	localObject1	Object
    //   75	4	3	localObject2	Object
    //   1	34	4	localObject3	Object
    //   11	3	5	localMediaDatabaseHelper	MediaDatabaseHelper
    // Exception table:
    //   from	to	target	type
    //   7	13	75	finally
    //   22	34	75	finally
    //   42	47	75	finally
    //   51	60	75	finally
    //   63	72	75	finally
  }
  
  public void a()
  {
    for (;;)
    {
      try
      {
        if (Build.VERSION.SDK_INT < 10)
        {
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "doScan() android.os.Build.VERSION.SDK_INT  < Build.VERSION_CODES.GINGERBREAD_MR1 return");
          }
          return;
        }
        if ((!"mounted".equals(Environment.getExternalStorageState())) || (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get() == true) || (jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get())) {
          continue;
        }
        jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "doScan() start");
        }
      }
      finally {}
      try
      {
        b();
        c();
      }
      catch (IOException localIOException)
      {
        localIOException.printStackTrace();
        jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
        continue;
      }
      finally
      {
        jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
      }
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "doScan() finish");
      }
    }
  }
  
  public void a(int paramInt, String paramString1, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "handleFileObserverEvent() is called event=" + paramInt);
    }
    if (!jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {}
    do
    {
      do
      {
        do
        {
          File localFile;
          do
          {
            return;
            switch (paramInt)
            {
            default: 
              return;
            case 8: 
            case 128: 
              paramString2 = paramString1 + "/" + paramString2;
              localFile = new File(paramString2);
              if ((c == null) && (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper != null)) {
                c = jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.b();
              }
              break;
            }
          } while ((c == null) || (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper == null));
          if (!localFile.exists()) {
            break;
          }
          paramString1 = a(null, paramString1, paramString2);
          if ((paramString1 != null) && (!c.contains(e)))
          {
            c.add(e);
            jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.a(paramString1);
            return;
          }
        } while (!QLog.isColorLevel());
        QLog.d(jdField_a_of_type_JavaLangString, 2, "handleFileObserverEvent() info=null");
        return;
      } while (!QLog.isColorLevel());
      QLog.d(jdField_a_of_type_JavaLangString, 2, "handleFileObserverEvent() mMd5Set.contains( md5 ) = true");
      return;
      paramString1 = paramString1 + "/" + paramString2;
      paramString2 = new File(paramString1);
    } while ((paramString2 == null) || (paramString2.exists() == true) || (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper == null));
    paramString2 = new HashSet();
    paramString2.add(paramString1);
    jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaDatabaseHelper.b(paramString2);
  }
  
  public void a(MediaScanner.OnMediaScannerListener paramOnMediaScannerListener, LocalMediaInfo paramLocalMediaInfo, int paramInt)
  {
    paramOnMediaScannerListener = new WeakReference(paramOnMediaScannerListener);
    ThreadManager.a(new maq(this, new WeakReference(paramLocalMediaInfo), paramOnMediaScannerListener, paramInt), 5, null, true);
  }
}
