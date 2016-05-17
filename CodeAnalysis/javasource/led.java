import android.os.AsyncTask;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListScene;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public class led
  extends AsyncTask
{
  static final int jdField_a_of_type_Int = 0;
  static final int b = 1;
  static final int c = 2;
  static final int d = 0;
  static final int e = 1;
  static final int f = 2;
  static final int g = 10;
  static final int h = 11;
  static final int i = 20;
  static final int j = 21;
  static final int k = 22;
  static final int l = 23;
  static final int m = 24;
  static final int n = 30;
  public AIORichMediaInfo a;
  public boolean a;
  AIORichMediaInfo[] jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo;
  int o;
  
  public led(AIOImageListScene paramAIOImageListScene, ArrayList paramArrayList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo = ((AIORichMediaInfo[])paramArrayList.toArray(new AIORichMediaInfo[0]));
  }
  
  /* Error */
  protected Integer a(Integer... paramVarArgs)
  {
    // Byte code:
    //   0: invokestatic 72	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3: ifeq +845 -> 848
    //   6: ldc 74
    //   8: iconst_2
    //   9: new 76	java/lang/StringBuilder
    //   12: dup
    //   13: invokespecial 77	java/lang/StringBuilder:<init>	()V
    //   16: ldc 79
    //   18: invokevirtual 83	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   21: aload_1
    //   22: invokevirtual 86	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   25: invokevirtual 90	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   28: invokestatic 93	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   31: goto +817 -> 848
    //   34: iload_3
    //   35: aload_1
    //   36: arraylength
    //   37: if_icmpge +801 -> 838
    //   40: aload_1
    //   41: iload_3
    //   42: aaload
    //   43: invokevirtual 99	java/lang/Integer:intValue	()I
    //   46: istore 4
    //   48: aload_0
    //   49: getfield 49	led:jdField_a_of_type_Boolean	Z
    //   52: ifne +8 -> 60
    //   55: iconst_1
    //   56: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   59: areturn
    //   60: aload_0
    //   61: iconst_1
    //   62: anewarray 95	java/lang/Integer
    //   65: dup
    //   66: iconst_0
    //   67: iload_3
    //   68: bipush 100
    //   70: imul
    //   71: aload_1
    //   72: arraylength
    //   73: idiv
    //   74: ldc 104
    //   76: iand
    //   77: iload 4
    //   79: bipush 16
    //   81: ishl
    //   82: ior
    //   83: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   86: aastore
    //   87: invokevirtual 108	led:publishProgress	([Ljava/lang/Object;)V
    //   90: iload 4
    //   92: tableswitch	default:+763->855, 0:+770->862, 1:+395->487, 2:+770->862
    //   120: iload_2
    //   121: aload_0
    //   122: getfield 60	led:jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo	[Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   125: arraylength
    //   126: if_icmpge +748 -> 874
    //   129: aload_0
    //   130: getfield 49	led:jdField_a_of_type_Boolean	Z
    //   133: ifne +8 -> 141
    //   136: iconst_1
    //   137: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   140: areturn
    //   141: aload_0
    //   142: iconst_1
    //   143: anewarray 95	java/lang/Integer
    //   146: dup
    //   147: iconst_0
    //   148: iload_3
    //   149: bipush 100
    //   151: imul
    //   152: aload_1
    //   153: arraylength
    //   154: idiv
    //   155: iload_2
    //   156: bipush 100
    //   158: imul
    //   159: aload_1
    //   160: arraylength
    //   161: idiv
    //   162: aload_0
    //   163: getfield 60	led:jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo	[Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   166: arraylength
    //   167: idiv
    //   168: iadd
    //   169: ldc 104
    //   171: iand
    //   172: iload 4
    //   174: bipush 16
    //   176: ishl
    //   177: ior
    //   178: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   181: aastore
    //   182: invokevirtual 108	led:publishProgress	([Ljava/lang/Object;)V
    //   185: aload_0
    //   186: getfield 60	led:jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo	[Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   189: iload_2
    //   190: aaload
    //   191: astore 8
    //   193: ldc 110
    //   195: aload 8
    //   197: getfield 113	com/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo:a	Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaData;
    //   200: invokevirtual 119	java/lang/Class:isInstance	(Ljava/lang/Object;)Z
    //   203: ifeq +271 -> 474
    //   206: aload 8
    //   208: getfield 113	com/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo:a	Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaData;
    //   211: checkcast 110	com/tencent/mobileqq/activity/aio/photo/AIOImageData
    //   214: astore 7
    //   216: aload 7
    //   218: getfield 122	com/tencent/mobileqq/activity/aio/photo/AIOImageData:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   221: astore 9
    //   223: ldc 124
    //   225: aload 9
    //   227: invokevirtual 129	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   230: ifeq +6 -> 236
    //   233: goto +634 -> 867
    //   236: aload_0
    //   237: aload 8
    //   239: putfield 131	led:jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo	Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   242: aload_0
    //   243: getfield 49	led:jdField_a_of_type_Boolean	Z
    //   246: ifeq +146 -> 392
    //   249: aload 9
    //   251: ifnull +18 -> 269
    //   254: new 133	java/io/File
    //   257: dup
    //   258: aload 9
    //   260: invokespecial 136	java/io/File:<init>	(Ljava/lang/String;)V
    //   263: invokevirtual 139	java/io/File:exists	()Z
    //   266: ifne +126 -> 392
    //   269: aload_0
    //   270: getfield 39	led:jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene	Lcom/tencent/mobileqq/activity/aio/photo/AIOImageListScene;
    //   273: getfield 144	com/tencent/mobileqq/activity/aio/photo/AIOImageListScene:jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider	Lcom/tencent/mobileqq/activity/aio/photo/IAIOImageProvider;
    //   276: aload 7
    //   278: getfield 147	com/tencent/mobileqq/activity/aio/photo/AIOImageData:e	J
    //   281: aload 7
    //   283: getfield 149	com/tencent/mobileqq/activity/aio/photo/AIOImageData:i	I
    //   286: iconst_2
    //   287: invokeinterface 154 5 0
    //   292: aload_0
    //   293: getfield 131	led:jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo	Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   296: astore 8
    //   298: aload 8
    //   300: monitorenter
    //   301: aload_0
    //   302: getfield 131	led:jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo	Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   305: invokevirtual 159	java/lang/Object:wait	()V
    //   308: aload 8
    //   310: monitorexit
    //   311: aload 7
    //   313: getfield 161	com/tencent/mobileqq/activity/aio/photo/AIOImageData:jdField_b_of_type_Boolean	Z
    //   316: ifeq +76 -> 392
    //   319: invokestatic 72	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   322: ifeq +41 -> 363
    //   325: ldc 74
    //   327: iconst_2
    //   328: new 76	java/lang/StringBuilder
    //   331: dup
    //   332: invokespecial 77	java/lang/StringBuilder:<init>	()V
    //   335: ldc -93
    //   337: invokevirtual 83	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   340: iload_2
    //   341: invokevirtual 166	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   344: ldc -88
    //   346: invokevirtual 83	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   349: aload 7
    //   351: getfield 122	com/tencent/mobileqq/activity/aio/photo/AIOImageData:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   354: invokevirtual 83	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   357: invokevirtual 90	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   360: invokestatic 93	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   363: aload_0
    //   364: aload_0
    //   365: getfield 60	led:jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo	[Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   368: arraylength
    //   369: iload_2
    //   370: isub
    //   371: putfield 170	led:o	I
    //   374: bipush 11
    //   376: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   379: areturn
    //   380: astore_1
    //   381: aload 8
    //   383: monitorexit
    //   384: aload_1
    //   385: athrow
    //   386: astore_1
    //   387: iconst_2
    //   388: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   391: areturn
    //   392: aload_0
    //   393: getfield 49	led:jdField_a_of_type_Boolean	Z
    //   396: ifne +8 -> 404
    //   399: iconst_1
    //   400: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   403: areturn
    //   404: aload 7
    //   406: iconst_2
    //   407: invokevirtual 173	com/tencent/mobileqq/activity/aio/photo/AIOImageData:a	(I)Ljava/io/File;
    //   410: ifnonnull +457 -> 867
    //   413: invokestatic 72	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   416: ifeq +41 -> 457
    //   419: ldc 74
    //   421: iconst_2
    //   422: new 76	java/lang/StringBuilder
    //   425: dup
    //   426: invokespecial 77	java/lang/StringBuilder:<init>	()V
    //   429: ldc -81
    //   431: invokevirtual 83	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   434: iload_2
    //   435: invokevirtual 166	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   438: ldc -88
    //   440: invokevirtual 83	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   443: aload 7
    //   445: getfield 122	com/tencent/mobileqq/activity/aio/photo/AIOImageData:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   448: invokevirtual 83	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   451: invokevirtual 90	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   454: invokestatic 93	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   457: aload_0
    //   458: aload_0
    //   459: getfield 60	led:jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo	[Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   462: arraylength
    //   463: iload_2
    //   464: isub
    //   465: putfield 170	led:o	I
    //   468: bipush 11
    //   470: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   473: areturn
    //   474: ldc -79
    //   476: aload 8
    //   478: invokevirtual 119	java/lang/Class:isInstance	(Ljava/lang/Object;)Z
    //   481: ifeq +386 -> 867
    //   484: goto +383 -> 867
    //   487: invokestatic 182	android/os/Environment:getExternalStorageState	()Ljava/lang/String;
    //   490: ldc -72
    //   492: invokevirtual 188	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   495: ifne +23 -> 518
    //   498: invokestatic 72	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   501: ifeq +11 -> 512
    //   504: ldc 74
    //   506: iconst_2
    //   507: ldc -66
    //   509: invokestatic 93	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   512: bipush 23
    //   514: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   517: areturn
    //   518: new 133	java/io/File
    //   521: dup
    //   522: getstatic 195	com/tencent/mobileqq/app/AppConstants:bi	Ljava/lang/String;
    //   525: invokespecial 136	java/io/File:<init>	(Ljava/lang/String;)V
    //   528: astore 7
    //   530: aload 7
    //   532: invokevirtual 139	java/io/File:exists	()Z
    //   535: ifne +357 -> 892
    //   538: aload 7
    //   540: invokevirtual 198	java/io/File:mkdirs	()Z
    //   543: pop
    //   544: goto +348 -> 892
    //   547: iload_2
    //   548: aload_0
    //   549: getfield 60	led:jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo	[Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   552: arraylength
    //   553: if_icmpge +268 -> 821
    //   556: aload_0
    //   557: getfield 60	led:jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo	[Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   560: iload_2
    //   561: aaload
    //   562: astore 8
    //   564: aload_0
    //   565: getfield 49	led:jdField_a_of_type_Boolean	Z
    //   568: ifne +8 -> 576
    //   571: iconst_1
    //   572: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   575: areturn
    //   576: ldc 110
    //   578: aload 8
    //   580: getfield 113	com/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo:a	Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaData;
    //   583: invokevirtual 119	java/lang/Class:isInstance	(Ljava/lang/Object;)Z
    //   586: ifeq +222 -> 808
    //   589: aload 8
    //   591: getfield 113	com/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo:a	Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaData;
    //   594: checkcast 110	com/tencent/mobileqq/activity/aio/photo/AIOImageData
    //   597: astore 8
    //   599: aload_0
    //   600: iconst_1
    //   601: anewarray 95	java/lang/Integer
    //   604: dup
    //   605: iconst_0
    //   606: iload_3
    //   607: bipush 100
    //   609: imul
    //   610: aload_1
    //   611: arraylength
    //   612: idiv
    //   613: iload_2
    //   614: bipush 100
    //   616: imul
    //   617: aload_1
    //   618: arraylength
    //   619: idiv
    //   620: aload_0
    //   621: getfield 60	led:jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioPhotoAIORichMediaInfo	[Lcom/tencent/mobileqq/activity/aio/photo/AIORichMediaInfo;
    //   624: arraylength
    //   625: idiv
    //   626: iadd
    //   627: ldc 104
    //   629: iand
    //   630: iload 4
    //   632: bipush 16
    //   634: ishl
    //   635: ior
    //   636: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   639: aastore
    //   640: invokevirtual 108	led:publishProgress	([Ljava/lang/Object;)V
    //   643: aload 8
    //   645: iconst_2
    //   646: invokevirtual 173	com/tencent/mobileqq/activity/aio/photo/AIOImageData:a	(I)Ljava/io/File;
    //   649: astore 8
    //   651: aload 8
    //   653: ifnull +244 -> 897
    //   656: invokestatic 202	android/os/Environment:getExternalStorageDirectory	()Ljava/io/File;
    //   659: invokestatic 208	com/tencent/image/Utils:getUsableSpace	(Ljava/io/File;)J
    //   662: lstore 5
    //   664: aload 8
    //   666: invokevirtual 212	java/io/File:length	()J
    //   669: lload 5
    //   671: lcmp
    //   672: ifle +23 -> 695
    //   675: invokestatic 72	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   678: ifeq +11 -> 689
    //   681: ldc 74
    //   683: iconst_2
    //   684: ldc -42
    //   686: invokestatic 93	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   689: bipush 22
    //   691: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   694: areturn
    //   695: new 133	java/io/File
    //   698: dup
    //   699: aload 7
    //   701: new 76	java/lang/StringBuilder
    //   704: dup
    //   705: invokespecial 77	java/lang/StringBuilder:<init>	()V
    //   708: aload 8
    //   710: invokevirtual 217	java/io/File:getName	()Ljava/lang/String;
    //   713: invokevirtual 83	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   716: ldc -37
    //   718: invokevirtual 83	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   721: invokevirtual 90	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   724: invokespecial 222	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   727: astore 9
    //   729: aload 8
    //   731: aload 9
    //   733: invokestatic 227	com/dataline/util/file/FileUtil:a	(Ljava/io/File;Ljava/io/File;)Z
    //   736: ifne +54 -> 790
    //   739: invokestatic 182	android/os/Environment:getExternalStorageState	()Ljava/lang/String;
    //   742: ldc -72
    //   744: invokevirtual 188	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   747: ifne +23 -> 770
    //   750: invokestatic 72	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   753: ifeq +11 -> 764
    //   756: ldc 74
    //   758: iconst_2
    //   759: ldc -27
    //   761: invokestatic 93	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   764: bipush 24
    //   766: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   769: areturn
    //   770: invokestatic 72	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   773: ifeq +11 -> 784
    //   776: ldc 74
    //   778: iconst_2
    //   779: ldc -25
    //   781: invokestatic 93	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   784: bipush 21
    //   786: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   789: areturn
    //   790: aload_0
    //   791: getfield 39	led:jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene	Lcom/tencent/mobileqq/activity/aio/photo/AIOImageListScene;
    //   794: invokestatic 234	com/tencent/mobileqq/activity/aio/photo/AIOImageListScene:a	(Lcom/tencent/mobileqq/activity/aio/photo/AIOImageListScene;)Landroid/app/Activity;
    //   797: aload 9
    //   799: invokevirtual 237	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   802: invokestatic 242	com/tencent/mobileqq/utils/ImageUtil:a	(Landroid/content/Context;Ljava/lang/String;)V
    //   805: goto +92 -> 897
    //   808: ldc -79
    //   810: aload 8
    //   812: invokevirtual 119	java/lang/Class:isInstance	(Ljava/lang/Object;)Z
    //   815: ifeq +82 -> 897
    //   818: goto +79 -> 897
    //   821: invokestatic 72	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   824: ifeq +80 -> 904
    //   827: ldc 74
    //   829: iconst_2
    //   830: ldc -12
    //   832: invokestatic 93	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   835: goto +69 -> 904
    //   838: iload_2
    //   839: invokestatic 103	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   842: areturn
    //   843: astore 9
    //   845: goto -537 -> 308
    //   848: iconst_0
    //   849: istore_3
    //   850: iconst_0
    //   851: istore_2
    //   852: goto -818 -> 34
    //   855: iload_3
    //   856: iconst_1
    //   857: iadd
    //   858: istore_3
    //   859: goto -825 -> 34
    //   862: iconst_0
    //   863: istore_2
    //   864: goto -744 -> 120
    //   867: iload_2
    //   868: iconst_1
    //   869: iadd
    //   870: istore_2
    //   871: goto -751 -> 120
    //   874: iload 4
    //   876: iconst_2
    //   877: if_icmpne +9 -> 886
    //   880: bipush 30
    //   882: istore_2
    //   883: goto -28 -> 855
    //   886: bipush 10
    //   888: istore_2
    //   889: goto -34 -> 855
    //   892: iconst_0
    //   893: istore_2
    //   894: goto -347 -> 547
    //   897: iload_2
    //   898: iconst_1
    //   899: iadd
    //   900: istore_2
    //   901: goto -354 -> 547
    //   904: bipush 20
    //   906: istore_2
    //   907: goto -52 -> 855
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	910	0	this	led
    //   0	910	1	paramVarArgs	Integer[]
    //   120	787	2	i1	int
    //   34	825	3	i2	int
    //   46	832	4	i3	int
    //   662	8	5	l1	long
    //   214	486	7	localObject1	Object
    //   221	577	9	localObject3	Object
    //   843	1	9	localInterruptedException	InterruptedException
    // Exception table:
    //   from	to	target	type
    //   301	308	380	finally
    //   308	311	380	finally
    //   381	384	380	finally
    //   0	31	386	java/lang/Throwable
    //   34	60	386	java/lang/Throwable
    //   60	90	386	java/lang/Throwable
    //   120	141	386	java/lang/Throwable
    //   141	233	386	java/lang/Throwable
    //   236	249	386	java/lang/Throwable
    //   254	269	386	java/lang/Throwable
    //   269	301	386	java/lang/Throwable
    //   311	363	386	java/lang/Throwable
    //   363	374	386	java/lang/Throwable
    //   384	386	386	java/lang/Throwable
    //   392	404	386	java/lang/Throwable
    //   404	457	386	java/lang/Throwable
    //   457	474	386	java/lang/Throwable
    //   474	484	386	java/lang/Throwable
    //   487	512	386	java/lang/Throwable
    //   512	518	386	java/lang/Throwable
    //   518	544	386	java/lang/Throwable
    //   547	576	386	java/lang/Throwable
    //   576	651	386	java/lang/Throwable
    //   656	689	386	java/lang/Throwable
    //   689	695	386	java/lang/Throwable
    //   695	764	386	java/lang/Throwable
    //   764	770	386	java/lang/Throwable
    //   770	784	386	java/lang/Throwable
    //   784	790	386	java/lang/Throwable
    //   790	805	386	java/lang/Throwable
    //   808	818	386	java/lang/Throwable
    //   821	835	386	java/lang/Throwable
    //   301	308	843	java/lang/InterruptedException
  }
  
  protected void a(Integer paramInteger)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.b(paramInteger.intValue(), o);
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.jdField_a_of_type_Led = null;
  }
  
  protected void a(Integer... paramVarArgs)
  {
    int i1 = paramVarArgs[(paramVarArgs.length - 1)].intValue();
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.c(i1 >> 16, 0xFFFF & i1);
  }
}
