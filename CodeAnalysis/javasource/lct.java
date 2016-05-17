import com.tencent.mobileqq.activity.aio.photo.AIOGalleryActivity;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaData;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProviderCallBack.Stub;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lct
  extends IAIOImageProviderCallBack.Stub
{
  lct(lcs paramLcs)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(long paramLong1, int paramInt1, int paramInt2, int paramInt3, long paramLong2, boolean paramBoolean)
  {
    a.a.runOnUiThread(new lcv(this, paramLong1, paramInt1, paramInt2, paramInt3, paramLong2, paramBoolean));
  }
  
  public void a(long paramLong, int paramInt1, int paramInt2, int paramInt3, String paramString, boolean paramBoolean)
  {
    a.a.runOnUiThread(new lcu(this, paramBoolean, paramLong, paramInt1, paramInt2, paramInt3, paramString));
  }
  
  public void a(AIORichMediaData[] paramArrayOfAIORichMediaData, int paramInt)
  {
    a.a.runOnUiThread(new lcw(this, paramArrayOfAIORichMediaData, paramInt));
  }
}
