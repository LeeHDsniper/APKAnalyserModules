package com.tencent.mobileqq.transfile;

import QQService.StreamData;
import QQService.StreamInfo;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.DownCallBack;
import com.tencent.mobileqq.pic.DownCallBack.DownResult;
import com.tencent.mobileqq.pic.PicPreDownloadUtils;
import com.tencent.mobileqq.pic.PicPreDownloader;
import com.tencent.mobileqq.streamtransfile.StreamDataManager;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.httputils.HttpCommunicator;
import com.tencent.mobileqq.utils.httputils.IHttpCommunicatorListener;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import rml;

public class TransFileController
  extends BaseTransFileController
{
  public static final boolean a = false;
  public static final String b = "Q.richmedia.TransFileController";
  public static final String c = "key_pre_conn";
  public static final String d = "use";
  public QQAppInterface a;
  ArrayList a;
  ArrayList b;
  public ConcurrentHashMap b;
  public String e;
  
  public TransFileController(QQAppInterface paramQQAppInterface)
  {
    super(paramQQAppInterface);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    e = null;
    jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap(20);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_b_of_type_JavaUtilArrayList = new ArrayList();
    if (QLog.isColorLevel()) {
      QLog.d("Q.richmedia.TransFileController", 2, "construct transfilecontroller:" + this);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  public static String a(TransferRequest paramTransferRequest)
  {
    return a(f, e, b);
  }
  
  public static String a(String paramString)
  {
    try
    {
      paramString = PreferenceManager.getDefaultSharedPreferences(BaseApplicationImpl.getContext()).getString(paramString, null);
      return paramString;
    }
    catch (Exception paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  public static String a(String paramString1, String paramString2, int paramInt)
  {
    if ((paramString1 != null) && (!"null".equals(paramString1)) && (!"".equals(paramString1))) {
      return paramString1 + "_" + paramInt;
    }
    return paramString2 + "_" + paramInt;
  }
  
  private void a(TransferRequest paramTransferRequest, BaseTransProcessor paramBaseTransProcessor)
  {
    try
    {
      RichMediaUtil.a(jdField_a_of_type_Int, jdField_a_of_type_Boolean, b, String.valueOf(jdField_a_of_type_Long), "callwait", "");
      paramBaseTransProcessor.wait();
      RichMediaUtil.a(jdField_a_of_type_Int, jdField_a_of_type_Boolean, b, String.valueOf(jdField_a_of_type_Long), "waitfin", "");
      return;
    }
    catch (InterruptedException paramTransferRequest)
    {
      paramTransferRequest.printStackTrace();
    }
  }
  
  private void a(TransferRequest paramTransferRequest, BaseTransProcessor paramBaseTransProcessor, String paramString, boolean paramBoolean)
  {
    String str;
    if (paramBoolean)
    {
      str = "sync ";
      if (paramBoolean) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString);
      }
      ??? = (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
      if (??? == null) {
        break label418;
      }
      if (!(??? instanceof BaseDownloadProcessor)) {}
    }
    label418:
    do
    {
      do
      {
        long l;
        TransferRequest localTransferRequest;
        do
        {
          synchronized ((BaseDownloadProcessor)???)
          {
            l = ((BaseDownloadProcessor)???).c();
            localTransferRequest = ((BaseDownloadProcessor)???).a();
            RichMediaUtil.a(jdField_a_of_type_Int, jdField_a_of_type_Boolean, b, String.valueOf(jdField_a_of_type_Long), str + "startDownloadProcessor", "status:" + l + ",key:" + paramString);
            if ((l == -1L) || (l == 2002L) || (l == 2001L))
            {
              jdField_a_of_type_ComTencentMobileqqTransfileTransferResult = jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
              if (jdField_a_of_type_ComTencentMobileqqPicDownCallBack != null) {
                jdField_b_of_type_JavaUtilArrayList.add(jdField_a_of_type_ComTencentMobileqqPicDownCallBack);
              }
              if (paramBoolean) {
                a(paramTransferRequest, (BaseTransProcessor)???);
              }
            }
            for (;;)
            {
              return;
              str = "aync ";
              break;
              if ((l == 2004L) || (l == 2005L))
              {
                if (paramBaseTransProcessor == null) {
                  continue;
                }
                jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, paramBaseTransProcessor);
                paramBaseTransProcessor.b(paramString);
                if (paramBaseTransProcessor.c() != 0) {
                  continue;
                }
                PicPreDownloadUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramTransferRequest);
                paramBaseTransProcessor.a();
                if (!paramBoolean) {
                  continue;
                }
                try
                {
                  RichMediaUtil.a(jdField_a_of_type_Int, jdField_a_of_type_Boolean, b, String.valueOf(jdField_a_of_type_Long), "callwait", "");
                  ???.wait();
                }
                catch (InterruptedException paramTransferRequest)
                {
                  paramTransferRequest.printStackTrace();
                }
              }
            }
          }
        } while (l != 2003L);
        jdField_a_of_type_ComTencentMobileqqTransfileTransferResult = jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
        if (jdField_a_of_type_ComTencentMobileqqPicDownCallBack != null)
        {
          paramBaseTransProcessor = new DownCallBack.DownResult();
          jdField_a_of_type_Int = 0;
          b = jdField_h_of_type_JavaLangString;
          jdField_c_of_type_JavaLangString = f;
          jdField_c_of_type_Int = b;
          d = g;
          jdField_a_of_type_ComTencentMobileqqPicDownCallBack.a(paramBaseTransProcessor);
        }
        return;
        RichMediaUtil.a(jdField_a_of_type_Int, jdField_a_of_type_Boolean, b, String.valueOf(jdField_a_of_type_Long), str + "startDownloadProcessor", "firs time ,key:" + paramString);
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, paramBaseTransProcessor);
        paramBaseTransProcessor.b(paramString);
      } while ((paramBaseTransProcessor == null) || (paramBaseTransProcessor.c() != 0));
      PicPreDownloadUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramTransferRequest);
      paramBaseTransProcessor.a();
    } while (!paramBoolean);
    try
    {
      a(paramTransferRequest, paramBaseTransProcessor);
      return;
    }
    finally {}
  }
  
  public static void a(String paramString1, String paramString2)
  {
    try
    {
      PreferenceManager.getDefaultSharedPreferences(BaseApplicationImpl.getContext()).edit().putString(paramString1, paramString2).commit();
      return;
    }
    catch (Exception paramString1)
    {
      paramString1.printStackTrace();
    }
  }
  
  private boolean a(IHttpCommunicatorListener paramIHttpCommunicatorListener)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramIHttpCommunicatorListener != null) {
      if (!(paramIHttpCommunicatorListener instanceof C2CPicUploadProcessor))
      {
        bool1 = bool2;
        if (!(paramIHttpCommunicatorListener instanceof GroupPicUploadProcessor)) {}
      }
      else
      {
        paramIHttpCommunicatorListener = (BaseTransProcessor)paramIHttpCommunicatorListener;
        bool1 = bool2;
        if (paramIHttpCommunicatorListener.c() != 1003L)
        {
          bool1 = bool2;
          if (paramIHttpCommunicatorListener.d() != 1003L) {
            bool1 = true;
          }
        }
      }
    }
    return bool1;
  }
  
  private boolean a(String paramString1, int paramInt1, String paramString2, String paramString3, long paramLong, int paramInt2, boolean paramBoolean)
  {
    String str = paramString1 + paramLong;
    if (!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(str))
    {
      if ((1 == paramInt2) && (!paramBoolean))
      {
        paramString1 = new LbsTransfileProcessor(paramString1, paramInt1, null, paramBoolean, this);
        paramString1.e(paramString2);
        paramString1.a((short)0);
      }
      for (;;)
      {
        if (paramString3 != null) {
          paramString1.c(paramString3);
        }
        if (paramLong != 0L) {
          paramString1.a(paramLong);
        }
        paramString1.e(paramInt2);
        paramString1.b(str);
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(str, paramString1);
        paramString1.a();
        return true;
        paramString2 = new LbsTransfileProcessor(paramString1, paramInt1, paramString2, paramBoolean, this);
        paramString1 = paramString2;
        if (65537 == paramInt2)
        {
          paramString1 = paramString2;
          if (!paramBoolean)
          {
            paramString2.a((short)120);
            paramString1 = paramString2;
          }
        }
      }
    }
    paramString1 = a(paramString1, paramLong);
    if (((paramString1 instanceof LbsTransfileProcessor)) && (paramString1 != null)) {
      ((LbsTransfileProcessor)paramString1).i();
    }
    return false;
  }
  
  private boolean b(IHttpCommunicatorListener paramIHttpCommunicatorListener)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramIHttpCommunicatorListener != null)
    {
      bool1 = bool2;
      if ((paramIHttpCommunicatorListener instanceof StructLongMessageDownloadProcessor))
      {
        bool1 = bool2;
        if (((BaseTransProcessor)paramIHttpCommunicatorListener).c() != 2003L) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  private boolean c(IHttpCommunicatorListener paramIHttpCommunicatorListener)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramIHttpCommunicatorListener != null) {
      if (!(paramIHttpCommunicatorListener instanceof JSPttUploadProcessor))
      {
        bool1 = bool2;
        if (!(paramIHttpCommunicatorListener instanceof JSPttDownloadProcessor)) {}
      }
      else
      {
        paramIHttpCommunicatorListener = (BaseTransProcessor)paramIHttpCommunicatorListener;
        bool1 = bool2;
        if (paramIHttpCommunicatorListener.c() != 1003L)
        {
          bool1 = bool2;
          if (paramIHttpCommunicatorListener.d() != 2003L) {
            bool1 = true;
          }
        }
      }
    }
    return bool1;
  }
  
  public int a(String paramString1, String paramString2, long paramLong)
  {
    paramString1 = paramString1 + paramLong;
    if ((!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.isEmpty()) && (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString1)))
    {
      paramString1 = (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString1);
      if ((paramString1 instanceof BaseTransProcessor)) {
        return ((BaseTransProcessor)paramString1).e();
      }
    }
    return 0;
  }
  
  public BaseTransProcessor a(TransferRequest paramTransferRequest)
  {
    if (paramTransferRequest == null) {
      return null;
    }
    if (b == 131078)
    {
      if (jdField_a_of_type_Boolean) {
        return new MultiMsgUpProcessor(this, paramTransferRequest);
      }
      return new MultiMsgDownloadProcessor(this, paramTransferRequest);
    }
    if (jdField_a_of_type_Int == 1026)
    {
      if (QLog.isColorLevel()) {
        QLog.i("PttShow", 2, "getProcessor UIN_TYPE_HOTCHAT_TOPIC  isUp = " + jdField_a_of_type_Boolean);
      }
      if (jdField_a_of_type_Boolean) {
        return new GroupPicUploadProcessor(this, paramTransferRequest);
      }
      if (b == 2) {
        return new GroupPttDownloadProcessor(this, paramTransferRequest);
      }
      return null;
    }
    if ((jdField_a_of_type_Int == 1) || (jdField_a_of_type_Int == 3000))
    {
      if (jdField_a_of_type_Boolean)
      {
        if ((b == 6) || (b == 17) || (b == 9)) {
          return new ShortVideoUploadProcessor(this, paramTransferRequest);
        }
        if (b == 20) {
          return new ShortVideoForwardProcessor(this, paramTransferRequest);
        }
        return new GroupPicUploadProcessor(this, paramTransferRequest);
      }
      if (b == 2) {
        return new GroupPttDownloadProcessor(this, paramTransferRequest);
      }
      if ((b == 1) || (b == 65537) || (b == 131075)) {
        return new GroupPicDownloadProcessor(this, paramTransferRequest);
      }
      if ((b == 6) || (b == 7) || (b == 17) || (b == 18) || (b == 9) || (b == 16)) {
        return new ShortVideoDownloadProcessor(this, paramTransferRequest);
      }
    }
    else
    {
      if (jdField_a_of_type_Boolean)
      {
        if (b == 2) {
          return new C2CPttUploadProcessor(this, paramTransferRequest);
        }
        if (b == 32) {
          return new JSPttUploadProcessor(this, paramTransferRequest);
        }
        if ((b == 6) || (b == 17) || (b == 9)) {
          return new ShortVideoUploadProcessor(this, paramTransferRequest);
        }
        if ((b == 8) || (b == 22) || (b == 21) || (b == 34)) {
          return new NearbyPeoplePhotoUploadProcessor(this, paramTransferRequest);
        }
        if (b == 20) {
          return new ShortVideoForwardProcessor(this, paramTransferRequest);
        }
        if (b == 24) {
          return new BDHCommonUploadProcessor(this, paramTransferRequest);
        }
        if (b == 23) {
          return new SnapChatPicUpProcessor(this, paramTransferRequest);
        }
        return new C2CPicUploadProcessor(this, paramTransferRequest);
      }
      if (b == 2) {
        return new C2CPttDownloadProcessor(this, paramTransferRequest);
      }
      if (b == 32) {
        return new JSPttDownloadProcessor(this, paramTransferRequest);
      }
      if (b == 33) {
        return new PAAudioPttDownloadProcessor(this, paramTransferRequest);
      }
      if ((b == 6) || (b == 7) || (b == 17) || (b == 18) || (b == 9) || (b == 16)) {
        return new ShortVideoDownloadProcessor(this, paramTransferRequest);
      }
      if ((b == 1) || (b == 65537) || (b == 131075)) {
        return new C2CPicDownloadProcessor(this, paramTransferRequest);
      }
      if (b == 131079) {
        return new StructLongMessageDownloadProcessor(this, paramTransferRequest);
      }
    }
    if (QLog.isColorLevel()) {
      QLog.e("Q.richmedia.TransFileController", 2, paramTransferRequest.toString());
    }
    return null;
  }
  
  public BaseTransProcessor a(String paramString, long paramLong)
  {
    paramString = a(paramString + paramLong);
    if ((paramString != null) && ((paramString instanceof BaseTransProcessor)))
    {
      paramString = (BaseTransProcessor)paramString;
      if ((j) && (i)) {
        return paramString;
      }
    }
    return null;
  }
  
  public TransferResult a(TransferRequest paramTransferRequest)
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqTransfileTransferResult = new TransferResult();
    Object localObject;
    if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
      if (b == 131076)
      {
        localObject = new UrlDownloader(this, paramTransferRequest);
        a(paramTransferRequest, (BaseTransProcessor)localObject, a(paramTransferRequest), true);
      }
    }
    for (;;)
    {
      return jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
      if ((jdField_a_of_type_Int == 1) || (jdField_a_of_type_Int == 3000))
      {
        localObject = new GroupPicDownloadProcessor(this, paramTransferRequest);
        break;
      }
      localObject = new C2CPicDownloadProcessor(this, paramTransferRequest);
      break;
      localObject = jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
      d = -1;
      jdField_a_of_type_Long = 9366L;
      jdField_a_of_type_JavaLangString = "transfilecontroller closed";
    }
  }
  
  public IHttpCommunicatorListener a(String paramString)
  {
    if (!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.isEmpty()) {
      return (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
    }
    return null;
  }
  
  public IHttpCommunicatorListener a(String paramString1, String paramString2, long paramLong)
  {
    return a(paramString1, paramLong);
  }
  
  public String a(String paramString, long paramLong)
  {
    return paramString + paramLong;
  }
  
  public void a()
  {
    long l;
    if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
      l = System.currentTimeMillis();
    }
    synchronized (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean)
    {
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b();
      b();
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
      if (QLog.isColorLevel()) {
        QLog.d("Q.richmedia.TransFileController", 2, "destroy transfilecontroller:" + this + " elapsed:" + (System.currentTimeMillis() - l));
      }
      return;
    }
  }
  
  public void a(long paramLong1, String paramString1, QQAppInterface paramQQAppInterface, int paramInt1, String paramString2, String paramString3, String paramString4, String paramString5, long paramLong2, int paramInt2)
  {
    String str = paramString2 + paramLong1;
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(str))
    {
      IHttpCommunicatorListener localIHttpCommunicatorListener = a(paramString2, paramLong1);
      if ((localIHttpCommunicatorListener instanceof ForwardImageProcessor)) {
        ((ForwardImageProcessor)localIHttpCommunicatorListener).a();
      }
    }
    paramString1 = new ForwardImageProcessor(paramLong1, paramString1, paramQQAppInterface, paramInt1, paramString2, paramString3, paramString4, paramString5, paramLong2, paramInt2);
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(str, paramString1);
  }
  
  public void a(StreamInfo paramStreamInfo, StreamData paramStreamData, long paramLong1, long paramLong2)
  {
    String str2 = StreamDataManager.a(iMsgId, 1);
    long l1 = lFromUIN;
    long l2 = lToUIN;
    String str1 = str2;
    if (str2 == null)
    {
      str1 = BuddyTransfileProcessor.a(String.valueOf(l2), null, 2, null);
      int i = Utils.a(pttFormat);
      str2 = MessageForPtt.getLocalFilePath(i, str1);
      StreamDataManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i, str2, 1, iMsgId);
      StreamDataManager.a(str2, (short)msgSeq);
      StreamDataManager.b(str2, random);
      str1 = str2;
      if (QLog.isColorLevel())
      {
        QLog.d("Q.richmedia.TransFileController", 2, "onReceiveStreamAction  key is:" + str2 + ",msgSeq is:" + msgSeq + ",random is:" + random);
        str1 = str2;
      }
    }
    a(String.valueOf(l1), str1, -1000L, paramStreamInfo, paramStreamData, paramLong1, paramLong2);
  }
  
  public void a(QQAppInterface paramQQAppInterface, String paramString)
  {
    ThreadManager.a(new rml(this, paramString, paramQQAppInterface), null, true);
  }
  
  public void a(String paramString)
  {
    if (paramString == null) {}
    for (;;)
    {
      return;
      Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
        if (a((IHttpCommunicatorListener)localObject))
        {
          localObject = (BaseTransProcessor)localObject;
          if ((paramString.equals(a.jdField_c_of_type_JavaLangString)) && (!i))
          {
            ((BaseTransProcessor)localObject).k();
            if (QLog.isColorLevel()) {
              QLog.d("cancelpic", 2, "pause pic:" + a.jdField_a_of_type_Long);
            }
          }
        }
      }
    }
  }
  
  public void a(String paramString, int paramInt)
  {
    Iterator localIterator = a(jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap).iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      IHttpCommunicatorListener localIHttpCommunicatorListener = (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(str);
      switch (paramInt)
      {
      case 1: 
      case 2: 
      default: 
        break;
      case 0: 
        if (((localIHttpCommunicatorListener instanceof BuddyTransfileProcessor)) && (paramString.equals(a.r)))
        {
          ((BaseTransProcessor)localIHttpCommunicatorListener).j();
          jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(str);
        }
        break;
      }
    }
  }
  
  public void a(String paramString, long paramLong)
  {
    if ((paramString == null) || (paramLong == 0L)) {}
    for (;;)
    {
      return;
      Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
        if (a((IHttpCommunicatorListener)localObject))
        {
          localObject = (BaseTransProcessor)localObject;
          if ((paramString.equals(a.jdField_c_of_type_JavaLangString)) && (paramLong == a.jdField_a_of_type_Long))
          {
            ((BaseTransProcessor)localObject).b();
            if (QLog.isColorLevel()) {
              QLog.d("cancelpic", 2, "cancel pic:" + a.jdField_a_of_type_Long);
            }
          }
        }
      }
    }
  }
  
  public void a(String paramString, TransFileController.OnCancelListener paramOnCancelListener)
  {
    if (paramString == null) {}
    ArrayList localArrayList;
    do
    {
      return;
      localArrayList = new ArrayList();
      Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
        if (a((IHttpCommunicatorListener)localObject))
        {
          localObject = (BaseTransProcessor)localObject;
          if ((paramString.equals(a.jdField_c_of_type_JavaLangString)) && (((BaseTransProcessor)localObject).c()))
          {
            ((BaseTransProcessor)localObject).b();
            if (QLog.isColorLevel()) {
              QLog.d("cancelpic", 2, "cancel pic:" + a.jdField_a_of_type_Long);
            }
            if (a.jdField_a_of_type_ComTencentMobileqqDataMessageRecord != null) {
              localArrayList.add(a.jdField_a_of_type_ComTencentMobileqqDataMessageRecord);
            }
          }
        }
      }
    } while (paramOnCancelListener == null);
    paramOnCancelListener.a(localArrayList);
  }
  
  public void a(String paramString, IHttpCommunicatorListener paramIHttpCommunicatorListener)
  {
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, paramIHttpCommunicatorListener);
  }
  
  public boolean a()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
    boolean bool = false;
    if (localIterator.hasNext())
    {
      Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
      if ((localObject == null) || (!(localObject instanceof BaseTransProcessor))) {
        break label171;
      }
      localObject = (BaseTransProcessor)localObject;
      if ((!k) || (i)) {
        break label171;
      }
      ((BaseTransProcessor)localObject).k();
      if (((BaseTransProcessor)localObject).a() != null) {
        jdField_a_of_type_JavaUtilArrayList.add(((BaseTransProcessor)localObject).a());
      }
      if (QLog.isColorLevel()) {
        QLog.d("short_video", 2, "pauseAllShortVideoSend key:" + ((BaseTransProcessor)localObject).a());
      }
      bool = true;
    }
    label171:
    for (;;)
    {
      break;
      if (QLog.isColorLevel()) {
        QLog.d("short_video", 2, "pauseAllShortVideoSend result:" + bool);
      }
      return bool;
    }
  }
  
  public boolean a(long paramLong)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
    boolean bool = false;
    if (localIterator.hasNext())
    {
      Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
      if ((localObject == null) || (!(localObject instanceof BaseUploadProcessor))) {
        break label175;
      }
      localObject = (BaseUploadProcessor)localObject;
      if ((a == null) || (!a.jdField_h_of_type_Boolean)) {
        break label175;
      }
      k = paramLong;
      if (QLog.isColorLevel()) {
        QLog.d("PresendPicReport", 2, "initAllPSProcessorEnterAioTime ,Processor:" + localObject + ",time = " + paramLong);
      }
      bool = true;
    }
    label175:
    for (;;)
    {
      break;
      if (QLog.isColorLevel()) {
        QLog.d("PresendPicReport", 2, "initAllPSProcessorEnterAioTime result:" + bool);
      }
      return bool;
    }
  }
  
  public boolean a(TransferRequest paramTransferRequest)
  {
    try
    {
      boolean bool = super.a(paramTransferRequest);
      return bool;
    }
    finally
    {
      paramTransferRequest = finally;
      throw paramTransferRequest;
    }
  }
  
  public boolean a(String paramString1, int paramInt, String paramString2, long paramLong)
  {
    return a(paramString1, paramInt, paramString2, null, paramLong, 2, true);
  }
  
  /* Error */
  public boolean a(String paramString, long paramLong)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 57	java/lang/StringBuilder
    //   5: dup
    //   6: invokespecial 58	java/lang/StringBuilder:<init>	()V
    //   9: aload_1
    //   10: invokevirtual 64	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   13: lload_2
    //   14: invokevirtual 194	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   17: invokevirtual 71	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   20: astore_1
    //   21: aload_0
    //   22: getfield 173	com/tencent/mobileqq/transfile/TransFileController:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   25: aload_1
    //   26: invokevirtual 293	java/util/concurrent/ConcurrentHashMap:containsKey	(Ljava/lang/Object;)Z
    //   29: ifeq +31 -> 60
    //   32: aload_0
    //   33: getfield 173	com/tencent/mobileqq/transfile/TransFileController:jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap	Ljava/util/concurrent/ConcurrentHashMap;
    //   36: aload_1
    //   37: invokevirtual 177	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   40: checkcast 366	com/tencent/mobileqq/transfile/ShortVideoDownloadProcessor
    //   43: astore_1
    //   44: aload_1
    //   45: ifnull +7 -> 52
    //   48: aload_1
    //   49: invokevirtual 639	com/tencent/mobileqq/transfile/ShortVideoDownloadProcessor:k	()V
    //   52: iconst_1
    //   53: istore 4
    //   55: aload_0
    //   56: monitorexit
    //   57: iload 4
    //   59: ireturn
    //   60: iconst_0
    //   61: istore 4
    //   63: goto -8 -> 55
    //   66: astore_1
    //   67: aload_0
    //   68: monitorexit
    //   69: aload_1
    //   70: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	71	0	this	TransFileController
    //   0	71	1	paramString	String
    //   0	71	2	paramLong	long
    //   53	9	4	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	44	66	finally
    //   48	52	66	finally
  }
  
  public boolean a(String paramString1, String paramString2)
  {
    return b(paramString1 + paramString2);
  }
  
  public boolean a(String paramString1, String paramString2, long paramLong)
  {
    paramString1 = paramString1 + paramLong;
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString1))
    {
      paramString2 = (BuddyTransfileProcessor)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString1);
      if (paramString2 != null) {
        paramString2.j();
      }
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString1);
      return true;
    }
    return false;
  }
  
  public boolean a(String paramString1, String paramString2, long paramLong1, StreamInfo paramStreamInfo, StreamData paramStreamData, long paramLong2, long paramLong3)
  {
    if (!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString1 + paramString2 + paramLong1))
    {
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
      {
        BuddyTransfileProcessor localBuddyTransfileProcessor = new BuddyTransfileProcessor(paramString1, paramString2, false, null, null, 2, -1, false, this, paramLong1);
        localBuddyTransfileProcessor.a(paramLong1);
        ae = paramString2;
        localBuddyTransfileProcessor.b(paramString1 + paramString2 + paramLong1);
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString1 + paramString2 + paramLong1, localBuddyTransfileProcessor);
        localBuddyTransfileProcessor.a(paramStreamInfo, paramStreamData, paramLong2, paramLong3);
        return true;
      }
      return false;
    }
    paramString1 = (BuddyTransfileProcessor)a(paramString1 + paramString2 + paramLong1);
    if (paramString1 != null) {
      paramString1.a(paramStreamInfo, paramStreamData, paramLong2, paramLong3);
    }
    return false;
  }
  
  public boolean a(String paramString1, String paramString2, long paramLong, short paramShort, int paramInt1, int paramInt2)
  {
    if (!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString1 + paramLong))
    {
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
      {
        paramString2 = new BuddyTransfileProcessor(paramString1, paramString2, true, null, null, 2, -1, false, this, paramLong);
        paramString2.a(paramLong);
        paramString2.e();
        paramString2.b(paramString1 + paramLong);
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString1 + paramLong, paramString2);
        paramString2.a(paramShort, false, paramInt1, paramInt2);
        return true;
      }
      return false;
    }
    paramString1 = (BuddyTransfileProcessor)a(paramString1, paramString2, paramLong);
    if (paramString1 != null) {
      paramString1.a(paramShort, false, paramInt1, paramInt2);
    }
    return false;
  }
  
  public int b(String paramString1, String paramString2, long paramLong)
  {
    paramString1 = paramString1 + paramLong;
    if ((!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.isEmpty()) && (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString1)))
    {
      paramString1 = (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString1);
      if ((paramString1 instanceof BaseTransProcessor)) {
        return (int)((BaseTransProcessor)paramString1).c();
      }
    }
    return -1;
  }
  
  public TransferResult b(TransferRequest paramTransferRequest)
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqTransfileTransferResult = new TransferResult();
    if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {}
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean)
      {
        Object localObject1;
        if ((!jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null))
        {
          localObject1 = jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
          d = -1;
          jdField_a_of_type_Long = 9366L;
          jdField_a_of_type_JavaLangString = "transfilecontroller closed";
          paramTransferRequest = jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
          return paramTransferRequest;
        }
        try
        {
          if (b == 131076)
          {
            localObject1 = new UrlDownloader(this, paramTransferRequest);
            a(paramTransferRequest, (BaseTransProcessor)localObject1, a(paramTransferRequest), false);
            return jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
          }
          if ((jdField_a_of_type_Int == 1) || (jdField_a_of_type_Int == 3000))
          {
            localObject1 = new GroupPicDownloadProcessor(this, paramTransferRequest);
            continue;
            paramTransferRequest = finally;
          }
        }
        catch (NullPointerException localNullPointerException)
        {
          localObject2 = jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
          d = -1;
          jdField_a_of_type_Long = 9366L;
          jdField_a_of_type_JavaLangString = "transfilecontroller closed";
          paramTransferRequest = jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
          return paramTransferRequest;
        }
      }
      Object localObject2 = new C2CPicDownloadProcessor(this, paramTransferRequest);
      continue;
      localObject2 = jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
      d = -1;
      jdField_a_of_type_Long = 9366L;
      jdField_a_of_type_JavaLangString = "transfilecontroller closed";
    }
  }
  
  public void b(String paramString)
  {
    if (paramString == null) {}
    for (;;)
    {
      return;
      Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
        if (a((IHttpCommunicatorListener)localObject))
        {
          localObject = (BaseTransProcessor)localObject;
          if ((paramString.equals(a.jdField_c_of_type_JavaLangString)) && (i))
          {
            ((BaseTransProcessor)localObject).a();
            if (QLog.isColorLevel()) {
              QLog.d("cancelpic", 2, "resume pic:" + a.jdField_a_of_type_Long);
            }
          }
        }
      }
    }
  }
  
  public void b(String paramString, long paramLong)
  {
    if ((paramString == null) || (paramLong == 0L)) {}
    for (;;)
    {
      return;
      Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
        if (c((IHttpCommunicatorListener)localObject))
        {
          localObject = (BaseTransProcessor)localObject;
          if ((paramString.equals(a.jdField_c_of_type_JavaLangString)) && (paramLong == a.jdField_a_of_type_Long))
          {
            ((BaseTransProcessor)localObject).b();
            if (QLog.isColorLevel()) {
              QLog.d("cancelpic", 2, "cancel JSPTT:" + a.jdField_a_of_type_Long);
            }
          }
        }
      }
    }
  }
  
  public boolean b()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
    boolean bool = false;
    if (localIterator.hasNext())
    {
      Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
      if ((localObject == null) || (!(localObject instanceof BaseTransProcessor))) {
        break label171;
      }
      localObject = (BaseTransProcessor)localObject;
      if ((!l) || (i)) {
        break label171;
      }
      ((BaseTransProcessor)localObject).k();
      if (((BaseTransProcessor)localObject).a() != null) {
        jdField_a_of_type_JavaUtilArrayList.add(((BaseTransProcessor)localObject).a());
      }
      if (QLog.isColorLevel()) {
        QLog.d("short_video", 2, "pauseAllShortVideoReceive key:" + ((BaseTransProcessor)localObject).a());
      }
      bool = true;
    }
    label171:
    for (;;)
    {
      break;
      if (QLog.isColorLevel()) {
        QLog.d("short_video", 2, "pauseAllShortVideoReceive result:" + bool);
      }
      return bool;
    }
  }
  
  public boolean b(String paramString)
  {
    paramString = a(paramString);
    if ((paramString != null) && ((paramString instanceof BaseTransProcessor)))
    {
      paramString = (BaseTransProcessor)paramString;
      if ((j) && (i))
      {
        paramString.a();
        if (QLog.isColorLevel()) {
          QLog.d("raw_photo", 2, "resumeRawSend ,key:" + paramString.a());
        }
        return true;
      }
    }
    return false;
  }
  
  public boolean b(String paramString1, int paramInt, String paramString2, long paramLong)
  {
    return a(paramString1, paramInt, null, paramString2, paramLong, 2, false);
  }
  
  public boolean b(String paramString, long paramLong)
  {
    for (;;)
    {
      try
      {
        paramString = paramString + paramLong;
        if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString))
        {
          paramString = (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
          if (paramString != null)
          {
            if ((paramString instanceof ShortVideoUploadProcessor)) {
              ((ShortVideoUploadProcessor)paramString).k();
            }
          }
          else
          {
            bool = true;
            return bool;
          }
          if (!(paramString instanceof ShortVideoForwardProcessor)) {
            continue;
          }
          ((ShortVideoForwardProcessor)paramString).k();
          continue;
        }
        boolean bool = false;
      }
      finally {}
    }
  }
  
  public boolean b(String paramString1, String paramString2, long paramLong)
  {
    paramString1 = paramString1 + paramString2 + paramLong;
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString1))
    {
      paramString2 = (BuddyTransfileProcessor)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString1);
      if (paramString2 != null) {
        paramString2.j();
      }
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString1);
      return true;
    }
    return false;
  }
  
  public void c() {}
  
  public void c(String paramString, long paramLong)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
      if (b((IHttpCommunicatorListener)localObject))
      {
        localObject = (BaseTransProcessor)localObject;
        if ((paramString.equals(a.jdField_c_of_type_JavaLangString)) && (paramLong == a.jdField_a_of_type_Long))
        {
          ((BaseTransProcessor)localObject).b();
          if (QLog.isColorLevel()) {
            QLog.d("cancelpic", 2, "cancel PALongMsg:" + a.jdField_a_of_type_Long);
          }
        }
      }
    }
  }
  
  public boolean c()
  {
    jdField_b_of_type_JavaUtilArrayList.clear();
    Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
    boolean bool = false;
    if (localIterator.hasNext())
    {
      Object localObject = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
      if ((localObject == null) || (!(localObject instanceof BaseTransProcessor))) {
        break label178;
      }
      localObject = (BaseTransProcessor)localObject;
      if ((!j) || (i)) {
        break label178;
      }
      ((BaseTransProcessor)localObject).k();
      if (((BaseTransProcessor)localObject).a() != null) {
        jdField_b_of_type_JavaUtilArrayList.add(((BaseTransProcessor)localObject).a());
      }
      if (QLog.isColorLevel()) {
        QLog.d("raw_photo", 2, "pauseAllRawSend key:" + ((BaseTransProcessor)localObject).a());
      }
      bool = true;
    }
    label178:
    for (;;)
    {
      break;
      if (QLog.isColorLevel()) {
        QLog.d("raw_photo", 2, "pauseAllRawSend result:" + bool);
      }
      return bool;
    }
  }
  
  public boolean c(String paramString)
  {
    if (paramString == null) {}
    label90:
    label91:
    for (;;)
    {
      return false;
      Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
      int i = 0;
      if (localIterator.hasNext())
      {
        IHttpCommunicatorListener localIHttpCommunicatorListener = (IHttpCommunicatorListener)((Map.Entry)localIterator.next()).getValue();
        if ((!a(localIHttpCommunicatorListener)) || (!paramString.equals(a.jdField_c_of_type_JavaLangString))) {
          break label90;
        }
        i += 1;
      }
      for (;;)
      {
        break;
        if (i <= 1) {
          break label91;
        }
        return true;
      }
    }
  }
  
  public boolean c(String paramString1, int paramInt, String paramString2, long paramLong)
  {
    return a(paramString1, paramInt, paramString2, null, paramLong, 1, true);
  }
  
  public boolean c(String paramString, long paramLong)
  {
    for (;;)
    {
      try
      {
        paramString = paramString + paramLong;
        if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString))
        {
          IHttpCommunicatorListener localIHttpCommunicatorListener = (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
          if (localIHttpCommunicatorListener != null)
          {
            if ((localIHttpCommunicatorListener instanceof ShortVideoUploadProcessor)) {
              ((ShortVideoUploadProcessor)localIHttpCommunicatorListener).k();
            }
          }
          else
          {
            jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString);
            bool = true;
            return bool;
          }
          if (!(localIHttpCommunicatorListener instanceof ShortVideoForwardProcessor)) {
            continue;
          }
          ((ShortVideoForwardProcessor)localIHttpCommunicatorListener).k();
          continue;
        }
        boolean bool = false;
      }
      finally {}
    }
  }
  
  public boolean c(String paramString1, String paramString2, long paramLong)
  {
    if (!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString1))
    {
      paramString2 = new HttpContinueDownloadFileProcessor(paramString1, paramString2, paramLong, this);
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString1, paramString2);
      paramString2.b(paramString1);
      paramString2.a();
      return true;
    }
    if (QLog.isColorLevel()) {
      QLog.d("ThemeDownloadTrace", 2, "startContinueDownloadFile  failed,url is:" + paramString1 + ",filePath is:" + paramString2 + ",destFileLen is:" + paramLong);
    }
    return false;
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("short_video", 2, "resumeLastShortVideoSend keys size:" + jdField_a_of_type_JavaUtilArrayList.size());
    }
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext())
    {
      Object localObject = a((String)localIterator.next());
      if ((localObject != null) && ((localObject instanceof BaseTransProcessor)))
      {
        localObject = (BaseTransProcessor)localObject;
        if (i)
        {
          ((BaseTransProcessor)localObject).a();
          if (QLog.isColorLevel()) {
            QLog.d("short_video", 2, "resumeLastShortVideoSend , key: " + ((BaseTransProcessor)localObject).a());
          }
        }
      }
    }
    jdField_a_of_type_JavaUtilArrayList.clear();
  }
  
  public boolean d(String paramString, long paramLong)
  {
    paramString = paramString + paramLong;
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString))
    {
      IHttpCommunicatorListener localIHttpCommunicatorListener = (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
      if ((localIHttpCommunicatorListener instanceof ShortVideoDownloadProcessor))
      {
        ((ShortVideoDownloadProcessor)localIHttpCommunicatorListener).k();
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString);
        return true;
      }
    }
    return false;
  }
  
  public void e()
  {
    if (QLog.isColorLevel()) {
      QLog.d("raw_photo", 2, "resumeLastRawSend keys size:" + jdField_b_of_type_JavaUtilArrayList.size());
    }
    Iterator localIterator = jdField_b_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext()) {
      b((String)localIterator.next());
    }
  }
  
  public boolean e(String paramString, long paramLong)
  {
    paramString = paramString + paramLong;
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString))
    {
      CommenTransFileProcessor localCommenTransFileProcessor = (CommenTransFileProcessor)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
      if (localCommenTransFileProcessor != null) {
        localCommenTransFileProcessor.j();
      }
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString);
      return true;
    }
    return false;
  }
}
