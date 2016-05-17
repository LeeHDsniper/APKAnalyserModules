import com.tencent.mobileqq.activity.shortvideo.ShortVideoPreviewActivity;
import com.tencent.mobileqq.filemanager.util.FMDialogUtil.FMDialogInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mpi
  implements FMDialogUtil.FMDialogInterface
{
  public mpi(ShortVideoPreviewActivity paramShortVideoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    ShortVideoPreviewActivity.b(a);
    a.setResult(-1);
  }
  
  public void b() {}
}
