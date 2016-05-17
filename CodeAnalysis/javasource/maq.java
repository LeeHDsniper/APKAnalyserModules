import android.media.MediaMetadataRetriever;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.activity.photo.MediaDatabaseHelper;
import com.tencent.mobileqq.activity.photo.MediaScanner;
import com.tencent.mobileqq.activity.photo.MediaScanner.OnMediaScannerListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;

public class maq
  implements Runnable
{
  public maq(MediaScanner paramMediaScanner, WeakReference paramWeakReference1, WeakReference paramWeakReference2, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      LocalMediaInfo localLocalMediaInfo = (LocalMediaInfo)jdField_a_of_type_JavaLangRefWeakReference.get();
      MediaScanner.OnMediaScannerListener localOnMediaScannerListener = (MediaScanner.OnMediaScannerListener)b.get();
      if (localLocalMediaInfo != null)
      {
        if (localOnMediaScannerListener == null) {
          return;
        }
        MediaMetadataRetriever localMediaMetadataRetriever = new MediaMetadataRetriever();
        localMediaMetadataRetriever.setDataSource(a);
        e = Long.parseLong(localMediaMetadataRetriever.extractMetadata(9));
        localOnMediaScannerListener.a(jdField_a_of_type_Int, localLocalMediaInfo);
        MediaScanner.a(MediaScanner.a(BaseApplicationImpl.getContext())).a(a, e);
        return;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d(MediaScanner.a, 2, "queryMediaInfoDuration() error=" + localException.getMessage());
      }
    }
  }
}
