package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView.ScaleType;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.dataline.activities.LiteActivity;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.FileTransferManager.Callback;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.DataLineHandler;
import com.tencent.mobileqq.app.FontSettingManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForFile;
import com.tencent.mobileqq.data.TransFileInfo;
import com.tencent.mobileqq.filemanager.app.FileManagerEngine;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.core.FileManagerRSCenter;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.ForwardFileInfo;
import com.tencent.mobileqq.filemanager.fileviewer.FileBrowserActivity;
import com.tencent.mobileqq.filemanager.fileviewer.TroopFileDetailBrowserActivity;
import com.tencent.mobileqq.filemanager.util.FMDialogUtil;
import com.tencent.mobileqq.filemanager.util.FMToastUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter.fileAssistantReportData;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.filemanager.util.FileUtil;
import com.tencent.mobileqq.filemanager.widget.AsyncImageView;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.forward.ForwardFileOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.TestStructMsg;
import com.tencent.mobileqq.transfile.FileMsg;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import cooperation.qqfav.QfavBuilder;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kvs;
import kvt;
import kvu;
import kvv;
import kvx;
import kvy;

public class FileItemBuilder
  extends BaseBubbleBuilder
  implements FileTransferManager.Callback
{
  private static final String b;
  public Handler a;
  public FileManagerEntity a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_JavaLangString = FileItemBuilder.class.getSimpleName();
  }
  
  public FileItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    jdField_a_of_type_AndroidOsHandler = new Handler();
    jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity = null;
  }
  
  private int a(String paramString1, String paramString2, boolean paramBoolean, long paramLong1, long paramLong2, long paramLong3, long paramLong4, int paramInt)
  {
    int i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong4, paramString1, paramInt, -1L);
    if (i != -1)
    {
      if (QLog.isColorLevel()) {
        QLog.d("chaosli", 2, "getFileTransStatus processor.getFileStatus() " + i);
      }
      return i;
    }
    paramString2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramLong4, paramString1, paramInt);
    if (paramString2 != null)
    {
      if ((cloudType == 1) && (FileManagerUtil.a(paramString2))) {
        status = 16;
      }
      return status;
    }
    paramString2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    paramString1 = (TransFileInfo)paramString2.a(TransFileInfo.class, new String[] { String.valueOf(paramLong3), String.valueOf(paramLong2), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramString1 });
    paramString2.a();
    if (paramString1 == null) {
      return 0;
    }
    status = FileManagerUtil.d(status);
    if (status == 2) {
      status = 0;
    }
    return status;
  }
  
  private long a(long paramLong1, long paramLong2, String paramString1, String paramString2)
  {
    paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    paramString2 = (TransFileInfo)paramString1.a(TransFileInfo.class, new String[] { String.valueOf(paramLong2), String.valueOf(paramLong1), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramString2 });
    paramString1.a();
    if (paramString2 != null) {
      return transferedSize;
    }
    return 0L;
  }
  
  private RelativeLayout a(kvy paramKvy)
  {
    int i = AIOUtils.a(10.0F, jdField_a_of_type_AndroidContentContext.getResources());
    AIOUtils.a(50.0F, jdField_a_of_type_AndroidContentContext.getResources());
    int j = AIOUtils.a(70.0F, jdField_a_of_type_AndroidContentContext.getResources());
    RelativeLayout localRelativeLayout = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
    localRelativeLayout.setId(2131296325);
    Object localObject2 = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
    ((RelativeLayout)localObject2).setId(2131296374);
    ((RelativeLayout)localObject2).setBackgroundResource(2130839789);
    ((RelativeLayout)localObject2).setPadding(AIOUtils.a(12.0F, jdField_a_of_type_AndroidContentContext.getResources()), i, i, AIOUtils.a(7.0F, jdField_a_of_type_AndroidContentContext.getResources()));
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localObject2);
    Object localObject1 = new RelativeLayout.LayoutParams(-1, -2);
    ((RelativeLayout.LayoutParams)localObject1).addRule(10, 2131296325);
    localRelativeLayout.addView((View)localObject2, (ViewGroup.LayoutParams)localObject1);
    localObject1 = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
    ((RelativeLayout)localObject1).setId(2131296375);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, j);
    localLayoutParams.addRule(10, 2131296374);
    ((RelativeLayout)localObject2).addView((View)localObject1, localLayoutParams);
    localObject2 = new AsyncImageView(jdField_a_of_type_AndroidContentContext, j, j);
    ((AsyncImageView)localObject2).setId(2131296376);
    ((AsyncImageView)localObject2).setScaleType(ImageView.ScaleType.CENTER_CROP);
    localLayoutParams = new RelativeLayout.LayoutParams(j, j);
    localLayoutParams.addRule(9, 2131296375);
    localLayoutParams.addRule(15, 2131296375);
    ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams);
    jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView = ((AsyncImageView)localObject2);
    localObject2 = new TextView(jdField_a_of_type_AndroidContentContext);
    ((TextView)localObject2).setId(2131296378);
    ((TextView)localObject2).setGravity(16);
    ((TextView)localObject2).setIncludeFontPadding(false);
    ((TextView)localObject2).setMaxLines(2);
    ((TextView)localObject2).setTextSize(1, 14.0F);
    ((TextView)localObject2).setTextColor(jdField_a_of_type_AndroidContentContext.getResources().getColorStateList(2131428183));
    localLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
    localLayoutParams.addRule(1, 2131296376);
    localLayoutParams.addRule(11, 2131296375);
    localLayoutParams.addRule(10, 2131296375);
    localLayoutParams.setMargins(i, 0, 0, 0);
    ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)localObject2);
    localObject2 = new TextView(jdField_a_of_type_AndroidContentContext);
    ((TextView)localObject2).setId(2131296380);
    ((TextView)localObject2).setSingleLine();
    ((TextView)localObject2).setGravity(5);
    ((TextView)localObject2).setTextColor(Color.parseColor("#777777"));
    ((TextView)localObject2).setTextSize(1, 12.0F);
    localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    localLayoutParams.addRule(11, 2131296375);
    localLayoutParams.addRule(12, 2131296375);
    ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams);
    c = ((TextView)localObject2);
    localObject2 = new TextView(jdField_a_of_type_AndroidContentContext);
    ((TextView)localObject2).setId(2131296379);
    ((TextView)localObject2).setSingleLine();
    if (VersionUtils.e()) {
      ((TextView)localObject2).setAlpha(0.75F);
    }
    ((TextView)localObject2).setGravity(17);
    ((TextView)localObject2).setTextColor(Color.parseColor("#777777"));
    ((TextView)localObject2).setTextSize(1, 12.0F);
    localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    DisplayMetrics localDisplayMetrics = jdField_a_of_type_AndroidContentContext.getResources().getDisplayMetrics();
    if ((FontSettingManager.a() > 17.0F) || (widthPixels <= 500))
    {
      localLayoutParams.addRule(11, 2131296375);
      localLayoutParams.addRule(2, 2131296380);
    }
    for (;;)
    {
      ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams);
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)localObject2);
      return localRelativeLayout;
      localLayoutParams.addRule(5, 2131296378);
      localLayoutParams.addRule(12, 2131296375);
    }
  }
  
  private String a(long paramLong1, long paramLong2, String paramString)
  {
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    paramString = (TransFileInfo)localEntityManager.a(TransFileInfo.class, new String[] { String.valueOf(paramLong2), String.valueOf(paramLong1), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramString });
    localEntityManager.a();
    if (paramString != null) {
      return fileName;
    }
    return "";
  }
  
  private String a(long paramLong1, long paramLong2, String paramString1, String paramString2)
  {
    int i;
    if ((paramString1 == null) && (paramString2 != null))
    {
      paramString2 = a(paramLong1, paramLong2, paramString2);
      if (paramString2 != null)
      {
        i = paramString2.lastIndexOf(".");
        if (i >= 0) {}
      }
    }
    do
    {
      return paramString2;
      return paramString2.substring(0, i);
      if (paramString1 == null) {
        return null;
      }
      i = paramString1.lastIndexOf(File.separator);
      paramString2 = paramString1;
    } while (i < 0);
    String str = "";
    paramString2 = str;
    if (i > 0)
    {
      paramString2 = str;
      if (i + 1 < paramString1.length()) {
        paramString2 = paramString1.substring(i + 1);
      }
    }
    return paramString2;
  }
  
  private String a(String paramString)
  {
    if (paramString == null) {
      localObject = null;
    }
    int i;
    do
    {
      return localObject;
      i = paramString.lastIndexOf(File.separator);
      localObject = paramString;
    } while (i < 0);
    String str = "";
    Object localObject = str;
    if (i > 0)
    {
      localObject = str;
      if (i + 1 < paramString.length()) {
        localObject = paramString.substring(i + 1);
      }
    }
    return localObject;
  }
  
  private void a(Intent paramIntent, String paramString, int paramInt)
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, paramInt);
    if ((localObject == null) || (((List)localObject).size() == 0)) {
      return;
    }
    paramString = new ArrayList();
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      ChatMessage localChatMessage = (ChatMessage)((Iterator)localObject).next();
      if ((msgtype == 63531) || (msgtype == 63522)) {
        paramString.add(String.valueOf(uniseq));
      }
    }
    paramIntent.putStringArrayListExtra("Aio_Uinseq_ImageList", paramString);
  }
  
  private void a(MessageForFile paramMessageForFile)
  {
    if (tempMsg == null) {
      return;
    }
    if (tempMsg.length > 0) {
      url = tempMsg[0].substring(1);
    }
    fileName = a(url);
    fileType = b(url);
    if ((tempMsg.length > 1) && (tempMsg[1] != null) && (Long.valueOf(tempMsg[1]).longValue() > 0L)) {
      fileSize = Long.valueOf(tempMsg[1]).longValue();
    }
    fileSizeString = FileUtil.a(fileSize);
  }
  
  private void a(kvy paramKvy, MessageForFile paramMessageForFile, FileManagerEntity paramFileManagerEntity)
  {
    if (paramFileManagerEntity == null) {
      c.setVisibility(8);
    }
    String str;
    do
    {
      return;
      str = jdField_a_of_type_AndroidContentContext.getString(2131362721);
      switch (status)
      {
      case 2: 
      case 14: 
      case 15: 
      default: 
        c.setVisibility(4);
        return;
      case 0: 
        c.setVisibility(0);
        if (paramMessageForFile.isSend())
        {
          if ((nOpType == 8) || (nOpType == 1) || (nOpType == 5))
          {
            c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362807));
            return;
          }
          c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362811));
          return;
        }
        c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362812));
        return;
      case 16: 
        c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362809));
        return;
      case -1: 
        c.setVisibility(0);
        if (paramMessageForFile.isSend())
        {
          c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362807));
          return;
        }
        c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362808));
        return;
      case 1: 
        c.setVisibility(0);
        if (paramMessageForFile.isSend())
        {
          c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362807));
          return;
        }
        if (paramFileManagerEntity.getCloudType() == 0)
        {
          c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362820));
          return;
        }
        c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362805));
        return;
      case 3: 
        c.setVisibility(0);
        if (!paramMessageForFile.isSend()) {
          break label638;
        }
        if ((nOpType == 8) || (nOpType == 5))
        {
          c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362807));
          return;
        }
        break;
      }
    } while (3 != paramFileManagerEntity.getCloudType());
    c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362806));
    return;
    label638:
    c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362806));
    return;
    c.setVisibility(0);
    c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362808));
    return;
    c.setVisibility(0);
    c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362808));
    return;
    c.setVisibility(0);
    c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362809));
    return;
    c.setVisibility(0);
    c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362809));
    return;
    c.setVisibility(0);
    c.setText(str + jdField_a_of_type_AndroidContentContext.getString(2131362808));
  }
  
  private void a(kvy paramKvy, FileManagerEntity paramFileManagerEntity)
  {
    int j = 1;
    int i;
    if (paramFileManagerEntity != null)
    {
      i = j;
      switch (status)
      {
      }
    }
    label245:
    do
    {
      for (i = 0;; i = j)
      {
        if (i == 0) {
          break label245;
        }
        if (jdField_a_of_type_AndroidWidgetProgressBar == null)
        {
          ProgressBar localProgressBar = new ProgressBar(jdField_a_of_type_AndroidContentContext, null, 16842872);
          localProgressBar.setId(2131296381);
          localProgressBar.setMax(100);
          localProgressBar.setMinimumHeight(AIOUtils.a(4.0F, jdField_a_of_type_AndroidContentContext.getResources()));
          localProgressBar.setProgressDrawable(jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130837558));
          RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, AIOUtils.a(4.0F, jdField_a_of_type_AndroidContentContext.getResources()));
          localLayoutParams.addRule(3, 2131296375);
          localLayoutParams.addRule(12, 2131296374);
          localLayoutParams.setMargins(0, AIOUtils.a(2.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, 0);
          jdField_a_of_type_AndroidWidgetRelativeLayout.addView(localProgressBar, localLayoutParams);
          jdField_a_of_type_AndroidWidgetProgressBar = localProgressBar;
        }
        jdField_a_of_type_AndroidWidgetProgressBar.setProgress((int)(fProgress * 100.0F));
        jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
        return;
        if (9 != nOpType) {
          break;
        }
      }
    } while (jdField_a_of_type_AndroidWidgetProgressBar == null);
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
  }
  
  private String b(String paramString)
  {
    int i = paramString.lastIndexOf(File.separator);
    int j = paramString.lastIndexOf(".");
    String str2 = "";
    String str1 = str2;
    if (i > 0)
    {
      str1 = str2;
      if (j > 0)
      {
        str1 = str2;
        if (j > i)
        {
          str1 = str2;
          if (j + 1 < paramString.length()) {
            str1 = paramString.substring(j + 1);
          }
        }
      }
    }
    return str1;
  }
  
  private void b(MessageForFile paramMessageForFile)
  {
    long l2 = 0L;
    for (;;)
    {
      try
      {
        if ((tempMsg == null) || (tempMsg.length <= 0)) {
          continue;
        }
        localObject1 = tempMsg[0].substring(1);
        url = ((String)localObject1);
        if (url.length() == 0)
        {
          url = a(msgseq, time, frienduin);
          if ((tempMsg != null) && (tempMsg.length > 1)) {
            tempMsg[1] = String.valueOf(a(msgseq, time, "", frienduin));
          }
        }
        fileName = a(msgseq, time, url, frienduin);
        fileType = b(url);
        if ((tempMsg == null) || (tempMsg.length <= 1) || (tempMsg[1] == null) || (Long.valueOf(tempMsg[1]).longValue() <= 0L)) {
          continue;
        }
        fileSize = Long.valueOf(tempMsg[1]).longValue();
      }
      catch (Exception localException)
      {
        Object localObject1;
        QLog.e(jdField_b_of_type_JavaLangString, 1, localException.toString());
        continue;
        long l1 = 0L;
        continue;
        if (tempMsg == null) {
          continue;
        }
        if (tempMsg.length <= 1) {
          continue;
        }
        l1 = Long.valueOf(tempMsg[1]).longValue();
        fileSize = l1;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d(jdField_b_of_type_JavaLangString, 2, "--------->>bindView 2 filePath:" + url + "fileMsgLength:" + tempMsg.length + ", fileSize:" + fileSize);
        continue;
        l1 = 0L;
        continue;
        Object localObject2 = null;
        continue;
      }
      fileSizeString = FileUtil.a(fileSize);
      if (tempMsg != null)
      {
        if (tempMsg.length <= 4) {
          continue;
        }
        localObject1 = tempMsg[4];
        urlAtServer = ((String)localObject1);
      }
      status = a(frienduin, url, paramMessageForFile.isSendFromLocal(), fileSize, msgseq, time, uniseq, istroop);
      return;
      localObject1 = "";
      continue;
      if (!paramMessageForFile.isSendFromLocal()) {
        continue;
      }
      localObject1 = new File(url);
      if (!((File)localObject1).exists()) {
        continue;
      }
      l1 = ((File)localObject1).length();
      fileSize = l1;
      if (QLog.isColorLevel()) {
        QLog.d(jdField_b_of_type_JavaLangString, 2, "--------->>bindView 1 filePath:" + url + ",fileExists:" + ((File)localObject1).exists() + ", fileSize:" + ((File)localObject1).length());
      }
      if ((fileSize == 0L) && (tempMsg != null))
      {
        l1 = l2;
        if (tempMsg.length > 1) {
          l1 = Long.valueOf(tempMsg[1]).longValue();
        }
        fileSize = l1;
      }
    }
  }
  
  private boolean b(FileManagerEntity paramFileManagerEntity)
  {
    boolean bool = true;
    if (paramFileManagerEntity == null) {
      return false;
    }
    switch (status)
    {
    case 1: 
    case 2: 
    case 3: 
    case 4: 
    case 9: 
    case 12: 
    case 13: 
    case 15: 
    default: 
      bool = false;
    }
    for (;;)
    {
      return bool;
      if (status != 0) {
        break;
      }
      continue;
      if (13 != nOpType) {
        break;
      }
      continue;
      if (10 == nOpType)
      {
        bool = false;
      }
      else
      {
        bool = false;
        continue;
        if (13 != nOpType) {
          break;
        }
      }
    }
  }
  
  private void d(View paramView)
  {
    Object localObject2 = (MessageForFile)AIOUtils.a(paramView);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_b_of_type_JavaLangString, 2, "TransfileUtile.TYPE_FILE uniseq " + uniseq + " itemStatus" + status);
    }
    Object localObject1 = a((MessageForFile)localObject2);
    paramView = new FileManagerReporter.fileAssistantReportData();
    jdField_b_of_type_JavaLangString = "file_viewer_in";
    jdField_a_of_type_Int = 9;
    c = FileUtil.a(fileName);
    d = FileManagerUtil.a(((FileManagerEntity)localObject1).getCloudType(), peerType);
    FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramView);
    FileManagerReporter.a("0X8004AE3");
    if ((TroopUin != 0L) && (!TextUtils.isEmpty(strTroopFileID)) && (!TextUtils.isEmpty(strTroopFilePath)))
    {
      paramView = new ForwardFileInfo();
      paramView.b(nSessionId);
      paramView.d(4);
      paramView.b(10006);
      paramView.a(((FileManagerEntity)localObject1).getFilePath());
      paramView.d(fileName);
      paramView.d(fileSize);
      paramView.a(TroopUin);
      localObject1 = (Activity)jdField_a_of_type_AndroidContentContext;
      localObject2 = new Intent((Context)localObject1, TroopFileDetailBrowserActivity.class);
      ((Intent)localObject2).putExtra("fileinfo", paramView);
      ((Intent)localObject2).putExtra("removemementity", true);
      ((Intent)localObject2).putExtra("forward_from_troop_file", true);
      ((Intent)localObject2).putExtra("not_forward", true);
      ((Activity)localObject1).startActivityForResult((Intent)localObject2, 102);
      return;
    }
    ForwardFileInfo localForwardFileInfo = new ForwardFileInfo();
    localForwardFileInfo.b(10004);
    if (((MessageForFile)localObject2).isSend()) {}
    for (paramView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();; paramView = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)
    {
      localForwardFileInfo.d(((FileManagerEntity)localObject1).getCloudType());
      localForwardFileInfo.a(Long.valueOf(paramView.replace("+", "")).longValue());
      localForwardFileInfo.c(uniseq);
      localForwardFileInfo.b(nSessionId);
      localForwardFileInfo.d(fileName);
      localForwardFileInfo.d(fileSize);
      localForwardFileInfo.b(Uuid);
      localForwardFileInfo.a(((FileManagerEntity)localObject1).getFilePath());
      paramView = new Intent(jdField_a_of_type_AndroidContentContext, FileBrowserActivity.class);
      paramView.putExtra("fileinfo", localForwardFileInfo);
      int i = FileManagerUtil.a(fileName);
      if ((i == 0) || (i == 1)) {
        a(paramView, frienduin, istroop);
      }
      paramView.putExtra("selfSet_leftViewText", "返回");
      ((Activity)jdField_a_of_type_AndroidContentContext).startActivityForResult(paramView, 102);
      return;
    }
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramChatMessage = super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    paramView = (kvy)paramChatMessage.getTag();
    jdField_a_of_type_AndroidViewView.getLayoutParams().width = BaseChatItemLayout.h;
    if (jdField_b_of_type_Boolean) {}
    try
    {
      jdField_b_of_type_JavaLangStringBuilder.append(jdField_a_of_type_AndroidWidgetTextView.getText());
      jdField_b_of_type_JavaLangStringBuilder.append(jdField_b_of_type_AndroidWidgetTextView.getText());
      jdField_b_of_type_JavaLangStringBuilder.append(c.getText());
      jdField_b_of_type_JavaLangStringBuilder.append("按钮");
      paramChatMessage.setContentDescription(jdField_b_of_type_JavaLangStringBuilder.toString());
      return paramChatMessage;
    }
    catch (Exception paramView) {}
    return paramChatMessage;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    kvy localKvy = (kvy)paramViewHolder;
    MessageForFile localMessageForFile = (MessageForFile)paramChatMessage;
    paramChatMessage = paramView;
    if (paramView == null) {
      paramChatMessage = a((kvy)paramViewHolder);
    }
    b(localMessageForFile);
    a(paramBaseChatItemLayout, localMessageForFile, localKvy, status, false);
    paramChatMessage.setOnLongClickListener(paramOnLongClickAndTouchListener);
    paramChatMessage.setOnTouchListener(paramOnLongClickAndTouchListener);
    paramChatMessage.setOnClickListener(this);
    FileTransferManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(paramChatMessage, this);
    return paramChatMessage;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new kvy(this);
  }
  
  public FileManagerEntity a(MessageForFile paramMessageForFile)
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uniseq, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    FileManagerEntity localFileManagerEntity;
    label295:
    int i;
    if (localObject == null)
    {
      localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(uniseq, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      if (QLog.isColorLevel()) {
        QLog.d("FileManager", 2, "QueryFileEntityByuniseq return null, create new! sessionId[" + String.valueOf(nSessionId) + "], messageId[" + String.valueOf(uniseq) + "], peerUin[" + FileManagerUtil.e(peerUin) + "], peerType[" + String.valueOf(peerType) + "]");
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
      TransFileInfo localTransFileInfo = (TransFileInfo)((EntityManager)localObject).a(TransFileInfo.class, new String[] { String.valueOf(time), String.valueOf(msgseq), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), frienduin });
      ((EntityManager)localObject).a();
      status = FileManagerUtil.d(status);
      if (paramMessageForFile.isSend())
      {
        localFileManagerEntity.setCloudType(3);
        if (TextUtils.isEmpty(url))
        {
          status = 16;
          if (localTransFileInfo != null)
          {
            if (uuid == null) {
              break label528;
            }
            localObject = new String(uuid);
            Uuid = ((String)localObject);
          }
          fileName = fileName;
          fileSize = fileSize;
          if (!paramMessageForFile.isSend()) {
            break label535;
          }
          i = 0;
          label328:
          nOpType = i;
          peerUin = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
          peerType = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int;
          peerNick = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, String.valueOf(frienduin), null, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          srvTime = (time * 1000L);
          strServerPath = urlAtServer;
          fProgress = ((float)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, fileSize, uniseq, istroop) / 100.0F);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(localFileManagerEntity);
          bDelInFM = true;
          paramMessageForFile = localFileManagerEntity;
        }
      }
    }
    label528:
    label535:
    do
    {
      return paramMessageForFile;
      localFileManagerEntity.setFilePath(url);
      break;
      localFileManagerEntity.setCloudType(1);
      lastTime = (time * 1000L + 604800000L);
      if (status != 1) {
        break;
      }
      localFileManagerEntity.setCloudType(3);
      localFileManagerEntity.setFilePath(url);
      break;
      localObject = "";
      break label295;
      i = 1;
      break label328;
      paramMessageForFile = (MessageForFile)localObject;
    } while (!QLog.isColorLevel());
    QLog.d("FileManager", 2, "QueryFileEntityByuniseq finded,FileEntity[" + FileManagerUtil.a((FileManagerEntity)localObject) + "]");
    return localObject;
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    if (MsgUtils.a(issend)) {
      return "发出文件";
    }
    return "发来文件";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    Object localObject2 = (MessageForFile)paramChatMessage;
    switch (paramInt)
    {
    }
    for (;;)
    {
      super.a(paramInt, paramContext, paramChatMessage);
      Object localObject1;
      for (;;)
      {
        jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity = null;
        return;
        long l1 = MessageCache.a();
        long l2 = time;
        if ((msgtype == 63531) && (istroop == 3000) && (l1 - l2 > 604800L))
        {
          FMToastUtil.a("该文件发送超过7天，撤回失败。");
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80056B1", "0X80056B1", 0, 0, "6", "", "", "");
          return;
        }
        a(paramChatMessage);
        FileManagerReporter.a("0X8005E4B");
        continue;
        ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006447", "0X8006447", 0, 0, "6", "", "", "");
        continue;
        super.b(paramChatMessage);
        continue;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800644C", "0X800644C", 0, 0, "6", "", "", "");
        localObject1 = a((MessageForFile)localObject2);
        switch (((FileManagerEntity)localObject1).getCloudType())
        {
        case 2: 
        case 4: 
        default: 
          break;
        case 1: 
          if (((MessageForFile)localObject2).isSend())
          {
            paramChatMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
            FMToastUtil.b(FileManagerUtil.d(fileName) + paramContext.getString(2131362754));
            if (jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity != null) {
              break label591;
            }
            jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((FileManagerEntity)localObject1, paramChatMessage);
          }
          for (;;)
          {
            nRelatedSessionId = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId;
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c((FileManagerEntity)localObject1);
            if (QLog.isColorLevel()) {
              QLog.i("@-@", 1, "mEntity[" + String.valueOf(nSessionId) + "]'s relateId[" + String.valueOf(nRelatedSessionId) + "] No reInit,Show Juhua");
            }
            paramContext = new FileManagerReporter.fileAssistantReportData();
            jdField_b_of_type_JavaLangString = "file_to_weiyun";
            jdField_a_of_type_Int = 9;
            jdField_a_of_type_Long = fileSize;
            c = FileUtil.a(fileName);
            FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramContext);
            break;
            paramChatMessage = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
            break label379;
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId);
          }
        case 3: 
        case 5: 
          label379:
          label591:
          if (nRelatedSessionId > 0L) {}
          for (paramChatMessage = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nRelatedSessionId);; paramChatMessage = null)
          {
            jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity = paramChatMessage;
            if ((!FileManagerUtil.a()) || (fileSize <= 3145728L)) {
              break label691;
            }
            FMDialogUtil.a(paramContext, 2131362794, 2131362790, new kvs(this, (MessageForFile)localObject2, paramContext, (FileManagerEntity)localObject1));
            break;
          }
          label691:
          FMToastUtil.b(FileManagerUtil.d(fileName) + paramContext.getString(2131362754));
          if (jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity == null) {
            jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(((FileManagerEntity)localObject1).getFilePath(), null, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0, false);
          }
          for (;;)
          {
            nRelatedSessionId = jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId;
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c((FileManagerEntity)localObject1);
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.i("@-@", 1, "mEntity[" + String.valueOf(nSessionId) + "]'s relateId[" + String.valueOf(nRelatedSessionId) + "] reInit");
            break;
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqFilemanagerDataFileManagerEntity.nSessionId);
          }
          paramContext = a((MessageForFile)localObject2);
          localObject1 = new FileManagerReporter.fileAssistantReportData();
          jdField_b_of_type_JavaLangString = "file_forward";
          jdField_a_of_type_Int = 9;
          jdField_a_of_type_Long = fileSize;
          c = FileUtil.a(fileName);
          d = FileManagerUtil.a(paramContext.getCloudType(), peerType);
          FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), (FileManagerReporter.fileAssistantReportData)localObject1);
          localObject1 = new Bundle();
          ((Bundle)localObject1).putInt("forward_type", 0);
          ((Bundle)localObject1).putBoolean("not_forward", true);
          ((Bundle)localObject1).putParcelable("fileinfo", ForwardFileOption.a(paramContext, paramChatMessage));
          paramChatMessage = new Intent();
          paramChatMessage.putExtras((Bundle)localObject1);
          paramChatMessage.putExtra("forward_text", "已选择" + FileManagerUtil.d(fileName) + "。");
          ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramChatMessage, 21);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "6", "", "", "");
          continue;
          paramContext = a((MessageForFile)localObject2);
          paramChatMessage = new Intent(jdField_a_of_type_AndroidContentContext, LiteActivity.class);
          localObject1 = new Bundle();
          ((Bundle)localObject1).putInt("forward_type", 0);
          ((Bundle)localObject1).putBoolean("not_forward", true);
          ((Bundle)localObject1).putInt("dataline_forward_type", 100);
          ((Bundle)localObject1).putString("dataline_forward_path", paramContext.getFilePath());
          ((Bundle)localObject1).putParcelable("fileinfo", ForwardFileOption.a(paramContext));
          paramChatMessage.putExtras((Bundle)localObject1);
          jdField_a_of_type_AndroidContentContext.startActivity(paramChatMessage);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800644B", "0X800644B", 0, 0, "6", "", "", "");
          continue;
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800644D", "0X800644D", 0, 0, "6", "", "", "");
          paramChatMessage = a((MessageForFile)localObject2);
          FileManagerReporter.a("0X8005080");
          if (!NetworkUtil.e(paramContext))
          {
            FMToastUtil.a(2131362880);
            return;
          }
          if ((FileManagerUtil.a()) && (fileSize > 3145728L)) {
            FMDialogUtil.a(paramContext, 2131362794, 2131362793, new kvt(this, paramChatMessage));
          }
          for (;;)
          {
            jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
            break;
            if (paramChatMessage.getCloudType() == 0)
            {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nSessionId);
              break;
            }
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramChatMessage);
          }
          paramContext = a((MessageForFile)localObject2);
          FileManagerReporter.a("0X8005081");
          if (paramContext.getCloudType() == 0)
          {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nSessionId);
          }
          else
          {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nSessionId);
            jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
            continue;
            paramChatMessage = a((MessageForFile)localObject2);
            FileManagerReporter.a("0X8005082");
            if (!NetworkUtil.e(paramContext))
            {
              FMToastUtil.a(2131362880);
              return;
            }
            if ((FileManagerUtil.a()) && (fileSize > 3145728L)) {
              if (nOpType == 0)
              {
                paramInt = 2131362790;
                label1500:
                FMDialogUtil.a(paramContext, 2131362794, paramInt, new kvu(this, paramChatMessage));
              }
            }
            for (;;)
            {
              jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
              break;
              paramInt = 2131362791;
              break label1500;
              if (paramChatMessage.getCloudType() == 0)
              {
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(nSessionId);
                break;
              }
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nSessionId);
            }
            paramContext = a((MessageForFile)localObject2);
            new QfavBuilder(3).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (Activity)jdField_a_of_type_AndroidContentContext, paramContext, paramChatMessage, false);
          }
          break;
        }
      }
      try
      {
        localObject1 = TestStructMsg.a(TestStructMsg.a(a((MessageForFile)localObject2).getFilePath()));
        localObject2 = new SessionInfo();
        jdField_a_of_type_JavaLangString = frienduin;
        jdField_a_of_type_Int = istroop;
        ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (SessionInfo)localObject2, (AbsStructMsg)localObject1);
      }
      catch (Exception localException)
      {
        QQToast.a(jdField_a_of_type_AndroidContentContext, "请先下载。。。。。。", 1).a();
      }
    }
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    kvy localKvy = (kvy)AIOUtils.a(paramView);
    MessageForFile localMessageForFile = (MessageForFile)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    BaseChatItemLayout localBaseChatItemLayout = jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout;
    paramView = a(localMessageForFile);
    if (paramView.getCloudType() == 5)
    {
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, paramView);
      return;
    }
    jdField_a_of_type_AndroidContentContext.getString(2131367611);
    jdField_a_of_type_AndroidContentContext.getString(2131367612);
    String str;
    switch (nOpType)
    {
    case 6: 
    case 7: 
    default: 
      str = jdField_a_of_type_AndroidContentContext.getString(2131362687);
    }
    for (paramView = jdField_a_of_type_AndroidContentContext.getString(2131362685); localMessageForFile.isSendFromLocal(); paramView = jdField_a_of_type_AndroidContentContext.getString(2131362686))
    {
      ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidContentContext, null);
      localActionSheet.c(str);
      localActionSheet.d(jdField_a_of_type_AndroidContentContext.getString(2131366996));
      localActionSheet.a(paramView);
      localActionSheet.a(new kvv(this, localMessageForFile, localBaseChatItemLayout, localKvy, localActionSheet));
      localActionSheet.show();
      return;
      str = jdField_a_of_type_AndroidContentContext.getString(2131362688);
    }
    paramView = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_AndroidContentContext, null);
    paramView.c(jdField_a_of_type_AndroidContentContext.getString(2131362688));
    paramView.d(jdField_a_of_type_AndroidContentContext.getString(2131366996));
    paramView.a(jdField_a_of_type_AndroidContentContext.getString(2131362686));
    paramView.a(new kvx(this, localMessageForFile, localBaseChatItemLayout, localKvy, paramView));
    paramView.show();
  }
  
  public void a(View paramView, FileMsg paramFileMsg, int paramInt1, int paramInt2)
  {
    paramView = (kvy)AIOUtils.a(paramView);
    MessageForFile localMessageForFile = (MessageForFile)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
    BaseChatItemLayout localBaseChatItemLayout = jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout;
    if (uniseq != c) {
      return;
    }
    if (paramInt1 == 5000)
    {
      QQToast.a(jdField_a_of_type_AndroidContentContext, 2131367726, 1).b(jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_b_of_type_JavaLangString, 2, "transferListener FileMsg.TRANSFILE_TYPE_FILE uniseq " + uniseq + " itemStatus " + status);
    }
    a(localBaseChatItemLayout, localMessageForFile, paramView, paramInt1, false);
  }
  
  public void a(BaseChatItemLayout paramBaseChatItemLayout, MessageForFile paramMessageForFile, kvy paramKvy, int paramInt, boolean paramBoolean)
  {
    FileManagerEntity localFileManagerEntity = a(paramMessageForFile);
    FileManagerUtil.b(localFileManagerEntity);
    fileName = fileName;
    fileSize = fileSize;
    status = status;
    urlAtServer = strServerPath;
    url = localFileManagerEntity.getFilePath();
    fileSizeString = FileUtil.a(fileSize);
    if ((localFileManagerEntity.getCloudType() == 3) || (localFileManagerEntity.getCloudType() == 5))
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(FileManagerUtil.d(fileName));
      if ((localFileManagerEntity == null) || (15 != status) || (9 != nOpType)) {
        break label172;
      }
      jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_AndroidContentContext.getString(2131362776));
    }
    for (;;)
    {
      if (5 != localFileManagerEntity.getCloudType()) {
        break label202;
      }
      return;
      jdField_a_of_type_AndroidWidgetTextView.setText(FileManagerUtil.d(strSrcName));
      break;
      label172:
      jdField_b_of_type_AndroidWidgetTextView.setText(FileUtil.a(fileSize, jdField_a_of_type_AndroidContentContext.getResources().getDisplayMetrics().densityDpi));
    }
    label202:
    a(paramKvy, localFileManagerEntity);
    a(paramKvy, paramMessageForFile, localFileManagerEntity);
    paramBaseChatItemLayout.setFailedIconVisable(b(localFileManagerEntity), this);
    status = paramInt;
    if (localFileManagerEntity == null)
    {
      FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView, fileName);
      return;
    }
    FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqFilemanagerWidgetAsyncImageView, localFileManagerEntity);
  }
  
  public boolean a(FileManagerEntity paramFileManagerEntity)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramFileManagerEntity != null) {
      if (nOpType != 24)
      {
        bool1 = bool2;
        if (nOpType != 25) {}
      }
      else if (status != 2)
      {
        bool1 = bool2;
        if (status != 0) {}
      }
      else
      {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = (MessageForFile)AIOUtils.a(paramView);
    FileManagerEntity localFileManagerEntity1 = a(paramView);
    if (localFileManagerEntity1.getCloudType() == 5) {
      return a(localFileManagerEntity1);
    }
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    if (16 != status)
    {
      if ((nOpType == -1) && (status == -1)) {
        localQQCustomMenu.a(2131304488, jdField_a_of_type_AndroidContentContext.getString(2131362873));
      }
      if (((nOpType == 0) || (nOpType == 11)) && (localFileManagerEntity1.getCloudType() == 1) && (status == 1)) {
        localQQCustomMenu.a(2131304488, jdField_a_of_type_AndroidContentContext.getString(2131362873));
      }
      if ((nOpType == 11) && (localFileManagerEntity1.getCloudType() == 1) && (status == 13)) {
        localQQCustomMenu.a(2131304488, jdField_a_of_type_AndroidContentContext.getString(2131362873));
      }
      if (((nOpType == 7) || (nOpType == 28) || (nOpType == 21) || (nOpType == 22) || (nOpType == 3) || (nOpType == 24) || (nOpType == 25)) && (status == 1)) {
        localQQCustomMenu.a(2131304488, jdField_a_of_type_AndroidContentContext.getString(2131362873));
      }
      if (nOpType == 1) {
        switch (status)
        {
        }
      }
      for (;;)
      {
        a(paramView, localQQCustomMenu);
        if ((localFileManagerEntity1.getCloudType() != 0) && (!a(localFileManagerEntity1)))
        {
          localQQCustomMenu.a(2131304486, jdField_a_of_type_AndroidContentContext.getString(2131362699));
          localQQCustomMenu.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131362701));
        }
        if (DataLineHandler.a(localFileManagerEntity1)) {
          localQQCustomMenu.a(2131304491, jdField_a_of_type_AndroidContentContext.getString(2131362182));
        }
        if ((localFileManagerEntity1.getCloudType() == 0) || (a(localFileManagerEntity1)) || (localFileManagerEntity1.getCloudType() == 2)) {
          break label591;
        }
        FileManagerEntity localFileManagerEntity2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nRelatedSessionId);
        if ((localFileManagerEntity2 == null) || (status != 1) || ((nOpType != 20) && (nOpType != 4) && (nOpType != 6))) {
          break;
        }
        ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        return localQQCustomMenu.a();
        localQQCustomMenu.a(2131304488, jdField_a_of_type_AndroidContentContext.getString(2131362873));
        continue;
        localQQCustomMenu.a(2131304489, jdField_a_of_type_AndroidContentContext.getString(2131362871));
        continue;
        localQQCustomMenu.a(2131304490, jdField_a_of_type_AndroidContentContext.getString(2131362741));
      }
      nRelatedSessionId = 0L;
      localQQCustomMenu.a(2131304485, jdField_a_of_type_AndroidContentContext.getString(2131362703));
    }
    label591:
    if (QLog.isColorLevel()) {
      QLog.i("msgrevoke", 2, "FileMenuitem entity.status:" + status);
    }
    if ((paramView.isSend()) && ((status == 1) || (status == -1) || ((status == 3) && (nOpType == 1)))) {
      a(localQQCustomMenu, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramView);
    }
    ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
    return localQQCustomMenu.a();
  }
  
  QQCustomMenuItem[] a(FileManagerEntity paramFileManagerEntity)
  {
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    if ((!bSend) && (status != 1))
    {
      ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
      return localQQCustomMenu.a();
    }
    localQQCustomMenu.a(2131304486, jdField_a_of_type_AndroidContentContext.getString(2131362699));
    localQQCustomMenu.a(2131304491, jdField_a_of_type_AndroidContentContext.getString(2131362182));
    if (paramFileManagerEntity.getCloudType() != 2)
    {
      paramFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(nRelatedSessionId);
      if ((paramFileManagerEntity == null) || (status != 1)) {
        localQQCustomMenu.a(2131304485, jdField_a_of_type_AndroidContentContext.getString(2131362703));
      }
    }
    ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    return localQQCustomMenu.a();
  }
  
  public void onClick(View paramView)
  {
    AIOUtils.l = true;
    if (super.a()) {
      return;
    }
    super.onClick(paramView);
    switch (paramView.getId())
    {
    case 2131296316: 
    default: 
      return;
    }
    d(paramView);
  }
}
