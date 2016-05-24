package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.os.Environment;
import android.text.TextUtils;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import it.sephiroth.android.library.disklrumulticache.DiskLruMultiCache;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.SoftReference;
import java.util.Locale;
import junit.framework.Assert;

public final class CdsDownloaderFactory
{
  static final LoggerFactory.Logger LOGGER = LoggerFactory.getLogger("CdsDownloaderFactory");
  
  public static Downloader create(Cds.ContentType paramContentType)
  {
    switch (1.$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$ContentType[paramContentType.ordinal()])
    {
    default: 
      return null;
    case 1: 
      return new PreviewDownloader();
    case 2: 
      return new ContentDownloader();
    case 3: 
      return new MessageDownloader();
    case 4: 
      return new DetailImageDownloader();
    }
    return new FeatureImageDownloader();
  }
  
  static File getCacheDir(Context paramContext, String paramString)
  {
    paramContext = DiskLruMultiCache.getCacheDir(paramContext, paramString);
    if (paramContext != null)
    {
      if (paramContext.exists())
      {
        com.adobe.creativesdk.aviary.internal.utils.IOUtils.createNoMediaFile(paramContext);
        return paramContext;
      }
      if (paramContext.mkdirs())
      {
        com.adobe.creativesdk.aviary.internal.utils.IOUtils.createNoMediaFile(paramContext);
        return paramContext;
      }
    }
    return null;
  }
  
