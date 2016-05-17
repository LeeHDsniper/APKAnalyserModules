package com.tencent.mobileqq.app;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class MemoryConfigs
{
  private static MemoryConfigs a;
  private static final int jdField_b_of_type_Int = 7;
  private static final String jdField_b_of_type_JavaLangString = "Q.Memory.MemoryConfigs";
  public float a;
  public int a;
  public long a;
  public String a;
  public boolean a;
  public float b;
  public boolean b;
  public boolean c;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqAppMemoryConfigs = null;
  }
  
  /* Error */
  private MemoryConfigs()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 31	java/lang/Object:<init>	()V
    //   4: aload_0
    //   5: ldc 33
    //   7: putfield 35	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   10: aload_0
    //   11: fconst_0
    //   12: putfield 37	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Float	F
    //   15: aload_0
    //   16: iconst_0
    //   17: putfield 39	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Boolean	Z
    //   20: aload_0
    //   21: iconst_0
    //   22: putfield 41	com/tencent/mobileqq/app/MemoryConfigs:jdField_b_of_type_Boolean	Z
    //   25: aload_0
    //   26: bipush 15
    //   28: putfield 43	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Int	I
    //   31: aload_0
    //   32: ldc2_w 44
    //   35: putfield 47	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Long	J
    //   38: aload_0
    //   39: iconst_1
    //   40: putfield 49	com/tencent/mobileqq/app/MemoryConfigs:c	Z
    //   43: aload_0
    //   44: ldc 50
    //   46: putfield 52	com/tencent/mobileqq/app/MemoryConfigs:jdField_b_of_type_Float	F
    //   49: invokestatic 57	com/tencent/mobileqq/app/DeviceProfileManager:a	()Lcom/tencent/mobileqq/app/DeviceProfileManager;
    //   52: astore_1
    //   53: aload_1
    //   54: getstatic 63	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:new_memory_strategy	Lcom/tencent/mobileqq/app/DeviceProfileManager$DpcNames;
    //   57: invokevirtual 67	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:name	()Ljava/lang/String;
    //   60: invokevirtual 70	com/tencent/mobileqq/app/DeviceProfileManager:a	(Ljava/lang/String;)Ljava/lang/String;
    //   63: astore_2
    //   64: invokestatic 76	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   67: ifeq +28 -> 95
    //   70: ldc 12
    //   72: iconst_2
    //   73: new 78	java/lang/StringBuilder
    //   76: dup
    //   77: invokespecial 79	java/lang/StringBuilder:<init>	()V
    //   80: ldc 81
    //   82: invokevirtual 85	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: aload_2
    //   86: invokevirtual 85	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   89: invokevirtual 88	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   92: invokestatic 92	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   95: aload_2
    //   96: invokestatic 98	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   99: ifne +12 -> 111
    //   102: aload_2
    //   103: ldc 100
    //   105: invokevirtual 106	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   108: ifeq +4 -> 112
    //   111: return
    //   112: aload_2
    //   113: ldc 108
    //   115: invokevirtual 112	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   118: astore_2
    //   119: aload_2
    //   120: arraylength
    //   121: iconst_1
    //   122: if_icmple +193 -> 315
    //   125: aload_2
    //   126: aload_1
    //   127: getfield 113	com/tencent/mobileqq/app/DeviceProfileManager:jdField_a_of_type_Int	I
    //   130: aload_2
    //   131: arraylength
    //   132: irem
    //   133: aaload
    //   134: astore_1
    //   135: aload_1
    //   136: ldc 115
    //   138: invokevirtual 112	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   141: astore_1
    //   142: aload_1
    //   143: arraylength
    //   144: bipush 7
    //   146: if_icmplt -35 -> 111
    //   149: aload_1
    //   150: iconst_1
    //   151: aaload
    //   152: ldc 117
    //   154: invokevirtual 112	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   157: astore_2
    //   158: aload_2
    //   159: iconst_0
    //   160: aaload
    //   161: ldc 119
    //   163: invokevirtual 106	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   166: ifeq +46 -> 212
    //   169: aload_0
    //   170: iconst_1
    //   171: putfield 41	com/tencent/mobileqq/app/MemoryConfigs:jdField_b_of_type_Boolean	Z
    //   174: aload_0
    //   175: aload_2
    //   176: iconst_1
    //   177: aaload
    //   178: invokestatic 125	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   181: putfield 43	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Int	I
    //   184: aload_0
    //   185: getfield 43	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Int	I
    //   188: bipush 50
    //   190: if_icmple +9 -> 199
    //   193: aload_0
    //   194: bipush 50
    //   196: putfield 43	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Int	I
    //   199: aload_0
    //   200: getfield 43	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Int	I
    //   203: iconst_1
    //   204: if_icmpge +8 -> 212
    //   207: aload_0
    //   208: iconst_1
    //   209: putfield 43	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Int	I
    //   212: aload_0
    //   213: aload_1
    //   214: iconst_2
    //   215: aaload
    //   216: putfield 35	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   219: aload_1
    //   220: iconst_3
    //   221: aaload
    //   222: ldc 119
    //   224: invokevirtual 129	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   227: ifeq +8 -> 235
    //   230: aload_0
    //   231: iconst_1
    //   232: putfield 39	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Boolean	Z
    //   235: aload_0
    //   236: aload_1
    //   237: iconst_4
    //   238: aaload
    //   239: invokestatic 135	java/lang/Float:valueOf	(Ljava/lang/String;)Ljava/lang/Float;
    //   242: invokevirtual 139	java/lang/Float:floatValue	()F
    //   245: putfield 37	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Float	F
    //   248: aload_0
    //   249: getfield 37	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Float	F
    //   252: fconst_1
    //   253: fcmpl
    //   254: ifle +8 -> 262
    //   257: aload_0
    //   258: fconst_1
    //   259: putfield 37	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Float	F
    //   262: ldc 119
    //   264: aload_1
    //   265: iconst_5
    //   266: aaload
    //   267: invokevirtual 129	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   270: ifeq +61 -> 331
    //   273: aload_0
    //   274: iconst_1
    //   275: putfield 49	com/tencent/mobileqq/app/MemoryConfigs:c	Z
    //   278: aload_0
    //   279: aload_1
    //   280: bipush 6
    //   282: aaload
    //   283: invokestatic 143	java/lang/Float:parseFloat	(Ljava/lang/String;)F
    //   286: putfield 52	com/tencent/mobileqq/app/MemoryConfigs:jdField_b_of_type_Float	F
    //   289: return
    //   290: astore_1
    //   291: aload_0
    //   292: ldc 50
    //   294: putfield 52	com/tencent/mobileqq/app/MemoryConfigs:jdField_b_of_type_Float	F
    //   297: return
    //   298: astore_1
    //   299: invokestatic 76	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   302: ifeq -191 -> 111
    //   305: ldc 12
    //   307: iconst_2
    //   308: ldc -111
    //   310: aload_1
    //   311: invokestatic 148	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   314: return
    //   315: aload_2
    //   316: iconst_0
    //   317: aaload
    //   318: astore_1
    //   319: goto -184 -> 135
    //   322: astore_2
    //   323: aload_0
    //   324: fconst_0
    //   325: putfield 37	com/tencent/mobileqq/app/MemoryConfigs:jdField_a_of_type_Float	F
    //   328: goto -66 -> 262
    //   331: aload_0
    //   332: iconst_0
    //   333: putfield 49	com/tencent/mobileqq/app/MemoryConfigs:c	Z
    //   336: goto -58 -> 278
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	339	0	this	MemoryConfigs
    //   52	228	1	localObject1	Object
    //   290	1	1	localException1	Exception
    //   298	13	1	localException2	Exception
    //   318	1	1	localObject2	Object
    //   63	253	2	localObject3	Object
    //   322	1	2	localException3	Exception
    // Exception table:
    //   from	to	target	type
    //   278	289	290	java/lang/Exception
    //   135	199	298	java/lang/Exception
    //   199	212	298	java/lang/Exception
    //   212	235	298	java/lang/Exception
    //   262	278	298	java/lang/Exception
    //   291	297	298	java/lang/Exception
    //   323	328	298	java/lang/Exception
    //   331	336	298	java/lang/Exception
    //   235	262	322	java/lang/Exception
  }
  
  public static MemoryConfigs a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMemoryConfigs == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqAppMemoryConfigs == null) {
        jdField_a_of_type_ComTencentMobileqqAppMemoryConfigs = new MemoryConfigs();
      }
      return jdField_a_of_type_ComTencentMobileqqAppMemoryConfigs;
    }
    finally {}
  }
}
