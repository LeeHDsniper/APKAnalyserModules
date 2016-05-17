import android.os.SystemClock;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.MyAdapter;
import com.tencent.mobileqq.activity.photo.FlowThumbDecoder;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class leu
  implements Runnable
{
  public leu(PhotoListPanel paramPhotoListPanel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    long l = SystemClock.uptimeMillis();
    List localList = AlbumUtil.c(a.jdField_a_of_type_AndroidAppActivity, "$RecentAlbumId", null, 100, a.jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter);
    if (QLog.isColorLevel()) {
      QLog.d("PhotoListPanel", 2, "get album medias cost: " + (SystemClock.uptimeMillis() - l));
    }
    if (localList == null) {
      return;
    }
    int m = localList.size();
    a.b = new ArrayList(localList.size());
    int k = 0;
    int j = 0;
    int i;
    if (k < m)
    {
      localObject = (LocalMediaInfo)localList.get(k);
      if (jdField_a_of_type_JavaLangString == null) {}
      for (;;)
      {
        k += 1;
        break;
        int n = AlbumUtil.a((LocalMediaInfo)localObject);
        if (n == 0)
        {
          a.b.add(jdField_a_of_type_JavaLangString);
          i = j;
        }
        for (;;)
        {
          jdField_a_of_type_JavaLangInteger = Integer.valueOf(k - i);
          if ((jdField_a_of_type_Int != 90) && (jdField_a_of_type_Int != 270)) {
            break label296;
          }
          f = a.c;
          g = 0;
          j = i;
          if (i <= 0) {
            break;
          }
          j = i;
          if (j <= 0) {
            break;
          }
          FlowThumbDecoder.a((LocalMediaInfo)localObject, i, j);
          j = f;
          f = g;
          g = j;
          j = i;
          break;
          i = j;
          if (n == 1) {
            i = j + 1;
          }
        }
        label296:
        f = 0;
        g = a.c;
        j = i;
        if (i > 0)
        {
          j = i;
          if (j > 0)
          {
            FlowThumbDecoder.a((LocalMediaInfo)localObject, i, j);
            j = i;
          }
        }
      }
    }
    Object localObject = a.jdField_a_of_type_JavaUtilLinkedList.iterator();
    label470:
    for (;;)
    {
      if (((Iterator)localObject).hasNext())
      {
        String str = (String)((Iterator)localObject).next();
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
        {
          LocalMediaInfo localLocalMediaInfo = (LocalMediaInfo)localIterator.next();
          if (str.equals(jdField_a_of_type_JavaLangString)) {
            jdField_a_of_type_Boolean = true;
          }
        }
      }
      for (i = 1;; i = 0)
      {
        if (i != 0) {
          break label470;
        }
        ((Iterator)localObject).remove();
        break;
        a.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.b(localList);
        return;
      }
    }
  }
}