  static class ContentDownloader
    extends CdsDownloaderFactory.Downloader
  {
    ContentDownloader() {}
    
    private String createExternalDownloadDirectory()
      throws AssertionError
    {
      Assert.assertTrue("External storage is not available", getExternalStorageAvailable());
      if (Build.VERSION.SDK_INT >= 11) {}
      File localFile;
      for (String str = Environment.DIRECTORY_DOWNLOADS;; str = "temp")
      {
        localFile = Environment.getExternalStoragePublicDirectory(str);
        if ((localFile == null) || (!localFile.isDirectory())) {
          break;
        }
        return localFile.getName();
      }
      int i = 0;
      while (i < 10)
      {
        localFile = Environment.getExternalStoragePublicDirectory(str + i);
        if (localFile != null)
        {
          if (!localFile.exists()) {
            localFile.mkdirs();
          }
          if ((localFile.exists()) && (localFile.isDirectory())) {
            return localFile.getName();
          }
        }
        i += 1;
      }
      return null;
    }
    
    private boolean getExternalStorageAvailable()
    {
      String str = Environment.getExternalStorageState();
      return ("checking".equals(str)) || ("mounted".equals(str));
    }
    
    /* Error */
    @android.annotation.TargetApi(11)
    public String download(Context paramContext, long paramLong, boolean paramBoolean)
      throws AssertionError
    {
      // Byte code:
      //   0: getstatic 96	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   3: ldc 98
      //   5: iconst_2
      //   6: anewarray 100	java/lang/Object
      //   9: dup
      //   10: iconst_0
      //   11: lload_2
      //   12: invokestatic 106	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   15: aastore
      //   16: dup
      //   17: iconst_1
      //   18: iload 4
      //   20: invokestatic 111	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   23: aastore
      //   24: invokeinterface 117 3 0
      //   29: ldc 119
      //   31: aload_1
      //   32: invokestatic 123	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
      //   35: aload_1
      //   36: invokestatic 129	com/adobe/creativesdk/aviary/internal/cds/CdsUtils:getManifestVersion	(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
      //   39: astore 9
      //   41: ldc -125
      //   43: aload 9
      //   45: invokestatic 123	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
      //   48: aload 9
      //   50: invokevirtual 136	com/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper:getAssetsBaseURL	()Ljava/lang/String;
      //   53: astore 13
      //   55: ldc -118
      //   57: aload 13
      //   59: invokestatic 123	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
      //   62: aconst_null
      //   63: astore 10
      //   65: aconst_null
      //   66: astore 11
      //   68: aconst_null
      //   69: astore 9
      //   71: aconst_null
      //   72: astore 12
      //   74: aload_1
      //   75: invokevirtual 144	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
      //   78: aload_1
      //   79: new 56	java/lang/StringBuilder
      //   82: dup
      //   83: invokespecial 57	java/lang/StringBuilder:<init>	()V
      //   86: ldc -110
      //   88: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   91: lload_2
      //   92: invokevirtual 149	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
      //   95: ldc -105
      //   97: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   100: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   103: invokestatic 157	com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils:getCDSProviderContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
      //   106: bipush 7
      //   108: anewarray 81	java/lang/String
      //   111: dup
      //   112: iconst_0
      //   113: ldc -97
      //   115: aastore
      //   116: dup
      //   117: iconst_1
      //   118: ldc -95
      //   120: aastore
      //   121: dup
      //   122: iconst_2
      //   123: ldc -93
      //   125: aastore
      //   126: dup
      //   127: iconst_3
      //   128: ldc -91
      //   130: aastore
      //   131: dup
      //   132: iconst_4
      //   133: ldc -89
      //   135: aastore
      //   136: dup
      //   137: iconst_5
      //   138: ldc -87
      //   140: aastore
      //   141: dup
      //   142: bipush 6
      //   144: ldc -85
      //   146: aastore
      //   147: aconst_null
      //   148: aconst_null
      //   149: aconst_null
      //   150: invokevirtual 177	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   153: astore 14
      //   155: aload 14
      //   157: ifnull +40 -> 197
      //   160: aload 12
      //   162: astore 9
      //   164: aload 11
      //   166: astore 10
      //   168: aload 14
      //   170: invokeinterface 182 1 0
      //   175: ifeq +17 -> 192
      //   178: aload 14
      //   180: invokestatic 188	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:create	(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
      //   183: astore 10
      //   185: aload 14
      //   187: invokestatic 193	com/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper:create	(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
      //   190: astore 9
      //   192: aload 14
      //   194: invokestatic 199	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
      //   197: ldc -55
      //   199: aload 10
      //   201: invokestatic 123	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
      //   204: ldc -53
      //   206: aload 9
      //   208: invokestatic 123	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
      //   211: ldc 119
      //   213: aload 9
      //   215: invokestatic 123	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
      //   218: aload 9
      //   220: invokevirtual 206	com/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper:getContentURL	()Ljava/lang/String;
      //   223: astore 12
      //   225: aload 12
      //   227: astore 11
      //   229: aload 12
      //   231: invokestatic 212	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
      //   234: ifne +53 -> 287
      //   237: aload 12
      //   239: astore 11
      //   241: aload 12
      //   243: ldc -42
      //   245: invokevirtual 218	java/lang/String:startsWith	(Ljava/lang/String;)Z
      //   248: ifne +39 -> 287
      //   251: aload 12
      //   253: astore 11
      //   255: aload 12
      //   257: ldc -36
      //   259: invokevirtual 218	java/lang/String:startsWith	(Ljava/lang/String;)Z
      //   262: ifne +25 -> 287
      //   265: new 56	java/lang/StringBuilder
      //   268: dup
      //   269: invokespecial 57	java/lang/StringBuilder:<init>	()V
      //   272: aload 13
      //   274: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   277: aload 12
      //   279: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   282: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   285: astore 11
      //   287: aload 10
      //   289: invokevirtual 223	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getIdentifier	()Ljava/lang/String;
      //   292: astore 17
      //   294: aload_1
      //   295: invokevirtual 144	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
      //   298: aload_1
      //   299: new 56	java/lang/StringBuilder
      //   302: dup
      //   303: invokespecial 57	java/lang/StringBuilder:<init>	()V
      //   306: ldc -31
      //   308: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   311: lload_2
      //   312: invokevirtual 149	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
      //   315: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   318: invokestatic 157	com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils:getCDSProviderContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
      //   321: iconst_1
      //   322: anewarray 81	java/lang/String
      //   325: dup
      //   326: iconst_0
      //   327: ldc -29
      //   329: aastore
      //   330: aconst_null
      //   331: aconst_null
      //   332: aconst_null
      //   333: invokevirtual 177	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   336: astore 16
      //   338: aload_1
      //   339: ldc -28
      //   341: invokevirtual 232	android/content/Context:getSystemService	(Ljava/lang/String;)Ljava/lang/Object;
      //   344: checkcast 234	android/app/DownloadManager
      //   347: astore 15
      //   349: aconst_null
      //   350: astore 13
      //   352: aconst_null
      //   353: astore 12
      //   355: aload 12
      //   357: astore 14
      //   359: aload 16
      //   361: ifnull +311 -> 672
      //   364: aload 12
      //   366: astore 14
      //   368: aload 13
      //   370: astore 12
      //   372: aload 16
      //   374: invokeinterface 182 1 0
      //   379: ifeq +293 -> 672
      //   382: aload 13
      //   384: astore 12
      //   386: aload 16
      //   388: aload 16
      //   390: ldc -29
      //   392: invokeinterface 238 2 0
      //   397: invokeinterface 242 2 0
      //   402: lstore 7
      //   404: aload 13
      //   406: astore 12
      //   408: new 244	android/app/DownloadManager$Query
      //   411: dup
      //   412: invokespecial 245	android/app/DownloadManager$Query:<init>	()V
      //   415: astore 14
      //   417: aload 13
      //   419: astore 12
      //   421: aload 14
      //   423: iconst_1
      //   424: newarray long
      //   426: dup
      //   427: iconst_0
      //   428: lload 7
      //   430: lastore
      //   431: invokevirtual 249	android/app/DownloadManager$Query:setFilterById	([J)Landroid/app/DownloadManager$Query;
      //   434: pop
      //   435: aload 13
      //   437: astore 12
      //   439: aload 15
      //   441: aload 14
      //   443: invokevirtual 252	android/app/DownloadManager:query	(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;
      //   446: astore 13
      //   448: aload 13
      //   450: ifnull +94 -> 544
      //   453: aload 13
      //   455: astore 12
      //   457: aload 13
      //   459: invokeinterface 182 1 0
      //   464: ifeq +80 -> 544
      //   467: aload 13
      //   469: astore 12
      //   471: aload 13
      //   473: aload 13
      //   475: ldc -2
      //   477: invokeinterface 238 2 0
      //   482: invokeinterface 258 2 0
      //   487: istore 5
      //   489: aload 13
      //   491: astore 12
      //   493: aload 13
      //   495: ldc_w 260
      //   498: invokeinterface 238 2 0
      //   503: istore 6
      //   505: iload 6
      //   507: iconst_m1
      //   508: if_icmple +433 -> 941
      //   511: aload 13
      //   513: astore 12
      //   515: aload 13
      //   517: iload 6
      //   519: invokeinterface 264 2 0
      //   524: astore 14
      //   526: goto +606 -> 1132
      //   529: aload 13
      //   531: astore 12
      //   533: getstatic 96	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   536: ldc_w 266
      //   539: invokeinterface 270 2 0
      //   544: aload 13
      //   546: astore 12
      //   548: aload 15
      //   550: iconst_1
      //   551: newarray long
      //   553: dup
      //   554: iconst_0
      //   555: lload 7
      //   557: lastore
      //   558: invokevirtual 274	android/app/DownloadManager:remove	([J)I
      //   561: pop
      //   562: aload 13
      //   564: astore 12
      //   566: aload_1
      //   567: invokevirtual 144	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
      //   570: aload_1
      //   571: new 56	java/lang/StringBuilder
      //   574: dup
      //   575: invokespecial 57	java/lang/StringBuilder:<init>	()V
      //   578: ldc_w 276
      //   581: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   584: lload_2
      //   585: invokevirtual 149	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
      //   588: ldc_w 278
      //   591: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   594: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   597: invokestatic 157	com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils:getCDSProviderContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
      //   600: aconst_null
      //   601: aconst_null
      //   602: invokevirtual 282	android/content/ContentResolver:delete	(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
      //   605: istore 5
      //   607: aload 13
      //   609: astore 12
      //   611: getstatic 96	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   614: new 56	java/lang/StringBuilder
      //   617: dup
      //   618: invokespecial 57	java/lang/StringBuilder:<init>	()V
      //   621: iload 5
      //   623: invokevirtual 64	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
      //   626: ldc_w 284
      //   629: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   632: lload_2
      //   633: invokevirtual 149	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
      //   636: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   639: invokeinterface 287 2 0
      //   644: aload 13
      //   646: astore 14
      //   648: iload 5
      //   650: ifne +22 -> 672
      //   653: aload 13
      //   655: astore 12
      //   657: getstatic 96	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   660: ldc_w 289
      //   663: invokeinterface 292 2 0
      //   668: aload 13
      //   670: astore 14
      //   672: aload 16
      //   674: invokestatic 199	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
      //   677: aload 14
      //   679: invokestatic 199	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
      //   682: aload 9
      //   684: invokevirtual 295	com/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper:getDisplayName	()Ljava/lang/String;
      //   687: ifnull +402 -> 1089
      //   690: aload 9
      //   692: invokevirtual 295	com/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper:getDisplayName	()Ljava/lang/String;
      //   695: astore 9
      //   697: aload 11
      //   699: invokestatic 301	android/net/Uri:parse	(Ljava/lang/String;)Landroid/net/Uri;
      //   702: astore 11
      //   704: new 303	android/app/DownloadManager$Request
      //   707: dup
      //   708: aload 11
      //   710: invokespecial 306	android/app/DownloadManager$Request:<init>	(Landroid/net/Uri;)V
      //   713: astore 12
      //   715: aload 11
      //   717: invokevirtual 309	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
      //   720: ifnonnull +377 -> 1097
      //   723: new 56	java/lang/StringBuilder
      //   726: dup
      //   727: invokespecial 57	java/lang/StringBuilder:<init>	()V
      //   730: aload 10
      //   732: invokevirtual 223	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getIdentifier	()Ljava/lang/String;
      //   735: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   738: ldc_w 311
      //   741: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   744: invokestatic 317	java/lang/System:currentTimeMillis	()J
      //   747: invokevirtual 149	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
      //   750: ldc_w 319
      //   753: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   756: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   759: astore 11
      //   761: aload_0
      //   762: invokespecial 321	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$ContentDownloader:createExternalDownloadDirectory	()Ljava/lang/String;
      //   765: astore 13
      //   767: ldc_w 323
      //   770: aload 13
      //   772: invokestatic 123	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
      //   775: aload 12
      //   777: aload 9
      //   779: invokevirtual 327	android/app/DownloadManager$Request:setTitle	(Ljava/lang/CharSequence;)Landroid/app/DownloadManager$Request;
      //   782: pop
      //   783: aload 12
      //   785: aload 13
      //   787: aload 11
      //   789: invokevirtual 331	android/app/DownloadManager$Request:setDestinationInExternalPublicDir	(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;
      //   792: pop
      //   793: aload 15
      //   795: aload 12
      //   797: invokevirtual 335	android/app/DownloadManager:enqueue	(Landroid/app/DownloadManager$Request;)J
      //   800: lstore 7
      //   802: new 337	android/content/ContentValues
      //   805: dup
      //   806: invokespecial 338	android/content/ContentValues:<init>	()V
      //   809: astore 9
      //   811: aload 9
      //   813: ldc_w 340
      //   816: lload_2
      //   817: invokestatic 106	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   820: invokevirtual 344	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
      //   823: aload 9
      //   825: ldc -29
      //   827: lload 7
      //   829: invokestatic 106	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   832: invokevirtual 344	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
      //   835: aload_1
      //   836: invokevirtual 144	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
      //   839: aload_1
      //   840: ldc_w 346
      //   843: invokestatic 157	com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils:getCDSProviderContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
      //   846: aload 9
      //   848: invokevirtual 350	android/content/ContentResolver:insert	(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
      //   851: astore 9
      //   853: ldc_w 352
      //   856: aload 9
      //   858: invokestatic 123	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
      //   861: aload_1
      //   862: invokevirtual 144	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
      //   865: aload_1
      //   866: new 56	java/lang/StringBuilder
      //   869: dup
      //   870: invokespecial 57	java/lang/StringBuilder:<init>	()V
      //   873: ldc_w 354
      //   876: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   879: lload 7
      //   881: invokevirtual 149	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
      //   884: ldc_w 356
      //   887: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   890: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   893: invokestatic 157	com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils:getCDSProviderContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
      //   896: new 337	android/content/ContentValues
      //   899: dup
      //   900: invokespecial 338	android/content/ContentValues:<init>	()V
      //   903: aconst_null
      //   904: aconst_null
      //   905: invokevirtual 360	android/content/ContentResolver:update	(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
      //   908: ifle +19 -> 927
      //   911: iload 4
      //   913: ifeq +14 -> 927
      //   916: aload_1
      //   917: lload_2
      //   918: aload 10
      //   920: invokevirtual 363	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getPackType	()Ljava/lang/String;
      //   923: iconst_1
      //   924: invokestatic 367	com/adobe/creativesdk/aviary/internal/cds/CdsUtils:notifyDownloadStatusChange	(Landroid/content/Context;JLjava/lang/String;I)V
      //   927: aload 9
      //   929: invokevirtual 368	android/net/Uri:toString	()Ljava/lang/String;
      //   932: areturn
      //   933: astore_1
      //   934: aload 14
      //   936: invokestatic 199	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
      //   939: aload_1
      //   940: athrow
      //   941: aconst_null
      //   942: astore 14
      //   944: goto +188 -> 1132
      //   947: aload 13
      //   949: astore 12
      //   951: getstatic 96	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   954: new 56	java/lang/StringBuilder
      //   957: dup
      //   958: invokespecial 57	java/lang/StringBuilder:<init>	()V
      //   961: ldc_w 370
      //   964: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   967: aload 17
      //   969: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   972: ldc_w 372
      //   975: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   978: lload 7
      //   980: invokevirtual 149	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
      //   983: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   986: invokeinterface 270 2 0
      //   991: aload 16
      //   993: invokestatic 199	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
      //   996: aload 13
      //   998: invokestatic 199	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
      //   1001: aload 14
      //   1003: areturn
      //   1004: aload 13
      //   1006: astore 12
      //   1008: getstatic 96	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   1011: ldc_w 374
      //   1014: invokeinterface 270 2 0
      //   1019: goto -475 -> 544
      //   1022: astore_1
      //   1023: aload 16
      //   1025: invokestatic 199	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
      //   1028: aload 12
      //   1030: invokestatic 199	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
      //   1033: aload_1
      //   1034: athrow
      //   1035: aload 13
      //   1037: astore 12
      //   1039: getstatic 96	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   1042: ldc_w 376
      //   1045: invokeinterface 287 2 0
      //   1050: goto -506 -> 544
      //   1053: aload 13
      //   1055: astore 12
      //   1057: getstatic 96	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   1060: ldc_w 378
      //   1063: invokeinterface 287 2 0
      //   1068: goto -524 -> 544
      //   1071: aload 13
      //   1073: astore 12
      //   1075: getstatic 96	com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   1078: ldc_w 380
      //   1081: invokeinterface 287 2 0
      //   1086: goto -542 -> 544
      //   1089: ldc_w 382
      //   1092: astore 9
      //   1094: goto -397 -> 697
      //   1097: new 56	java/lang/StringBuilder
      //   1100: dup
      //   1101: invokespecial 57	java/lang/StringBuilder:<init>	()V
      //   1104: invokestatic 317	java/lang/System:currentTimeMillis	()J
      //   1107: invokevirtual 149	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
      //   1110: ldc_w 311
      //   1113: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   1116: aload 11
      //   1118: invokevirtual 309	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
      //   1121: invokevirtual 61	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   1124: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   1127: astore 11
      //   1129: goto -368 -> 761
      //   1132: iload 5
      //   1134: lookupswitch	default:+50->1184, 1:+-99->1035, 2:+-187->947, 4:+-81->1053, 8:+-63->1071, 16:+-130->1004
      //   1184: goto -655 -> 529
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	1187	0	this	ContentDownloader
      //   0	1187	1	paramContext	Context
      //   0	1187	2	paramLong	long
      //   0	1187	4	paramBoolean	boolean
      //   487	646	5	i	int
      //   503	15	6	j	int
      //   402	577	7	l	long
      //   39	1054	9	localObject1	Object
      //   63	856	10	localObject2	Object
      //   66	1062	11	localObject3	Object
      //   72	1002	12	localObject4	Object
      //   53	1019	13	localObject5	Object
      //   153	849	14	localObject6	Object
      //   347	447	15	localDownloadManager	android.app.DownloadManager
      //   336	688	16	localCursor	Cursor
      //   292	676	17	str	String
      // Exception table:
      //   from	to	target	type
      //   168	192	933	finally
      //   372	382	1022	finally
      //   386	404	1022	finally
      //   408	417	1022	finally
      //   421	435	1022	finally
      //   439	448	1022	finally
      //   457	467	1022	finally
      //   471	489	1022	finally
      //   493	505	1022	finally
      //   515	526	1022	finally
      //   533	544	1022	finally
      //   548	562	1022	finally
      //   566	607	1022	finally
      //   611	644	1022	finally
      //   657	668	1022	finally
      //   951	991	1022	finally
      //   1008	1019	1022	finally
      //   1039	1050	1022	finally
      //   1057	1068	1022	finally
      //   1075	1086	1022	finally
    }
  }
  
