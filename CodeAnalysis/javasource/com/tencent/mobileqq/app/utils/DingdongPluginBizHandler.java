package com.tencent.mobileqq.app.utils;

import android.content.Intent;
import com.tencent.mobileqq.app.BusinessHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.InvalidProtocolBufferMicroException;
import com.tencent.mobileqq.pb.MessageMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBRepeatField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import com.trunk.Qworkflow.Qworkflow.Notification;
import com.trunk.Qworkflow.Qworkflow.ScheduleChangeNotification;
import com.trunk.Qworkflow.Qworkflow.Text;
import cooperation.dingdong.DingdongPluginDataFactory;
import cooperation.dingdong.DingdongPluginHelper;
import cooperation.dingdong.data.OfficeCenterSharedPref;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import tencent.im.oidb.cmd0x4f2.oidb_0x4f2.ReqBody;
import tencent.im.oidb.cmd0x4f2.oidb_0x4f2.RspBody;
import tencent.im.oidb.cmd0x508.oidb_0x508.ReqBody;
import tencent.im.oidb.cmd0x508.oidb_0x508.RspBody;
import tencent.im.oidb.cmd0x51d.oidb_0x51d.GetOfficeNoticeRsp;
import tencent.im.oidb.cmd0x51d.oidb_0x51d.NoticeInfo;
import tencent.im.oidb.cmd0x51d.oidb_0x51d.ReqBody;
import tencent.im.oidb.cmd0x51d.oidb_0x51d.RspBody;
import tencent.im.oidb.cmd0x589.oidb_0x589.GetUserOpenIdReq;
import tencent.im.oidb.cmd0x589.oidb_0x589.GetUserOpenIdRsp;
import tencent.im.oidb.cmd0x589.oidb_0x589.ReqBody;
import tencent.im.oidb.cmd0x589.oidb_0x589.RspBody;
import tencent.im.oidb.cmd0x8f6.oidb_cmd0x8f6.DecreaseUnreadMailCountReq;
import tencent.im.oidb.cmd0x8f6.oidb_cmd0x8f6.GetUnreadMailCountRsp;
import tencent.im.oidb.cmd0x8f6.oidb_cmd0x8f6.ReqBody;
import tencent.im.oidb.cmd0x8f6.oidb_cmd0x8f6.RspBody;
import tencent.im.oidb.cmd0x8f6.oidb_cmd0x8f6.UnreadMailCountInfo;
import tencent.im.oidb.cmd0x8f9.oidb_0x8f9.GetLatestNodeInfoReq;
import tencent.im.oidb.cmd0x8f9.oidb_0x8f9.GetLatestNodeInfoRsp;
import tencent.im.oidb.cmd0x8f9.oidb_0x8f9.LiteMailBrief;
import tencent.im.oidb.cmd0x8f9.oidb_0x8f9.ReqBody;
import tencent.im.oidb.cmd0x8f9.oidb_0x8f9.ResultMsg;
import tencent.im.oidb.cmd0x8f9.oidb_0x8f9.RspBody;
import tencent.im.oidb.cmd0x8f9.oidb_0x8f9.SourceID;
import tencent.im.oidb.cmd0x8f9.oidb_0x8f9.UnreadMailCountInfo;
import tencent.im.s2c.msgtype0x210.submsgtype0x8f.submsgtype0x8f.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x8f.submsgtype0x8f.SourceID;
import tencent.im.s2c.msgtype0x210.submsgtype0x93.submsgtype0x93.LiteMailIndexInfo;
import tencent.im.s2c.msgtype0x210.submsgtype0x93.submsgtype0x93.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x93.submsgtype0x93.SourceID;
import tencent.im.s2c.msgtype0x210.submsgtype0x93.submsgtype0x93.StateChangeNotify;
import tencent.im.s2c.msgtype0x210.submsgtype0x93.submsgtype0x93.UnreadMailCountChanged;
import tencent.im.s2c.msgtype0x210.submsgtype0x93.submsgtype0x93.UnreadMailCountInfo;
import tencent.im.s2c.msgtype0x210.submsgtype0x9b.SubMsgType0x9b.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x9b.SubMsgType0x9b.PbOfficeNotify;
import tencent.im.s2c.msgtype0x210.submsgtype0x9c.SubMsgType0x9c.MsgBody;

