import android.content.ContentResolver;
import android.content.Context;
import com.tencent.mobileqq.app.utils.QQPimUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class nmp
{
  protected ContentResolver a;
  
  public nmp(QQPimUtil paramQQPimUtil, Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidContentContentResolver = paramContext.getContentResolver();
  }
  
  private String a()
  {
    String str = b();
    return "deleted = 0 AND (account_name is null or (account_name <> 'SIM' AND account_name <> 'UIM' AND account_type <> 'vnd.sec.contact.sim2'" + str + "))";
  }
  
  /* Error */
  private final void a(ArrayList paramArrayList)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aload_0
    //   3: getfield 28	nmp:jdField_a_of_type_AndroidContentContentResolver	Landroid/content/ContentResolver;
    //   6: astore_3
    //   7: getstatic 58	android/provider/ContactsContract$RawContacts:CONTENT_URI	Landroid/net/Uri;
    //   10: astore 4
    //   12: aload_0
    //   13: invokespecial 60	nmp:a	()Ljava/lang/String;
    //   16: astore 5
    //   18: aload_3
    //   19: aload 4
    //   21: iconst_1
    //   22: anewarray 62	java/lang/String
    //   25: dup
    //   26: iconst_0
    //   27: ldc 64
    //   29: aastore
    //   30: aload 5
    //   32: aconst_null
    //   33: aconst_null
    //   34: invokevirtual 70	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   37: astore_3
    //   38: aload_3
    //   39: astore_2
    //   40: aload_2
    //   41: ifnull +55 -> 96
    //   44: aload_2
    //   45: invokeinterface 76 1 0
    //   50: ifeq +46 -> 96
    //   53: aload_2
    //   54: invokeinterface 79 1 0
    //   59: ifne +37 -> 96
    //   62: aload_1
    //   63: aload_2
    //   64: iconst_0
    //   65: invokeinterface 83 2 0
    //   70: invokevirtual 89	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   73: pop
    //   74: aload_2
    //   75: invokeinterface 92 1 0
    //   80: pop
    //   81: goto -28 -> 53
    //   84: astore_1
    //   85: aload_2
    //   86: ifnull +9 -> 95
    //   89: aload_2
    //   90: invokeinterface 95 1 0
    //   95: return
    //   96: aload_2
    //   97: ifnull -2 -> 95
    //   100: aload_2
    //   101: invokeinterface 95 1 0
    //   106: return
    //   107: astore_1
    //   108: return
    //   109: astore_1
    //   110: aload_2
    //   111: ifnull +9 -> 120
    //   114: aload_2
    //   115: invokeinterface 95 1 0
    //   120: aload_1
    //   121: athrow
    //   122: astore_1
    //   123: return
    //   124: astore_2
    //   125: goto -5 -> 120
    //   128: astore_1
    //   129: goto -19 -> 110
    //   132: astore_1
    //   133: aconst_null
    //   134: astore_2
    //   135: goto -50 -> 85
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	138	0	this	nmp
    //   0	138	1	paramArrayList	ArrayList
    //   1	114	2	localObject1	Object
    //   124	1	2	localException	Exception
    //   134	1	2	localObject2	Object
    //   6	33	3	localObject3	Object
    //   10	10	4	localUri	android.net.Uri
    //   16	15	5	str	String
    // Exception table:
    //   from	to	target	type
    //   44	53	84	java/lang/Throwable
    //   53	81	84	java/lang/Throwable
    //   100	106	107	java/lang/Exception
    //   2	38	109	finally
    //   89	95	122	java/lang/Exception
    //   114	120	124	java/lang/Exception
    //   44	53	128	finally
    //   53	81	128	finally
    //   2	38	132	java/lang/Throwable
  }
  
  private final String b()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Object localObject = new ArrayList();
    ((List)localObject).add("com.tencent.mm.account; ");
    ((List)localObject).add("com.tencent.mobileqq.account; ");
    ((List)localObject).add("com.yy.yymeet.contact; ");
    ((List)localObject).add("vnd.sec.contact.sim;primary.sim.account_name");
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      String[] arrayOfString = ((String)((Iterator)localObject).next()).split(";");
      if (arrayOfString.length == 2) {
        if ((!arrayOfString[0].equals(" ")) && (arrayOfString[1].equals(" "))) {
          localStringBuilder.append(" AND (account_type <> '" + arrayOfString[0] + "')");
        } else if ((arrayOfString[0].equals(" ")) && (!arrayOfString[1].equals(" "))) {
          localStringBuilder.append(" AND (account_name <> '" + arrayOfString[1] + "')");
        } else if ((!arrayOfString[0].equals(" ")) && (!arrayOfString[1].equals(" "))) {
          localStringBuilder.append(" AND (account_type <>'" + arrayOfString[0] + "' OR " + "account_name" + " <> '" + arrayOfString[1] + "')");
        }
      }
    }
    return localStringBuilder.toString();
  }
  
  public List a()
  {
    ArrayList localArrayList = new ArrayList();
    a(localArrayList);
    return localArrayList;
  }
}
