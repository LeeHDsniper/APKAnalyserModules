package com.adobe.creativesdk.aviary.internal.cds;

import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import junit.framework.Assert;

class CdsContentValidator
  extends CdsValidatorFactory.Validator
{
  ContentValidator mInstance;
  
  public CdsContentValidator(Cds.PackType paramPackType)
  {
    super(paramPackType);
    switch (1.$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType[paramPackType.ordinal()])
    {
    default: 
      mInstance = null;
      return;
    case 1: 
      mInstance = new FrameValidator();
      return;
    case 2: 
      mInstance = new EffectValidator();
      return;
    case 3: 
      mInstance = new StickerValidator();
      return;
    }
    mInstance = new OverlayValidator();
  }
  
  /* Error */
  public boolean validate(android.content.Context paramContext, long paramLong, java.io.File paramFile, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 56	com/adobe/creativesdk/aviary/internal/cds/CdsContentValidator:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   4: new 58	java/lang/StringBuilder
    //   7: dup
    //   8: invokespecial 59	java/lang/StringBuilder:<init>	()V
    //   11: ldc 61
    //   13: invokevirtual 65	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   16: lload_2
    //   17: invokevirtual 68	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   20: ldc 70
    //   22: invokevirtual 65	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   25: aload 4
    //   27: invokevirtual 76	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   30: invokevirtual 65	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   33: invokevirtual 79	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   36: invokeinterface 85 2 0
    //   41: aconst_null
    //   42: astore 9
    //   44: aconst_null
    //   45: astore 8
    //   47: iload 5
    //   49: ifeq +232 -> 281
    //   52: new 87	java/util/zip/ZipFile
    //   55: dup
    //   56: aload 4
    //   58: invokespecial 90	java/util/zip/ZipFile:<init>	(Ljava/io/File;)V
    //   61: astore 4
    //   63: aload_1
    //   64: invokevirtual 96	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   67: aload_1
    //   68: new 58	java/lang/StringBuilder
    //   71: dup
    //   72: invokespecial 59	java/lang/StringBuilder:<init>	()V
    //   75: ldc 98
    //   77: invokevirtual 65	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   80: lload_2
    //   81: invokevirtual 68	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   84: ldc 100
    //   86: invokevirtual 65	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   89: invokevirtual 79	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   92: invokestatic 106	com/adobe/creativesdk/aviary/internal/cds/CdsUtils:getContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    //   95: iconst_2
    //   96: anewarray 108	java/lang/String
    //   99: dup
    //   100: iconst_0
    //   101: ldc 110
    //   103: aastore
    //   104: dup
    //   105: iconst_1
    //   106: ldc 112
    //   108: aastore
    //   109: aconst_null
    //   110: aconst_null
    //   111: aconst_null
    //   112: invokevirtual 118	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   115: astore_1
    //   116: ldc 120
    //   118: aload_1
    //   119: invokestatic 126	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
    //   122: aload_1
    //   123: ifnull +257 -> 380
    //   126: aload_1
    //   127: ldc 112
    //   129: invokeinterface 132 2 0
    //   134: istore 6
    //   136: iload 6
    //   138: iconst_m1
    //   139: if_icmple +159 -> 298
    //   142: iconst_1
    //   143: istore 7
    //   145: ldc -122
    //   147: iload 7
    //   149: invokestatic 138	junit/framework/Assert:assertTrue	(Ljava/lang/String;Z)V
    //   152: aload_1
    //   153: invokeinterface 141 1 0
    //   158: ifle +146 -> 304
    //   161: iconst_1
    //   162: istore 7
    //   164: ldc -113
    //   166: iload 7
    //   168: invokestatic 138	junit/framework/Assert:assertTrue	(Ljava/lang/String;Z)V
    //   171: aload_1
    //   172: invokeinterface 147 1 0
    //   177: ifeq +178 -> 355
    //   180: aload_1
    //   181: iload 6
    //   183: invokeinterface 151 2 0
    //   188: astore 9
    //   190: ldc -103
    //   192: aload 9
    //   194: invokestatic 126	junit/framework/Assert:assertNotNull	(Ljava/lang/String;Ljava/lang/Object;)V
    //   197: aload_0
    //   198: getfield 56	com/adobe/creativesdk/aviary/internal/cds/CdsContentValidator:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   201: ldc -101
    //   203: iconst_1
    //   204: anewarray 157	java/lang/Object
    //   207: dup
    //   208: iconst_0
    //   209: aload 9
    //   211: aastore
    //   212: invokeinterface 161 3 0
    //   217: iload 5
    //   219: ifeq +91 -> 310
    //   222: aload_0
    //   223: getfield 39	com/adobe/creativesdk/aviary/internal/cds/CdsContentValidator:mInstance	Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;
    //   226: aload 9
    //   228: aload 4
    //   230: invokevirtual 165	com/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator:validateItem	(Ljava/lang/String;Ljava/util/zip/ZipFile;)Z
    //   233: ifne -62 -> 171
    //   236: aload_0
    //   237: getfield 56	com/adobe/creativesdk/aviary/internal/cds/CdsContentValidator:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   240: ldc -89
    //   242: iconst_1
    //   243: anewarray 157	java/lang/Object
    //   246: dup
    //   247: iconst_0
    //   248: aload 9
    //   250: aastore
    //   251: invokeinterface 170 3 0
    //   256: aload_1
    //   257: invokestatic 176	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
    //   260: aload 4
    //   262: invokestatic 179	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/util/zip/ZipFile;)V
    //   265: iconst_0
    //   266: ireturn
    //   267: astore_1
    //   268: aload_1
    //   269: invokevirtual 182	java/util/zip/ZipException:printStackTrace	()V
    //   272: iconst_0
    //   273: ireturn
    //   274: astore_1
    //   275: aload_1
    //   276: invokevirtual 183	java/io/IOException:printStackTrace	()V
    //   279: iconst_0
    //   280: ireturn
    //   281: aload 4
    //   283: invokevirtual 187	java/io/File:list	()[Ljava/lang/String;
    //   286: invokestatic 193	java/util/Arrays:asList	([Ljava/lang/Object;)Ljava/util/List;
    //   289: astore 8
    //   291: aload 9
    //   293: astore 4
    //   295: goto -232 -> 63
    //   298: iconst_0
    //   299: istore 7
    //   301: goto -156 -> 145
    //   304: iconst_0
    //   305: istore 7
    //   307: goto -143 -> 164
    //   310: aload_0
    //   311: getfield 39	com/adobe/creativesdk/aviary/internal/cds/CdsContentValidator:mInstance	Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;
    //   314: aload 9
    //   316: aload 8
    //   318: invokevirtual 196	com/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator:validateItem	(Ljava/lang/String;Ljava/util/List;)Z
    //   321: ifne -150 -> 171
    //   324: aload_0
    //   325: getfield 56	com/adobe/creativesdk/aviary/internal/cds/CdsContentValidator:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   328: ldc -89
    //   330: iconst_1
    //   331: anewarray 157	java/lang/Object
    //   334: dup
    //   335: iconst_0
    //   336: aload 9
    //   338: aastore
    //   339: invokeinterface 170 3 0
    //   344: aload_1
    //   345: invokestatic 176	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
    //   348: aload 4
    //   350: invokestatic 179	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/util/zip/ZipFile;)V
    //   353: iconst_0
    //   354: ireturn
    //   355: aload_1
    //   356: invokestatic 176	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
    //   359: aload 4
    //   361: invokestatic 179	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/util/zip/ZipFile;)V
    //   364: iconst_1
    //   365: ireturn
    //   366: astore 8
    //   368: aload_1
    //   369: invokestatic 176	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
    //   372: aload 4
    //   374: invokestatic 179	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/util/zip/ZipFile;)V
    //   377: aload 8
    //   379: athrow
    //   380: iconst_0
    //   381: ireturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	382	0	this	CdsContentValidator
    //   0	382	1	paramContext	android.content.Context
    //   0	382	2	paramLong	long
    //   0	382	4	paramFile	java.io.File
    //   0	382	5	paramBoolean	boolean
    //   134	48	6	i	int
    //   143	163	7	bool	boolean
    //   45	272	8	localList	List
    //   366	12	8	localObject	Object
    //   42	295	9	str	String
    // Exception table:
    //   from	to	target	type
    //   52	63	267	java/util/zip/ZipException
    //   52	63	274	java/io/IOException
    //   126	136	366	finally
    //   145	161	366	finally
    //   164	171	366	finally
    //   171	217	366	finally
    //   222	256	366	finally
    //   310	344	366	finally
  }
  
  static abstract class ContentValidator
  {
    ContentValidator() {}
    
    abstract boolean validateItem(String paramString, List<String> paramList)
      throws AssertionError;
    
    abstract boolean validateItem(String paramString, ZipFile paramZipFile)
      throws AssertionError;
  }
  
  static class EffectValidator
    extends CdsContentValidator.ContentValidator
  {
    EffectValidator() {}
    
    boolean validateItem(String paramString, List<String> paramList)
      throws AssertionError
    {
      return paramList.contains(paramString + ".json");
    }
    
    boolean validateItem(String paramString, ZipFile paramZipFile)
      throws AssertionError
    {
      Assert.assertNotNull("identifier is null", paramString);
      Assert.assertNotNull("zip is null", paramZipFile);
      paramZipFile = paramZipFile.getEntry(paramString + ".json");
      Assert.assertNotNull(paramString + ".json", paramZipFile);
      return true;
    }
  }
  
  static class FrameValidator
    extends CdsContentValidator.ContentValidator
  {
    FrameValidator() {}
    
    boolean validateItem(String paramString, List<String> paramList)
      throws AssertionError
    {
      if (!paramList.contains(paramString + "-small.png")) {}
      while ((!paramList.contains(paramString + "-br-medium.png")) || (!paramList.contains(paramString + "-r-medium.png")) || (!paramList.contains(paramString + "-tr-medium.png")) || (!paramList.contains(paramString + "-t-medium.png")) || (!paramList.contains(paramString + "-tl-medium.png")) || (!paramList.contains(paramString + "-l-medium.png")) || (!paramList.contains(paramString + "-b-medium.png")) || (!paramList.contains(paramString + "-bl-medium.png")) || (!paramList.contains(paramString + "-br-medium.png")) || (!paramList.contains(paramString + "-br-large.png")) || (!paramList.contains(paramString + "-r-large.png")) || (!paramList.contains(paramString + "-tr-large.png")) || (!paramList.contains(paramString + "-t-large.png")) || (!paramList.contains(paramString + "-tl-large.png")) || (!paramList.contains(paramString + "-l-large.png")) || (!paramList.contains(paramString + "-b-large.png")) || (!paramList.contains(paramString + "-bl-large.png"))) {
        return false;
      }
      return paramList.contains(paramString + "-br-large.png");
    }
    
    boolean validateItem(String paramString, ZipFile paramZipFile)
    {
      Assert.assertNotNull("identifier is null", paramString);
      Assert.assertNotNull("zip is null", paramZipFile);
      ZipEntry localZipEntry = paramZipFile.getEntry(paramString + "-small.png");
      Assert.assertNotNull(paramString + "-small.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-br-medium.png");
      Assert.assertNotNull(paramString + "-br-medium.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-r-medium.png");
      Assert.assertNotNull(paramString + "-r-medium.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-tr-medium.png");
      Assert.assertNotNull(paramString + "-tr-medium.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-t-medium.png");
      Assert.assertNotNull(paramString + "-t-medium.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-tl-medium.png");
      Assert.assertNotNull(paramString + "-tl-medium.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-l-medium.png");
      Assert.assertNotNull(paramString + "-l-medium.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-b-medium.png");
      Assert.assertNotNull(paramString + "-b-medium.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-bl-medium.png");
      Assert.assertNotNull(paramString + "-bl-medium.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-br-medium.png");
      Assert.assertNotNull(paramString + "-br-medium.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-br-large.png");
      Assert.assertNotNull(paramString + "-br-large.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-r-large.png");
      Assert.assertNotNull(paramString + "-r-large.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-tr-large.png");
      Assert.assertNotNull(paramString + "-tr-large.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-t-large.png");
      Assert.assertNotNull(paramString + "-t-large.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-tl-large.png");
      Assert.assertNotNull(paramString + "-tl-large.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-l-large.png");
      Assert.assertNotNull(paramString + "-l-large.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-b-large.png");
      Assert.assertNotNull(paramString + "-b-large.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-bl-large.png");
      Assert.assertNotNull(paramString + "-bl-large.png", localZipEntry);
      paramZipFile = paramZipFile.getEntry(paramString + "-br-large.png");
      Assert.assertNotNull(paramString + "-br-large.png", paramZipFile);
      return true;
    }
  }
  
  static class OverlayValidator
    extends CdsContentValidator.ContentValidator
  {
    OverlayValidator() {}
    
    boolean validateItem(String paramString, List<String> paramList)
      throws AssertionError
    {
      return true;
    }
    
    boolean validateItem(String paramString, ZipFile paramZipFile)
      throws AssertionError
    {
      return true;
    }
  }
  
  static class StickerValidator
    extends CdsContentValidator.ContentValidator
  {
    StickerValidator() {}
    
    boolean validateItem(String paramString, List<String> paramList)
      throws AssertionError
    {
      if (!paramList.contains(paramString + "-small.png")) {}
      while (!paramList.contains(paramString + "-medium.png")) {
        return false;
      }
      return paramList.contains(paramString + "-large.png");
    }
    
    boolean validateItem(String paramString, ZipFile paramZipFile)
      throws AssertionError
    {
      Assert.assertNotNull("identifier is null", paramString);
      Assert.assertNotNull("zip is null", paramZipFile);
      ZipEntry localZipEntry = paramZipFile.getEntry(paramString + "-small.png");
      Assert.assertNotNull(paramString + "-small.png", localZipEntry);
      localZipEntry = paramZipFile.getEntry(paramString + "-medium.png");
      Assert.assertNotNull(paramString + "-medium.png", localZipEntry);
      paramZipFile = paramZipFile.getEntry(paramString + "-large.png");
      Assert.assertNotNull(paramString + "-large.png", paramZipFile);
      return true;
    }
  }
}
