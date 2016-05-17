import com.tencent.mobileqq.activity.photo.AlbumListAdapter;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.activity.photo.StatisticConstants;
import com.tencent.mobileqq.data.QQAlbumInfo;
import com.tencent.mobileqq.filemanager.util.FileUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

public class lzv
  implements Runnable
{
  public lzv(AlbumListAdapter paramAlbumListAdapter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i6 = 0;
    int i5 = 0;
    int i4 = 0;
    int j = 0;
    int i = 0;
    int i3 = 0;
    int i2 = 0;
    int i1 = 0;
    int n = 0;
    int m = 0;
    int k = 0;
    Object localObject = new ArrayList(a.a.size());
    ((List)localObject).addAll(a.a);
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      QQAlbumInfo localQQAlbumInfo = (QQAlbumInfo)((Iterator)localObject).next();
      if ((localQQAlbumInfo != null) && (mCoverInfo != null))
      {
        String str2 = FileUtil.b(mCoverInfo.a);
        String str1 = name;
        if ((str2 != null) && (str1 != null) && (!str1.equals("最近照片")) && (!str1.equals("空间照片")))
        {
          str2 = str2.toLowerCase(Locale.US);
          str1 = str1.toLowerCase(Locale.US);
          if (str2.contains("/tencent/"))
          {
            if (str2.contains("/qq_collection/")) {
              i3 += mMediaFileCount;
            } else if ((str1.equals("qq_images")) || (str2.contains("/mobileqq/photo")) || (str2.contains("/mobileqq/diskcache"))) {
              i2 += mMediaFileCount;
            } else if (str1.equals("qqfile_recv")) {
              i1 += mMediaFileCount;
            } else if (str1.equals("qq_favorite")) {
              m += mMediaFileCount;
            } else if (str2.contains("/zebra/cache")) {
              n += 1;
            } else if ((str1.equals("weixin")) || (str1.equals("wechat")) || (str1.equals("micromsg"))) {
              k += mMediaFileCount;
            } else if (StatisticConstants.a(str2)) {
              j += mMediaFileCount;
            } else {
              i += mMediaFileCount;
            }
          }
          else if (str1.equals("qq_screenshot")) {
            i5 += mMediaFileCount;
          } else if ((str2.contains("screenshot")) || (str2.contains("截屏")) || (str2.contains("截图")) || (str2.equals("screen_cap")) || (str2.equals("ScreenCapture"))) {
            i4 += mMediaFileCount;
          } else if ((str1.contains("camera")) || (str1.equals("dcim")) || (str1.equals("100MEDIA")) || (str1.equals("100ANDRO")) || (str1.contains("相机")) || (str1.contains("照片")) || (str1.contains("相片"))) {
            i6 += mMediaFileCount;
          } else if (StatisticConstants.a(str2)) {
            j += mMediaFileCount;
          } else {
            i += mMediaFileCount;
          }
        }
      }
    }
    StatisticConstants.a(i6, i5, i4, j, i, i3, i2, i1, n, m, k);
  }
}
