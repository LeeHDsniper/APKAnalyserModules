package com.tencent.mobileqq.msf.sdk;

import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;

public class VerifyCodeInfo
{
  public int appSeq;
  public int ssoSeq;
  public int svrSeqNo;
  public String uin;
  public String verifyNote;
  public byte[] verifyimage;
  public String verifyurl;
  public String vpicSid;
  public int wupSeq;
  
  public VerifyCodeInfo() {}
  
  public static VerifyCodeInfo getVerifyCodeInfo(FromServiceMsg paramFromServiceMsg)
  {
    VerifyCodeInfo localVerifyCodeInfo = new VerifyCodeInfo();
    verifyimage = ((byte[])paramFromServiceMsg.getAttribute("resp_verify_image"));
    verifyNote = ((String)paramFromServiceMsg.getAttribute("resp_verify_msg"));
    svrSeqNo = ((Integer)paramFromServiceMsg.getAttribute("resp_verify_svrSeq")).intValue();
    vpicSid = ((String)paramFromServiceMsg.getAttribute("resp_verify_picSid"));
    wupSeq = ((Integer)paramFromServiceMsg.getAttribute("resp_verify_wupSeq")).intValue();
    ssoSeq = ((Integer)paramFromServiceMsg.getAttribute("resp_verify_ssoSeq")).intValue();
    uin = paramFromServiceMsg.getUin();
    verifyurl = ((String)paramFromServiceMsg.getAttribute("resp_verify_url"));
    appSeq = paramFromServiceMsg.getAppSeq();
    return localVerifyCodeInfo;
  }
  
  public static VerifyCodeInfo getVerifyCodeInfo(ToServiceMsg paramToServiceMsg)
  {
    VerifyCodeInfo localVerifyCodeInfo = new VerifyCodeInfo();
    verifyimage = ((byte[])paramToServiceMsg.getAttribute("resp_verify_image"));
    verifyNote = ((String)paramToServiceMsg.getAttribute("resp_verify_msg"));
    svrSeqNo = ((Integer)paramToServiceMsg.getAttribute("resp_verify_svrSeq")).intValue();
    vpicSid = ((String)paramToServiceMsg.getAttribute("resp_verify_picSid"));
    wupSeq = ((Integer)paramToServiceMsg.getAttribute("resp_verify_wupSeq")).intValue();
    ssoSeq = ((Integer)paramToServiceMsg.getAttribute("resp_verify_ssoSeq")).intValue();
    uin = paramToServiceMsg.getUin();
    verifyurl = ((String)paramToServiceMsg.getAttribute("resp_verify_url"));
    appSeq = paramToServiceMsg.getAppSeq();
    return localVerifyCodeInfo;
  }
  
  public static void putVerifyCodeInfo(FromServiceMsg paramFromServiceMsg, VerifyCodeInfo paramVerifyCodeInfo)
  {
    if (paramVerifyCodeInfo == null) {
      return;
    }
    paramFromServiceMsg.addAttribute("resp_verify_image", verifyimage);
    paramFromServiceMsg.addAttribute("resp_verify_msg", verifyNote);
    paramFromServiceMsg.addAttribute("resp_verify_svrSeq", Integer.valueOf(svrSeqNo));
    paramFromServiceMsg.addAttribute("resp_verify_picSid", vpicSid);
    paramFromServiceMsg.addAttribute("resp_verify_wupSeq", Integer.valueOf(wupSeq));
    paramFromServiceMsg.addAttribute("resp_verify_ssoSeq", Integer.valueOf(ssoSeq));
    paramFromServiceMsg.addAttribute("resp_verify_uin", paramFromServiceMsg.getUin());
    paramFromServiceMsg.addAttribute("resp_verify_url", verifyurl);
    paramFromServiceMsg.addAttribute("resp_verify_appseq", Integer.valueOf(paramFromServiceMsg.getAppSeq()));
  }
  
  public static void putVerifyCodeInfo(ToServiceMsg paramToServiceMsg, VerifyCodeInfo paramVerifyCodeInfo)
  {
    if ((paramToServiceMsg == null) || (paramVerifyCodeInfo == null)) {
      return;
    }
    paramToServiceMsg.addAttribute("resp_verify_image", verifyimage);
    paramToServiceMsg.addAttribute("resp_verify_msg", verifyNote);
    paramToServiceMsg.addAttribute("resp_verify_svrSeq", Integer.valueOf(svrSeqNo));
    paramToServiceMsg.addAttribute("resp_verify_picSid", vpicSid);
    paramToServiceMsg.addAttribute("resp_verify_wupSeq", Integer.valueOf(wupSeq));
    paramToServiceMsg.addAttribute("resp_verify_ssoSeq", Integer.valueOf(ssoSeq));
    paramToServiceMsg.addAttribute("resp_verify_uin", paramToServiceMsg.getUin());
    paramToServiceMsg.addAttribute("resp_verify_url", verifyurl);
    paramToServiceMsg.addAttribute("resp_verify_appseq", Integer.valueOf(paramToServiceMsg.getAppSeq()));
  }
}
