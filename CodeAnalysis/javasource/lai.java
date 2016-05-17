import android.app.Dialog;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.ShortVideoItemBuilder;
import com.tencent.mobileqq.activity.photo.StatisticConstants;
import com.tencent.mobileqq.activity.shortvideo.ProgressiveUtils;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.ShortVideoBusiManager;
import com.tencent.mobileqq.shortvideo.ShortVideoReq;
import com.tencent.mobileqq.shortvideo.ShortVideoUploadInfo;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.shortvideo.mediacodec.ShortVideoCodec;
import com.tencent.mobileqq.shortvideo.util.ShortVideoTrimmer;
import com.tencent.mobileqq.shortvideo.util.ShortVideoTrimmer.CompressConfig;
import com.tencent.mobileqq.shortvideo.util.videoconverter.VideoConverter;
import com.tencent.mobileqq.shortvideo.util.videoconverter.VideoConverter.Processor;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

public class lai
  extends AsyncTask
{
  long jdField_a_of_type_Long;
  SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  MessageForShortVideo jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo;
  String jdField_a_of_type_JavaLangString;
  WeakReference jdField_a_of_type_JavaLangRefWeakReference;
  String jdField_b_of_type_JavaLangString;
  WeakReference jdField_b_of_type_JavaLangRefWeakReference;
  String c;
  
  public lai(QQAppInterface paramQQAppInterface, Context paramContext, SessionInfo paramSessionInfo, MessageForShortVideo paramMessageForShortVideo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_JavaLangRefWeakReference = new WeakReference(paramQQAppInterface);
    jdField_a_of_type_JavaLangRefWeakReference = new WeakReference(paramContext);
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo = paramMessageForShortVideo;
    videoFileStatus = 998;
    paramMessageForShortVideo.serial();
    paramQQAppInterface.a().a(frienduin, istroop, uniseq, msgData);
  }
  
  protected Integer a(Void... paramVarArgs)
  {
    if ((jdField_a_of_type_JavaLangRefWeakReference == null) || (jdField_a_of_type_JavaLangRefWeakReference.get() == null) || (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo == null)) {
      return Integer.valueOf(7);
    }
    if (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.md5 != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: Md5 not null, Compressed has been done, uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
      }
      return Integer.valueOf(5);
    }
    if ((TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileName)) || (!FileUtils.b(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileName)))
    {
      if (QLog.isColorLevel()) {
        QLog.e("ShortVideoItemBuilder", 2, "CompressTask, step: before compress, msg.videoFileName file not exists!! videoFileName=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileName);
      }
      return Integer.valueOf(3);
    }
    c = jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileName;
    paramVarArgs = jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileName;
    String str = ShortVideoUtils.b(paramVarArgs, "mp4");
    if (str == null) {
      return Integer.valueOf(5);
    }
    long l1;
    long l2;
    int i;
    boolean bool1;
    if (FileUtils.b(str))
    {
      jdField_b_of_type_JavaLangString = str;
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: Compressed file has exists, videoPath:" + str + ", uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
      }
      l1 = new File(paramVarArgs).length();
      l2 = new File(jdField_b_of_type_JavaLangString).length();
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoItemBuilder", 2, "CompressTask，step: ShortVideoTrimmer Over fileSourceSize=" + l1 + ", fileTargetSize=" + l2 + ", uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq + ", videoInput=" + paramVarArgs + ", mVideoPath=" + jdField_b_of_type_JavaLangString);
      }
      if (l2 > l1) {
        jdField_b_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileName;
      }
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: after compress, mVideoPath = " + jdField_b_of_type_JavaLangString + ", videoInput = " + paramVarArgs + ", uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
      }
      if ((TextUtils.isEmpty(jdField_b_of_type_JavaLangString)) || (!FileUtils.b(jdField_b_of_type_JavaLangString)))
      {
        if (QLog.isColorLevel()) {
          QLog.e("ShortVideoItemBuilder", 2, "CompressTask, step: after compress, mVideoPath not exists!!, path = " + jdField_b_of_type_JavaLangString + ", uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
        }
        return Integer.valueOf(3);
      }
    }
    else
    {
      l1 = System.currentTimeMillis();
      if (ShortVideoTrimmer.a((Context)jdField_a_of_type_JavaLangRefWeakReference.get(), 0, 0))
      {
        Object localObject = ShortVideoTrimmer.a(paramVarArgs);
        if ((localObject == null) || (!jdField_a_of_type_Boolean)) {
          break label1285;
        }
        if (Build.VERSION.SDK_INT >= 18)
        {
          i = ShortVideoCodec.b((Context)jdField_a_of_type_JavaLangRefWeakReference.get());
          if (((i & 0x1) > 0) && ((i & 0x2) > 0))
          {
            bool1 = true;
            label585:
            if (QLog.isColorLevel()) {
              QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: isHWCodecSupported = " + bool1);
            }
            if (!bool1) {
              break label917;
            }
            if (QLog.isColorLevel()) {
              QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: Try to compress using MediaCodec");
            }
            File localFile = new File(paramVarArgs);
            localObject = new lal(this, str, (int)(b * 1024L), (int)jdField_a_of_type_Long);
            if ((!new VideoConverter().a(localFile, (VideoConverter.Processor)localObject, true)) || (a != null)) {
              break label903;
            }
            if (QLog.isColorLevel()) {
              QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: compress completed using MediaCodec");
            }
            i = 0;
            label716:
            j = i;
            if (i != 0) {
              if (QLog.isColorLevel()) {
                QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: Try to compress using ShortVideoTrimmer.compressVideo");
              }
            }
          }
        }
      }
    }
    label771:
    label903:
    label917:
    label936:
    label1285:
    for (int j = ShortVideoTrimmer.a((Context)jdField_a_of_type_JavaLangRefWeakReference.get(), paramVarArgs, str);; j = -1)
    {
      l1 = System.currentTimeMillis() - l1;
      long l3;
      if (j == 0)
      {
        jdField_b_of_type_JavaLangString = str;
        l2 = new File(paramVarArgs).length();
        l3 = new File(jdField_b_of_type_JavaLangString).length();
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoItemBuilder", 2, "CompressTask，step: ShortVideoTrimmer compress ret = " + j + ", cost:" + l1 + "ms, fileSourceSize=" + l2 + ", fileTargetSize=" + l3 + ", uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
        }
        if (j != 0) {
          break label936;
        }
      }
      for (bool1 = true;; bool1 = false)
      {
        StatisticConstants.a(bool1, l1, l2, l3);
        break;
        bool1 = false;
        break label585;
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: compress failed using MediaCodecr");
        }
        i = -1;
        break label716;
        jdField_b_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileName;
        break label771;
      }
      jdField_b_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.videoFileName;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e("ShortVideoItemBuilder", 2, "CompressTask，step: ShortVideoTrimmer init failure, ignore compress, uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
      break;
      paramVarArgs = new File(jdField_b_of_type_JavaLangString);
      if (ShortVideoUtils.a(paramVarArgs))
      {
        if (QLog.isColorLevel()) {
          QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: supportProgressive, uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
        }
        jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.supportProgressive = true;
      }
      for (;;)
      {
        jdField_a_of_type_Long = paramVarArgs.length();
        try
        {
          jdField_a_of_type_JavaLangString = HexUtil.a(MD5.toMD5Byte(new FileInputStream(paramVarArgs), jdField_a_of_type_Long));
          if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString))
          {
            if (QLog.isColorLevel()) {
              QLog.e("ShortVideoItemBuilder", 2, "CompressTask, step: after compress, mVideoMd5 is empty!!, uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
            }
            return Integer.valueOf(5);
            bool1 = false;
            boolean bool2 = ProgressiveUtils.a.get();
            if (bool2) {
              bool1 = ShortVideoUtils.a(jdField_b_of_type_JavaLangString);
            }
            if (QLog.isColorLevel()) {
              QLog.d("ShortVideoItemBuilder", 2, "CompressTask, step: not supportProgressive => moveMoovAtom, result = " + bool1 + ", uniseq=" + jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq + ", enableProgressive = " + bool2);
            }
            if (bool1)
            {
              jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.supportProgressive = true;
              continue;
            }
            jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.supportProgressive = false;
          }
        }
        catch (FileNotFoundException paramVarArgs)
        {
          for (;;)
          {
            paramVarArgs.printStackTrace();
          }
        }
        catch (Exception paramVarArgs)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("ShortVideoItemBuilder", 2, "", paramVarArgs);
            }
          }
        }
      }
      return Integer.valueOf(1);
    }
  }
  
  protected void a(Integer paramInteger)
  {
    super.onPostExecute(paramInteger);
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoItemBuilder", 2, "CompressTask onPostExecute(): result = " + paramInteger);
    }
    switch (paramInteger.intValue())
    {
    default: 
      if ((jdField_a_of_type_JavaLangRefWeakReference == null) || (jdField_a_of_type_JavaLangRefWeakReference.get() == null)) {
        break;
      }
    }
    label115:
    label460:
    do
    {
      Object localObject1;
      do
      {
        do
        {
          do
          {
            QQToast.a((Context)jdField_a_of_type_JavaLangRefWeakReference.get(), "For test, Compress failure,result=" + paramInteger, 0).a();
            break label115;
            break label115;
            do
            {
              return;
            } while (jdField_b_of_type_JavaLangRefWeakReference == null);
            paramInteger = (QQAppInterface)jdField_b_of_type_JavaLangRefWeakReference.get();
            if (paramInteger == null) {
              break label460;
            }
            localObject1 = jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo;
            if (jdField_a_of_type_Long < 28835840L) {
              break;
            }
            videoFileStatus = 1005;
            ((MessageForShortVideo)localObject1).serial();
            paramInteger.a().a(frienduin, istroop, uniseq, msgData);
          } while ((jdField_a_of_type_JavaLangRefWeakReference == null) || (jdField_a_of_type_JavaLangRefWeakReference.get() == null));
          localObject1 = (Context)jdField_a_of_type_JavaLangRefWeakReference.get();
        } while (!(localObject1 instanceof BaseActivity));
        localObject2 = (BaseActivity)localObject1;
        paramInteger = DialogUtil.a((Context)localObject1, 232, null, ((Context)localObject1).getString(2131371176), new laj(this, paramInteger, (BaseActivity)localObject2), new lak(this, paramInteger));
        try
        {
          paramInteger.show();
          return;
        }
        catch (Exception paramInteger)
        {
          return;
        }
        if ((ShortVideoItemBuilder.a == null) || (ShortVideoItemBuilder.a.get() != uniseq)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.i("ShortVideoItemBuilder", 2, "CompressTask onPostExecute sRecvMsgSeq==mr.uniseq==" + uniseq + ", just return");
      return;
      md5 = jdField_a_of_type_JavaLangString;
      videoFileSize = ((int)jdField_a_of_type_Long);
      videoFileName = jdField_b_of_type_JavaLangString;
      ((MessageForShortVideo)localObject1).serial();
      paramInteger.a().a(frienduin, istroop, uniseq, msgData);
      Object localObject2 = ShortVideoBusiManager.a(0, 0);
      ShortVideoUploadInfo localShortVideoUploadInfo = ShortVideoBusiManager.a(localObject1, (ShortVideoReq)localObject2);
      i = c;
      b = false;
      ((ShortVideoReq)localObject2).a(localShortVideoUploadInfo);
      ShortVideoBusiManager.a((ShortVideoReq)localObject2, paramInteger);
      ShortVideoItemBuilder.a.set(-1L);
      FileUtils.a(new File(jdField_b_of_type_JavaLangString), new File(ShortVideoUtils.a((MessageForShortVideo)localObject1, "mp4")));
      return;
    } while (!QLog.isColorLevel());
    QLog.i("ShortVideoItemBuilder", 2, "CompressTask onPostExecute QQAppInterface is null...");
  }
  
  protected void onPreExecute()
  {
    super.onPreExecute();
  }
}
