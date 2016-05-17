package com.tencent.mobileqq.activity.aio;

import android.os.Looper;
import android.os.Message;
import android.view.View;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.openapi.OpenApiManager;
import com.tencent.mobileqq.transfile.BuddyTransfileProcessor;
import com.tencent.mobileqq.transfile.C2CPicDownloadProcessor;
import com.tencent.mobileqq.transfile.C2CPicUploadProcessor;
import com.tencent.mobileqq.transfile.C2CPttDownloadProcessor;
import com.tencent.mobileqq.transfile.C2CPttUploadProcessor;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.transfile.ForwardImageProcessor;
import com.tencent.mobileqq.transfile.GroupPicDownloadProcessor;
import com.tencent.mobileqq.transfile.GroupPicUploadProcessor;
import com.tencent.mobileqq.transfile.GroupPttDownloadProcessor;
import com.tencent.mobileqq.transfile.LbsTransfileProcessor;
import com.tencent.mobileqq.transfile.PAAudioPttDownloadProcessor;
import com.tencent.mobileqq.transfile.ShortVideoDownloadProcessor;
import com.tencent.mobileqq.transfile.ShortVideoForwardProcessor;
import com.tencent.mobileqq.transfile.ShortVideoUploadProcessor;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.transfile.TransProcessorHandler;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import kqf;
import kqg;
import mqq.manager.Manager;

public class FileTransferManager
  implements Manager
{
  public static final String a = "FileTransferManager";
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private final TransProcessorHandler jdField_a_of_type_ComTencentMobileqqTransfileTransProcessorHandler;
  private final ArrayList jdField_a_of_type_JavaUtilArrayList;
  
  public FileTransferManager(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqTransfileTransProcessorHandler = new kqf(this, Looper.getMainLooper());
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqTransfileTransProcessorHandler.a(new Class[] { LbsTransfileProcessor.class, BuddyTransfileProcessor.class, C2CPicUploadProcessor.class, C2CPttDownloadProcessor.class, C2CPttUploadProcessor.class, GroupPicUploadProcessor.class, GroupPttDownloadProcessor.class, C2CPicDownloadProcessor.class, GroupPicDownloadProcessor.class, ForwardImageProcessor.class, ShortVideoUploadProcessor.class, ShortVideoDownloadProcessor.class, ShortVideoForwardProcessor.class, PAAudioPttDownloadProcessor.class });
    a(paramQQAppInterface);
  }
  
  public static FileTransferManager a(QQAppInterface paramQQAppInterface)
  {
    return (FileTransferManager)paramQQAppInterface.getManager(22);
  }
  
  private void a(QQAppInterface paramQQAppInterface)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == paramQQAppInterface) {
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      a();
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    paramQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqTransfileTransProcessorHandler);
  }
  
  public void a()
  {
    jdField_a_of_type_JavaUtilArrayList.clear();
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(jdField_a_of_type_ComTencentMobileqqTransfileTransProcessorHandler);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    }
  }
  
  public void a(Message paramMessage)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FileTransferManager", 2, "handleMessage" + obj).c + " status " + what + "retCode " + arg1);
    }
    int i = 0;
    if (i < jdField_a_of_type_JavaUtilArrayList.size())
    {
      Object localObject = (kqg)jdField_a_of_type_JavaUtilArrayList.get(i);
      View localView = ((kqg)localObject).a();
      localObject = ((kqg)localObject).a();
      if ((localView != null) && (localObject != null)) {
        ((FileTransferManager.Callback)localObject).a(localView, (FileMsg)obj, what, arg1);
      }
      for (;;)
      {
        i += 1;
        break;
        jdField_a_of_type_JavaUtilArrayList.remove(i);
        i -= 1;
      }
    }
    OpenApiManager.a().a((FileMsg)obj, what, arg1);
  }
  
  public void a(View paramView, FileTransferManager.Callback paramCallback)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext())
    {
      kqg localKqg = (kqg)localIterator.next();
      if (localKqg.a() == paramView)
      {
        b = new WeakReference(paramCallback);
        return;
      }
    }
    jdField_a_of_type_JavaUtilArrayList.add(new kqg(this, paramView, paramCallback));
  }
  
  public void b()
  {
    if (jdField_a_of_type_JavaUtilArrayList != null) {
      jdField_a_of_type_JavaUtilArrayList.clear();
    }
  }
  
  public void onDestroy()
  {
    a();
  }
}