  static class DetailImageDownloader
    extends CdsDownloaderFactory.Downloader
  {
    DetailImageDownloader() {}
    
    public String download(Context paramContext, long paramLong, boolean paramBoolean)
      throws IOException, AssertionError
    {
      Assert.assertNotNull("null context", paramContext);
      Object localObject1 = CdsUtils.getManifestVersion(paramContext);
      Assert.assertNotNull("null manifest", localObject1);
      String str = ((VersionColumns.CursorWrapper)localObject1).getAssetsBaseURL();
      Assert.assertNotNull("null baseUrl", str);
      Object localObject2 = null;
      Object localObject3 = null;
      localObject1 = null;
      Object localObject4 = null;
      Cursor localCursor = paramContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(paramContext, "pack/id/" + paramLong + "/content"), new String[] { "pack_id", "pack_identifier", "content_id", "content_packId", getRemoteUrlColumnName(), getLocalPathColumnName() }, null, null, null);
      if (localCursor != null)
      {
        localObject1 = localObject4;
        localObject2 = localObject3;
      }
      try
      {
        if (localCursor.moveToFirst())
        {
          localObject2 = PacksColumns.PackCursorWrapper.create(localCursor);
          localObject1 = PacksContentColumns.ContentCursorWrapper.create(localCursor);
        }
        com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently(localCursor);
        Assert.assertNotNull("null pack", localObject2);
        Assert.assertNotNull("null content", localObject1);
        localObject4 = getRemotePath((PacksContentColumns.ContentCursorWrapper)localObject1);
        localObject3 = getLocalPath((PacksContentColumns.ContentCursorWrapper)localObject1);
        if (!TextUtils.isEmpty((CharSequence)localObject3))
        {
          localObject3 = new File((String)localObject3);
          CdsDownloaderFactory.LOGGER.log("localPath exists: %b", new Object[] { Boolean.valueOf(((File)localObject3).exists()) });
          if (((File)localObject3).exists()) {
            return ((File)localObject3).getAbsolutePath();
          }
        }
      }
      finally
      {
        com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently(localCursor);
      }
      localObject3 = localObject4;
      if (!TextUtils.isEmpty((CharSequence)localObject4))
      {
        localObject3 = localObject4;
        if (!((String)localObject4).startsWith("http://"))
        {
          localObject3 = localObject4;
          if (!((String)localObject4).startsWith("https://"))
          {
            localObject3 = localObject4;
            if (!((String)localObject4).startsWith("file://")) {
              localObject3 = str + (String)localObject4;
            }
          }
        }
      }
      localObject2 = ((PacksColumns.PackCursorWrapper)localObject2).getIdentifier();
      long l = ((PacksContentColumns.ContentCursorWrapper)localObject1).getId();
      localObject1 = getCacheDirName();
      localObject4 = CdsDownloaderFactory.getCacheDir(paramContext, (String)localObject1);
      Assert.assertNotNull("destination directory is null: " + (String)localObject1, localObject4);
      localObject1 = new File((File)localObject4, (String)localObject2 + ".jpg");
      localObject2 = com.adobe.creativesdk.aviary.internal.utils.IOUtils.hunt(paramContext, (String)localObject3);
      localObject3 = new FileOutputStream((File)localObject1);
      org.apache.commons.io.IOUtils.copy((InputStream)localObject2, (OutputStream)localObject3);
      com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently((Closeable)localObject2);
      com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently((Closeable)localObject3);
      localObject2 = new ContentValues();
      ((ContentValues)localObject2).put(getLocalPathColumnName(), ((File)localObject1).getAbsolutePath());
      if (paramContext.getContentResolver().update(PackageManagerUtils.getCDSProviderContentUri(paramContext, "pack/id/" + paramLong + "/content/id/" + l + "/update"), (ContentValues)localObject2, null, null) > 0) {}
      for (boolean bool = true;; bool = false)
      {
        Assert.assertTrue("failed to update the provider", bool);
        if (paramBoolean) {
          CdsUtils.notifyPackContentUpdate(paramContext, paramLong);
        }
        return ((File)localObject1).getAbsolutePath();
      }
    }
    
