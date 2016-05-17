import android.app.Application;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import com.tencent.biz.pubaccount.util.PubAccountHttpDownloader;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.ProtocolDownloader;
import com.tencent.image.URLDrawableParams;
import com.tencent.mobileqq.activity.aio.item.ApolloItemBuilder.ApolloGifDownloader;
import com.tencent.mobileqq.activity.aio.photo.PhotoDecoder;
import com.tencent.mobileqq.app.FunnyPicHelper.FunnyPicDownloader;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.ThreadPoolParams;
import com.tencent.mobileqq.emoticonview.FavoriteDownloader;
import com.tencent.mobileqq.redtouch.RedTouchPicDownloader;
import com.tencent.mobileqq.transfile.AIOFlowerImgDownloader;
import com.tencent.mobileqq.transfile.AIOPhotoImageDownloader;
import com.tencent.mobileqq.transfile.AlbumThumbDownloader;
import com.tencent.mobileqq.transfile.AvatarPendantDownloader;
import com.tencent.mobileqq.transfile.CarrierImgDownloader;
import com.tencent.mobileqq.transfile.ChatImageDownloader;
import com.tencent.mobileqq.transfile.DataLineDownloader;
import com.tencent.mobileqq.transfile.DeviceMsgThumbDownloader;
import com.tencent.mobileqq.transfile.EmotionDownloader;
import com.tencent.mobileqq.transfile.FavoriteImageDownloader;
import com.tencent.mobileqq.transfile.FileAssistantDownloader;
import com.tencent.mobileqq.transfile.HttpDownloader;
import com.tencent.mobileqq.transfile.LBSImageDownloader;
import com.tencent.mobileqq.transfile.LastModifySupportDownloader;
import com.tencent.mobileqq.transfile.LocalBilldDownloader;
import com.tencent.mobileqq.transfile.LocationDownloader;
import com.tencent.mobileqq.transfile.NearbyImgDownloader;
import com.tencent.mobileqq.transfile.PicEmotionDownloader;
import com.tencent.mobileqq.transfile.ProfileImgDownloader;
import com.tencent.mobileqq.transfile.QZoneCoverDownloader;
import com.tencent.mobileqq.transfile.QZoneRecentPhotoDownloader;
import com.tencent.mobileqq.transfile.RegionalThumbDownloader;
import com.tencent.mobileqq.transfile.ShortVideoThumbDownloader;
import com.tencent.mobileqq.transfile.SignatureTemplateDownloader;
import com.tencent.mobileqq.transfile.ThirdPartAppIconDownloader;
import com.tencent.mobileqq.transfile.VasExtensionDownloader;
import com.tencent.mobileqq.transfile.VideoThumbDownloader;
import cooperation.huangye.HuangyeHttpDownloader;
import java.util.concurrent.LinkedBlockingQueue;

