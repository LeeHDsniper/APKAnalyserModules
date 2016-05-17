import com.tencent.mobileqq.activity.aio.photo.AIOImageProviderService;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProviderCallBack;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.DownCallBack.DownResult;
import com.tencent.mobileqq.pic.PicInfoInterface.ErrInfo;
import com.tencent.mobileqq.shortvideo.ShortVideoResult;
import com.tencent.mobileqq.shortvideo.UiCallBack.DownAdapter;

public class lef
  extends UiCallBack.DownAdapter
{
  public lef(AIOImageProviderService paramAIOImageProviderService, long paramLong, int paramInt1, int paramInt2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt)
  {
    IAIOImageProviderCallBack localIAIOImageProviderCallBack = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.a;
    if (localIAIOImageProviderCallBack != null) {
      localIAIOImageProviderCallBack.a(jdField_a_of_type_Long, jdField_a_of_type_Int, b, paramInt, 0L, true);
    }
  }
  
  public void a(int paramInt, ShortVideoResult paramShortVideoResult)
  {
    IAIOImageProviderCallBack localIAIOImageProviderCallBack = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.a;
    if (localIAIOImageProviderCallBack != null)
    {
      if (d == 0)
      {
        paramShortVideoResult = (DownCallBack.DownResult)jdField_a_of_type_JavaLangObject;
        localIAIOImageProviderCallBack.a(jdField_a_of_type_Long, jdField_a_of_type_Int, b, 1, b, false);
      }
    }
    else {
      return;
    }
    localIAIOImageProviderCallBack.a(jdField_a_of_type_Long, jdField_a_of_type_Int, b, 2, "step:" + jdField_a_of_type_ComTencentMobileqqPicPicInfoInterface$ErrInfo.a + ", desc:" + jdField_a_of_type_ComTencentMobileqqPicPicInfoInterface$ErrInfo.b, false);
  }
}
