package com.tencent.mobileqq.app.readinjoy;

import android.os.Handler;
import android.os.Looper;
import com.tencent.mobileqq.app.BusinessHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.InvalidProtocolBufferMicroException;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBRepeatField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import cooperation.readinjoy.ReadInJoyHelper;
import cooperation.readinjoy.ReadInJoyRemoteCommand;
import cooperation.readinjoy.storage.ReadInJoyFeedsMsgRecord;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import tencent.im.s2c.msgtype0x210.submsgtype0x8d.SubMsgType0x8d.ChannelNotify;
import tencent.im.s2c.msgtype0x210.submsgtype0x8d.SubMsgType0x8d.CommentFeeds;
import tencent.im.s2c.msgtype0x210.submsgtype0x8d.SubMsgType0x8d.DeleteComment;
import tencent.im.s2c.msgtype0x210.submsgtype0x8d.SubMsgType0x8d.DeleteFeeds;
import tencent.im.s2c.msgtype0x210.submsgtype0x8d.SubMsgType0x8d.LikeFeeds;
import tencent.im.s2c.msgtype0x210.submsgtype0x8d.SubMsgType0x8d.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x8d.SubMsgType0x8d.NotifyBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x8d.SubMsgType0x8d.PublishFeeds;
import tencent.im.s2c.msgtype0x210.submsgtype0x8d.SubMsgType0x8d.RedSpotNotifyBody;

