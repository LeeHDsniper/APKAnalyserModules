package com.tencent.mobileqq.transfile;

import android.os.Environment;
import android.os.Message;
import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.AppConstants.RichMediaErrorCode;
import com.tencent.mobileqq.app.MessageObserver.StatictisInfo;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.Logger;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.transfile.protohandler.RichProto.RichProtoReq;
import com.tencent.mobileqq.transfile.protohandler.RichProto.RichProtoResp;
import com.tencent.mobileqq.transfile.protohandler.RichProto.RichProtoResp.RespCommon;
import com.tencent.mobileqq.transfile.protohandler.RichProtoProc;
import com.tencent.mobileqq.transfile.protohandler.RichProtoProc.RichProtoCallback;
import com.tencent.mobileqq.utils.httputils.HttpMsg;
import com.tencent.mobileqq.utils.httputils.IHttpCommunicatorListener;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import mqq.manager.ProxyIpManager.ProxyIp;
import rjy;

public class BaseTransProcessor
  implements AppConstants.RichMediaErrorCode, INetEngine.INetEngineListener, ITransProcessor, ProtoReqManager.IProtoRespBack, RichProtoProc.RichProtoCallback, IHttpCommunicatorListener
{
  public static final String A = "param_fromUin";
  public static final String B = "param_toUin";
  public static final String C = "param_sliceNum";
  public static final String D = "param_step";
  public static final String E = "param_DownMode";
  public static final String F = "param_CostEach";
  public static final String G = "param_BdhTrans";
  public static final String H = "X-piccachetime";
  public static final String I = "param_segspercnt";
  public static final String J = "param_switchChannel";
  public static final String K = "param_sessionKey";
  public static final String L = "param_iplist";
  public static final String M = "param_writtenSize";
  public static final String N = "param_isPresend";
  public static final String O = "param_isSecondTrans";
  public static final String P = "param_AIODuration";
  public static final String Q = "param_AIOPercent";
  public static final String R = "param_PhoneType";
  public static final String S = "param_NetType";
  public static final String T = "param_IsRawPic";
  public static final String U = "param_quickHttp";
  public static final String V = "param_pttOpt";
  public static final String W = "param_pttNetDown";
  public static final String X = "param_picType";
  public static final String Y = "param_openUp";
  public static final String Z = "param_openUpStep";
  protected static INetEngine.IBreakDownFix a;
  protected static RichMediaStrategy.OldEngineDPCProfile a;
  private static Object jdField_a_of_type_JavaLangObject;
  private static ArrayList jdField_a_of_type_JavaUtilArrayList;
  static ConcurrentHashMap jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap;
  public static final String aA = "param_cost_c_comp";
  public static final String aB = "param_cost_s_segs";
  public static final String aC = "param_cost_s_comp";
  public static final String aD = "param_cost_s_store";
  public static final String aE = "param_thumbSize";
  public static final String aF = "param_SvrErroCode";
  public static final String aG = "param_fileFormat";
  public static final String aH = "param_fileMd5";
  public static final String aI = "param_picResLength";
  public static final String aJ = "param_picResWidth";
  public static final String aK = "param_fromChatType";
  public static final String aL = "param_toChatType";
  public static final String aM = "param_fromBusiType";
  public static final String aN = "param_toBusiType";
  public static final String aO = "param_bdhSrv";
  public static final String aP = "param_bdhPort";
  public static final String aQ = "param_xRtFlag";
  public static final int aT = 0;
  public static final int aU = 1;
  public static final String aU = "BaseTransProcessor";
  public static final int aV = 2;
  public static String aV;
  public static final int aW = 3;
  static final String aW = "ptt";
  public static final int aX = 4;
  protected static final String aX = "s";
  protected static final String aY = "tr";
  protected static final String aZ = "ht";
  public static final String aa = "param_picDecryptTime";
  public static final String ab = "param_recvDataLen";
  public static final String ac = "param_picEncrypt";
  public static final String ad = "param_urlEncrypt";
  public static final String ae = "param_encryptRollback";
  public static final String af = "param_busiType";
  public static final String ag = "param_uin";
  public static final String ah = "param_puin";
  public static final String ai = "param_resid";
  public static final String aj = "param_ip_source";
  public static final String ak = "param_channel";
  public static final String al = "param_errcode";
  public static final String am = "param_url";
  public static final String an = "param_http_error_code";
  public static final String ao = "param_android_error_code";
  public static final String ap = "param_inQueueCost";
  public static final String aq = "param_isPreUpload";
  public static final String ar = "param_rollback";
  public static final String as = "param_videoDuration";
  public static final String at = "param_sessionID";
  public static final String au = "param_fileMD5";
  public static final String av = "param_thumbMd5";
  public static final String aw = "param_cost_c_record";
  public static final String ax = "param_cost_c_trans";
  public static final String ay = "param_cost_c_aio";
  public static final String az = "param_cost_c_wait";
  protected static final String ba = "pic";
  protected static final String bb = "sn";
  private static final String jdField_e_of_type_JavaLangString = "PROXY_IP";
  public static final String j = "ftn";
  public static final String k = "pttcenter";
  public static final String l = "picplatform";
  public static final String m = "param_FailCode";
  public static final String n = "param_errorDesc";
  public static final String o = "param_reason";
  public static final String p = "serverip";
  public static final String q = "param_Server";
  public static final String r = "param_grpUin";
  public static final String s = "param_Retry";
  public static final String t = "param_fileid";
  public static final String u = "param_rspHeader";
  public static final String v = "param_reqHeader";
  public static final String w = "param_picSize";
  public static final String x = "param_picmd5";
  public static final String y = "param_uuid";
  public static final String z = "param_url";
  protected AppInterface a;
  public BaseTransFileController a;
  BaseTransProcessor.StepInfo jdField_a_of_type_ComTencentMobileqqTransfileBaseTransProcessor$StepInfo = new BaseTransProcessor.StepInfo();
  public FileMsg a;
  public INetEngine a;
  NetReq jdField_a_of_type_ComTencentMobileqqTransfileNetReq;
  public TransferRequest a;
  RichProto.RichProtoReq jdField_a_of_type_ComTencentMobileqqTransfileProtohandlerRichProto$RichProtoReq;
  StringBuilder jdField_a_of_type_JavaLangStringBuilder = new StringBuilder();
  public HashMap a;
  protected List a;
  private boolean jdField_a_of_type_Boolean = false;
  private int aC;
  private int aD;
  private int aE;
  int aJ = 56008;
  int aK = 56007;
  int aL = 56006;
  int aM = 56005;
  int aN = 56004;
  int aO = 56003;
  public int aP = 9001;
  int aQ = -1;
  int jdField_aR_of_type_Int = 0;
  String jdField_aR_of_type_JavaLangString = "P";
  int jdField_aS_of_type_Int = 0;
  String jdField_aS_of_type_JavaLangString = "Q";
  public String aT = "";
  protected int aY = 0;
  public BaseTransProcessor.StepInfo b = new BaseTransProcessor.StepInfo();
  public BaseTransProcessor.StepInfo c = new BaseTransProcessor.StepInfo();
  public long d;
  BaseTransProcessor.StepInfo jdField_d_of_type_ComTencentMobileqqTransfileBaseTransProcessor$StepInfo = new BaseTransProcessor.StepInfo();
  private String jdField_d_of_type_JavaLangString;
  long jdField_e_of_type_Long;
  public long f = 0L;
  long jdField_g_of_type_Long = 0L;
  boolean jdField_g_of_type_Boolean = false;
  public long h;
  boolean h;
  protected long i;
  public boolean i;
  boolean j = false;
  boolean k = false;
  boolean l = false;
  public boolean m = false;
  boolean n = true;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqTransfileRichMediaStrategy$OldEngineDPCProfile = new RichMediaStrategy.OldEngineDPCProfile();
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_JavaLangObject = new Object();
    aV = "param_reason";
    jdField_a_of_type_ComTencentMobileqqTransfileINetEngine$IBreakDownFix = new rjy();
  }
  
  public BaseTransProcessor(BaseTransFileController paramBaseTransFileController, TransferRequest paramTransferRequest)
  {
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    jdField_h_of_type_Boolean = false;
    jdField_i_of_type_Boolean = false;
    jdField_h_of_type_Long = 0L;
    jdField_i_of_type_Long = 0L;
    jdField_a_of_type_ComTencentCommonAppAppInterface = jdField_a_of_type_ComTencentCommonAppAppInterface;
    jdField_d_of_type_Long = System.nanoTime();
    Logger.a("BaseTransProcessor", "TimeCompare", "Processor Start Time = " + jdField_d_of_type_Long + "ns,Processor = " + this);
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg = new FileMsg();
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController = paramBaseTransFileController;
    jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest = paramTransferRequest;
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.e = jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_b_of_type_Int;
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_c_of_type_Long = jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_a_of_type_Long;
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.bh = jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_a_of_type_Int;
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.s = jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.c;
    paramBaseTransFileController = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg;
    if (jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_a_of_type_Boolean) {
      i1 = 0;
    }
    jdField_a_of_type_Int = i1;
    jdField_a_of_type_ComTencentMobileqqTransfileINetEngine = jdField_a_of_type_ComTencentCommonAppAppInterface.a(0);
    o();
  }
  
  public BaseTransProcessor(TransFileController paramTransFileController)
  {
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    jdField_h_of_type_Boolean = false;
    jdField_i_of_type_Boolean = false;
    jdField_h_of_type_Long = 0L;
    jdField_i_of_type_Long = 0L;
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController = paramTransFileController;
    jdField_a_of_type_ComTencentCommonAppAppInterface = a;
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg = new FileMsg();
    jdField_d_of_type_Long = System.nanoTime();
  }
  
  public BaseTransProcessor(String paramString1, String paramString2, boolean paramBoolean, TransFileController paramTransFileController)
  {
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    jdField_h_of_type_Boolean = false;
    jdField_i_of_type_Boolean = false;
    jdField_h_of_type_Long = 0L;
    jdField_i_of_type_Long = 0L;
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController = paramTransFileController;
    jdField_a_of_type_ComTencentCommonAppAppInterface = a;
    jdField_d_of_type_Long = System.nanoTime();
    if (paramBoolean) {}
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqTransfileFileMsg = new FileMsg(paramString1, paramString2, i1);
      jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_ComTencentMobileqqTransfileBaseTransProcessor = this;
      return;
      i1 = 1;
    }
  }
  
  public BaseTransProcessor(String paramString, boolean paramBoolean, TransFileController paramTransFileController)
  {
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    jdField_h_of_type_Boolean = false;
    jdField_i_of_type_Boolean = false;
    jdField_h_of_type_Long = 0L;
    jdField_i_of_type_Long = 0L;
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController = paramTransFileController;
    jdField_a_of_type_ComTencentCommonAppAppInterface = a;
    jdField_d_of_type_Long = System.nanoTime();
    if (paramBoolean) {}
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqTransfileFileMsg = new FileMsg(paramString, null, i1);
      jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_ComTencentMobileqqTransfileBaseTransProcessor = this;
      return;
      i1 = 1;
    }
  }
  
  public static String a(int paramInt, long paramLong)
  {
    return "S_" + paramInt + "_" + paramLong;
  }
  
  public static String a(long paramLong)
  {
    return "T_" + paramLong;
  }
  
  public static String a(Exception paramException)
  {
    return AbstractImageDownloader.a(paramException);
  }
  
  public static String a(String paramString, long paramLong)
  {
    return paramString + "_" + paramLong;
  }
  
  public static void a(Message paramMessage, Class paramClass, long paramLong)
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if ((jdField_a_of_type_JavaUtilArrayList != null) && (!jdField_a_of_type_JavaUtilArrayList.isEmpty()))
      {
        Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
        TransProcessorHandler localTransProcessorHandler;
        Object localObject2;
        do
        {
          while (!((Iterator)localObject2).hasNext())
          {
            do
            {
              if (!localIterator.hasNext()) {
                break;
              }
              localTransProcessorHandler = (TransProcessorHandler)localIterator.next();
              localObject2 = localTransProcessorHandler.a();
            } while (((ArrayList)localObject2).isEmpty());
            localObject2 = ((ArrayList)localObject2).iterator();
          }
        } while (!paramClass.isAssignableFrom((Class)((Iterator)localObject2).next()));
        Message localMessage = localTransProcessorHandler.obtainMessage();
        what = what;
        obj = obj;
        arg1 = arg1;
        localTransProcessorHandler.sendMessageDelayed(localMessage, paramLong);
      }
    }
  }
  
  public static void a(TransProcessorHandler paramTransProcessorHandler)
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (!jdField_a_of_type_JavaUtilArrayList.contains(paramTransProcessorHandler)) {
        jdField_a_of_type_JavaUtilArrayList.add(paramTransProcessorHandler);
      }
      return;
    }
  }
  
  public static boolean a(int paramInt, HashMap paramHashMap)
  {
    if (paramHashMap == null) {
      return true;
    }
    if ((paramInt == 56006) || (paramInt == 56004) || (paramInt == 56003) || (paramInt == 56005))
    {
      paramHashMap.put(aV, a("Q", paramInt));
      paramHashMap.put("param_FailCode", Integer.toString(56009));
      return true;
    }
    if ((paramInt == 56008) || (paramInt == 56007))
    {
      paramHashMap.put(aV, a("P", paramInt));
      paramHashMap.put("param_FailCode", Integer.toString(56009));
      return true;
    }
    return false;
  }
  
  static boolean a(List paramList1, List paramList2)
  {
    if ((paramList2 == null) || (paramList1 == null) || (paramList1.isEmpty()) || (paramList2.contains(paramList1.get(0)))) {
      return false;
    }
    ArrayList localArrayList = new ArrayList();
    paramList1 = paramList1.iterator();
    while (paramList1.hasNext())
    {
      ProxyIpManager.ProxyIp localProxyIp = (ProxyIpManager.ProxyIp)paramList1.next();
      Object localObject = paramList2.iterator();
      while (((Iterator)localObject).hasNext())
      {
        ServerAddr localServerAddr = (ServerAddr)((Iterator)localObject).next();
        if ((ip.equals(jdField_a_of_type_JavaLangString)) && (port == jdField_b_of_type_Int)) {
          paramList2.remove(localServerAddr);
        }
      }
      localObject = new ServerAddr();
      jdField_a_of_type_JavaLangString = ip;
      jdField_b_of_type_Int = port;
      localArrayList.add(localObject);
    }
    paramList2.addAll(0, localArrayList);
    return true;
  }
  
  public static String b(int paramInt, long paramLong)
  {
    return "H_" + paramInt + "_" + paramLong;
  }
  
  public static String b(long paramLong)
  {
    return "M_" + paramLong;
  }
  
  private void b(NetResp paramNetResp)
  {
    long l1 = 0L;
    if ((jdField_g_of_type_Long != 0L) && (n)) {
      if (jdField_a_of_type_JavaUtilHashMap.get("X-httime") == null) {
        break label213;
      }
    }
    for (int i1 = Integer.parseInt((String)jdField_a_of_type_JavaUtilHashMap.get("X-httime"));; i1 = 0)
    {
      if (jdField_a_of_type_JavaUtilHashMap.get("X-piccachetime") != null) {
        l1 = Integer.parseInt((String)jdField_a_of_type_JavaUtilHashMap.get("X-piccachetime"));
      }
      long l2 = i1 - l1;
      long l3 = jdField_g_of_type_Long - i1;
      jdField_g_of_type_Long += l3;
      f += l2;
      jdField_h_of_type_Long += l1;
      jdField_a_of_type_JavaLangStringBuilder.append("s").append(aY).append("_").append("tr").append(l3).append("_").append("ht").append(l2).append("_").append("pic").append(l1).append(";");
      aY += 1;
      jdField_i_of_type_Long = jdField_h_of_type_Long;
      return;
      label213:
      n = false;
    }
  }
  
  public static void b(TransProcessorHandler paramTransProcessorHandler)
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      jdField_a_of_type_JavaUtilArrayList.remove(paramTransProcessorHandler);
      return;
    }
  }
  
  public static String c(String paramString)
  {
    return "C_" + paramString;
  }
  
  private void e()
  {
    if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_Int == 0) {
        d(1002);
      }
    }
    else {
      return;
    }
    d(2002);
  }
  
  private void f()
  {
    if (jdField_a_of_type_Boolean)
    {
      int i1 = g();
      if (i1 > aC) {
        aC = i1;
      }
    }
  }
  
  public int a()
  {
    return 0;
  }
  
  public long a()
  {
    return jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_Long;
  }
  
  @Deprecated
  public FileMsg.StepBaseInfo a(int paramInt)
  {
    Object localObject1 = null;
    if (paramInt == 0) {}
    for (;;)
    {
      try
      {
        localObject1 = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepBaseInfo;
        return localObject1;
      }
      finally {}
      if (paramInt == 1) {
        localObject1 = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_b_of_type_ComTencentMobileqqTransfileFileMsg$StepBaseInfo;
      } else if (paramInt == 2) {
        localObject1 = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo;
      } else if (paramInt == 3) {
        localObject1 = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_c_of_type_ComTencentMobileqqTransfileFileMsg$StepBaseInfo;
      } else if (paramInt == 3) {
        localObject1 = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_b_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo;
      }
    }
  }
  
  public FileMsg a()
  {
    return jdField_a_of_type_ComTencentMobileqqTransfileFileMsg;
  }
  
  TransferRequest a()
  {
    return jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest;
  }
  
  public String a()
  {
    return jdField_d_of_type_JavaLangString;
  }
  
  public String a(String paramString1, String paramString2, int paramInt)
  {
    return MessageForPtt.getLocalFilePath(paramInt, AppConstants.bd + jdField_a_of_type_ComTencentCommonAppAppInterface.getAccount() + "/" + "ptt" + "/" + paramString1 + "_" + FileMsg.a() + ".amr");
  }
  
  protected String a(String paramString, List paramList)
  {
    if ((jdField_a_of_type_JavaUtilList == null) || (jdField_a_of_type_JavaUtilList.isEmpty()))
    {
      paramList = paramString;
      if (QLog.isColorLevel())
      {
        QLog.d("PROXY_IP", 2, "[HTTP] proxy Ip List is empty use common conn!");
        paramList = paramString;
      }
    }
    ServerAddr localServerAddr;
    do
    {
      return paramList;
      localServerAddr = RichMediaUtil.a(paramString);
      if (localServerAddr != null) {
        break;
      }
      paramList = paramString;
    } while (!QLog.isColorLevel());
    QLog.d("PROXY_IP", 2, "[HTTP] replace proxy ip fail, host is domain");
    return paramString;
    Object localObject1 = jdField_a_of_type_JavaUtilList.iterator();
    int i1 = 0;
    label85:
    Object localObject2;
    if (((Iterator)localObject1).hasNext())
    {
      localObject2 = (ProxyIpManager.ProxyIp)((Iterator)localObject1).next();
      if ((!ip.equals(jdField_a_of_type_JavaLangString)) || (port != jdField_b_of_type_Int)) {
        break label523;
      }
      i1 = 1;
    }
    label317:
    label404:
    label523:
    for (;;)
    {
      break label85;
      if (i1 == 0)
      {
        localObject1 = (ProxyIpManager.ProxyIp)jdField_a_of_type_JavaUtilList.get(0);
        paramString = RichMediaUtil.a(paramString, "http://" + ip + ":" + port + "/");
        paramString = paramString + "&bHost=" + jdField_a_of_type_JavaLangString + "&bPort=" + jdField_b_of_type_Int;
        paramList = paramString;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("PROXY_IP", 2, "[HTTP] replace proxy ip: " + ip + ":" + port);
        return paramString;
      }
      localObject2 = paramList.iterator();
      paramList = null;
      if (((Iterator)localObject2).hasNext())
      {
        localObject1 = (ServerAddr)((Iterator)localObject2).next();
        Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
        for (;;)
        {
          if (localIterator.hasNext())
          {
            ProxyIpManager.ProxyIp localProxyIp = (ProxyIpManager.ProxyIp)localIterator.next();
            if ((!jdField_a_of_type_JavaLangString.equals(ip)) && (jdField_b_of_type_Int != port))
            {
              paramList = (List)localObject1;
              if (paramList == null) {
                break;
              }
            }
          }
        }
      }
      for (;;)
      {
        localObject1 = paramString;
        if (paramList != null) {
          localObject1 = paramString + "&bHost=" + jdField_a_of_type_JavaLangString + "&bPort=" + jdField_b_of_type_Int;
        }
        paramList = (List)localObject1;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("PROXY_IP", 2, "[HTTP] replace proxy ip: " + jdField_a_of_type_JavaLangString + ":" + jdField_b_of_type_Int);
        return localObject1;
        break label317;
        break label404;
      }
    }
  }
  
  public void a() {}
  
  public void a(int paramInt)
  {
    aE = paramInt;
  }
  
  @Deprecated
  public void a(int paramInt1, int paramInt2)
  {
    try
    {
      FileMsg.StepBaseInfo localStepBaseInfo = a(paramInt1);
      if (localStepBaseInfo != null) {
        jdField_b_of_type_Int = paramInt2;
      }
      return;
    }
    finally {}
  }
  
  protected void a(int paramInt1, int paramInt2, long paramLong)
  {
    a("updateUiState", "state:" + paramInt1 + " ret:" + paramInt2 + " currentProgress:" + aE + " mProgress:" + aC);
    if (((paramInt1 == 2005) || (paramInt1 == 1005)) && (aP == 9001))
    {
      String str = AbstractImageDownloader.a(new Exception());
      HashMap localHashMap = new HashMap();
      localHashMap.put("stackMsg", str);
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actRichMediaReportError", false, 0L, 0L, localHashMap, "");
    }
    e = System.currentTimeMillis();
    long l1 = (System.nanoTime() - jdField_d_of_type_Long) / 1000000L;
    boolean bool;
    if ((l1 > 60000L) || (paramInt1 == 1005))
    {
      bool = true;
      if (l1 <= 60000L) {
        break label210;
      }
      RichMediaUtil.a(true, "image_sending_too_long");
    }
    for (;;)
    {
      b(paramInt1, paramInt2, paramLong);
      return;
      bool = false;
      break;
      label210:
      RichMediaUtil.a(bool, "image_sending_" + aP + "_" + aT);
    }
  }
  
  @Deprecated
  public void a(int paramInt1, int paramInt2, long paramLong, String paramString)
  {
    try
    {
      FileMsg.StepBaseInfo localStepBaseInfo = a(paramInt1);
      if (localStepBaseInfo != null)
      {
        jdField_a_of_type_Int = paramInt2;
        jdField_a_of_type_JavaLangString = paramString;
        jdField_c_of_type_Long = paramLong;
        jdField_a_of_type_Boolean = false;
        c(paramInt1);
      }
      a(paramInt2, paramString);
      return;
    }
    finally {}
  }
  
  @Deprecated
  public void a(int paramInt1, int paramInt2, String paramString)
  {
    try
    {
      FileMsg.StepBaseInfo localStepBaseInfo = a(paramInt1);
      if (localStepBaseInfo != null)
      {
        jdField_a_of_type_Int = paramInt2;
        jdField_a_of_type_JavaLangString = paramString;
        jdField_a_of_type_Boolean = false;
        c(paramInt1);
      }
      a(paramInt2, paramString);
      return;
    }
    finally {}
  }
  
  protected void a(int paramInt, long paramLong)
  {
    a(paramInt, 0, paramLong);
  }
  
  @Deprecated
  public void a(int paramInt, MessageObserver.StatictisInfo paramStatictisInfo, String paramString)
  {
    try
    {
      a(paramInt, false, paramStatictisInfo, paramString);
      return;
    }
    finally
    {
      paramStatictisInfo = finally;
      throw paramStatictisInfo;
    }
  }
  
  public void a(int paramInt, String paramString)
  {
    a(paramInt, paramString, null, null);
  }
  
  public void a(int paramInt, String paramString1, String paramString2, BaseTransProcessor.StepInfo paramStepInfo)
  {
    aP = paramInt;
    aT = paramString1;
    if ((paramString2 != null) && (!"".equals(paramString2))) {
      jdField_a_of_type_JavaUtilHashMap.put("param_reason", paramString2);
    }
    if (paramStepInfo != null)
    {
      paramStepInfo.b();
      jdField_a_of_type_Int = 0;
    }
  }
  
  @Deprecated
  public void a(int paramInt, boolean paramBoolean)
  {
    try
    {
      FileMsg.StepBaseInfo localStepBaseInfo = a(paramInt);
      if ((localStepBaseInfo != null) && ((jdField_a_of_type_Long == 0L) || (paramBoolean))) {
        jdField_a_of_type_Long = System.currentTimeMillis();
      }
      return;
    }
    finally {}
  }
  
  /* Error */
  @Deprecated
  public void a(int paramInt1, boolean paramBoolean, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: iload_1
    //   4: invokevirtual 768	com/tencent/mobileqq/transfile/BaseTransProcessor:a	(I)Lcom/tencent/mobileqq/transfile/FileMsg$StepBaseInfo;
    //   7: astore 4
    //   9: aload 4
    //   11: ifnull +19 -> 30
    //   14: iload_2
    //   15: ifeq +18 -> 33
    //   18: aload 4
    //   20: aload 4
    //   22: getfield 853	com/tencent/mobileqq/transfile/FileMsg$StepBaseInfo:jdField_c_of_type_Int	I
    //   25: iload_3
    //   26: iadd
    //   27: putfield 853	com/tencent/mobileqq/transfile/FileMsg$StepBaseInfo:jdField_c_of_type_Int	I
    //   30: aload_0
    //   31: monitorexit
    //   32: return
    //   33: aload 4
    //   35: aload 4
    //   37: getfield 855	com/tencent/mobileqq/transfile/FileMsg$StepBaseInfo:jdField_d_of_type_Int	I
    //   40: iload_3
    //   41: iadd
    //   42: putfield 855	com/tencent/mobileqq/transfile/FileMsg$StepBaseInfo:jdField_d_of_type_Int	I
    //   45: goto -15 -> 30
    //   48: astore 4
    //   50: aload_0
    //   51: monitorexit
    //   52: aload 4
    //   54: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	55	0	this	BaseTransProcessor
    //   0	55	1	paramInt1	int
    //   0	55	2	paramBoolean	boolean
    //   0	55	3	paramInt2	int
    //   7	29	4	localStepBaseInfo	FileMsg.StepBaseInfo
    //   48	5	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	9	48	finally
    //   18	30	48	finally
    //   33	45	48	finally
  }
  
  @Deprecated
  public void a(int paramInt, boolean paramBoolean, MessageObserver.StatictisInfo paramStatictisInfo)
  {
    int i2 = 0;
    int i3 = 0;
    int i4 = 0;
    int i1 = 0;
    FileMsg.StepBaseInfo localStepBaseInfo;
    for (;;)
    {
      try
      {
        localStepBaseInfo = a(paramInt);
        if (localStepBaseInfo == null) {
          return;
        }
        if (!paramBoolean) {
          break;
        }
        if (paramInt != 1) {
          break label148;
        }
        if (paramStatictisInfo == null)
        {
          paramInt = i1;
          jdField_d_of_type_Int = paramInt;
          jdField_c_of_type_Int = 1;
        }
        else
        {
          paramInt = jdField_d_of_type_Int - 1;
        }
      }
      finally {}
    }
    for (;;)
    {
      jdField_d_of_type_Int = paramInt;
      break;
      label84:
      paramInt = jdField_d_of_type_Int;
    }
    jdField_c_of_type_Int = 0;
    if (paramInt == 1)
    {
      if (paramStatictisInfo == null) {}
      for (paramInt = i3;; paramInt = jdField_d_of_type_Int)
      {
        jdField_d_of_type_Int = paramInt;
        break;
      }
    }
    for (;;)
    {
      label127:
      jdField_d_of_type_Int = paramInt;
      break;
      label148:
      do
      {
        paramInt = jdField_d_of_type_Int;
        paramInt += 1;
        break label127;
        if (paramStatictisInfo != null) {
          break label84;
        }
        paramInt = i2;
        break;
      } while (paramStatictisInfo != null);
      paramInt = i4;
    }
  }
  
  @Deprecated
  public void a(int paramInt, boolean paramBoolean, MessageObserver.StatictisInfo paramStatictisInfo, String paramString)
  {
    int i1 = 9351;
    FileMsg.StepBaseInfo localStepBaseInfo;
    for (;;)
    {
      try
      {
        localStepBaseInfo = a(paramInt);
        if (localStepBaseInfo == null)
        {
          if (!paramBoolean)
          {
            if (paramInt == 3) {
              a(paramInt, i1, paramString + "info null");
            }
          }
          else {
            return;
          }
          i1 = 9044;
          continue;
        }
        if (!paramBoolean) {
          break label115;
        }
        if (paramStatictisInfo == null)
        {
          jdField_d_of_type_Int = 0;
          jdField_c_of_type_Int = 1;
          continue;
        }
        jdField_d_of_type_Int = (jdField_d_of_type_Int - 1);
      }
      finally {}
      jdField_c_of_type_Int = 1;
      continue;
      label115:
      if (paramStatictisInfo != null) {
        break;
      }
      jdField_d_of_type_Int = 1;
      jdField_c_of_type_Int = 0;
    }
    if (jdField_c_of_type_Int == 2900)
    {
      jdField_c_of_type_Int = 56009;
      if (paramInt == 3) {
        paramString = b(jdField_d_of_type_Long);
      }
    }
    for (;;)
    {
      a(paramInt, jdField_c_of_type_Int, paramString);
      jdField_c_of_type_Long = jdField_d_of_type_Long;
      jdField_b_of_type_Int = jdField_d_of_type_Int;
      jdField_d_of_type_Int = jdField_d_of_type_Int;
      jdField_c_of_type_Int = 0;
      break;
      paramString = a(jdField_d_of_type_Long);
      continue;
      if (jdField_c_of_type_Int == 1002) {
        break label285;
      }
      if (jdField_c_of_type_Int != 1013) {
        break label306;
      }
      break label285;
      jdField_c_of_type_Int = i1;
      paramString = jdField_a_of_type_JavaLangString;
    }
    for (;;)
    {
      label262:
      jdField_c_of_type_Int = i1;
      paramString = jdField_a_of_type_JavaLangString;
      break;
      label285:
      label306:
      do
      {
        i1 = 9044;
        break label262;
        if (paramInt == 3)
        {
          i1 = 9350;
          break;
        }
        i1 = 9311;
        break;
      } while (paramInt != 3);
    }
  }
  
  public void a(long paramLong)
  {
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.a(paramLong);
  }
  
  public void a(BaseTransProcessor.StepInfo paramStepInfo, NetResp paramNetResp, boolean paramBoolean)
  {
    if ((paramStepInfo == null) || (paramNetResp == null)) {
      return;
    }
    jdField_a_of_type_JavaUtilHashMap.put("param_Server", jdField_a_of_type_JavaUtilHashMap.get("serverip"));
    if (paramBoolean)
    {
      jdField_a_of_type_JavaUtilHashMap.put("serverip", jdField_a_of_type_JavaUtilHashMap.get("serverip"));
      jdField_b_of_type_Int += 1;
      jdField_c_of_type_Int += jdField_h_of_type_Int - 1;
      paramStepInfo.b();
      jdField_a_of_type_Int = 1;
      jdField_a_of_type_JavaUtilHashMap.remove("param_url");
      jdField_a_of_type_JavaUtilHashMap.remove("param_rspHeader");
      return;
    }
    jdField_a_of_type_JavaUtilHashMap.put("serverip", jdField_a_of_type_JavaUtilHashMap.get("firstserverip"));
    jdField_c_of_type_Int += jdField_h_of_type_Int;
    if (f == 56009) {}
    for (String str = (String)jdField_a_of_type_JavaUtilHashMap.get("netresp_param_reason");; str = null)
    {
      a(f, jdField_a_of_type_JavaLangString, str, paramStepInfo);
      jdField_a_of_type_JavaUtilHashMap.put("param_url", jdField_a_of_type_JavaUtilHashMap.get("param_url"));
      jdField_a_of_type_JavaUtilHashMap.put("param_rspHeader", jdField_a_of_type_JavaUtilHashMap.get("param_rspHeader"));
      if ((f == 56009) && ("H_404_-124".equals(str))) {
        jdField_a_of_type_JavaUtilHashMap.put("param_reqHeader", jdField_a_of_type_JavaUtilHashMap.get("param_reqHeader"));
      }
      jdField_a_of_type_Int = 0;
      return;
    }
  }
  
  public void a(BaseTransProcessor.StepInfo paramStepInfo, RichProto.RichProtoResp.RespCommon paramRespCommon)
  {
    if ((paramStepInfo != null) && (paramRespCommon != null))
    {
      paramStepInfo.b();
      jdField_b_of_type_Int = e;
      jdField_c_of_type_Int = f;
      if (jdField_c_of_type_Int == 0) {
        jdField_a_of_type_Int = 1;
      }
    }
    else
    {
      return;
    }
    jdField_a_of_type_Int = 0;
    a(jdField_d_of_type_Int, g, h, paramStepInfo);
  }
  
  public void a(BaseTransProcessor.StepInfo paramStepInfo, boolean paramBoolean1, boolean paramBoolean2, MessageObserver.StatictisInfo paramStatictisInfo)
  {
    if (paramStatictisInfo == null) {
      return;
    }
    paramStepInfo.b();
    if (paramBoolean2)
    {
      jdField_c_of_type_Int = (jdField_d_of_type_Int - 1);
      jdField_b_of_type_Int = 1;
      jdField_a_of_type_Int = 1;
      return;
    }
    String str;
    if (jdField_c_of_type_Int == 2900)
    {
      i1 = 56009;
      if (!paramBoolean1) {}
      for (str = b(jdField_d_of_type_Long);; str = a(jdField_d_of_type_Long))
      {
        a(i1, "", str, paramStepInfo);
        jdField_c_of_type_Int = jdField_d_of_type_Int;
        jdField_b_of_type_Int = 0;
        jdField_a_of_type_Int = 0;
        return;
      }
    }
    if ((jdField_c_of_type_Int == 1002) || (jdField_c_of_type_Int == 1013))
    {
      if (!paramBoolean1) {}
      for (i1 = 9350;; i1 = 9311)
      {
        str = jdField_a_of_type_JavaLangString;
        break;
      }
    }
    if (!paramBoolean1) {}
    for (int i1 = 9351;; i1 = 9044)
    {
      str = jdField_a_of_type_JavaLangString;
      break;
    }
  }
  
  public void a(NetReq paramNetReq, long paramLong1, long paramLong2) {}
  
  public void a(NetResp paramNetResp)
  {
    b(paramNetResp);
  }
  
  public void a(ProtoReqManager.ProtoResp paramProtoResp, ProtoReqManager.ProtoReq paramProtoReq) {}
  
  public void a(RichProto.RichProtoReq paramRichProtoReq, RichProto.RichProtoResp paramRichProtoResp) {}
  
  public void a(HttpMsg paramHttpMsg)
  {
    int i1;
    int i2;
    int i3;
    if (paramHttpMsg != null)
    {
      i1 = jdField_d_of_type_Int;
      i2 = e;
      i3 = f;
      if (((i1 == -1) || (i2 == -1)) && (QLog.isColorLevel())) {
        QLog.e("flowstat", 2, "fileType:" + i1 + ",busiType:" + i2);
      }
      if (!"POST".equals(paramHttpMsg.e())) {
        break label115;
      }
    }
    label115:
    for (boolean bool = true;; bool = false)
    {
      jdField_a_of_type_ComTencentCommonAppAppInterface.a(jdField_a_of_type_ComTencentCommonAppAppInterface.getAccount(), bool, i3, i1, i2, i);
      return;
    }
  }
  
  public void a(HttpMsg paramHttpMsg1, HttpMsg paramHttpMsg2) {}
  
  public void a(IOException paramIOException)
  {
    paramIOException = paramIOException.getMessage();
    String str = Environment.getExternalStorageState();
    if (paramIOException.contains("EACCES")) {
      a(9039, paramIOException);
    }
    do
    {
      return;
      if (paramIOException.contains("ENOSPC"))
      {
        a(9040, paramIOException);
        return;
      }
      if (paramIOException.contains("Read-only"))
      {
        a(9039, paramIOException);
        return;
      }
    } while ("mounted".equals(str));
    a(9039, paramIOException);
  }
  
  public void a(String paramString) {}
  
  public void a(String paramString1, String paramString2)
  {
    boolean bool = false;
    if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg == null)
    {
      Logger.b("BaseTransProcessor", "logRichMediaEvent", "file is null !");
      return;
    }
    if ((this instanceof ShortVideoForwardProcessor))
    {
      RichMediaUtil.a("T", RichMediaUtil.b(jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_a_of_type_Int), RichMediaUtil.c(jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.e), String.valueOf(jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_c_of_type_Long), paramString1, paramString2, null);
      return;
    }
    int i1 = -1;
    if (jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest != null) {
      i1 = jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_a_of_type_Int;
    }
    if ((this instanceof BuddyTransfileProcessor))
    {
      i1 = 0;
      if (jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest == null) {
        break label155;
      }
      bool = jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_a_of_type_Boolean;
    }
    for (;;)
    {
      RichMediaUtil.a(RichMediaUtil.b(i1), bool, RichMediaUtil.c(jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.e), String.valueOf(jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_c_of_type_Long), paramString1, paramString2);
      return;
      if (!(this instanceof C2CPicUploadProcessor)) {
        break;
      }
      i1 = 0;
      break;
      label155:
      if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_Int == 0) {
        bool = true;
      }
    }
  }
  
  protected void a(boolean paramBoolean) {}
  
  public boolean a()
  {
    return aP != 9001;
  }
  
  protected boolean a(HttpMsg paramHttpMsg1, HttpMsg paramHttpMsg2)
  {
    if (paramHttpMsg2 == null) {}
    do
    {
      return false;
      paramHttpMsg1 = paramHttpMsg2.d();
    } while ((paramHttpMsg1 != null) && (paramHttpMsg1.contains("HttpCommunicator closed or msg caceled!")));
    return true;
  }
  
  public boolean a(HttpMsg paramHttpMsg1, HttpMsg paramHttpMsg2, int paramInt)
  {
    return true;
  }
  
  public int b()
  {
    if (jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest != null) {
      if (!jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_a_of_type_Boolean) {
        break label177;
      }
    }
    label177:
    for (int i1 = 1004;; i1 = 2004)
    {
      d(i1);
      m = true;
      if (QLog.isColorLevel()) {
        a("cancel", "");
      }
      if (jdField_a_of_type_ComTencentMobileqqTransfileProtohandlerRichProto$RichProtoReq != null)
      {
        RichProtoProc.b(jdField_a_of_type_ComTencentMobileqqTransfileProtohandlerRichProto$RichProtoReq);
        jdField_a_of_type_ComTencentMobileqqTransfileProtohandlerRichProto$RichProtoReq = null;
      }
      if (jdField_a_of_type_ComTencentMobileqqTransfileNetReq != null)
      {
        jdField_a_of_type_ComTencentMobileqqTransfileINetEngine.b(jdField_a_of_type_ComTencentMobileqqTransfileNetReq);
        jdField_a_of_type_ComTencentMobileqqTransfileNetReq = null;
      }
      jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController.a(a());
      try
      {
        if (jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest != null)
        {
          TransferResult localTransferResult = jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_a_of_type_ComTencentMobileqqTransfileTransferResult;
          if (localTransferResult != null)
          {
            jdField_d_of_type_Int = -1;
            jdField_a_of_type_Long = 9037L;
            jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest = jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest;
          }
        }
        a("notify", "start");
        notifyAll();
        a("notify", "end");
        return 0;
      }
      finally {}
    }
  }
  
  public long b()
  {
    return jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.f;
  }
  
  protected String b()
  {
    return null;
  }
  
  void b()
  {
    long l1 = (System.nanoTime() - jdField_d_of_type_Long) / 1000000L;
    if ((!jdField_a_of_type_ComTencentCommonAppAppInterface.isLogin()) || (!jdField_a_of_type_ComTencentCommonAppAppInterface.isRunning())) {
      a(9366, "account switch");
    }
    a("onError", "elapsed:" + l1 + " errCode:" + aP + " errDesc:" + aT + " reason:" + (String)jdField_a_of_type_JavaUtilHashMap.get("param_reason"));
    a(false);
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController.a(a());
  }
  
  @Deprecated
  public void b(int paramInt)
  {
    a(paramInt, false);
  }
  
  protected void b(int paramInt1, int paramInt2, long paramLong)
  {
    if (m) {
      return;
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      aD = paramInt1;
      if ((jdField_a_of_type_JavaUtilArrayList != null) && (!jdField_a_of_type_JavaUtilArrayList.isEmpty()))
      {
        Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
        TransProcessorHandler localTransProcessorHandler;
        do
        {
          Object localObject3;
          while (!((Iterator)localObject3).hasNext())
          {
            do
            {
              if (!localIterator.hasNext()) {
                break;
              }
              localTransProcessorHandler = (TransProcessorHandler)localIterator.next();
              localObject3 = localTransProcessorHandler.a();
            } while (((ArrayList)localObject3).isEmpty());
            localObject3 = ((ArrayList)localObject3).iterator();
          }
          localObject4 = (Class)((Iterator)localObject3).next();
        } while (!getClass().equals(localObject4));
        Object localObject4 = localTransProcessorHandler.obtainMessage();
        jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.N = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.M;
        jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.M = paramInt1;
        what = paramInt1;
        obj = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg;
        arg1 = paramInt2;
        localTransProcessorHandler.sendMessageDelayed((Message)localObject4, paramLong);
      }
    }
  }
  
  @Deprecated
  public void b(int paramInt1, int paramInt2, long paramLong, String paramString)
  {
    try
    {
      FileMsg.StepTransInfo localStepTransInfo = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo;
      jdField_a_of_type_Int = paramInt1;
      jdField_a_of_type_Boolean = false;
      jdField_a_of_type_JavaLangString = paramString;
      e = paramInt2;
      jdField_c_of_type_Long = paramLong;
      a(jdField_a_of_type_Int, jdField_a_of_type_JavaLangString);
      c(2);
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public void b(long paramLong)
  {
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_Long = paramLong;
  }
  
  public void b(HttpMsg paramHttpMsg1, HttpMsg paramHttpMsg2) {}
  
  protected void b(String paramString)
  {
    jdField_d_of_type_JavaLangString = paramString;
  }
  
  public void b(boolean paramBoolean) {}
  
  public boolean b()
  {
    return j;
  }
  
  public int c()
  {
    return 0;
  }
  
  public long c()
  {
    return jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.M;
  }
  
  void c()
  {
    long l1 = (System.nanoTime() - jdField_d_of_type_Long) / 1000000L;
    a("onSuccess", "elapsed:" + l1 + ",key:" + a());
    a(true);
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController.a(a());
  }
  
  @Deprecated
  public void c(int paramInt)
  {
    try
    {
      FileMsg.StepBaseInfo localStepBaseInfo = a(paramInt);
      if (localStepBaseInfo != null) {
        jdField_b_of_type_Long = System.currentTimeMillis();
      }
      return;
    }
    finally {}
  }
  
  public void c(long paramLong)
  {
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_b_of_type_Long = paramLong;
  }
  
  public void c(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public boolean c()
  {
    return jdField_i_of_type_Boolean;
  }
  
  public int d()
  {
    return aE;
  }
  
  public long d()
  {
    return jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.N;
  }
  
  public void d() {}
  
  public void d(int paramInt)
  {
    a(paramInt, 0L);
  }
  
  boolean d()
  {
    return (jdField_a_of_type_ComTencentCommonAppAppInterface.isRunning()) && (jdField_a_of_type_ComTencentCommonAppAppInterface.isLogin());
  }
  
  public int e()
  {
    int i2 = 0;
    int i1;
    if (jdField_a_of_type_Boolean) {
      i1 = aC;
    }
    do
    {
      do
      {
        return i1;
        i1 = i2;
      } while (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg == null);
      i1 = i2;
    } while (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_Long <= 0L);
    return (int)(jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.f * 100L / jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_Long);
  }
  
  public void e(int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.a(paramInt);
  }
  
  protected boolean e()
  {
    return (!m) && (!jdField_i_of_type_Boolean);
  }
  
  protected int f()
  {
    return aD;
  }
  
  public int g()
  {
    int i2 = 0;
    int i1 = i2;
    if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg != null)
    {
      i1 = i2;
      if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_Long > 0L)
      {
        i2 = (int)(jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.f * 100L / jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_Long);
        i1 = i2;
        if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.jdField_a_of_type_Int == 0) {
          if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.e != 1)
          {
            i1 = i2;
            if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.e != 131075) {}
          }
          else
          {
            i1 = i2;
            if (i2 == 100)
            {
              i1 = i2;
              if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg.M != 1003) {
                i1 = 99;
              }
            }
          }
        }
      }
    }
    return i1;
  }
  
  public void h()
  {
    if (jdField_a_of_type_ComTencentMobileqqTransfileFileMsg != null)
    {
      f();
      e();
    }
  }
  
  public void i() {}
  
  public void j() {}
  
  public void k() {}
  
  protected void l() {}
  
  public void m() {}
  
  public void n() {}
  
  public void o()
  {
    boolean bool = false;
    Integer localInteger = (Integer)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.b());
    if (localInteger == null) {}
    for (int i1 = 0;; i1 = localInteger.intValue())
    {
      jdField_aS_of_type_Int = i1;
      if (jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.jdField_d_of_type_Int < 3) {
        bool = true;
      }
      jdField_g_of_type_Boolean = bool;
      return;
    }
  }
  
  public void p()
  {
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(jdField_a_of_type_ComTencentMobileqqTransfileTransferRequest.b(), Integer.valueOf(jdField_aS_of_type_Int));
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.size() > 2000) {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    }
  }
  
  void q()
  {
    aP = 0;
    aT = "";
    jdField_a_of_type_JavaUtilHashMap.clear();
  }
  
  protected void r() {}
}
