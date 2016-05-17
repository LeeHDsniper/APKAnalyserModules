package com.tencent.mobileqq.activity.aio.photo;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.text.TextUtils;
import com.qq.taf.jce.HexUtil;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.photopreview.PhotoPreviewConstant;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.CustomEmotionData;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.data.VipComicFavorEmoStructMsgInfo;
import com.tencent.mobileqq.emosm.favroaming.FavEmoConstant;
import com.tencent.mobileqq.emosm.favroaming.FavroamingManager;
import com.tencent.mobileqq.emosm.vipcomic.VipComicMqqManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mqsafeedit.MD5;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.structmsg.StructMsgForImageShare;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.QZoneHelper;
import cooperation.qzone.QZoneHelper.UserInfo;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import ldr;
import lds;
import ldt;
import ldu;
import ldv;

public class AIOGalleryUtils
{
  static final int jdField_a_of_type_Int = 0;
  public static final Handler a = null;
  private static final String jdField_a_of_type_JavaLangString = "AIOGalleryUtils";
  static final int b = 2;
  static final int c = 3;
  public static final int d = 1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    if (BaseApplicationImpl.a.getProcessName().endsWith(":peak"))
    {
      a = new ldv();
      return;
    }
  }
  
  public AIOGalleryUtils() {}
  
  public static AIOImageData a(MessageForPic paramMessageForPic)
  {
    AIOImageData localAIOImageData = new AIOImageData();
    jdField_e_of_type_Long = uniseq;
    i = subMsgId;
    int i;
    if (isMixed)
    {
      i = 1;
      jdField_a_of_type_JavaLangString = AbsDownloader.d(URLDrawableHelper.a(paramMessageForPic, i, "chatthumb").toString());
      if (!isMixed) {
        break label160;
      }
      jdField_b_of_type_JavaLangString = jdField_a_of_type_JavaLangString;
    }
    for (;;)
    {
      if (fileSizeFlag == 1) {
        jdField_c_of_type_JavaLangString = AbsDownloader.d(URLDrawableHelper.a(paramMessageForPic, 131075, null).toString());
      }
      jdField_e_of_type_JavaLangString = uuid;
      jdField_d_of_type_Long = groupFileID;
      jdField_a_of_type_Long = width;
      jdField_b_of_type_Long = height;
      jdField_e_of_type_Boolean = paramMessageForPic.isSendFromLocal();
      g = imageType;
      return localAIOImageData;
      i = 65537;
      break;
      label160:
      URL localURL = URLDrawableHelper.a(paramMessageForPic, 1, null);
      jdField_b_of_type_JavaLangString = AbsDownloader.d(localURL.toString());
      if (fileSizeFlag != 1)
      {
        long l = size;
        File localFile = new File(jdField_b_of_type_JavaLangString);
        if ((localFile.exists()) && (localFile.length() < l)) {
          jdField_d_of_type_Boolean = true;
        }
        jdField_d_of_type_JavaLangString = AbsDownloader.e(localURL.toString());
        if ((mShowLength > 0) && (mShowLength < mDownloadLength)) {
          f = true;
        }
      }
    }
  }
  
  public static AIOShortVideoData a(MessageForShortVideo paramMessageForShortVideo)
  {
    AIOShortVideoData localAIOShortVideoData = new AIOShortVideoData();
    jdField_e_of_type_Long = uniseq;
    String str = ShortVideoUtils.a(thumbMD5, "jpg");
    paramMessageForShortVideo = ShortVideoUtils.a(paramMessageForShortVideo, "mp4");
    jdField_a_of_type_JavaLangString = str;
    jdField_b_of_type_JavaLangString = paramMessageForShortVideo;
    return localAIOShortVideoData;
  }
  
  public static void a(Activity paramActivity, Intent paramIntent, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt, ArrayList paramArrayList)
  {
    QZoneHelper.UserInfo localUserInfo = QZoneHelper.UserInfo.a();
    jdField_a_of_type_JavaLangString = paramString1;
    QZoneHelper.a(paramActivity, localUserInfo, paramIntent, paramString2, paramString3, paramString4, paramString5, paramInt, paramArrayList, 7001);
  }
  
  public static void a(Activity paramActivity, File paramFile, String paramString)
  {
    new File(AppConstants.bi).mkdirs();
    String str = paramString;
    if (paramString.indexOf(".") == -1)
    {
      str = FileUtils.a(paramFile.getAbsolutePath());
      str = paramString + "." + str;
    }
    paramString = new File(AppConstants.bi, str);
    if (!paramString.exists()) {
      try
      {
        if (paramString.createNewFile()) {
          b(paramActivity, paramFile, paramString);
        }
        return;
      }
      catch (IOException paramFile)
      {
        do
        {
          QQToast.a(paramActivity, paramActivity.getString(2131368491), 0).a();
        } while (!QLog.isColorLevel());
        QLog.e("AIOGalleryUtils", 2, "", paramFile);
        return;
      }
    }
    DialogUtil.a(paramActivity, 230).setTitle(paramActivity.getString(2131368494)).setMessage(paramActivity.getString(2131368496)).setPositiveButton(paramActivity.getString(2131368495), new lds(paramActivity, paramFile, paramString)).setNegativeButton(paramActivity.getString(2131366993), new ldr()).show();
  }
  
  public static void a(Activity paramActivity, String paramString1, String paramString2, int paramInt, AIORichMediaInfo paramAIORichMediaInfo, boolean paramBoolean, String paramString3)
  {
    if ((paramAIORichMediaInfo == null) || (!AIOImageData.class.isInstance(a))) {
      return;
    }
    QZoneHelper.UserInfo localUserInfo = QZoneHelper.UserInfo.a();
    jdField_a_of_type_JavaLangString = paramString1;
    AIOImageData localAIOImageData = (AIOImageData)a;
    paramString1 = jdField_a_of_type_JavaLangString;
    if (!paramString1.endsWith("_hd"))
    {
      paramAIORichMediaInfo = paramString1 + "_hd";
      if (new File(paramAIORichMediaInfo).exists()) {
        paramString1 = paramAIORichMediaInfo;
      }
    }
    for (;;)
    {
      paramAIORichMediaInfo = jdField_e_of_type_JavaLangString;
      long l2 = jdField_c_of_type_Long;
      long l1 = 0L;
      if (paramBoolean) {
        l1 = jdField_d_of_type_Long;
      }
      QZoneHelper.a(paramActivity, localUserInfo, paramBoolean, paramString3, paramString2, paramInt, paramString1, paramAIORichMediaInfo, l2, l1, -1);
      return;
    }
  }
  
  public static void a(Activity paramActivity, String paramString1, String paramString2, int paramInt, List paramList, boolean paramBoolean, String paramString3)
  {
    if (paramList == null) {
      return;
    }
    QZoneHelper.UserInfo localUserInfo = QZoneHelper.UserInfo.a();
    jdField_a_of_type_JavaLangString = paramString1;
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    ArrayList localArrayList3 = new ArrayList();
    ArrayList localArrayList4 = new ArrayList();
    Iterator localIterator = paramList.iterator();
    AIOImageData localAIOImageData;
    while (localIterator.hasNext())
    {
      paramString1 = (AIORichMediaInfo)localIterator.next();
      if (AIOImageData.class.isInstance(a))
      {
        localAIOImageData = (AIOImageData)a;
        localArrayList2.add(jdField_e_of_type_JavaLangString);
        localArrayList3.add(Long.valueOf(jdField_c_of_type_Long));
        if (paramBoolean) {
          localArrayList4.add(Long.valueOf(jdField_d_of_type_Long));
        }
        paramString1 = jdField_a_of_type_JavaLangString;
        if (paramString1.endsWith("_hd")) {
          break label297;
        }
        paramList = paramString1 + "_hd";
        if (!new File(paramList).exists()) {
          break label297;
        }
        paramString1 = paramList;
      }
    }
    label297:
    for (;;)
    {
      localArrayList1.add(paramString1);
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("AIOGalleryUtils", 2, "fowardToQZoneGroupAlbums(), uuid:" + jdField_e_of_type_JavaLangString + " time:" + jdField_c_of_type_Long + " path:" + paramString1);
      break;
      QZoneHelper.a(paramActivity, localUserInfo, paramBoolean, paramString3, paramString2, paramInt, localArrayList1, localArrayList2, localArrayList3, localArrayList4, 98);
      return;
    }
  }
  
  public static void a(Activity paramActivity, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, long paramLong, int paramInt)
  {
    QZoneHelper.UserInfo localUserInfo = QZoneHelper.UserInfo.a();
    jdField_a_of_type_JavaLangString = paramString1;
    if (QLog.isColorLevel()) {
      QLog.d("AIOGalleryUtils", 2, "fowardToGroupAlbum(),uin:" + paramString1 + " qunId:" + paramString2 + " qunCode:" + paramString3 + " uuid:" + paramString5 + " time:" + paramLong + " path:" + paramInt);
    }
    QZoneHelper.a(paramActivity, localUserInfo, paramString2, paramString3, paramString4, paramString5, paramLong, paramInt);
  }
  
  public static void a(Activity paramActivity, String paramString1, String paramString2, String paramString3, ArrayList paramArrayList1, ArrayList paramArrayList2, ArrayList paramArrayList3, int paramInt)
  {
    QZoneHelper.UserInfo localUserInfo = QZoneHelper.UserInfo.a();
    jdField_a_of_type_JavaLangString = paramString1;
    if (QLog.isColorLevel()) {
      QLog.d("AIOGalleryUtils", 2, "fowardToGroupAlbumEx(),uin:" + paramString1 + " qunId:" + paramString2 + " qunCode:" + paramString3);
    }
    QZoneHelper.a(paramActivity, localUserInfo, paramString2, paramString3, paramArrayList1, paramArrayList2, paramArrayList3, paramInt);
  }
  
  public static void a(Context paramContext, QQAppInterface paramQQAppInterface, URLDrawable paramURLDrawable, String paramString, int paramInt, StructMsgForImageShare paramStructMsgForImageShare)
  {
    new ldu(paramContext, paramInt, paramQQAppInterface, paramURLDrawable, paramStructMsgForImageShare, paramString).execute(new Void[0]);
  }
  
  private static boolean a(Context paramContext, String paramString)
  {
    paramContext = ((QQAppInterface)((BaseActivity)paramContext).getAppRuntime()).a().createEntityManager();
    List localList = paramContext.a(CustomEmotionData.class, false, null, null, null, null, null, null);
    if (localList != null)
    {
      int i = 0;
      while (i < localList.size())
      {
        int j = getemoId;
        if ((paramString != null) && (paramString.equals(getemoPath)))
        {
          paramContext.a();
          return true;
        }
        i += 1;
      }
    }
    paramContext.a();
    return false;
  }
  
  private static int b(Context paramContext, String paramString, StructMsgForImageShare paramStructMsgForImageShare)
  {
    int i1 = 0;
    QQAppInterface localQQAppInterface = (QQAppInterface)((BaseActivity)paramContext).getAppRuntime();
    paramContext = ImageUtil.a(paramContext, Uri.parse(paramString));
    Object localObject1 = new File(paramContext);
    if ((!((File)localObject1).exists()) || (((File)localObject1).length() > 20480L)) {
      ImageUtil.a(BaseApplication.getContext(), paramString, paramContext, PhotoPreviewConstant.g, PhotoPreviewConstant.g);
    }
    if (!new File(paramContext).exists()) {
      ImageUtil.a(BaseApplication.getContext(), paramString, paramContext, PhotoPreviewConstant.g, PhotoPreviewConstant.g);
    }
    localObject1 = HexUtil.bytes2HexStr(MD5.getFileMd5(paramString));
    paramContext = localQQAppInterface.a().createEntityManager();
    Object localObject2 = paramContext.a(CustomEmotionData.class, false, null, null, null, null, null, null);
    int i;
    if (localObject2 != null)
    {
      int j = 0;
      int m = 0;
      label420:
      int n;
      for (i = 1; j < ((List)localObject2).size(); i = n)
      {
        int k;
        if (!TextUtils.isEmpty(getRomaingType))
        {
          k = m;
          if ("needDel".equals(getRomaingType)) {}
        }
        else
        {
          k = m + 1;
        }
        m = getemoId;
        if ((paramString != null) && (paramString.equals(getemoPath)))
        {
          b(localQQAppInterface, paramStructMsgForImageShare, (CustomEmotionData)((List)localObject2).get(j));
          i = 2;
        }
        do
        {
          return i;
          if ((localObject1 == null) || (getmd5 == null) || (!((String)localObject1).equals(getmd5))) {
            break label420;
          }
          b(localQQAppInterface, paramStructMsgForImageShare, (CustomEmotionData)((List)localObject2).get(j));
          if (!"needDel".equals(getRomaingType)) {
            break;
          }
          paramString = (CustomEmotionData)((List)localObject2).get(j);
          RomaingType = "isUpdate";
          paramContext.a(paramString);
          paramContext.a();
          paramContext = (FavroamingManager)localQQAppInterface.getManager(102);
          i = i1;
        } while (paramContext == null);
        paramContext.syncUpload(paramString);
        return 0;
        return 2;
        n = i;
        if (i < m) {
          n = m;
        }
        j += 1;
        m = k;
      }
      if (m >= FavEmoConstant.d) {
        return 3;
      }
    }
    else
    {
      i = 1;
    }
    localObject2 = new CustomEmotionData();
    uin = localQQAppInterface.a();
    emoId = (i + 1);
    emoPath = paramString;
    md5 = ((String)localObject1);
    paramContext.a((Entity)localObject2);
    paramContext.a();
    c(localQQAppInterface, paramStructMsgForImageShare, (CustomEmotionData)localObject2);
    paramContext = (FavroamingManager)localQQAppInterface.getManager(102);
    if (paramContext != null) {
      paramContext.syncUpload((CustomEmotionData)localObject2);
    }
    ChatActivityFacade.a(localQQAppInterface, paramString);
    return 0;
  }
  
  private static CustomEmotionData b(Context paramContext, String paramString)
  {
    int i = 0;
    Object localObject = null;
    EntityManager localEntityManager = ((QQAppInterface)((BaseActivity)paramContext).getAppRuntime()).a().createEntityManager();
    List localList = localEntityManager.a(CustomEmotionData.class, false, null, null, null, null, null, null);
    paramContext = localObject;
    if (localList != null) {}
    for (;;)
    {
      paramContext = localObject;
      if (i < localList.size())
      {
        if ((paramString != null) && (paramString.equals(getemoPath))) {
          paramContext = (CustomEmotionData)localList.get(i);
        }
      }
      else
      {
        localEntityManager.a();
        return paramContext;
      }
      i += 1;
    }
  }
  
  private static void b(Activity paramActivity, File paramFile1, File paramFile2)
  {
    new ldt(paramFile2, paramFile1, paramActivity).execute(new Void[0]);
  }
  
  private static void b(QQAppInterface paramQQAppInterface, StructMsgForImageShare paramStructMsgForImageShare, CustomEmotionData paramCustomEmotionData)
  {
    paramStructMsgForImageShare = AIOGallerySceneWithBusiness.a(paramStructMsgForImageShare);
    if ((paramQQAppInterface != null) && (!TextUtils.isEmpty(paramStructMsgForImageShare)) && (paramStructMsgForImageShare.startsWith("comic_plugin.apk")) && (paramCustomEmotionData != null) && (!TextUtils.isEmpty(md5)))
    {
      paramQQAppInterface = (VipComicMqqManager)paramQQAppInterface.getManager(140);
      VipComicFavorEmoStructMsgInfo localVipComicFavorEmoStructMsgInfo = new VipComicFavorEmoStructMsgInfo();
      picMd5 = md5;
      actionData = paramStructMsgForImageShare;
      if (!localVipComicFavorEmoStructMsgInfo.equals(paramQQAppInterface.a(md5)))
      {
        paramStructMsgForImageShare = new ArrayList();
        paramStructMsgForImageShare.add(localVipComicFavorEmoStructMsgInfo);
        paramQQAppInterface.a(paramStructMsgForImageShare, true);
        if (QLog.isColorLevel()) {
          QLog.d("AIOGalleryUtils", 2, "handleOldComicStructMsg , emoStructMsgInfo = " + localVipComicFavorEmoStructMsgInfo);
        }
      }
    }
  }
  
  private static void c(QQAppInterface paramQQAppInterface, StructMsgForImageShare paramStructMsgForImageShare, CustomEmotionData paramCustomEmotionData)
  {
    paramStructMsgForImageShare = AIOGallerySceneWithBusiness.a(paramStructMsgForImageShare);
    if ((paramQQAppInterface != null) && (!TextUtils.isEmpty(paramStructMsgForImageShare)) && (paramStructMsgForImageShare.startsWith("comic_plugin.apk")) && (paramCustomEmotionData != null) && (!TextUtils.isEmpty(md5)))
    {
      paramQQAppInterface = (VipComicMqqManager)paramQQAppInterface.getManager(140);
      VipComicFavorEmoStructMsgInfo localVipComicFavorEmoStructMsgInfo = new VipComicFavorEmoStructMsgInfo();
      picMd5 = md5;
      actionData = paramStructMsgForImageShare;
      paramStructMsgForImageShare = new ArrayList();
      paramStructMsgForImageShare.add(localVipComicFavorEmoStructMsgInfo);
      paramQQAppInterface.a(paramStructMsgForImageShare, true);
      if (QLog.isColorLevel()) {
        QLog.d("AIOGalleryUtils", 2, "handleComicStructMsg , emoStructMsgInfo = " + localVipComicFavorEmoStructMsgInfo);
      }
    }
  }
}
