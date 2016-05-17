import android.os.AsyncTask;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoThumbGenMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoThumbGenMgr.ThumbGenItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mjw
  extends AsyncTask
{
  public RMVideoThumbGenMgr.ThumbGenItem a;
  
  public mjw(RMVideoThumbGenMgr paramRMVideoThumbGenMgr)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  /* Error */
  protected Integer a(Void... paramVarArgs)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 11	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr;
    //   4: invokevirtual 33	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr:b	()V
    //   7: new 35	java/io/File
    //   10: dup
    //   11: new 37	java/lang/StringBuilder
    //   14: dup
    //   15: invokespecial 38	java/lang/StringBuilder:<init>	()V
    //   18: getstatic 44	com/tencent/mobileqq/shortvideo/common/GloableValue:c	Ljava/lang/String;
    //   21: invokevirtual 48	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   24: getstatic 51	java/io/File:separator	Ljava/lang/String;
    //   27: invokevirtual 48	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: ldc 53
    //   32: invokevirtual 48	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: invokevirtual 57	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   38: invokespecial 60	java/io/File:<init>	(Ljava/lang/String;)V
    //   41: astore_1
    //   42: aload_1
    //   43: invokevirtual 64	java/io/File:exists	()Z
    //   46: ifne +8 -> 54
    //   49: aload_1
    //   50: invokevirtual 67	java/io/File:createNewFile	()Z
    //   53: pop
    //   54: aload_0
    //   55: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   58: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   61: iconst_2
    //   62: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   65: pop
    //   66: aload_0
    //   67: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   70: getfield 82	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_Boolean	Z
    //   73: ifeq +29 -> 102
    //   76: aload_0
    //   77: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   80: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   83: iconst_4
    //   84: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   87: pop
    //   88: aload_0
    //   89: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   92: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   95: invokevirtual 86	java/util/concurrent/atomic/AtomicInteger:get	()I
    //   98: invokestatic 92	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   101: areturn
    //   102: aload_0
    //   103: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   106: getfield 94	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   109: aload_0
    //   110: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   113: getfield 97	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_Int	I
    //   116: aload_0
    //   117: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   120: getfield 99	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_b_of_type_Int	I
    //   123: invokestatic 104	com/tencent/mobileqq/shortvideo/cover/RecordThumbnailUtils:a	(Ljava/lang/String;II)Ljava/lang/String;
    //   126: astore 5
    //   128: aload 5
    //   130: ifnonnull +29 -> 159
    //   133: aload_0
    //   134: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   137: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   140: iconst_5
    //   141: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   144: pop
    //   145: aload_0
    //   146: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   149: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   152: invokevirtual 86	java/util/concurrent/atomic/AtomicInteger:get	()I
    //   155: invokestatic 92	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   158: areturn
    //   159: new 35	java/io/File
    //   162: dup
    //   163: aload 5
    //   165: invokespecial 60	java/io/File:<init>	(Ljava/lang/String;)V
    //   168: astore 4
    //   170: aload 4
    //   172: invokevirtual 64	java/io/File:exists	()Z
    //   175: ifne +29 -> 204
    //   178: aload_0
    //   179: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   182: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   185: iconst_5
    //   186: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   189: pop
    //   190: aload_0
    //   191: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   194: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   197: invokevirtual 86	java/util/concurrent/atomic/AtomicInteger:get	()I
    //   200: invokestatic 92	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   203: areturn
    //   204: aload_0
    //   205: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   208: getfield 82	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_Boolean	Z
    //   211: ifeq +35 -> 246
    //   214: aload_0
    //   215: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   218: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   221: iconst_4
    //   222: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   225: pop
    //   226: aload 5
    //   228: invokestatic 110	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   231: pop
    //   232: aload_0
    //   233: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   236: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   239: invokevirtual 86	java/util/concurrent/atomic/AtomicInteger:get	()I
    //   242: invokestatic 92	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   245: areturn
    //   246: new 112	java/io/FileInputStream
    //   249: dup
    //   250: aload 5
    //   252: invokespecial 113	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   255: astore_3
    //   256: aload_3
    //   257: astore_1
    //   258: aload_3
    //   259: aload 4
    //   261: invokevirtual 117	java/io/File:length	()J
    //   264: invokestatic 123	com/tencent/qphone/base/util/MD5:toMD5Byte	(Ljava/io/InputStream;J)[B
    //   267: astore 4
    //   269: aload_3
    //   270: astore_1
    //   271: aload_0
    //   272: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   275: aload 4
    //   277: invokestatic 129	com/qq/taf/jce/HexUtil:bytes2HexStr	([B)Ljava/lang/String;
    //   280: putfield 131	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:d	Ljava/lang/String;
    //   283: aload_3
    //   284: ifnull +7 -> 291
    //   287: aload_3
    //   288: invokevirtual 134	java/io/FileInputStream:close	()V
    //   291: aload_0
    //   292: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   295: aload 5
    //   297: putfield 136	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   300: aload_0
    //   301: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   304: getfield 131	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:d	Ljava/lang/String;
    //   307: invokestatic 142	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   310: ifeq +88 -> 398
    //   313: aload_0
    //   314: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   317: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   320: bipush 6
    //   322: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   325: pop
    //   326: aconst_null
    //   327: astore_1
    //   328: aload_0
    //   329: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   332: getfield 82	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_Boolean	Z
    //   335: ifeq +41 -> 376
    //   338: aload_0
    //   339: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   342: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   345: iconst_4
    //   346: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   349: istore_2
    //   350: aload_0
    //   351: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   354: aconst_null
    //   355: putfield 143	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:c	Ljava/lang/String;
    //   358: aload_0
    //   359: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   362: aconst_null
    //   363: putfield 136	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   366: iload_2
    //   367: iconst_3
    //   368: if_icmpne +91 -> 459
    //   371: aload_1
    //   372: invokestatic 110	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   375: pop
    //   376: aload_0
    //   377: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   380: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   383: invokevirtual 86	java/util/concurrent/atomic/AtomicInteger:get	()I
    //   386: invokestatic 92	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   389: areturn
    //   390: astore_1
    //   391: aload_1
    //   392: invokevirtual 146	java/io/IOException:printStackTrace	()V
    //   395: goto -104 -> 291
    //   398: aload_0
    //   399: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   402: getfield 131	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:d	Ljava/lang/String;
    //   405: ldc -108
    //   407: invokestatic 153	com/tencent/mobileqq/shortvideo/ShortVideoUtils:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   410: astore_1
    //   411: aload 5
    //   413: aload_1
    //   414: invokestatic 156	com/tencent/mobileqq/utils/FileUtils:c	(Ljava/lang/String;Ljava/lang/String;)Z
    //   417: ifeq +26 -> 443
    //   420: aload_0
    //   421: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   424: aload_1
    //   425: putfield 143	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:c	Ljava/lang/String;
    //   428: aload_0
    //   429: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   432: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   435: iconst_3
    //   436: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   439: pop
    //   440: goto -112 -> 328
    //   443: aload_0
    //   444: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   447: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   450: bipush 6
    //   452: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   455: pop
    //   456: goto -128 -> 328
    //   459: iload_2
    //   460: bipush 6
    //   462: if_icmpne -86 -> 376
    //   465: aload 5
    //   467: invokestatic 110	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   470: pop
    //   471: goto -95 -> 376
    //   474: astore 4
    //   476: aconst_null
    //   477: astore_3
    //   478: aload_3
    //   479: astore_1
    //   480: aload 4
    //   482: invokevirtual 157	java/io/FileNotFoundException:printStackTrace	()V
    //   485: aload_3
    //   486: ifnull +7 -> 493
    //   489: aload_3
    //   490: invokevirtual 134	java/io/FileInputStream:close	()V
    //   493: aload_0
    //   494: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   497: aload 5
    //   499: putfield 136	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   502: aload_0
    //   503: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   506: getfield 131	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:d	Ljava/lang/String;
    //   509: invokestatic 142	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   512: ifeq +77 -> 589
    //   515: aload_0
    //   516: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   519: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   522: bipush 6
    //   524: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   527: pop
    //   528: aconst_null
    //   529: astore_1
    //   530: aload_0
    //   531: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   534: getfield 82	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_Boolean	Z
    //   537: ifeq -161 -> 376
    //   540: aload_0
    //   541: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   544: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   547: iconst_4
    //   548: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   551: istore_2
    //   552: aload_0
    //   553: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   556: aconst_null
    //   557: putfield 143	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:c	Ljava/lang/String;
    //   560: aload_0
    //   561: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   564: aconst_null
    //   565: putfield 136	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   568: iload_2
    //   569: iconst_3
    //   570: if_icmpne +80 -> 650
    //   573: aload_1
    //   574: invokestatic 110	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   577: pop
    //   578: goto -202 -> 376
    //   581: astore_1
    //   582: aload_1
    //   583: invokevirtual 146	java/io/IOException:printStackTrace	()V
    //   586: goto -93 -> 493
    //   589: aload_0
    //   590: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   593: getfield 131	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:d	Ljava/lang/String;
    //   596: ldc -108
    //   598: invokestatic 153	com/tencent/mobileqq/shortvideo/ShortVideoUtils:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   601: astore_1
    //   602: aload 5
    //   604: aload_1
    //   605: invokestatic 156	com/tencent/mobileqq/utils/FileUtils:c	(Ljava/lang/String;Ljava/lang/String;)Z
    //   608: ifeq +26 -> 634
    //   611: aload_0
    //   612: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   615: aload_1
    //   616: putfield 143	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:c	Ljava/lang/String;
    //   619: aload_0
    //   620: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   623: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   626: iconst_3
    //   627: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   630: pop
    //   631: goto -101 -> 530
    //   634: aload_0
    //   635: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   638: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   641: bipush 6
    //   643: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   646: pop
    //   647: goto -117 -> 530
    //   650: iload_2
    //   651: bipush 6
    //   653: if_icmpne -277 -> 376
    //   656: aload 5
    //   658: invokestatic 110	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   661: pop
    //   662: goto -286 -> 376
    //   665: astore 4
    //   667: aconst_null
    //   668: astore_3
    //   669: aload_3
    //   670: astore_1
    //   671: aload 4
    //   673: invokevirtual 158	java/lang/UnsatisfiedLinkError:printStackTrace	()V
    //   676: aload_3
    //   677: ifnull +7 -> 684
    //   680: aload_3
    //   681: invokevirtual 134	java/io/FileInputStream:close	()V
    //   684: aload_0
    //   685: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   688: aload 5
    //   690: putfield 136	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   693: aload_0
    //   694: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   697: getfield 131	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:d	Ljava/lang/String;
    //   700: invokestatic 142	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   703: ifeq +77 -> 780
    //   706: aload_0
    //   707: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   710: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   713: bipush 6
    //   715: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   718: pop
    //   719: aconst_null
    //   720: astore_1
    //   721: aload_0
    //   722: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   725: getfield 82	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_Boolean	Z
    //   728: ifeq -352 -> 376
    //   731: aload_0
    //   732: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   735: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   738: iconst_4
    //   739: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   742: istore_2
    //   743: aload_0
    //   744: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   747: aconst_null
    //   748: putfield 143	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:c	Ljava/lang/String;
    //   751: aload_0
    //   752: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   755: aconst_null
    //   756: putfield 136	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   759: iload_2
    //   760: iconst_3
    //   761: if_icmpne +80 -> 841
    //   764: aload_1
    //   765: invokestatic 110	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   768: pop
    //   769: goto -393 -> 376
    //   772: astore_1
    //   773: aload_1
    //   774: invokevirtual 146	java/io/IOException:printStackTrace	()V
    //   777: goto -93 -> 684
    //   780: aload_0
    //   781: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   784: getfield 131	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:d	Ljava/lang/String;
    //   787: ldc -108
    //   789: invokestatic 153	com/tencent/mobileqq/shortvideo/ShortVideoUtils:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   792: astore_1
    //   793: aload 5
    //   795: aload_1
    //   796: invokestatic 156	com/tencent/mobileqq/utils/FileUtils:c	(Ljava/lang/String;Ljava/lang/String;)Z
    //   799: ifeq +26 -> 825
    //   802: aload_0
    //   803: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   806: aload_1
    //   807: putfield 143	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:c	Ljava/lang/String;
    //   810: aload_0
    //   811: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   814: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   817: iconst_3
    //   818: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   821: pop
    //   822: goto -101 -> 721
    //   825: aload_0
    //   826: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   829: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   832: bipush 6
    //   834: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   837: pop
    //   838: goto -117 -> 721
    //   841: iload_2
    //   842: bipush 6
    //   844: if_icmpne -468 -> 376
    //   847: aload 5
    //   849: invokestatic 110	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   852: pop
    //   853: goto -477 -> 376
    //   856: astore_1
    //   857: aconst_null
    //   858: astore_3
    //   859: aload_3
    //   860: ifnull +7 -> 867
    //   863: aload_3
    //   864: invokevirtual 134	java/io/FileInputStream:close	()V
    //   867: aload_0
    //   868: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   871: aload 5
    //   873: putfield 136	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   876: aload_0
    //   877: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   880: getfield 131	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:d	Ljava/lang/String;
    //   883: invokestatic 142	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   886: ifeq +76 -> 962
    //   889: aload_0
    //   890: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   893: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   896: bipush 6
    //   898: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   901: pop
    //   902: aconst_null
    //   903: astore_3
    //   904: aload_0
    //   905: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   908: getfield 82	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_Boolean	Z
    //   911: ifeq +41 -> 952
    //   914: aload_0
    //   915: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   918: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   921: iconst_4
    //   922: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   925: istore_2
    //   926: aload_0
    //   927: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   930: aconst_null
    //   931: putfield 143	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:c	Ljava/lang/String;
    //   934: aload_0
    //   935: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   938: aconst_null
    //   939: putfield 136	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   942: iload_2
    //   943: iconst_3
    //   944: if_icmpne +79 -> 1023
    //   947: aload_3
    //   948: invokestatic 110	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   951: pop
    //   952: aload_1
    //   953: athrow
    //   954: astore_3
    //   955: aload_3
    //   956: invokevirtual 146	java/io/IOException:printStackTrace	()V
    //   959: goto -92 -> 867
    //   962: aload_0
    //   963: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   966: getfield 131	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:d	Ljava/lang/String;
    //   969: ldc -108
    //   971: invokestatic 153	com/tencent/mobileqq/shortvideo/ShortVideoUtils:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   974: astore_3
    //   975: aload 5
    //   977: aload_3
    //   978: invokestatic 156	com/tencent/mobileqq/utils/FileUtils:c	(Ljava/lang/String;Ljava/lang/String;)Z
    //   981: ifeq +26 -> 1007
    //   984: aload_0
    //   985: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   988: aload_3
    //   989: putfield 143	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:c	Ljava/lang/String;
    //   992: aload_0
    //   993: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   996: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   999: iconst_3
    //   1000: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   1003: pop
    //   1004: goto -100 -> 904
    //   1007: aload_0
    //   1008: getfield 69	mjw:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr$ThumbGenItem	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem;
    //   1011: getfield 74	com/tencent/mobileqq/activity/richmedia/state/RMVideoThumbGenMgr$ThumbGenItem:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger	Ljava/util/concurrent/atomic/AtomicInteger;
    //   1014: bipush 6
    //   1016: invokevirtual 80	java/util/concurrent/atomic/AtomicInteger:getAndSet	(I)I
    //   1019: pop
    //   1020: goto -116 -> 904
    //   1023: iload_2
    //   1024: bipush 6
    //   1026: if_icmpne -74 -> 952
    //   1029: aload 5
    //   1031: invokestatic 110	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   1034: pop
    //   1035: goto -83 -> 952
    //   1038: astore_1
    //   1039: goto -985 -> 54
    //   1042: astore 4
    //   1044: aload_1
    //   1045: astore_3
    //   1046: aload 4
    //   1048: astore_1
    //   1049: goto -190 -> 859
    //   1052: astore 4
    //   1054: goto -385 -> 669
    //   1057: astore 4
    //   1059: goto -581 -> 478
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1062	0	this	mjw
    //   0	1062	1	paramVarArgs	Void[]
    //   349	678	2	i	int
    //   255	693	3	localFileInputStream	java.io.FileInputStream
    //   954	2	3	localIOException	java.io.IOException
    //   974	72	3	localObject1	Object
    //   168	108	4	localObject2	Object
    //   474	7	4	localFileNotFoundException1	java.io.FileNotFoundException
    //   665	7	4	localUnsatisfiedLinkError1	UnsatisfiedLinkError
    //   1042	5	4	localObject3	Object
    //   1052	1	4	localUnsatisfiedLinkError2	UnsatisfiedLinkError
    //   1057	1	4	localFileNotFoundException2	java.io.FileNotFoundException
    //   126	904	5	str	String
    // Exception table:
    //   from	to	target	type
    //   287	291	390	java/io/IOException
    //   246	256	474	java/io/FileNotFoundException
    //   489	493	581	java/io/IOException
    //   246	256	665	java/lang/UnsatisfiedLinkError
    //   680	684	772	java/io/IOException
    //   246	256	856	finally
    //   863	867	954	java/io/IOException
    //   49	54	1038	java/io/IOException
    //   258	269	1042	finally
    //   271	283	1042	finally
    //   480	485	1042	finally
    //   671	676	1042	finally
    //   258	269	1052	java/lang/UnsatisfiedLinkError
    //   271	283	1052	java/lang/UnsatisfiedLinkError
    //   258	269	1057	java/io/FileNotFoundException
    //   271	283	1057	java/io/FileNotFoundException
  }
}