public class DingdongPluginBizHandler
  extends BusinessHandler
{
  private static final int a = 1;
  public static final String a = "DingdongPluginBizHandler";
  public static final String b = "OidbSvc.0x8f6_1";
  public static final String c = "OidbSvc.0x51d_1";
  public static final String d = "OidbSvc.0x508_1";
  public static final String e = "OidbSvc.0x508_2";
  public static final String f = "OidbSvc.0x4f2";
  public static final String g = "OidbSvc.0x8f9_13";
  public static final String h = "OidbSvc.0x589";
  private static final String i = "OidbSvc.0x8f6_1_subCmd";
  private static final String j = "OidbSvc.0x8f9_13_subCmd";
  private static final String k = "ReqSeq";
  
  public DingdongPluginBizHandler(QQAppInterface paramQQAppInterface)
  {
    super(paramQQAppInterface);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private String a(byte[] paramArrayOfByte, boolean paramBoolean)
  {
    c();
    Object localObject = new Qworkflow.Notification();
    for (;;)
    {
      try
      {
        ((Qworkflow.Notification)localObject).mergeFrom(paramArrayOfByte);
        paramArrayOfByte = (Qworkflow.ScheduleChangeNotification)msg_schedule_change.get();
        if (1 != enum_change_type.get()) {
          break;
        }
        localObject = new DingdongPluginBizObserver.ScheduleNotificationData();
        jdField_a_of_type_Boolean = paramBoolean;
        jdField_a_of_type_CooperationDingdongDingdongPluginDataFactory$ScheduleSummaryData = DingdongPluginDataFactory.a((Qworkflow.Text)msg_summary.get());
        if (jdField_a_of_type_CooperationDingdongDingdongPluginDataFactory$ScheduleSummaryData != null)
        {
          jdField_a_of_type_CooperationDingdongDingdongPluginDataFactory$ScheduleSummaryData.jdField_a_of_type_JavaLangString = bytes_workflow_id.get().toStringUtf8();
          jdField_a_of_type_CooperationDingdongDingdongPluginDataFactory$ScheduleSummaryData.e = String.valueOf(uint64_author_uin.get());
          if (jdField_a_of_type_Int == 0)
          {
            paramBoolean = true;
            super.a(10, paramBoolean, localObject);
            break label207;
          }
        }
        else
        {
          jdField_a_of_type_Int = -1;
          continue;
        }
        paramBoolean = false;
      }
      catch (Exception paramArrayOfByte)
      {
        return paramArrayOfByte.toString();
      }
    }
    localObject = new DingdongPluginBizObserver.ScheduleChangeNotifyData();
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_JavaLangString = bytes_workflow_id.get().toStringUtf8();
    jdField_a_of_type_Long = uint64_author_uin.get();
    jdField_b_of_type_Int = enum_change_type.get();
    super.a(9, true, localObject);
    label207:
    return null;
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    int m = paramFromServiceMsg.getResultCode();
    Object localObject = new oidb_0x589.RspBody();
    int n;
    if (1000 == m)
    {
      n = a(paramFromServiceMsg, paramObject, (MessageMicro)localObject);
      m = n;
      if (n == 0) {
        break label405;
      }
      QLog.e("DingdongPluginBizHandler", 1, "0x589 respond oidb error:retCode[" + n + "].");
      m = n;
    }
    for (;;)
    {
      paramFromServiceMsg = new DingdongPluginBizObserver.GetOpenIdNotifyData();
      jdField_a_of_type_Long = ((Long)paramToServiceMsg.getAttribute("ReqSeq", Long.valueOf(-1L))).longValue();
      if (m != 0) {
        break label483;
      }
      try
      {
        paramToServiceMsg = rpt_msg_open_id.get();
        jdField_b_of_type_Long = uint64_app_id.get();
        jdField_b_of_type_Int = paramToServiceMsg.size();
        paramObject = new DingdongPluginBizObserver.GetOpenIdNotifyData.GetOpenIdData[jdField_b_of_type_Int];
        n = 0;
        for (;;)
        {
          if (n < jdField_b_of_type_Int)
          {
            localObject = (oidb_0x589.GetUserOpenIdRsp)paramToServiceMsg.get(n);
            paramObject[n] = new DingdongPluginBizObserver.GetOpenIdNotifyData.GetOpenIdData();
            jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$GetOpenIdNotifyData$ReqData = new DingdongPluginBizObserver.GetOpenIdNotifyData.ReqData();
            jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$GetOpenIdNotifyData$ReqData.jdField_a_of_type_Int = msg_req_id.uint32_req_flag.get();
            jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$GetOpenIdNotifyData$ReqData.jdField_a_of_type_Long = msg_req_id.uint64_req_uin.get();
            jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$GetOpenIdNotifyData$ReqData.jdField_b_of_type_Long = msg_req_id.uint64_req_host_uin.get();
            jdField_a_of_type_Int = uint32_result.get();
            jdField_a_of_type_JavaLangString = bytes_open_id.get().toStringUtf8();
            jdField_b_of_type_JavaLangString = bytes_group_open_id.get().toStringUtf8();
            jdField_c_of_type_JavaLangString = bytes_discuss_open_id.get().toStringUtf8();
            jdField_d_of_type_JavaLangString = bytes_token.get().toStringUtf8();
            n += 1;
            continue;
            QLog.e("DingdongPluginBizHandler", 1, "0x589 respond msf error:retCode[" + m + "],errMsg[" + paramFromServiceMsg.getBusinessFailMsg() + "]");
            label405:
            break;
          }
        }
        jdField_a_of_type_ArrayOfComTencentMobileqqAppUtilsDingdongPluginBizObserver$GetOpenIdNotifyData$GetOpenIdData = paramObject;
        jdField_a_of_type_Int = 1;
      }
      catch (NullPointerException paramToServiceMsg)
      {
        for (;;)
        {
          jdField_a_of_type_Int = -1;
          QLog.e("DingdongPluginBizHandler", 1, "0x589 handleRsp nullPointer error:[" + paramToServiceMsg.toString() + "]");
          m = -1;
        }
      }
    }
    if (m == 0) {}
    for (boolean bool = true;; bool = false)
    {
      super.a(6, bool, paramFromServiceMsg);
      return;
      label483:
      jdField_a_of_type_Int = -1;
      break;
    }
  }
  
  private void c()
  {
    if (!OfficeCenterSharedPref.a().a("officecenter_always_show_flag", false)) {
      OfficeCenterSharedPref.a().b("officecenter_always_show_flag", true);
    }
    a(13, true, null);
  }
  
  private void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    int m = paramFromServiceMsg.getResultCode();
    oidb_0x508.RspBody localRspBody = new oidb_0x508.RspBody();
    if (1000 == m)
    {
      m = a(paramFromServiceMsg, paramObject, localRspBody);
      if (m == 0)
      {
        int n = opt_uint32_result.get();
        m = n;
        if (n == 0) {
          break label290;
        }
        QLog.e("DingdongPluginBizHandler", 1, "0x508_2 respond biz error: retCode[" + n + "].");
        m = n;
        paramFromServiceMsg = new DingdongPluginBizObserver.GetAppListData();
        jdField_a_of_type_Long = ((Long)paramToServiceMsg.getAttribute("ReqSeq", Long.valueOf(-1L))).longValue();
        if (m != 0) {
          break label293;
        }
        jdField_a_of_type_Int = opt_uint32_result.get();
        jdField_a_of_type_JavaLangString = opt_bytes_errinfo.get().toStringUtf8();
        jdField_b_of_type_Long = opt_uint64_update_seq.get();
        paramToServiceMsg = rpt_uint64_appid_list.get();
        if (paramToServiceMsg != null)
        {
          jdField_a_of_type_JavaUtilArrayList = new ArrayList(paramToServiceMsg.size());
          jdField_a_of_type_JavaUtilArrayList.addAll(paramToServiceMsg);
        }
        label205:
        if (m != 0) {
          break label301;
        }
      }
    }
    label290:
    label293:
    label301:
    for (boolean bool = true;; bool = false)
    {
      super.a(11, bool, paramFromServiceMsg);
      return;
      QLog.e("DingdongPluginBizHandler", 1, "0x508_2 respond oidb error: retCode[" + m + "].");
      break;
      QLog.e("DingdongPluginBizHandler", 1, "0x508_2 respond msf error: retCode[" + m + "].");
      break;
      jdField_a_of_type_Int = -1;
      break label205;
    }
  }
  
  private void d(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    int m = paramFromServiceMsg.getResultCode();
    oidb_0x4f2.RspBody localRspBody = new oidb_0x4f2.RspBody();
    if (1000 == m)
    {
      m = a(paramFromServiceMsg, paramObject, localRspBody);
      if (m == 0)
      {
        int n = opt_uint32_result.get();
        m = n;
        if (n == 0) {
          break label290;
        }
        QLog.e("DingdongPluginBizHandler", 1, "0x4f2 respond biz error: retCode[" + n + "].");
        m = n;
        paramFromServiceMsg = new DingdongPluginBizObserver.SetAppListData();
        jdField_a_of_type_Long = ((Long)paramToServiceMsg.getAttribute("ReqSeq", Long.valueOf(-1L))).longValue();
        if (m != 0) {
          break label293;
        }
        jdField_a_of_type_Int = opt_uint32_result.get();
        jdField_a_of_type_JavaLangString = opt_bytes_errinfo.get().toStringUtf8();
        jdField_b_of_type_Long = opt_uint64_update_seq.get();
        paramToServiceMsg = rpt_uint64_appid_list.get();
        if (paramToServiceMsg != null)
        {
          jdField_a_of_type_JavaUtilArrayList = new ArrayList(paramToServiceMsg.size());
          jdField_a_of_type_JavaUtilArrayList.addAll(paramToServiceMsg);
        }
        label205:
        if (m != 0) {
          break label301;
        }
      }
    }
    label290:
    label293:
    label301:
    for (boolean bool = true;; bool = false)
    {
      super.a(12, bool, paramFromServiceMsg);
      return;
      QLog.e("DingdongPluginBizHandler", 1, "0x4f2 respond oidb error: retCode[" + m + "].");
      break;
      QLog.e("DingdongPluginBizHandler", 1, "0x4f2 respond msf error: retCode[" + m + "].");
      break;
      jdField_a_of_type_Int = -1;
      break label205;
    }
  }
  
  private void e(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    int m = paramFromServiceMsg.getResultCode();
    int i1 = ((Integer)paramToServiceMsg.getAttribute("OidbSvc.0x8f6_1_subCmd")).intValue();
    paramToServiceMsg = new oidb_cmd0x8f6.RspBody();
    if (1000 == m)
    {
      m = a(paramFromServiceMsg, paramObject, paramToServiceMsg);
      if (m == 0)
      {
        int n = uint32_result.get();
        m = n;
        if (n != 0)
        {
          QLog.e("DingdongPluginBizHandler", 1, "0x8f6_1 respond biz error:subCmd[" + i1 + "],retCode[" + n + "].");
          m = n;
        }
        switch (i1)
        {
        }
      }
    }
    label359:
    do
    {
      return;
      QLog.e("DingdongPluginBizHandler", 1, "0x8f6_1 respond oidb error:subCmd[" + i1 + "],retCode[" + m + "].");
      break;
      QLog.e("DingdongPluginBizHandler", 1, "0x8f6_1 respond msf error:subCmd[" + i1 + "],retCode[" + m + "].");
      break;
      paramFromServiceMsg = new DingdongPluginBizObserver.UnreadNumUpdateData();
      if (m == 0) {}
      for (;;)
      {
        try
        {
          paramToServiceMsg = (oidb_cmd0x8f6.UnreadMailCountInfo)msg_get_umc.get()).msg_unread.get();
          jdField_b_of_type_Int = uint32_unread_count.get();
          jdField_c_of_type_Int = uint32_data_version.get();
          if (jdField_a_of_type_Int != 0) {
            break label359;
          }
          bool = true;
          super.a(1, bool, paramFromServiceMsg);
          return;
        }
        catch (NullPointerException paramToServiceMsg)
        {
          QLog.e("DingdongPluginBizHandler", 1, "0x8f6_1 respond biz package error:subCmd[0x1],errMsg[" + paramToServiceMsg.toString() + "].");
          jdField_a_of_type_Int = -1;
          continue;
        }
        jdField_a_of_type_Int = m;
        continue;
        boolean bool = false;
      }
    } while (m != 0);
  }
  
  private void f(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    int m = paramFromServiceMsg.getResultCode();
    int i1 = ((Integer)paramToServiceMsg.getAttribute("OidbSvc.0x8f9_13_subCmd")).intValue();
    paramToServiceMsg = new oidb_0x8f9.RspBody();
    if (1000 == m)
    {
      m = a(paramFromServiceMsg, paramObject, paramToServiceMsg);
      if (m != 0) {}
    }
    for (;;)
    {
      try
      {
        int n = msg_result_msg.uint32_result.get();
        m = n;
        if (n != 0)
        {
          m = n;
          paramFromServiceMsg = msg_result_msg.bytes_err_msg.get().toStringUtf8();
          m = n;
          QLog.e("DingdongPluginBizHandler", 1, "0x8f9_11 respond biz package error -> subCmd" + i1 + "retCode[" + n + "],errMsg[" + paramFromServiceMsg + "].");
          m = n;
        }
      }
      catch (NullPointerException paramFromServiceMsg)
      {
        QLog.e("DingdongPluginBizHandler", 1, "0x8f9_11 respond biz package error -> subCmd" + i1 + "retCode[" + m + "],errMsg[" + paramFromServiceMsg.toString() + "].");
        m = -1;
        continue;
      }
      switch (i1)
      {
      default: 
        return;
        QLog.e("DingdongPluginBizHandler", 1, "0x8f9_11 respond oidb package error -> subCmd" + i1 + "retCode[" + m + "].");
        continue;
        QLog.e("DingdongPluginBizHandler", 1, "0x8f9_11 respond msf error -> subCmd" + i1 + "retCode[" + m + "].");
      }
    }
    paramFromServiceMsg = new DingdongPluginBizObserver.NodeUpdateData();
    if (m == 0) {}
    for (;;)
    {
      try
      {
        jdField_a_of_type_Int = msg_rsp_get_latest_node_info.uint32_result.get();
        if (132 == jdField_a_of_type_Int)
        {
          jdField_a_of_type_Int = 0;
          jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$LastMsgUpdateData = new DingdongPluginBizObserver.LastMsgUpdateData();
          jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$UnreadNumUpdateData = new DingdongPluginBizObserver.UnreadNumUpdateData();
          if (QLog.isColorLevel()) {
            QLog.i("DingdongPluginBizHandler", 2, "0x8f9_13 respond no feed data.");
          }
          if (jdField_a_of_type_Int != 0) {
            break label838;
          }
          bool = true;
          super.a(2, bool, paramFromServiceMsg);
          return;
        }
        if (jdField_a_of_type_Int == 0)
        {
          paramObject = new DingdongPluginBizObserver.LastMsgUpdateData();
          if (msg_rsp_get_latest_node_info.msg_litemail_brief.has())
          {
            jdField_a_of_type_JavaLangString = msg_rsp_get_latest_node_info.msg_litemail_brief.bytes_feeds_id.get().toStringUtf8();
            jdField_c_of_type_Int = msg_rsp_get_latest_node_info.msg_litemail_brief.uint32_last_modify_time.get();
            jdField_b_of_type_Int = msg_rsp_get_latest_node_info.msg_litemail_brief.msg_source_id.uint32_source_type.get();
            jdField_b_of_type_JavaLangString = String.valueOf(msg_rsp_get_latest_node_info.msg_litemail_brief.msg_source_id.uint64_source_code.get());
            jdField_c_of_type_JavaLangString = String.valueOf(msg_rsp_get_latest_node_info.msg_litemail_brief.uint64_author_uin.get());
            jdField_d_of_type_JavaLangString = msg_rsp_get_latest_node_info.msg_litemail_brief.bytes_feeds_summary.get().toStringUtf8();
            if (1 == msg_rsp_get_latest_node_info.msg_litemail_brief.uint32_summary_truncate_flag.get()) {
              jdField_d_of_type_JavaLangString = (jdField_d_of_type_JavaLangString.substring(0, jdField_d_of_type_JavaLangString.length() - 1) + "...");
            }
          }
          jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$LastMsgUpdateData = paramObject;
          if (!msg_rsp_get_latest_node_info.msg_unread_cnt_info.has()) {
            continue;
          }
          paramObject = new DingdongPluginBizObserver.UnreadNumUpdateData();
          jdField_b_of_type_Int = msg_rsp_get_latest_node_info.msg_unread_cnt_info.uint32_unread_count.get();
          jdField_c_of_type_Int = msg_rsp_get_latest_node_info.msg_unread_cnt_info.uint32_data_version.get();
          jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$UnreadNumUpdateData = paramObject;
          continue;
        }
      }
      catch (NullPointerException paramToServiceMsg)
      {
        QLog.e("DingdongPluginBizHandler", 1, "0x8f9_13 respond biz error:errMsg[" + paramToServiceMsg.toString() + "].");
        jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$UnreadNumUpdateData = null;
        jdField_a_of_type_ComTencentMobileqqAppUtilsDingdongPluginBizObserver$LastMsgUpdateData = null;
        jdField_a_of_type_Int = -1;
        continue;
      }
      if (msg_rsp_get_latest_node_info.bytes_err_msg.has()) {}
      for (paramToServiceMsg = msg_rsp_get_latest_node_info.bytes_err_msg.get().toStringUtf8();; paramToServiceMsg = "serveUnknownError")
      {
        QLog.e("DingdongPluginBizHandler", 1, "0x8f9_13 respond biz error -> retCode[" + jdField_a_of_type_Int + ",errMsg[" + paramToServiceMsg + "].");
        break;
      }
      jdField_a_of_type_Int = m;
      continue;
      label838:
      boolean bool = false;
    }
  }
  
  private void g(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    int m = paramFromServiceMsg.getResultCode();
    paramToServiceMsg = new oidb_0x508.RspBody();
    if (1000 == m)
    {
      m = a(paramFromServiceMsg, paramObject, paramToServiceMsg);
      if (m == 0)
      {
        m = opt_uint32_result.get();
        if (m != 0) {
          QLog.e("DingdongPluginBizHandler", 1, "0x508_1 respond biz error: retCode[" + m + "].");
        }
      }
    }
    while (!DingdongPluginHelper.a(b.getApplication()))
    {
      if (rpt_uint64_appid_list.has())
      {
        paramObject = rpt_uint64_appid_list.get();
        int n = paramObject.size();
        if (n > 0)
        {
          paramToServiceMsg = "";
          m = 0;
          for (;;)
          {
            if (m < n)
            {
              paramFromServiceMsg = paramToServiceMsg + paramObject.get(m);
              paramToServiceMsg = paramFromServiceMsg;
              if (m != n - 1) {
                paramToServiceMsg = paramFromServiceMsg + ",";
              }
              m += 1;
              continue;
              QLog.e("DingdongPluginBizHandler", 1, "0x508_1 respond oidb error: retCode[" + m + "].");
              break;
              QLog.e("DingdongPluginBizHandler", 1, "0x508_1 respond msf error: retCode[" + m + "].");
              break;
            }
          }
          QLog.i("DingdongPluginBizHandler", 4, "officecenter: handleRspMsg_0x508_1 set app id list: " + paramToServiceMsg);
          if (paramToServiceMsg.length() > 0)
          {
            paramFromServiceMsg = "officecenter_user_apps_list_txt_" + b.getLongAccountUin();
            OfficeCenterSharedPref.a().a(paramFromServiceMsg, paramToServiceMsg);
          }
        }
      }
      return;
    }
    QLog.i("DingdongPluginBizHandler", 1, "officecenter: handleRspMsg_0x508_1 dingdong is running, no set list plz.");
  }
  
  private void h(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    int m = paramFromServiceMsg.getResultCode();
    paramToServiceMsg = new oidb_0x51d.RspBody();
    if (1000 == m)
    {
      m = a(paramFromServiceMsg, paramObject, paramToServiceMsg);
      if (m == 0)
      {
        m = opt_uint32_result.get();
        if (m != 0) {
          QLog.e("DingdongPluginBizHandler", 1, "0x51d_1 respond biz error: retCode[" + m + "].");
        }
      }
    }
    for (;;)
    {
      if (opt_msg_office_notice_rsp.has())
      {
        paramToServiceMsg = (oidb_0x51d.GetOfficeNoticeRsp)opt_msg_office_notice_rsp.get();
        if (opt_msg_office_notice.has())
        {
          paramToServiceMsg = (oidb_0x51d.NoticeInfo)opt_msg_office_notice.get();
          m = opt_uint32_notice_count.get();
          int n = opt_uint32_notice_version.get();
          QLog.e("DingdongPluginBizHandler", 4, "handleRspMsg_0x51d_1 cnt: " + m + " ver: " + n);
          if (m > 0)
          {
            OfficeCenterSharedPref.a().b("officecenter_red_point_flag_" + b.getLongAccountUin(), true);
            OfficeCenterSharedPref.a().a("officecenter_red_point_cnt_" + b.getLongAccountUin(), m);
            OfficeCenterSharedPref.a().a("officecenter_red_point_ver_" + b.getLongAccountUin(), n);
            a(5, true, null);
          }
        }
      }
      return;
      QLog.e("DingdongPluginBizHandler", 1, "0x51d_1 respond oidb error: retCode[" + m + "].");
      continue;
      QLog.e("DingdongPluginBizHandler", 1, "0x51d_1 respond msf error: retCode[" + m + "].");
    }
  }
  
  public Class a()
  {
    return DingdongPluginBizObserver.class;
  }
  
  public void a()
  {
    oidb_0x51d.ReqBody localReqBody = new oidb_0x51d.ReqBody();
    localReqBody.setHasFlag(true);
    opt_uint64_handled_uin.set(b.getLongAccountUin());
    super.b(super.a("OidbSvc.0x51d_1", 1309, 1, localReqBody.toByteArray()));
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    Object localObject = new oidb_cmd0x8f6.ReqBody();
    uint32_subcmd.set(2);
    oidb_cmd0x8f6.DecreaseUnreadMailCountReq localDecreaseUnreadMailCountReq = new oidb_cmd0x8f6.DecreaseUnreadMailCountReq();
    uint32_type.set(1);
    uint32_amount.set(paramInt1);
    uint32_data_version.set(paramInt2);
    msg_dec_umc.set(localDecreaseUnreadMailCountReq, true);
    localObject = super.a("OidbSvc.0x8f6_1", 2294, 1, ((oidb_cmd0x8f6.ReqBody)localObject).toByteArray());
    ((ToServiceMsg)localObject).addAttribute("OidbSvc.0x8f6_1_subCmd", Integer.valueOf(2));
    super.b((ToServiceMsg)localObject);
  }
  
  public void a(long paramLong)
  {
    Object localObject = new oidb_0x508.ReqBody();
    rpt_uint64_update_seq.set(0L);
    ((oidb_0x508.ReqBody)localObject).setHasFlag(true);
    localObject = super.a("OidbSvc.0x508_2", 1288, 1, ((oidb_0x508.ReqBody)localObject).toByteArray());
    ((ToServiceMsg)localObject).addAttribute("ReqSeq", Long.valueOf(paramLong));
    ((ToServiceMsg)localObject).setTimeout(20000L);
    super.b((ToServiceMsg)localObject);
  }
  
  public void a(long paramLong1, long paramLong2, List paramList)
  {
    if (paramList != null)
    {
      oidb_0x589.ReqBody localReqBody = new oidb_0x589.ReqBody();
      localReqBody.setHasFlag(true);
      uint64_app_id.set(paramLong2);
      rpt_msg_user_id.addAll(paramList);
      paramList = super.a("OidbSvc.0x589", 1417, 1, localReqBody.toByteArray());
      paramList.addAttribute("ReqSeq", Long.valueOf(paramLong1));
      paramList.setTimeout(20000L);
      super.b(paramList);
    }
  }
  
  public void a(long paramLong, List paramList)
  {
    if (paramList != null)
    {
      oidb_0x4f2.ReqBody localReqBody = new oidb_0x4f2.ReqBody();
      rpt_uint64_appid_list.set(paramList);
      localReqBody.setHasFlag(true);
      paramList = super.a("OidbSvc.0x4f2", 1266, 1, localReqBody.toByteArray());
      paramList.addAttribute("ReqSeq", Long.valueOf(paramLong));
      paramList.setTimeout(20000L);
      super.b(paramList);
    }
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    String str = paramToServiceMsg.getServiceCmd();
    if ("OidbSvc.0x8f6_1".equals(str)) {
      e(paramToServiceMsg, paramFromServiceMsg, paramObject);
    }
    do
    {
      return;
      if ("OidbSvc.0x8f9_13".equals(str))
      {
        f(paramToServiceMsg, paramFromServiceMsg, paramObject);
        return;
      }
      if ("OidbSvc.0x51d_1".equals(str))
      {
        h(paramToServiceMsg, paramFromServiceMsg, paramObject);
        return;
      }
      if ("OidbSvc.0x508_1".equals(str))
      {
        g(paramToServiceMsg, paramFromServiceMsg, paramObject);
        return;
      }
      if ("OidbSvc.0x589".equals(str))
      {
        b(paramToServiceMsg, paramFromServiceMsg, paramObject);
        return;
      }
      if ("OidbSvc.0x508_2".equals(str))
      {
        c(paramToServiceMsg, paramFromServiceMsg, paramObject);
        return;
      }
    } while (!"OidbSvc.0x4f2".equals(str));
    d(paramToServiceMsg, paramFromServiceMsg, paramObject);
  }
  
  public void a(submsgtype0x8f.MsgBody paramMsgBody)
  {
    DingdongPluginBizObserver.FeedConfirmNotifyData localFeedConfirmNotifyData = new DingdongPluginBizObserver.FeedConfirmNotifyData();
    try
    {
      jdField_a_of_type_JavaLangString = bytes_feeds_id.get().toStringUtf8();
      jdField_b_of_type_Int = msg_source_id.uint32_source_type.get();
      jdField_b_of_type_JavaLangString = String.valueOf(msg_source_id.uint64_source_code.get());
      jdField_d_of_type_JavaLangString = String.valueOf(uint64_author_uin.get());
      jdField_c_of_type_JavaLangString = String.valueOf(uint64_confirm_uin.get());
      jdField_d_of_type_Int = enum_msg_type.get();
      if (jdField_a_of_type_Int == 0)
      {
        bool = true;
        super.a(4, bool, localFeedConfirmNotifyData);
        return;
      }
    }
    catch (NullPointerException paramMsgBody)
    {
      for (;;)
      {
        jdField_a_of_type_Int = -1;
        continue;
        boolean bool = false;
      }
    }
  }
  
  public void a(submsgtype0x93.MsgBody paramMsgBody)
  {
    boolean bool = true;
    int m = uint32_msg_type.get();
    if (QLog.isColorLevel()) {
      QLog.i("DingdongPluginBizHandler", 2, "handlePushMsg_0x210_0x93:msgType[" + m + "].");
    }
    switch (m)
    {
    default: 
      return;
    case 1: 
      localObject = new DingdongPluginBizObserver.UnreadNumUpdateData();
      try
      {
        jdField_b_of_type_Int = msg_umc_changed.msg_umc.uint32_unread_count.get();
        jdField_c_of_type_Int = msg_umc_changed.msg_umc.uint32_data_version.get();
        if (jdField_a_of_type_Int == 0)
        {
          bool = true;
          super.a(1, bool, localObject);
          return;
        }
      }
      catch (NullPointerException paramMsgBody)
      {
        for (;;)
        {
          QLog.e("DingdongPluginBizHandler", 1, "handlePushMsg_0x210_0x93_0x1 error:nullPointer[" + paramMsgBody.toString() + "].");
          jdField_a_of_type_Int = -1;
          continue;
          bool = false;
        }
      }
    }
    Object localObject = new DingdongPluginBizObserver.FeedStateUpdateData();
    try
    {
      jdField_d_of_type_Int = msg_state_changed.enum_msg_type.get();
      jdField_b_of_type_Int = msg_state_changed.msg_source_id.uint32_source_type.get();
      jdField_b_of_type_JavaLangString = String.valueOf(msg_state_changed.msg_source_id.uint64_source_code.get());
      jdField_a_of_type_JavaLangString = msg_state_changed.bytes_feeds_id.get().toStringUtf8();
      jdField_c_of_type_JavaLangString = String.valueOf(msg_state_changed.uint64_req_uin.get());
      paramMsgBody = msg_state_changed.rpt_msg_lite_mail_index.get();
      if ((paramMsgBody != null) && (paramMsgBody.size() > 0))
      {
        jdField_a_of_type_JavaUtilArrayList = new ArrayList();
        paramMsgBody = paramMsgBody.iterator();
        while (paramMsgBody.hasNext())
        {
          submsgtype0x93.LiteMailIndexInfo localLiteMailIndexInfo = (submsgtype0x93.LiteMailIndexInfo)paramMsgBody.next();
          DingdongPluginBizObserver.TempLiteMailIndexInfo localTempLiteMailIndexInfo = new DingdongPluginBizObserver.TempLiteMailIndexInfo();
          jdField_a_of_type_JavaLangString = bytes_feeds_id.get().toStringUtf8();
          jdField_a_of_type_Int = msg_source_id.uint32_source_type.get();
          jdField_a_of_type_Long = msg_source_id.uint64_source_code.get();
          jdField_a_of_type_JavaUtilArrayList.add(localTempLiteMailIndexInfo);
        }
      }
      if (jdField_a_of_type_Int != 0) {}
    }
    catch (NullPointerException paramMsgBody)
    {
      jdField_a_of_type_Int = -1;
      QLog.e("DingdongPluginBizHandler", 1, "handlePushMsg_0x210_0x93_0x2 error:nullPointer[" + paramMsgBody.toString() + "].");
    }
    for (;;)
    {
      super.a(3, bool, localObject);
      return;
      bool = false;
    }
  }
  
  public void a(SubMsgType0x9b.MsgBody paramMsgBody)
  {
    c();
    int m = uint32_main_type.get();
    String str = bytes_workflow_id.get().toStringUtf8();
    boolean bool = OfficeCenterSharedPref.a().a("officecenter_mark_leave_activity", true);
    if (m == 1) {
      if (!bool)
      {
        paramMsgBody = new Intent();
        paramMsgBody.putExtra("reqCode", 4);
        paramMsgBody.putExtra("serviceType", m);
        DingdongPluginHelper.a(2, paramMsgBody);
      }
    }
    for (;;)
    {
      return;
      if (m == 2)
      {
        SubMsgType0x9b.PbOfficeNotify localPbOfficeNotify = new SubMsgType0x9b.PbOfficeNotify();
        paramMsgBody = bytes_ext_msg.get().toByteArray();
        try
        {
          localPbOfficeNotify.mergeFrom(paramMsgBody);
          int n = opt_uint32_myoffice_flag.get();
          paramMsgBody = rpt_uint64_appid.get();
          QLog.i("DingdongPluginBizHandler", 4, "0x210_0x9b push msg, serviceType: " + m + " workId: " + str + " flag: " + n + " id list: " + paramMsgBody.toString());
          if ((n == 1) && (bool)) {
            a();
          }
          if (paramMsgBody.size() > 0)
          {
            paramMsgBody = new Intent();
            paramMsgBody.putExtra("reqCode", 4);
            paramMsgBody.putExtra("serviceType", m);
            paramMsgBody.putExtra("hasAppNotice", true);
            DingdongPluginHelper.a(2, paramMsgBody);
            return;
          }
        }
        catch (InvalidProtocolBufferMicroException paramMsgBody)
        {
          paramMsgBody.printStackTrace();
        }
      }
    }
  }
  
  public void a(SubMsgType0x9b.MsgBody paramMsgBody, boolean paramBoolean)
  {
    long l = uint64_app_id.get();
    if (QLog.isColorLevel()) {
      QLog.i("DingdongPluginBizHandler", 1, "handlePushMsg_0x210_0x9b. appid = " + l + "  beoffline = " + paramBoolean);
    }
    if (1800000000L == l) {
      a(paramMsgBody);
    }
    do
    {
      do
      {
        return;
      } while ((1800000002L != l) || (!uint32_main_type.has()) || (!uint32_sub_type.has()) || (uint32_main_type.get() != 100) || (uint32_sub_type.get() != 1));
      paramMsgBody = a(bytes_ext_msg.get().toByteArray(), paramBoolean);
    } while (paramMsgBody == null);
    QLog.e("DingdongPluginBizHandler", 1, "handlePushMsg_0x210_0x9b.100 error(-1):" + paramMsgBody + ".");
  }
  
  public void a(SubMsgType0x9c.MsgBody paramMsgBody, boolean paramBoolean)
  {
    switch (uint32_main_type.get())
    {
    }
    do
    {
      do
      {
        return;
      } while (uint32_sub_type.get() != 1);
      paramMsgBody = a(bytes_ext_msg.get().toByteArray(), paramBoolean);
    } while (paramMsgBody == null);
    QLog.e("DingdongPluginBizHandler", 1, "handlePushMsg_0x210_0x9b.100 error(-1):" + paramMsgBody + ".");
  }
  
  public void a(boolean paramBoolean)
  {
    Object localObject = new oidb_0x8f9.ReqBody();
    oidb_0x8f9.GetLatestNodeInfoReq localGetLatestNodeInfoReq = new oidb_0x8f9.GetLatestNodeInfoReq();
    uint32_node_type.set(1);
    PBUInt32Field localPBUInt32Field = uint32_unread_count_flag;
    if (paramBoolean) {}
    for (int m = 0;; m = 1)
    {
      localPBUInt32Field.set(m);
      msg_req_get_latest_node_info.set(localGetLatestNodeInfoReq, true);
      localObject = super.a("OidbSvc.0x8f9_13", 2297, 13, ((oidb_0x8f9.ReqBody)localObject).toByteArray());
      ((ToServiceMsg)localObject).addAttribute("OidbSvc.0x8f9_13_subCmd", Integer.valueOf(1));
      super.b((ToServiceMsg)localObject);
      return;
    }
  }
  
  public void b()
  {
    if (!DingdongPluginHelper.a(b.getApplication()))
    {
      oidb_0x508.ReqBody localReqBody = new oidb_0x508.ReqBody();
      rpt_uint64_update_seq.set(0L);
      localReqBody.setHasFlag(true);
      super.b(super.a("OidbSvc.0x508_1", 1288, 1, localReqBody.toByteArray()));
    }
  }
}
