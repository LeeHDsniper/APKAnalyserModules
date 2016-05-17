import com.tencent.mobileqq.activity.photo.AlbumListAdapter;
import com.tencent.mobileqq.activity.photo.MediaFileFilter;
import com.tencent.mobileqq.data.QQAlbumInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.LogTag;
import com.tencent.qphone.base.util.QLog;

public class maa
  implements Runnable
{
  public maa(AlbumListAdapter paramAlbumListAdapter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    LogTag.a();
    QQAlbumInfo localQQAlbumInfo = a.c(a.jdField_a_of_type_AndroidAppActivity, 210, 100, a.jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter);
    a.b(localQQAlbumInfo);
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter.b()))
    {
      localQQAlbumInfo = a.a(a.jdField_a_of_type_AndroidAppActivity);
      if (mMediaFileCount <= 0) {
        break label113;
      }
      a.d(localQQAlbumInfo);
      if (QLog.isColorLevel()) {
        QLog.d("AlbumListAdapter", 2, "queryAlbumList() run postVideoAlbum()");
      }
    }
    for (;;)
    {
      LogTag.a("PEAK", "queryRecentBucket");
      return;
      label113:
      if (QLog.isColorLevel()) {
        QLog.d("AlbumListAdapter", 2, "queryAlbumList() DON'T run postVideoAlbum()");
      }
    }
  }
}