    protected String getCacheDirName()
    {
      return "aviary-cds-detail-image-cache";
    }
    
    protected String getLocalPath(PacksContentColumns.ContentCursorWrapper paramContentCursorWrapper)
    {
      return paramContentCursorWrapper.getDetailImageLocalPath();
    }
    
    protected String getLocalPathColumnName()
    {
      return "content_detailImageLocalPath";
    }
    
    protected String getRemotePath(PacksContentColumns.ContentCursorWrapper paramContentCursorWrapper)
    {
      return paramContentCursorWrapper.getDetailImageURL();
    }
    
    protected String getRemoteUrlColumnName()
    {
      return "content_detailImageURL";
    }
  }
  
  public static abstract class Downloader
  {
    public Downloader() {}
    
    public final String download(Context paramContext, long paramLong)
      throws IOException, AssertionError
    {
      return download(paramContext, paramLong, true);
    }
    
    public abstract String download(Context paramContext, long paramLong, boolean paramBoolean)
      throws IOException, AssertionError;
    
    public final void downloadAsync(Context paramContext, long paramLong, CdsDownloaderFactory.DownloaderAsyncListener paramDownloaderAsyncListener)
    {
      new CdsDownloaderFactory.DownloaderAsync(paramContext, paramLong, paramDownloaderAsyncListener).execute(new Downloader[] { this });
    }
  }
  
  static final class DownloaderAsync
    extends AsyncTask<CdsDownloaderFactory.Downloader, Void, String>
  {
    Context context;
    SoftReference<CdsDownloaderFactory.DownloaderAsyncListener> listener;
    final long packId;
    
    DownloaderAsync(Context paramContext, long paramLong, CdsDownloaderFactory.DownloaderAsyncListener paramDownloaderAsyncListener)
    {
      context = paramContext;
      packId = paramLong;
      listener = new SoftReference(paramDownloaderAsyncListener);
    }
    
    protected String doInBackground(CdsDownloaderFactory.Downloader... paramVarArgs)
    {
      try
      {
        paramVarArgs = paramVarArgs[0].download(context, packId);
        return paramVarArgs;
      }
      catch (IOException paramVarArgs)
      {
        paramVarArgs.printStackTrace();
      }
      return null;
    }
    
    protected void onPostExecute(String paramString)
    {
      super.onPostExecute(paramString);
      CdsDownloaderFactory.DownloaderAsyncListener localDownloaderAsyncListener = (CdsDownloaderFactory.DownloaderAsyncListener)listener.get();
      if (localDownloaderAsyncListener != null)
      {
        localDownloaderAsyncListener.onDownloadComplete(packId, paramString);
        return;
      }
      Log.w("DownloaderAsync", "listener is null");
    }
  }
  
  public static abstract interface DownloaderAsyncListener
  {
    public abstract void onDownloadComplete(long paramLong, String paramString);
  }
  
  static class FeatureImageDownloader
    extends CdsDownloaderFactory.DetailImageDownloader
  {
    FeatureImageDownloader() {}
    
    protected String getCacheDirName()
    {
      return "aviary-cds-featured-image-cache";
    }
    
    protected String getLocalPath(PacksContentColumns.ContentCursorWrapper paramContentCursorWrapper)
    {
      return paramContentCursorWrapper.getFeatureImageLocalPath();
    }
    
    protected String getLocalPathColumnName()
    {
      return "content_featureImageLocalPath";
    }
    
    protected String getRemotePath(PacksContentColumns.ContentCursorWrapper paramContentCursorWrapper)
    {
      return paramContentCursorWrapper.getFeatureImageURL();
    }
    
    protected String getRemoteUrlColumnName()
    {
      return "content_featureImageURL";
    }
  }
  
  static class MessageDownloader
    extends CdsDownloaderFactory.Downloader
  {
    MessageDownloader() {}
    
    public String download(Context paramContext, long paramLong, boolean paramBoolean)
      throws IOException, AssertionError
    {
      Assert.assertNotNull("null context", paramContext);
      Object localObject1 = CdsUtils.getManifestVersion(paramContext);
      Assert.assertNotNull("null manifest", localObject1);
      Object localObject5 = ((VersionColumns.CursorWrapper)localObject1).getAssetsBaseURL();
      Assert.assertNotNull("null baseUrl", localObject5);
      localObject1 = null;
      Object localObject4 = null;
      Object localObject2 = null;
      Object localObject3 = null;
      Cursor localCursor = paramContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(paramContext, "message/id/" + paramLong + "/content"), new String[] { "msg_id", "msg_identifier", "msg_type", "msgcnt_id", "msgcnt_messageId", "msgcnt_contentURL" }, null, null, null);
      if (localCursor != null)
      {
        localObject1 = localObject4;
        localObject2 = localObject3;
      }
      for (;;)
      {
        try
        {
          if (localCursor.moveToFirst())
          {
            localObject1 = MessageColumns.MessageCursorWrapper.create(localCursor);
            localObject2 = MessageContentColumn.MessageContentCursorWrapper.create(localCursor);
          }
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently(localCursor);
          Assert.assertNotNull("message is null", localObject1);
          Assert.assertNotNull("messageContent is null", localObject2);
          localObject4 = ((MessageContentColumn.MessageContentCursorWrapper)localObject2).getContentURL();
          localObject3 = localObject4;
          if (!TextUtils.isEmpty((CharSequence)localObject4))
          {
            localObject3 = localObject4;
            if (!((String)localObject4).startsWith("http://"))
            {
              localObject3 = localObject4;
              if (!((String)localObject4).startsWith("https://")) {
                localObject3 = (String)localObject5 + (String)localObject4;
              }
            }
          }
          localObject4 = ((MessageColumns.MessageCursorWrapper)localObject1).getIdentifier();
          localObject5 = CdsDownloaderFactory.getCacheDir(paramContext, getCacheDirName());
          Assert.assertNotNull("destination directory is null", localObject5);
          ((File)localObject5).setReadable(true, false);
          localObject4 = new File((File)localObject5, (String)localObject4 + ".jpg");
          localObject3 = com.adobe.creativesdk.aviary.internal.utils.IOUtils.download((String)localObject3, null);
          localObject5 = new FileOutputStream((File)localObject4);
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.copyFile((InputStream)localObject3, (OutputStream)localObject5);
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently((Closeable)localObject3);
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently((Closeable)localObject5);
          localObject3 = new ContentValues();
          ((ContentValues)localObject3).put("msgcnt_contentPath", ((File)localObject4).getAbsolutePath());
          if (paramContext.getContentResolver().update(PackageManagerUtils.getCDSProviderContentUri(paramContext, "message/id/" + ((MessageColumns.MessageCursorWrapper)localObject1).getId() + "/content/id/" + ((MessageContentColumn.MessageContentCursorWrapper)localObject2).getId() + "/update"), (ContentValues)localObject3, null, null) > 0)
          {
            bool = true;
            Assert.assertTrue("failed to update the provider", bool);
            if (paramBoolean) {
              CdsUtils.notifyMessageContentUpdate(paramContext, paramLong);
            }
            return ((File)localObject4).getAbsolutePath();
          }
        }
        finally
        {
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently(localCursor);
        }
        boolean bool = false;
      }
    }
    
    protected String getCacheDirName()
    {
      return "aviary-cds-message-image-cache";
    }
  }
  
  static class PreviewDownloader
    extends CdsDownloaderFactory.Downloader
  {
    PreviewDownloader() {}
    
    public String download(Context paramContext, long paramLong, boolean paramBoolean)
      throws IOException, AssertionError
    {
      Assert.assertNotNull("null context", paramContext);
      Object localObject1 = CdsUtils.getManifestVersion(paramContext);
      Assert.assertNotNull("null manifest", localObject1);
      String str2 = ((VersionColumns.CursorWrapper)localObject1).getAssetsBaseURL();
      Assert.assertNotNull("null baseUrl", str2);
      Object localObject2 = null;
      Object localObject3 = null;
      localObject1 = null;
      String str1 = null;
      Cursor localCursor = paramContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(paramContext, "pack/id/" + paramLong + "/content"), new String[] { "pack_id", "pack_identifier", "pack_type", "content_id", "content_packId", "content_previewURL" }, null, null, null);
      if (localCursor != null)
      {
        localObject1 = str1;
        localObject2 = localObject3;
      }
      for (;;)
      {
        try
        {
          if (localCursor.moveToFirst())
          {
            localObject2 = PacksColumns.PackCursorWrapper.create(localCursor);
            localObject1 = PacksContentColumns.ContentCursorWrapper.create(localCursor);
          }
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently(localCursor);
          Assert.assertNotNull("null pack", localObject2);
          Assert.assertNotNull("null content", localObject1);
          str1 = ((PacksContentColumns.ContentCursorWrapper)localObject1).getPreviewURL();
          localObject3 = str1;
          if (!TextUtils.isEmpty(str1))
          {
            localObject3 = str1;
            if (!str1.startsWith("http://"))
            {
              localObject3 = str1;
              if (!str1.startsWith("https://"))
              {
                localObject3 = str1;
                if (!str1.startsWith("file://")) {
                  localObject3 = str2 + str1;
                }
              }
            }
          }
          str1 = ((PacksColumns.PackCursorWrapper)localObject2).getIdentifier();
          localObject2 = ((PacksColumns.PackCursorWrapper)localObject2).getPackType();
          long l = ((PacksContentColumns.ContentCursorWrapper)localObject1).getId();
          localObject3 = com.adobe.creativesdk.aviary.internal.utils.IOUtils.hunt(paramContext, (String)localObject3);
          localObject1 = CdsDownloaderFactory.getCacheDir(paramContext, getCacheDirName());
          Assert.assertNotNull("destination directory is null", localObject1);
          ((File)localObject1).setReadable(true, false);
          localObject1 = new File((File)localObject1, str1);
          ((File)localObject1).mkdirs();
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.createNoMediaFile((File)localObject1);
          Assert.assertTrue("failed to create dest folder: " + str1, ((File)localObject1).exists());
          ((File)localObject1).setReadable(true, false);
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.unzip((InputStream)localObject3, (File)localObject1);
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently((Closeable)localObject3);
          localObject2 = Cds.PackType.valueOf(((String)localObject2).toUpperCase(Locale.US));
          Assert.assertTrue("invalid preview content", CdsValidatorFactory.create(Cds.ContentType.PREVIEW, (Cds.PackType)localObject2).validate(paramContext, paramLong, (File)localObject1, false));
          localObject2 = new ContentValues();
          ((ContentValues)localObject2).put("content_previewPath", ((File)localObject1).getAbsolutePath());
          if (paramContext.getContentResolver().update(PackageManagerUtils.getCDSProviderContentUri(paramContext, "pack/id/" + paramLong + "/content/id/" + l + "/update"), (ContentValues)localObject2, null, null) > 0)
          {
            bool = true;
            Assert.assertTrue("failed to update the provider", bool);
            if (paramBoolean) {
              CdsUtils.notifyPackContentUpdate(paramContext, paramLong);
            }
            return ((File)localObject1).getAbsolutePath();
          }
        }
        finally
        {
          com.adobe.creativesdk.aviary.internal.utils.IOUtils.closeSilently(localCursor);
        }
        boolean bool = false;
      }
    }
    
    protected String getCacheDirName()
    {
      return "aviary-cds-preview-image-cache";
    }
  }
}
