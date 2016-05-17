import com.tencent.mobileqq.startup.step.UpgradeDB;

public class reg
  extends Thread
{
  public reg(UpgradeDB paramUpgradeDB) {}
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: sipush 30000
    //   3: istore_1
    //   4: aload_0
    //   5: getfield 10	reg:a	Lcom/tencent/mobileqq/startup/step/UpgradeDB;
    //   8: getfield 22	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaLangObject	Ljava/lang/Object;
    //   11: astore_2
    //   12: aload_2
    //   13: monitorenter
    //   14: aload_0
    //   15: getfield 10	reg:a	Lcom/tencent/mobileqq/startup/step/UpgradeDB;
    //   18: getfield 22	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_JavaLangObject	Ljava/lang/Object;
    //   21: aload_0
    //   22: getfield 10	reg:a	Lcom/tencent/mobileqq/startup/step/UpgradeDB;
    //   25: getfield 25	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Int	I
    //   28: i2l
    //   29: invokevirtual 31	java/lang/Object:wait	(J)V
    //   32: aload_2
    //   33: monitorexit
    //   34: aload_0
    //   35: getfield 10	reg:a	Lcom/tencent/mobileqq/startup/step/UpgradeDB;
    //   38: getfield 34	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   41: ifnull +85 -> 126
    //   44: aload_0
    //   45: getfield 10	reg:a	Lcom/tencent/mobileqq/startup/step/UpgradeDB;
    //   48: getfield 34	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   51: ldc 36
    //   53: iconst_0
    //   54: invokevirtual 42	com/tencent/common/app/BaseApplicationImpl:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   57: astore_2
    //   58: aload_0
    //   59: getfield 10	reg:a	Lcom/tencent/mobileqq/startup/step/UpgradeDB;
    //   62: getfield 25	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Int	I
    //   65: sipush 1000
    //   68: iadd
    //   69: sipush 30000
    //   72: if_icmplt +109 -> 181
    //   75: aload_2
    //   76: invokeinterface 48 1 0
    //   81: ldc 50
    //   83: iload_1
    //   84: invokeinterface 56 3 0
    //   89: invokeinterface 60 1 0
    //   94: pop
    //   95: invokestatic 65	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   98: ifeq +28 -> 126
    //   101: ldc 67
    //   103: iconst_2
    //   104: new 69	java/lang/StringBuilder
    //   107: dup
    //   108: invokespecial 70	java/lang/StringBuilder:<init>	()V
    //   111: ldc 72
    //   113: invokevirtual 76	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   116: iload_1
    //   117: invokevirtual 79	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   120: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   123: invokestatic 87	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   126: aload_0
    //   127: getfield 10	reg:a	Lcom/tencent/mobileqq/startup/step/UpgradeDB;
    //   130: iconst_0
    //   131: putfield 90	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Boolean	Z
    //   134: return
    //   135: astore_3
    //   136: aload_2
    //   137: monitorexit
    //   138: aload_3
    //   139: athrow
    //   140: astore_2
    //   141: invokestatic 65	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   144: ifeq -18 -> 126
    //   147: ldc 67
    //   149: iconst_2
    //   150: new 69	java/lang/StringBuilder
    //   153: dup
    //   154: invokespecial 70	java/lang/StringBuilder:<init>	()V
    //   157: ldc 92
    //   159: invokevirtual 76	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   162: aload_0
    //   163: getfield 10	reg:a	Lcom/tencent/mobileqq/startup/step/UpgradeDB;
    //   166: getfield 25	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Int	I
    //   169: invokevirtual 79	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   172: invokevirtual 83	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   175: invokestatic 87	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   178: goto -52 -> 126
    //   181: aload_0
    //   182: getfield 10	reg:a	Lcom/tencent/mobileqq/startup/step/UpgradeDB;
    //   185: getfield 25	com/tencent/mobileqq/startup/step/UpgradeDB:jdField_a_of_type_Int	I
    //   188: istore_1
    //   189: iload_1
    //   190: sipush 1000
    //   193: iadd
    //   194: istore_1
    //   195: goto -120 -> 75
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	198	0	this	reg
    //   3	192	1	i	int
    //   140	1	2	localInterruptedException	InterruptedException
    //   135	4	3	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   14	34	135	finally
    //   136	138	135	finally
    //   4	14	140	java/lang/InterruptedException
    //   34	75	140	java/lang/InterruptedException
    //   75	126	140	java/lang/InterruptedException
    //   138	140	140	java/lang/InterruptedException
    //   181	189	140	java/lang/InterruptedException
  }
}