public class ReadInJoyHandler
  extends BusinessHandler
{
  public static final int a = 1;
  public static final String a;
  Handler jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
  ReadInJoyRemoteCommand jdField_a_of_type_CooperationReadinjoyReadInJoyRemoteCommand = null;
  private ExecutorService jdField_a_of_type_JavaUtilConcurrentExecutorService = Executors.newSingleThreadExecutor();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = ReadInJoyHandler.class.getSimpleName();
  }
  
  public ReadInJoyHandler(QQAppInterface paramQQAppInterface)
  {
    super(paramQQAppInterface);
  }
  
  private String a(SubMsgType0x8d.RedSpotNotifyBody paramRedSpotNotifyBody)
  {
    if (paramRedSpotNotifyBody == null) {}
    while ((!bytes_guide_wording.has()) || (bytes_guide_wording.get() == null)) {
      return null;
    }
    return bytes_guide_wording.get().toStringUtf8();
  }
  
  private List a(List paramList)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      return null;
    }
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    if (paramList.hasNext())
    {
      Object localObject = (SubMsgType0x8d.NotifyBody)paramList.next();
      ReadInJoyFeedsMsgRecord localReadInJoyFeedsMsgRecord = new ReadInJoyFeedsMsgRecord();
      if (uint32_push_time.has()) {
        jdField_g_of_type_Int = uint32_push_time.get();
      }
      if (uint32_seq.has()) {
        h = uint32_seq.get();
      }
      if ((msg_publish_feeds.has()) && (msg_publish_feeds.get() != null))
      {
        i = 10;
        localObject = (SubMsgType0x8d.PublishFeeds)msg_publish_feeds.get();
        if (uint64_feeds_owner.has()) {
          jdField_a_of_type_Long = uint64_feeds_owner.get();
        }
        if (uint64_feeds_id.has()) {
          jdField_b_of_type_Long = uint64_feeds_id.get();
        }
      }
      for (;;)
      {
        jdField_g_of_type_Long = NetConnInfoCenter.getServerTime();
        localArrayList.add(localReadInJoyFeedsMsgRecord);
        break;
        if ((msg_comment_feeds.has()) && (msg_comment_feeds.get() != null))
        {
          i = 11;
          localObject = (SubMsgType0x8d.CommentFeeds)msg_comment_feeds.get();
          if (uint64_feeds_owner.has()) {
            jdField_a_of_type_Long = uint64_feeds_owner.get();
          }
          if (uint64_feeds_id.has()) {
            jdField_b_of_type_Long = uint64_feeds_id.get();
          }
          if (uint64_comment_uin.has()) {
            jdField_c_of_type_Long = uint64_comment_uin.get();
          }
          if (bytes_comment_id.has()) {
            jdField_b_of_type_JavaLangString = bytes_comment_id.get().toStringUtf8();
          }
          if (uint64_reply_uin.has()) {
            jdField_d_of_type_Long = uint64_reply_uin.get();
          }
          if (bytes_reply_id.has()) {
            jdField_c_of_type_JavaLangString = bytes_reply_id.get().toStringUtf8();
          }
          if (bytes_comment_info.has()) {
            jdField_d_of_type_JavaLangString = bytes_comment_info.get().toStringUtf8();
          }
          if (bytes_feeds_subject.has()) {
            jdField_a_of_type_JavaLangString = bytes_feeds_subject.get().toStringUtf8();
          }
        }
        else if ((msg_like_feeds.has()) && (msg_like_feeds.get() != null))
        {
          i = 12;
          localObject = (SubMsgType0x8d.LikeFeeds)msg_like_feeds.get();
          if (uint64_feeds_owner.has()) {
            jdField_a_of_type_Long = uint64_feeds_owner.get();
          }
          if (uint64_feeds_id.has()) {
            jdField_b_of_type_Long = uint64_feeds_id.get();
          }
          if (uint64_like_uin.has()) {
            e = uint64_like_uin.get();
          }
          if (bytes_feeds_subject.has()) {
            jdField_a_of_type_JavaLangString = bytes_feeds_subject.get().toStringUtf8();
          }
        }
        else if ((msg_delete_feeds.has()) && (msg_delete_feeds.get() != null))
        {
          i = 13;
          localObject = (SubMsgType0x8d.DeleteFeeds)msg_delete_feeds.get();
          if (uint64_feeds_owner.has()) {
            jdField_a_of_type_Long = uint64_feeds_owner.get();
          }
          if (uint64_feeds_id.has()) {
            jdField_b_of_type_Long = uint64_feeds_id.get();
          }
          if (uint64_delete_uin.has()) {
            f = uint64_delete_uin.get();
          }
        }
        else if ((msg_delete_comment.has()) && (msg_delete_comment.get() != null))
        {
          i = 14;
          localObject = (SubMsgType0x8d.DeleteComment)msg_delete_comment.get();
          if (uint64_feeds_owner.has()) {
            jdField_a_of_type_Long = uint64_feeds_owner.get();
          }
          if (uint64_feeds_id.has()) {
            jdField_b_of_type_Long = uint64_feeds_id.get();
          }
          if (uint64_comment_uin.has()) {
            jdField_c_of_type_Long = uint64_comment_uin.get();
          }
          if (bytes_comment_id.has()) {
            jdField_b_of_type_JavaLangString = bytes_comment_id.get().toStringUtf8();
          }
          if (uint64_reply_uin.has()) {
            jdField_d_of_type_Long = uint64_reply_uin.get();
          }
          if (bytes_reply_id.has()) {
            jdField_c_of_type_JavaLangString = bytes_reply_id.get().toStringUtf8();
          }
          if (uint64_delete_uin.has()) {
            f = uint64_delete_uin.get();
          }
        }
      }
    }
    return localArrayList;
  }
  
  private List a(SubMsgType0x8d.RedSpotNotifyBody paramRedSpotNotifyBody)
  {
    if (paramRedSpotNotifyBody == null) {}
    while ((!rpt_new_channel_list.has()) || (rpt_new_channel_list.get() == null)) {
      return null;
    }
    ArrayList localArrayList = new ArrayList(10);
    paramRedSpotNotifyBody = rpt_new_channel_list.get().iterator();
    while (paramRedSpotNotifyBody.hasNext()) {
      localArrayList.add(Integer.valueOf((int)((Long)paramRedSpotNotifyBody.next()).longValue()));
    }
    return localArrayList;
  }
  
  private void a(SubMsgType0x8d.RedSpotNotifyBody paramRedSpotNotifyBody)
  {
    if ((!msg_channel_notify.has()) || (msg_channel_notify.get() == null)) {
      return;
    }
    long l = 0L;
    Object localObject1 = "推荐";
    Object localObject2 = "";
    ArrayList localArrayList = new ArrayList();
    SubMsgType0x8d.ChannelNotify localChannelNotify = (SubMsgType0x8d.ChannelNotify)msg_channel_notify.get();
    if (uint64_channel_id.has()) {
      l = uint64_channel_id.get();
    }
    paramRedSpotNotifyBody = (SubMsgType0x8d.RedSpotNotifyBody)localObject1;
    if (bytes_channel_name.has())
    {
      paramRedSpotNotifyBody = (SubMsgType0x8d.RedSpotNotifyBody)localObject1;
      if (bytes_channel_name.get() != null) {
        paramRedSpotNotifyBody = bytes_channel_name.get().toStringUtf8();
      }
    }
    localObject1 = localObject2;
    if (bytes_wording.has())
    {
      localObject1 = localObject2;
      if (bytes_wording.get() != null) {
        localObject1 = bytes_wording.get().toStringUtf8();
      }
    }
    if ((rpt_top_article_id_list.has()) && (rpt_top_article_id_list.get() != null))
    {
      localObject2 = rpt_top_article_id_list.get().iterator();
      while (((Iterator)localObject2).hasNext()) {
        localArrayList.add(Long.valueOf(((Long)((Iterator)localObject2).next()).longValue()));
      }
    }
    ((ReadInJoyManager)b.getManager(95)).a(l, paramRedSpotNotifyBody, (String)localObject1, localArrayList);
  }
  
  protected Class a()
  {
    return ReadInJoyObserver.class;
  }
  
  public void a()
  {
    if (jdField_a_of_type_CooperationReadinjoyReadInJoyRemoteCommand == null)
    {
      jdField_a_of_type_CooperationReadinjoyReadInJoyRemoteCommand = new ReadInJoyRemoteCommand(b);
      jdField_a_of_type_CooperationReadinjoyReadInJoyRemoteCommand.a();
      return;
    }
    jdField_a_of_type_CooperationReadinjoyReadInJoyRemoteCommand.a(b);
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject) {}
  
  public void a(boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "readInJoyFeedsMsgNotify, isSuccess=" + paramBoolean1 + ",isNewMsgCome=" + paramBoolean2 + ",reason=" + paramInt);
    }
    a(1, paramBoolean1, new Object[] { Boolean.valueOf(paramBoolean2), Integer.valueOf(paramInt) });
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "handleOnlinePushReadInJoyFeedsMsg");
    }
    if (!ReadInJoyHelper.a()) {}
    do
    {
      for (;;)
      {
        return;
        if (paramArrayOfByte != null)
        {
          Object localObject = new SubMsgType0x8d.MsgBody();
          try
          {
            ((SubMsgType0x8d.MsgBody)localObject).mergeFrom(paramArrayOfByte);
            paramArrayOfByte = (ReadInJoyManager)b.getManager(95);
            if ((rpt_msg_notify_infos.has()) && (rpt_msg_notify_infos.get() != null)) {
              paramArrayOfByte.a(a(rpt_msg_notify_infos.get()));
            }
            if ((red_spot_notify_body.has()) && (red_spot_notify_body.get() != null))
            {
              localObject = (SubMsgType0x8d.RedSpotNotifyBody)red_spot_notify_body.get();
              paramArrayOfByte.b(a((SubMsgType0x8d.RedSpotNotifyBody)localObject));
              paramArrayOfByte.a(a((SubMsgType0x8d.RedSpotNotifyBody)localObject));
              a((SubMsgType0x8d.RedSpotNotifyBody)localObject);
              return;
            }
          }
          catch (InvalidProtocolBufferMicroException paramArrayOfByte) {}
        }
      }
    } while (!QLog.isColorLevel());
    QLog.e(jdField_a_of_type_JavaLangString, 2, "handleOnlinePushReadInJoyFeedsMsg, parse error, exception: " + paramArrayOfByte.getMessage());
  }
  
  protected boolean a(String paramString)
  {
    if (jdField_a_of_type_JavaUtilSet == null) {
      jdField_a_of_type_JavaUtilSet = new HashSet();
    }
    return !jdField_a_of_type_JavaUtilSet.contains(paramString);
  }
  
  public void b()
  {
    if (jdField_a_of_type_CooperationReadinjoyReadInJoyRemoteCommand != null)
    {
      jdField_a_of_type_CooperationReadinjoyReadInJoyRemoteCommand.b();
      jdField_a_of_type_CooperationReadinjoyReadInJoyRemoteCommand = null;
    }
  }
  
  public void g()
  {
    b();
    super.g();
  }
}