public class rdy
  extends URLDrawableParams
{
  private ProtocolDownloader jdField_a_of_type_ComTencentImageProtocolDownloader;
  private AIOPhotoImageDownloader jdField_a_of_type_ComTencentMobileqqTransfileAIOPhotoImageDownloader;
  private ProtocolDownloader b;
  private ProtocolDownloader c;
  private ProtocolDownloader d;
  private ProtocolDownloader e;
  private ProtocolDownloader f;
  
  public rdy(Application paramApplication)
  {
    super(paramApplication);
    mFadeInImage = false;
    mUseGifAnimation = false;
    mMemoryCache = BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache;
    mURLDrawableExecutor = ThreadManager.a(null);
    paramApplication = new ThreadPoolParams();
    b = 1;
    c = 1;
    d = 1;
    jdField_a_of_type_JavaUtilConcurrentBlockingQueue = new LinkedBlockingQueue(128);
    jdField_a_of_type_JavaLangString = "URLDrawableSubExecutor";
    mURLDrawableSubExecutor = ThreadManager.a(paramApplication);
    paramApplication = new ThreadPoolParams();
    b = 1;
    c = 1;
    d = 1;
    jdField_a_of_type_JavaUtilConcurrentBlockingQueue = new LinkedBlockingQueue(128);
    jdField_a_of_type_JavaLangString = "URLDrawableFileExecutor";
    mURLDrawableFileExecutor = ThreadManager.a(paramApplication);
    if ((mURLDrawableExecutor == null) || (mURLDrawableSubExecutor == null) || (mURLDrawableFileExecutor == null)) {
      throw new RuntimeException("URLDrawable executor init failure...");
    }
  }
  
  protected ProtocolDownloader doGetDownloader(String paramString)
  {
    if (("http".equals(paramString)) || ("https".equals(paramString)))
    {
      if (jdField_a_of_type_ComTencentImageProtocolDownloader == null) {
        jdField_a_of_type_ComTencentImageProtocolDownloader = new HttpDownloader();
      }
      return jdField_a_of_type_ComTencentImageProtocolDownloader;
    }
    if (("nearbyimage".equals(paramString)) || ("nearbylocalimage".equals(paramString)))
    {
      if (f == null) {
        f = new NearbyImgDownloader();
      }
      return f;
    }
    if (("chatthumb".equals(paramString)) || ("chatimg".equals(paramString)) || ("chatraw".equals(paramString)))
    {
      if (b == null) {
        b = new ChatImageDownloader(BaseApplicationImpl.a());
      }
      return b;
    }
    if (("lbsthumb".equals(paramString)) || ("lbsimg".equals(paramString)))
    {
      if (c == null) {
        c = new LBSImageDownloader(BaseApplicationImpl.a());
      }
      return c;
    }
    if ("datalineimage".equals(paramString)) {
      return new DataLineDownloader(BaseApplicationImpl.a());
    }
    if ("emotion".equals(paramString)) {
      return new EmotionDownloader(BaseApplicationImpl.a());
    }
    if ("emotion_pic".equals(paramString)) {
      return new PicEmotionDownloader(BaseApplicationImpl.a());
    }
    if ("favorite".equals(paramString)) {
      return new FavoriteDownloader(BaseApplicationImpl.a());
    }
    if ("albumthumb".equals(paramString)) {
      return new AlbumThumbDownloader(BaseApplicationImpl.a());
    }
    if ("huangyeroundimage".equals(paramString)) {
      return new HuangyeHttpDownloader();
    }
    if ("videothumb".equals(paramString)) {
      return new VideoThumbDownloader();
    }
    if ("pubaccountimage".equals(paramString)) {
      return new PubAccountHttpDownloader(BaseApplicationImpl.a());
    }
    if ("location".equals(paramString)) {
      return new LocationDownloader(BaseApplicationImpl.a());
    }
    if (("billdthumb".equals(paramString)) || ("billdimg".equals(paramString)))
    {
      if (d == null) {
        d = new LocalBilldDownloader(BaseApplicationImpl.a());
      }
      return d;
    }
    if (("profile_img_big".equals(paramString)) || ("profile_img_thumb".equals(paramString)) || ("profile_img_icon".equals(paramString)))
    {
      if (e == null) {
        e = new ProfileImgDownloader();
      }
      return e;
    }
    if ("qzone_cover".equals(paramString)) {
      return new QZoneCoverDownloader();
    }
    if ("favimage".equals(paramString)) {
      return new FavoriteImageDownloader(BaseApplicationImpl.a());
    }
    if ("fileassistantimage".equals(paramString)) {
      return new FileAssistantDownloader(BaseApplicationImpl.a());
    }
    if ("troop_photo_qzone".equals(paramString)) {
      return new QZoneRecentPhotoDownloader();
    }
    if ("aiothumb".equals(paramString))
    {
      if (jdField_a_of_type_ComTencentMobileqqTransfileAIOPhotoImageDownloader == null) {
        jdField_a_of_type_ComTencentMobileqqTransfileAIOPhotoImageDownloader = new AIOPhotoImageDownloader(BaseApplicationImpl.a());
      }
      return jdField_a_of_type_ComTencentMobileqqTransfileAIOPhotoImageDownloader;
    }
    if ("protocol_pendant_image".equals(paramString)) {
      return new AvatarPendantDownloader();
    }
    if (("file".equals(paramString)) || (BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getProcessName().endsWith(":peak"))) {
      return new PhotoDecoder(BaseApplicationImpl.a());
    }
    if ("regionalthumb".equals(paramString)) {
      return new RegionalThumbDownloader(BaseApplicationImpl.a());
    }
    if ("third_part".equals(paramString)) {
      return new ThirdPartAppIconDownloader(BaseApplicationImpl.a());
    }
    if ("gamead".equals(paramString)) {
      return new LastModifySupportDownloader();
    }
    if ("shortVideoThumb".equals(paramString)) {
      return new ShortVideoThumbDownloader();
    }
    if ("DeviceMsgThumb".equals(paramString)) {
      return new DeviceMsgThumbDownloader();
    }
    if ("carrier".equals(paramString)) {
      return new CarrierImgDownloader();
    }
    if ("aioflower".equals(paramString)) {
      return new AIOFlowerImgDownloader();
    }
    if (("sig_cover".equals(paramString)) || ("sig_zip".equals(paramString))) {
      return new SignatureTemplateDownloader();
    }
    if ("funny_pic".equals(paramString)) {
      return new FunnyPicHelper.FunnyPicDownloader();
    }
    if ("redtouchPicDownloadProtoc".equals(paramString)) {
      return new RedTouchPicDownloader(BaseApplicationImpl.a());
    }
    if ("protocol_vas_extension_image".equals(paramString)) {
      return new VasExtensionDownloader();
    }
    if ("apollo_gif".equals(paramString)) {
      return new ApolloItemBuilder.ApolloGifDownloader();
    }
    return null;
  }
  
  protected String doGetLocalFilePath(String paramString)
  {
    return null;
  }
  
  protected Drawable getDefaultLoadingDrawable()
  {
    try
    {
      Drawable localDrawable = BaseApplicationImpl.a().getResources().getDrawable(2130837563);
      return localDrawable;
    }
    catch (Throwable localThrowable) {}
    return new ColorDrawable(0);
  }
  
  protected Drawable getDefualtFailedDrawable()
  {
    return BaseApplicationImpl.a().getResources().getDrawable(2130837565);
  }
}
