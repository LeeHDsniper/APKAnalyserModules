package com.adobe.creativesdk.aviary.internal.cds;

import android.content.Context;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.HashSet;

public final class CdsManifestMessagesRemoverConsumer
{
  private static LoggerFactory.Logger logger = LoggerFactory.getLogger("AviaryCdsManifestPackRemoverConsumer");
  private final Context mContext;
  private final CdsManifestParser mManifestParser;
  private final HashSet<String> mRemovedMessageTypes;
  
  private CdsManifestMessagesRemoverConsumer(Context paramContext, CdsManifestParser paramCdsManifestParser)
  {
    mContext = paramContext;
    mManifestParser = paramCdsManifestParser;
    mRemovedMessageTypes = new HashSet();
  }
  
  /* Error */
  void consume()
  {
    // Byte code:
    //   0: invokestatic 53	com/adobe/creativesdk/aviary/internal/utils/SystemUtils:throwIfUiThread	()V
    //   3: aload_0
    //   4: getfield 39	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:mManifestParser	Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    //   7: invokevirtual 59	com/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser:hasContent	()Z
    //   10: ifeq +333 -> 343
    //   13: aload_0
    //   14: getfield 37	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:mContext	Landroid/content/Context;
    //   17: invokevirtual 65	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   20: aload_0
    //   21: getfield 37	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:mContext	Landroid/content/Context;
    //   24: ldc 67
    //   26: invokestatic 73	com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils:getCDSProviderContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    //   29: aconst_null
    //   30: aconst_null
    //   31: aconst_null
    //   32: aconst_null
    //   33: invokevirtual 79	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   36: astore 4
    //   38: aload 4
    //   40: ifnull +303 -> 343
    //   43: aload 4
    //   45: invokeinterface 84 1 0
    //   50: ifeq +288 -> 338
    //   53: aload 4
    //   55: invokestatic 90	com/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper:create	(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    //   58: astore 6
    //   60: aload 6
    //   62: ifnull -19 -> 43
    //   65: aload_0
    //   66: getfield 39	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:mManifestParser	Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    //   69: aload 6
    //   71: invokevirtual 94	com/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper:getIdentifier	()Ljava/lang/String;
    //   74: invokevirtual 98	com/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser:containsMessage	(Ljava/lang/String;)Z
    //   77: ifne -34 -> 43
    //   80: getstatic 30	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   83: ldc 100
    //   85: iconst_1
    //   86: anewarray 4	java/lang/Object
    //   89: dup
    //   90: iconst_0
    //   91: aload 6
    //   93: invokevirtual 94	com/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper:getIdentifier	()Ljava/lang/String;
    //   96: aastore
    //   97: invokeinterface 106 3 0
    //   102: aconst_null
    //   103: astore_2
    //   104: aconst_null
    //   105: astore_3
    //   106: aload_0
    //   107: getfield 37	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:mContext	Landroid/content/Context;
    //   110: invokevirtual 65	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   113: aload_0
    //   114: getfield 37	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:mContext	Landroid/content/Context;
    //   117: new 108	java/lang/StringBuilder
    //   120: dup
    //   121: invokespecial 109	java/lang/StringBuilder:<init>	()V
    //   124: ldc 111
    //   126: invokevirtual 115	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   129: aload 6
    //   131: invokevirtual 119	com/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper:getId	()J
    //   134: invokevirtual 122	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   137: ldc 124
    //   139: invokevirtual 115	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: invokevirtual 127	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   145: invokestatic 73	com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils:getCDSProviderContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    //   148: iconst_3
    //   149: anewarray 129	java/lang/String
    //   152: dup
    //   153: iconst_0
    //   154: ldc -125
    //   156: aastore
    //   157: dup
    //   158: iconst_1
    //   159: ldc -123
    //   161: aastore
    //   162: dup
    //   163: iconst_2
    //   164: ldc -121
    //   166: aastore
    //   167: aconst_null
    //   168: aconst_null
    //   169: aconst_null
    //   170: invokevirtual 79	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   173: astore 5
    //   175: aload 5
    //   177: ifnull +29 -> 206
    //   180: aload_3
    //   181: astore_2
    //   182: aload 5
    //   184: invokeinterface 138 1 0
    //   189: ifeq +12 -> 201
    //   192: aload 5
    //   194: invokestatic 143	com/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper:create	(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    //   197: invokevirtual 146	com/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper:getContentPath	()Ljava/lang/String;
    //   200: astore_2
    //   201: aload 5
    //   203: invokestatic 152	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
    //   206: aload_0
    //   207: getfield 37	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:mContext	Landroid/content/Context;
    //   210: invokevirtual 65	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   213: aload_0
    //   214: getfield 37	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:mContext	Landroid/content/Context;
    //   217: new 108	java/lang/StringBuilder
    //   220: dup
    //   221: invokespecial 109	java/lang/StringBuilder:<init>	()V
    //   224: ldc 111
    //   226: invokevirtual 115	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   229: aload 6
    //   231: invokevirtual 119	com/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper:getId	()J
    //   234: invokevirtual 122	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   237: ldc -102
    //   239: invokevirtual 115	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   242: invokevirtual 127	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   245: invokestatic 73	com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils:getCDSProviderContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    //   248: aconst_null
    //   249: aconst_null
    //   250: invokevirtual 158	android/content/ContentResolver:delete	(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    //   253: ifle +72 -> 325
    //   256: aload_2
    //   257: ifnull +36 -> 293
    //   260: new 160	java/io/File
    //   263: dup
    //   264: aload_2
    //   265: invokespecial 163	java/io/File:<init>	(Ljava/lang/String;)V
    //   268: invokestatic 167	com/adobe/creativesdk/aviary/internal/utils/IOUtils:deleteQuietly	(Ljava/io/File;)Z
    //   271: istore_1
    //   272: getstatic 30	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   275: ldc -87
    //   277: iconst_1
    //   278: anewarray 4	java/lang/Object
    //   281: dup
    //   282: iconst_0
    //   283: iload_1
    //   284: invokestatic 175	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   287: aastore
    //   288: invokeinterface 178 3 0
    //   293: aload_0
    //   294: getfield 44	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:mRemovedMessageTypes	Ljava/util/HashSet;
    //   297: aload 6
    //   299: invokevirtual 181	com/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper:getMessageType	()Ljava/lang/String;
    //   302: invokevirtual 185	java/util/HashSet:add	(Ljava/lang/Object;)Z
    //   305: pop
    //   306: goto -263 -> 43
    //   309: astore_2
    //   310: aload 4
    //   312: invokestatic 152	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
    //   315: aload_2
    //   316: athrow
    //   317: astore_2
    //   318: aload 5
    //   320: invokestatic 152	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
    //   323: aload_2
    //   324: athrow
    //   325: getstatic 30	com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   328: ldc -69
    //   330: invokeinterface 190 2 0
    //   335: goto -292 -> 43
    //   338: aload 4
    //   340: invokestatic 152	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/database/Cursor;)V
    //   343: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	344	0	this	CdsManifestMessagesRemoverConsumer
    //   271	13	1	bool	boolean
    //   103	162	2	localObject1	Object
    //   309	7	2	localObject2	Object
    //   317	7	2	localObject3	Object
    //   105	76	3	localObject4	Object
    //   36	303	4	localCursor1	android.database.Cursor
    //   173	146	5	localCursor2	android.database.Cursor
    //   58	240	6	localMessageCursorWrapper	MessageColumns.MessageCursorWrapper
    // Exception table:
    //   from	to	target	type
    //   43	60	309	finally
    //   65	102	309	finally
    //   106	175	309	finally
    //   201	206	309	finally
    //   206	256	309	finally
    //   260	293	309	finally
    //   293	306	309	finally
    //   318	325	309	finally
    //   325	335	309	finally
    //   182	201	317	finally
  }
  
  static class Builder
  {
    private final Context context;
    private CdsManifestParser parser;
    
    Builder(Context paramContext)
    {
      context = paramContext;
    }
    
    CdsManifestMessagesRemoverConsumer build()
    {
      if (context == null) {
        throw new IllegalArgumentException("Context is null");
      }
      if (parser == null) {
        throw new IllegalArgumentException("Parser is null");
      }
      return new CdsManifestMessagesRemoverConsumer(context, parser, null);
    }
    
    Builder withParser(CdsManifestParser paramCdsManifestParser)
    {
      parser = paramCdsManifestParser;
      return this;
    }
  }
}
