package com.tencent.mobileqq.activity.aio.photo;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.photo.StatisticConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.pic.PicBusiManager;
import com.tencent.mobileqq.pic.PicPreDownloader;
import com.tencent.mobileqq.pic.PicReq;
import com.tencent.mobileqq.pic.PicStatisticsManager;
import com.tencent.mobileqq.pic.PreDownloadStrategyBeta;
import com.tencent.mobileqq.shortvideo.ShortVideoBusiManager;
import com.tencent.mobileqq.shortvideo.ShortVideoDownloadInfo;
import com.tencent.mobileqq.shortvideo.ShortVideoReq;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.BaseDownloadProcessor;
import com.tencent.mobileqq.transfile.C2CPicDownloadProcessor;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qqfav.QfavBuilder;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import lee;
import lef;
import leg;
import leh;
import lei;
import mqq.app.AccountNotMatchException;
import mqq.app.AppRuntime;
import mqq.os.MqqHandler;

public class AIOImageProviderService
  extends IAIOImageProvider.Stub
{
  static final String a = "AIOImageProviderService";
  public int a;
  public final long a;
  public List a;
  public final boolean a;
  public String b;
  public String c;
  
  public AIOImageProviderService(String paramString1, String paramString2, int paramInt, ChatMessage paramChatMessage)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = paramString1;
    c = paramString2;
    jdField_a_of_type_Int = paramInt;
    paramString1 = new ArrayList(1);
    paramString1.add(paramChatMessage);
    jdField_a_of_type_Boolean = isMultiMsg;
    jdField_a_of_type_Long = msgseq;
    jdField_a_of_type_JavaUtilList = paramString1;
  }
  
  public Intent a(long paramLong, int paramInt)
  {
    try
    {
      Object localObject2 = jdField_a_of_type_JavaUtilList.iterator();
      while (((Iterator)localObject2).hasNext())
      {
        Object localObject1 = (ChatMessage)((Iterator)localObject2).next();
        if (MessageForPic.class.isInstance(localObject1))
        {
          MessageForPic localMessageForPic = (MessageForPic)localObject1;
          if ((uniseq == paramLong) && (subMsgId == paramInt))
          {
            localObject2 = (QQAppInterface)BaseApplicationImpl.a.getAppRuntime(b);
            localObject1 = QfavBuilder.a((Entity)localObject1).b((QQAppInterface)localObject2, (MessageRecord)localObject1).a();
            return localObject1;
          }
        }
      }
    }
    catch (AccountNotMatchException localAccountNotMatchException)
    {
      throw new IllegalArgumentException("no appRuntime", localAccountNotMatchException);
    }
    throw new IllegalArgumentException("message not find..");
  }
  
  public Intent a(long paramLong, int paramInt1, int paramInt2)
  {
    Object localObject1 = jdField_a_of_type_JavaUtilList.iterator();
    while (((Iterator)localObject1).hasNext())
    {
      Object localObject2 = (ChatMessage)((Iterator)localObject1).next();
      if (MessageForPic.class.isInstance(localObject2))
      {
        localObject2 = (MessageForPic)localObject2;
        if ((uniseq != paramLong) || (subMsgId != paramInt1)) {
          break;
        }
      }
      else if (MessageForShortVideo.class.isInstance(localObject2))
      {
        localObject2 = (MessageForShortVideo)localObject2;
        if (uniseq == paramLong)
        {
          localObject1 = a((MessageForShortVideo)localObject2);
          if (localObject1 != null) {
            ((Intent)localObject1).putExtra("from_uin_type", paramInt2);
          }
          return localObject1;
        }
      }
    }
    return null;
  }
  
  public Intent a(MessageForShortVideo paramMessageForShortVideo)
  {
    if (TextUtils.isEmpty(md5))
    {
      if (QLog.isColorLevel()) {
        QLog.d("AIOImageProviderService", 2, "Forward menu clicked, md5 is empty.");
      }
      return null;
    }
    Bundle localBundle = new Bundle();
    localBundle.putInt("forward_type", 21);
    String str1 = ShortVideoUtils.a(thumbMD5, "jpg");
    localBundle.putString("forward_thumb", str1);
    localBundle.putString("from_uin", ShortVideoUtils.c(paramMessageForShortVideo));
    localBundle.putInt("from_busi_type", busiType);
    localBundle.putInt("file_send_size", videoFileSize);
    localBundle.putInt("file_send_duration", videoFileTime);
    localBundle.putString("file_name", videoFileName);
    localBundle.putInt("file_format", videoFileFormat);
    String str2 = ShortVideoUtils.b(paramMessageForShortVideo);
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageProviderService", 2, "Forward menu clicked, videoPath=" + str2 + ",videoPath = " + str2 + ", " + paramMessageForShortVideo.toLogString());
    }
    localBundle.putString("file_send_path", str2);
    localBundle.putString("thumbfile_send_path", str1);
    localBundle.putString("file_shortvideo_md5", md5);
    localBundle.putInt("thumbfile_send_width", thumbWidth);
    localBundle.putInt("thumbfile_send_height", thumbHeight);
    localBundle.putString("thumbfile_md5", thumbMD5);
    localBundle.putString("file_source", fileSource);
    localBundle.putString("file_uuid", uuid);
    localBundle.putInt("file_thumb_Size", thumbFileSize);
    return new Intent().putExtras(localBundle);
  }
  
  public void a()
  {
    super.a();
    jdField_a_of_type_JavaUtilList = null;
    b = null;
    c = null;
    jdField_a_of_type_Int = 0;
  }
  
  public void a(long paramLong)
  {
    ThreadManager.a().post(new leh(this, paramLong));
  }
  
  public void a(long paramLong, int paramInt)
  {
    ThreadManager.a().post(new leg(this, paramLong, paramInt));
  }
  
  public void a(long paramLong, int paramInt1, int paramInt2)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (ChatMessage)localIterator.next();
      if (MessageForPic.class.isInstance(localObject))
      {
        localObject = (MessageForPic)localObject;
        if ((uniseq == paramLong) && (subMsgId == paramInt1)) {
          a((MessageForPic)localObject, paramLong, paramInt1, paramInt2);
        }
      }
      else if (MessageForShortVideo.class.isInstance(localObject))
      {
        localObject = (MessageForShortVideo)localObject;
        if (uniseq == paramLong) {
          a((MessageForShortVideo)localObject, paramLong, paramInt1, paramInt2);
        }
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, MessageForPic paramMessageForPic)
  {
    if ((paramQQAppInterface == null) || (paramMessageForPic == null)) {
      return;
    }
    ((PicStatisticsManager)paramQQAppInterface.getManager(72)).d(paramMessageForPic);
    paramQQAppInterface = paramQQAppInterface.a();
    a.b(paramMessageForPic, size);
    paramQQAppInterface.e();
  }
  
  public void a(MessageForPic paramMessageForPic, long paramLong, int paramInt1, int paramInt2)
  {
    PicReq localPicReq;
    int i;
    switch (paramInt2)
    {
    case 3: 
    default: 
      return;
    case 2: 
      localPicReq = PicBusiManager.a(6, 1536, 1);
      i = 1;
    }
    for (;;)
    {
      try
      {
        localPicReq.a(paramMessageForPic, paramMessageForPic.getPicDownloadInfo());
        String str = AbsDownloader.d(URLDrawableHelper.a(paramMessageForPic, i, null).toString().toString());
        localPicReq.a(new lee(this, paramLong, paramInt1, paramInt2, size, str));
        PicBusiManager.a(localPicReq, (QQAppInterface)BaseApplicationImpl.a.getAppRuntime(b));
        return;
      }
      catch (AccountNotMatchException paramMessageForPic) {}
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("AIOImageProviderService", 2, "no appRuntime");
      return;
      localPicReq = PicBusiManager.a(7, 1);
      i = 131075;
      continue;
      localPicReq = PicBusiManager.a(5, 1);
      i = 65537;
    }
  }
  
  public void a(MessageForShortVideo paramMessageForShortVideo, long paramLong, int paramInt1, int paramInt2)
  {
    try
    {
      ShortVideoReq localShortVideoReq = ShortVideoBusiManager.a(2, 2);
      ShortVideoDownloadInfo localShortVideoDownloadInfo = paramMessageForShortVideo.getDownloadInfo(g);
      if (paramInt2 == 0)
      {
        i = ShortVideoUtils.a(thumbMD5, "jpg");
        localShortVideoDownloadInfo.a(istroop, 1);
      }
      for (;;)
      {
        localShortVideoReq.a(localShortVideoDownloadInfo);
        localShortVideoReq.a(new lef(this, paramLong, paramInt1, paramInt2));
        ShortVideoBusiManager.a(localShortVideoReq, (QQAppInterface)BaseApplicationImpl.a.getAppRuntime(b));
        return;
        h = ShortVideoUtils.a(paramMessageForShortVideo, "mp4");
        localShortVideoDownloadInfo.a(istroop, 0);
      }
      return;
    }
    catch (AccountNotMatchException paramMessageForShortVideo)
    {
      if (QLog.isColorLevel()) {
        QLog.d("AIOImageProviderService", 2, "no appRuntime");
      }
    }
  }
  
  public void a(String paramString, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageProviderService", 2, "reportData,sendReportType:" + paramString + ",count:" + paramInt);
    }
    try
    {
      AppRuntime localAppRuntime = BaseApplicationImpl.a.getAppRuntime(b);
      if (paramInt == 55)
      {
        StatisticConstants.a(paramString, jdField_a_of_type_Int, (QQAppInterface)localAppRuntime);
        return;
      }
      StatisticCollector.a(BaseApplication.getContext()).a(localAppRuntime, b, "Pic", paramString, 0, 1, null, String.valueOf(paramInt), null, null, null);
      return;
    }
    catch (AccountNotMatchException paramString)
    {
      throw new IllegalArgumentException("no appRuntime", paramString);
    }
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProviderCallBack == null) {
      return;
    }
    ThreadManager.a().post(new lei(this));
  }
  
  public void b(long paramLong, int paramInt1, int paramInt2)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (ChatMessage)localIterator.next();
      if (MessageForPic.class.isInstance(localObject))
      {
        localObject = (MessageForPic)localObject;
        if ((uniseq == paramLong) && (subMsgId == paramInt1)) {
          b((MessageForPic)localObject, paramLong, paramInt1, paramInt2);
        }
      }
      else if (MessageForShortVideo.class.isInstance(localObject))
      {
        localObject = (MessageForShortVideo)localObject;
        if (uniseq == paramLong) {
          b((MessageForShortVideo)localObject, paramLong, paramInt1, paramInt2);
        }
      }
    }
  }
  
  public void b(MessageForPic paramMessageForPic, long paramLong, int paramInt1, int paramInt2)
  {
    try
    {
      paramMessageForPic = ((QQAppInterface)BaseApplicationImpl.a.getAppRuntime(b)).a().a(TransFileController.a(md5, uuid, 131075));
      if ((paramMessageForPic instanceof C2CPicDownloadProcessor))
      {
        if (QLog.isColorLevel()) {
          QLog.d("AIOImageProviderService", 2, "destroy cancel processor:" + paramMessageForPic);
        }
        ((BaseDownloadProcessor)paramMessageForPic).b();
      }
      return;
    }
    catch (AccountNotMatchException paramMessageForPic)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("AIOImageProviderService", 2, "no appRuntime");
    }
  }
  
  public void b(MessageForShortVideo paramMessageForShortVideo, long paramLong, int paramInt1, int paramInt2) {}
}
