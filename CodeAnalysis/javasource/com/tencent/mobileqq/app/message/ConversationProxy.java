package com.tencent.mobileqq.app.message;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.BaseProxy;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.data.ConversationInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.NoColumnErrorHandler;
import com.tencent.qphone.base.util.QLog;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import njq;

public class ConversationProxy
  extends BaseProxy
{
  static final String jdField_a_of_type_JavaLangString = "Q.unread.Proxy";
  EntityManager jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager;
  NoColumnErrorHandler jdField_a_of_type_ComTencentMobileqqPersistenceNoColumnErrorHandler;
  private Object jdField_a_of_type_JavaLangObject;
  private ConcurrentHashMap jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap;
  private boolean jdField_a_of_type_Boolean;
  
  public ConversationProxy(QQAppInterface paramQQAppInterface, ProxyManager paramProxyManager)
  {
    super(paramQQAppInterface, paramProxyManager);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager = null;
    jdField_a_of_type_JavaLangObject = new Object();
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqPersistenceNoColumnErrorHandler = new njq(this);
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  }
  
  private EntityManager a()
  {
    if ((jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager == null) || (!jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a())) {}
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if ((jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager == null) || (!jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a())) {
        jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
      }
      return jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager;
    }
  }
  
  /* Error */
  protected int a(String paramString, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: iload_2
    //   4: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   7: astore_1
    //   8: aload_1
    //   9: ifnull +33 -> 42
    //   12: aload_0
    //   13: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   16: aload_1
    //   17: invokevirtual 76	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   20: ifeq +22 -> 42
    //   23: aload_0
    //   24: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   27: aload_1
    //   28: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   31: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   34: getfield 86	com/tencent/mobileqq/data/ConversationInfo:unreadCount	I
    //   37: istore_2
    //   38: aload_0
    //   39: monitorexit
    //   40: iload_2
    //   41: ireturn
    //   42: iconst_0
    //   43: istore_2
    //   44: goto -6 -> 38
    //   47: astore_1
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_1
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	ConversationProxy
    //   0	52	1	paramString	String
    //   0	52	2	paramInt	int
    // Exception table:
    //   from	to	target	type
    //   2	8	47	finally
    //   12	38	47	finally
  }
  
  /* Error */
  protected long a(String paramString, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: iload_2
    //   4: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   7: astore_1
    //   8: aload_1
    //   9: ifnull +33 -> 42
    //   12: aload_0
    //   13: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   16: aload_1
    //   17: invokevirtual 76	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   20: ifeq +22 -> 42
    //   23: aload_0
    //   24: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   27: aload_1
    //   28: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   31: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   34: getfield 91	com/tencent/mobileqq/data/ConversationInfo:lastread	J
    //   37: lstore_3
    //   38: aload_0
    //   39: monitorexit
    //   40: lload_3
    //   41: lreturn
    //   42: lconst_0
    //   43: lstore_3
    //   44: goto -6 -> 38
    //   47: astore_1
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_1
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	ConversationProxy
    //   0	52	1	paramString	String
    //   0	52	2	paramInt	int
    //   37	7	3	l	long
    // Exception table:
    //   from	to	target	type
    //   2	8	47	finally
    //   12	38	47	finally
  }
  
  /* Error */
  protected ConversationInfo a(String paramString, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: iload_2
    //   4: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   7: astore_1
    //   8: aload_1
    //   9: ifnull +30 -> 39
    //   12: aload_0
    //   13: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   16: aload_1
    //   17: invokevirtual 76	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   20: ifeq +19 -> 39
    //   23: aload_0
    //   24: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   27: aload_1
    //   28: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   31: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   34: astore_1
    //   35: aload_0
    //   36: monitorexit
    //   37: aload_1
    //   38: areturn
    //   39: aconst_null
    //   40: astore_1
    //   41: goto -6 -> 35
    //   44: astore_1
    //   45: aload_0
    //   46: monitorexit
    //   47: aload_1
    //   48: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	49	0	this	ConversationProxy
    //   0	49	1	paramString	String
    //   0	49	2	paramInt	int
    // Exception table:
    //   from	to	target	type
    //   2	8	44	finally
    //   12	35	44	finally
  }
  
  protected Set a()
  {
    try
    {
      HashSet localHashSet1 = new HashSet(jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.values());
      return localHashSet1;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.e("Q.unread.Proxy", 2, "cloneConversationInfoSet OOM!", localOutOfMemoryError);
        }
        HashSet localHashSet2 = new HashSet();
      }
    }
    finally {}
  }
  
  protected void a() {}
  
  protected void a(String paramString, int paramInt)
  {
    try
    {
      String str = MsgProxyUtils.a(paramString, paramInt);
      if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(str))
      {
        c(paramString, paramInt, (ConversationInfo)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(str));
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(str);
      }
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  protected void a(String paramString, int paramInt1, int paramInt2)
  {
    for (;;)
    {
      Object localObject;
      try
      {
        localObject = MsgProxyUtils.a(paramString, paramInt1);
        if ((jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(localObject)) && (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(localObject) != null))
        {
          localObject = (ConversationInfo)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(localObject);
          if (unreadMark != paramInt2)
          {
            unreadMark = paramInt2;
            if (QLog.isColorLevel()) {
              QLog.d("Q.unread.Proxy", 2, "insertOrUpdateUnreadMark update=" + ((ConversationInfo)localObject).toString());
            }
            a(paramString, paramInt1, (ConversationInfo)localObject);
            return;
          }
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d("Q.unread.Proxy", 2, "insertOrUpdateUnreadMark nochange=" + ((ConversationInfo)localObject).toString());
          continue;
        }
        localConversationInfo = new ConversationInfo(paramString, paramInt1, 0L, 0);
      }
      finally {}
      ConversationInfo localConversationInfo;
      unreadMark = paramInt2;
      if (QLog.isColorLevel()) {
        QLog.d("Q.unread.Proxy", 2, "insertOrUpdateUnreadMark insert=" + localConversationInfo.toString());
      }
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(localObject, localConversationInfo);
      b(paramString, paramInt1, localConversationInfo);
    }
  }
  
  /* Error */
  protected void a(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: iload_2
    //   4: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   7: astore 6
    //   9: aload_0
    //   10: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   13: aload 6
    //   15: invokevirtual 76	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   18: ifeq +66 -> 84
    //   21: aload_0
    //   22: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   25: aload 6
    //   27: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   30: ifnull +54 -> 84
    //   33: aload_0
    //   34: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   37: aload 6
    //   39: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   42: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   45: astore 6
    //   47: aload_0
    //   48: aload_1
    //   49: iload_2
    //   50: aload 6
    //   52: getfield 91	com/tencent/mobileqq/data/ConversationInfo:lastread	J
    //   55: aload 6
    //   57: getfield 86	com/tencent/mobileqq/data/ConversationInfo:unreadCount	I
    //   60: iload_3
    //   61: iadd
    //   62: aload 6
    //   64: getfield 166	com/tencent/mobileqq/data/ConversationInfo:unreadGiftCount	I
    //   67: iload 4
    //   69: iadd
    //   70: aload 6
    //   72: getfield 169	com/tencent/mobileqq/data/ConversationInfo:extInt1	I
    //   75: iload 5
    //   77: iadd
    //   78: invokevirtual 172	com/tencent/mobileqq/app/message/ConversationProxy:a	(Ljava/lang/String;IJIII)V
    //   81: aload_0
    //   82: monitorexit
    //   83: return
    //   84: aload_0
    //   85: aload_1
    //   86: iload_2
    //   87: lconst_0
    //   88: iload_3
    //   89: iload 4
    //   91: iload 5
    //   93: invokevirtual 172	com/tencent/mobileqq/app/message/ConversationProxy:a	(Ljava/lang/String;IJIII)V
    //   96: goto -15 -> 81
    //   99: astore_1
    //   100: aload_0
    //   101: monitorexit
    //   102: aload_1
    //   103: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	104	0	this	ConversationProxy
    //   0	104	1	paramString	String
    //   0	104	2	paramInt1	int
    //   0	104	3	paramInt2	int
    //   0	104	4	paramInt3	int
    //   0	104	5	paramInt4	int
    //   7	64	6	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	81	99	finally
    //   84	96	99	finally
  }
  
  protected void a(String paramString, int paramInt1, long paramLong, int paramInt2, int paramInt3, int paramInt4)
  {
    for (;;)
    {
      Object localObject;
      try
      {
        localObject = MsgProxyUtils.a(paramString, paramInt1);
        if ((jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(localObject)) && (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(localObject) != null))
        {
          localObject = (ConversationInfo)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(localObject);
          if (((lastread < paramLong) && (ConversationFacade.a(paramInt1))) || ((lastread != paramLong) && (!ConversationFacade.a(paramInt1))) || (unreadCount != paramInt2) || (unreadGiftCount != paramInt3) || (extInt1 != paramInt4))
          {
            long l = paramLong;
            if (ConversationFacade.a(paramInt1)) {
              l = Math.max(lastread, paramLong);
            }
            lastread = l;
            unreadCount = Math.max(0, paramInt2);
            unreadGiftCount = Math.max(0, paramInt3);
            extInt1 = Math.max(0, paramInt4);
            if (QLog.isColorLevel()) {
              QLog.d("Q.unread.Proxy", 2, "insertOrUpdateUnread update=" + ((ConversationInfo)localObject).toString());
            }
            a(paramString, paramInt1, (ConversationInfo)localObject);
            return;
          }
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d("Q.unread.Proxy", 2, "insertOrUpdateUnread nochange=" + ((ConversationInfo)localObject).toString());
          continue;
        }
        localConversationInfo = new ConversationInfo(paramString, paramInt1, paramLong, Math.max(0, paramInt2));
      }
      finally {}
      ConversationInfo localConversationInfo;
      unreadGiftCount = Math.max(0, paramInt3);
      extInt1 = Math.max(0, paramInt4);
      if (QLog.isColorLevel()) {
        QLog.d("Q.unread.Proxy", 2, "insertOrUpdateUnread insert=" + localConversationInfo.toString());
      }
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(localObject, localConversationInfo);
      b(paramString, paramInt1, localConversationInfo);
    }
  }
  
  protected void a(String paramString, int paramInt, ConversationInfo paramConversationInfo)
  {
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramString, paramInt, ConversationInfo.getConversationInfoTableName(), paramConversationInfo, 4, null);
  }
  
  /* Error */
  protected int b(String paramString, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: iload_2
    //   4: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   7: astore_1
    //   8: aload_1
    //   9: ifnull +33 -> 42
    //   12: aload_0
    //   13: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   16: aload_1
    //   17: invokevirtual 76	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   20: ifeq +22 -> 42
    //   23: aload_0
    //   24: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   27: aload_1
    //   28: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   31: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   34: getfield 128	com/tencent/mobileqq/data/ConversationInfo:unreadMark	I
    //   37: istore_2
    //   38: aload_0
    //   39: monitorexit
    //   40: iload_2
    //   41: ireturn
    //   42: iconst_0
    //   43: istore_2
    //   44: goto -6 -> 38
    //   47: astore_1
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_1
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	ConversationProxy
    //   0	52	1	paramString	String
    //   0	52	2	paramInt	int
    // Exception table:
    //   from	to	target	type
    //   2	8	47	finally
    //   12	38	47	finally
  }
  
  protected void b()
  {
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    if ((jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager != null) && (jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a())) {
      jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
    }
  }
  
  /* Error */
  protected void b(String paramString, int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: iload_2
    //   4: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   7: astore 4
    //   9: aload_0
    //   10: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   13: aload 4
    //   15: invokevirtual 76	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   18: ifeq +54 -> 72
    //   21: aload_0
    //   22: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   25: aload 4
    //   27: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   30: ifnull +42 -> 72
    //   33: aload_0
    //   34: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   37: aload 4
    //   39: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   42: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   45: astore 4
    //   47: aload_0
    //   48: aload_1
    //   49: iload_2
    //   50: aload 4
    //   52: getfield 91	com/tencent/mobileqq/data/ConversationInfo:lastread	J
    //   55: iload_3
    //   56: aload 4
    //   58: getfield 166	com/tencent/mobileqq/data/ConversationInfo:unreadGiftCount	I
    //   61: aload 4
    //   63: getfield 169	com/tencent/mobileqq/data/ConversationInfo:extInt1	I
    //   66: invokevirtual 172	com/tencent/mobileqq/app/message/ConversationProxy:a	(Ljava/lang/String;IJIII)V
    //   69: aload_0
    //   70: monitorexit
    //   71: return
    //   72: aload_0
    //   73: aload_1
    //   74: iload_2
    //   75: lconst_0
    //   76: iload_3
    //   77: iconst_0
    //   78: iconst_0
    //   79: invokevirtual 172	com/tencent/mobileqq/app/message/ConversationProxy:a	(Ljava/lang/String;IJIII)V
    //   82: goto -13 -> 69
    //   85: astore_1
    //   86: aload_0
    //   87: monitorexit
    //   88: aload_1
    //   89: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	90	0	this	ConversationProxy
    //   0	90	1	paramString	String
    //   0	90	2	paramInt1	int
    //   0	90	3	paramInt2	int
    //   7	55	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	69	85	finally
    //   72	82	85	finally
  }
  
  protected void b(String paramString, int paramInt, ConversationInfo paramConversationInfo)
  {
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramString, paramInt, ConversationInfo.getConversationInfoTableName(), paramConversationInfo, 3, null);
  }
  
  /* Error */
  protected int c(String paramString, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: iload_2
    //   4: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   7: astore_1
    //   8: aload_0
    //   9: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   12: aload_1
    //   13: invokevirtual 76	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   16: ifeq +22 -> 38
    //   19: aload_0
    //   20: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   23: aload_1
    //   24: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   27: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   30: getfield 166	com/tencent/mobileqq/data/ConversationInfo:unreadGiftCount	I
    //   33: istore_2
    //   34: aload_0
    //   35: monitorexit
    //   36: iload_2
    //   37: ireturn
    //   38: iconst_0
    //   39: istore_2
    //   40: goto -6 -> 34
    //   43: astore_1
    //   44: aload_0
    //   45: monitorexit
    //   46: aload_1
    //   47: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	48	0	this	ConversationProxy
    //   0	48	1	paramString	String
    //   0	48	2	paramInt	int
    // Exception table:
    //   from	to	target	type
    //   2	34	43	finally
  }
  
  /* Error */
  protected void c()
  {
    // Byte code:
    //   0: invokestatic 109	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3: ifeq +11 -> 14
    //   6: ldc 8
    //   8: iconst_2
    //   9: ldc -44
    //   11: invokestatic 215	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   14: aload_0
    //   15: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   18: invokevirtual 206	java/util/concurrent/ConcurrentHashMap:clear	()V
    //   21: aload_0
    //   22: invokespecial 217	com/tencent/mobileqq/app/message/ConversationProxy:a	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   25: ldc 82
    //   27: invokestatic 198	com/tencent/mobileqq/data/ConversationInfo:getConversationInfoTableName	()Ljava/lang/String;
    //   30: iconst_0
    //   31: aconst_null
    //   32: aconst_null
    //   33: aconst_null
    //   34: aconst_null
    //   35: aconst_null
    //   36: aconst_null
    //   37: aload_0
    //   38: getfield 40	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_ComTencentMobileqqPersistenceNoColumnErrorHandler	Lcom/tencent/mobileqq/persistence/NoColumnErrorHandler;
    //   41: invokevirtual 220	com/tencent/mobileqq/persistence/EntityManager:a	(Ljava/lang/Class;Ljava/lang/String;ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/mobileqq/persistence/NoColumnErrorHandler;)Ljava/util/List;
    //   44: astore_2
    //   45: aload_0
    //   46: getfield 33	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_Boolean	Z
    //   49: ifeq +44 -> 93
    //   52: aload_0
    //   53: invokespecial 217	com/tencent/mobileqq/app/message/ConversationProxy:a	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   56: ldc 82
    //   58: invokevirtual 223	com/tencent/mobileqq/persistence/EntityManager:a	(Ljava/lang/Class;)Z
    //   61: pop
    //   62: invokestatic 109	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   65: ifeq +11 -> 76
    //   68: ldc 8
    //   70: iconst_2
    //   71: ldc -31
    //   73: invokestatic 146	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   76: invokestatic 231	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   79: invokestatic 236	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   82: aconst_null
    //   83: ldc -18
    //   85: iconst_1
    //   86: lconst_1
    //   87: lconst_0
    //   88: aconst_null
    //   89: aconst_null
    //   90: invokevirtual 241	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;)V
    //   93: aload_2
    //   94: ifnonnull +4 -> 98
    //   97: return
    //   98: invokestatic 109	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   101: ifeq +33 -> 134
    //   104: ldc 8
    //   106: iconst_2
    //   107: new 130	java/lang/StringBuilder
    //   110: dup
    //   111: invokespecial 131	java/lang/StringBuilder:<init>	()V
    //   114: ldc -13
    //   116: invokevirtual 137	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   119: aload_2
    //   120: invokeinterface 249 1 0
    //   125: invokevirtual 252	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   128: invokevirtual 142	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   131: invokestatic 146	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   134: iconst_0
    //   135: istore_1
    //   136: iload_1
    //   137: aload_2
    //   138: invokeinterface 249 1 0
    //   143: if_icmpge -46 -> 97
    //   146: aload_0
    //   147: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   150: aload_2
    //   151: iload_1
    //   152: invokeinterface 255 2 0
    //   157: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   160: getfield 258	com/tencent/mobileqq/data/ConversationInfo:uin	Ljava/lang/String;
    //   163: aload_2
    //   164: iload_1
    //   165: invokeinterface 255 2 0
    //   170: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   173: getfield 261	com/tencent/mobileqq/data/ConversationInfo:type	I
    //   176: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   179: aload_2
    //   180: iload_1
    //   181: invokeinterface 255 2 0
    //   186: invokevirtual 159	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   189: pop
    //   190: iload_1
    //   191: iconst_1
    //   192: iadd
    //   193: istore_1
    //   194: goto -58 -> 136
    //   197: astore_2
    //   198: aload_2
    //   199: athrow
    //   200: astore_2
    //   201: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	202	0	this	ConversationProxy
    //   135	59	1	i	int
    //   44	136	2	localList	java.util.List
    //   197	2	2	localObject	Object
    //   200	1	2	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   136	190	197	finally
    //   136	190	200	java/lang/Exception
  }
  
  /* Error */
  protected void c(String paramString, int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: iload_2
    //   4: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   7: astore 4
    //   9: aload_0
    //   10: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   13: aload 4
    //   15: invokevirtual 76	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   18: ifeq +60 -> 78
    //   21: aload_0
    //   22: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   25: aload 4
    //   27: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   30: ifnull +48 -> 78
    //   33: aload_0
    //   34: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   37: aload 4
    //   39: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   42: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   45: astore 4
    //   47: aload_0
    //   48: aload_1
    //   49: iload_2
    //   50: aload 4
    //   52: getfield 91	com/tencent/mobileqq/data/ConversationInfo:lastread	J
    //   55: aload 4
    //   57: getfield 86	com/tencent/mobileqq/data/ConversationInfo:unreadCount	I
    //   60: iload_3
    //   61: iadd
    //   62: aload 4
    //   64: getfield 166	com/tencent/mobileqq/data/ConversationInfo:unreadGiftCount	I
    //   67: aload 4
    //   69: getfield 169	com/tencent/mobileqq/data/ConversationInfo:extInt1	I
    //   72: invokevirtual 172	com/tencent/mobileqq/app/message/ConversationProxy:a	(Ljava/lang/String;IJIII)V
    //   75: aload_0
    //   76: monitorexit
    //   77: return
    //   78: aload_0
    //   79: aload_1
    //   80: iload_2
    //   81: lconst_0
    //   82: iload_3
    //   83: iconst_0
    //   84: iconst_0
    //   85: invokevirtual 172	com/tencent/mobileqq/app/message/ConversationProxy:a	(Ljava/lang/String;IJIII)V
    //   88: goto -13 -> 75
    //   91: astore_1
    //   92: aload_0
    //   93: monitorexit
    //   94: aload_1
    //   95: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	96	0	this	ConversationProxy
    //   0	96	1	paramString	String
    //   0	96	2	paramInt1	int
    //   0	96	3	paramInt2	int
    //   7	61	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	75	91	finally
    //   78	88	91	finally
  }
  
  protected void c(String paramString, int paramInt, ConversationInfo paramConversationInfo)
  {
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(paramString, paramInt, ConversationInfo.getConversationInfoTableName(), paramConversationInfo, 5, null);
  }
  
  /* Error */
  protected int d(String paramString, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: iload_2
    //   4: invokestatic 72	com/tencent/mobileqq/app/message/MsgProxyUtils:a	(Ljava/lang/String;I)Ljava/lang/String;
    //   7: astore_1
    //   8: aload_0
    //   9: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   12: aload_1
    //   13: invokevirtual 76	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   16: ifeq +22 -> 38
    //   19: aload_0
    //   20: getfield 45	com/tencent/mobileqq/app/message/ConversationProxy:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   23: aload_1
    //   24: invokevirtual 80	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   27: checkcast 82	com/tencent/mobileqq/data/ConversationInfo
    //   30: getfield 169	com/tencent/mobileqq/data/ConversationInfo:extInt1	I
    //   33: istore_2
    //   34: aload_0
    //   35: monitorexit
    //   36: iload_2
    //   37: ireturn
    //   38: iconst_0
    //   39: istore_2
    //   40: goto -6 -> 34
    //   43: astore_1
    //   44: aload_0
    //   45: monitorexit
    //   46: aload_1
    //   47: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	48	0	this	ConversationProxy
    //   0	48	1	paramString	String
    //   0	48	2	paramInt	int
    // Exception table:
    //   from	to	target	type
    //   2	34	43	finally
  }
  
  protected void d()
  {
    try
    {
      if (!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.isEmpty())
      {
        Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.values().iterator();
        while (localIterator.hasNext())
        {
          ConversationInfo localConversationInfo = (ConversationInfo)localIterator.next();
          if ((unreadCount > 0) || (unreadMark > 0))
          {
            unreadCount = 0;
            unreadGiftCount = 0;
            unreadMark = 0;
            extInt1 = 0;
            a(uin, type, localConversationInfo);
          }
        }
      }
    }
    finally {}
  }
}
