import android.os.AsyncTask;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.utils.LogTag;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.GestureSelectGridView;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

public class mbl
  extends AsyncTask
{
  mbl(PhotoListActivity paramPhotoListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected List a(Object... paramVarArgs)
  {
    LogTag.a();
    int i = -1;
    if (a.j.equals("$RecentAlbumId")) {
      i = 100;
    }
    paramVarArgs = AlbumUtil.c(a, a.j, a.i, i, a.jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaFileFilter);
    LogTag.a("PEAK", "getAlbumMedias");
    if (paramVarArgs == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("SelectPhotoTrace", 2, "photoList is null");
      }
      return null;
    }
    Object localObject;
    int j;
    if ((a.c != null) && (a.c.size() != 0)) {
      for (i = 0; i < a.c.size(); i = j + 1)
      {
        localObject = (String)a.c.get(i);
        j = i;
        if (!new File((String)localObject).exists()) {
          if ((((String)localObject).startsWith("http")) && (a.jdField_a_of_type_JavaUtilHashMap != null))
          {
            j = i;
            if (a.jdField_a_of_type_JavaUtilHashMap.containsKey(localObject)) {}
          }
          else
          {
            a.c.remove(i);
            j = i - 1;
          }
        }
      }
    }
    a.jdField_s_of_type_Int = 0;
    long l1 = System.currentTimeMillis();
    long l2 = AlbumUtil.c;
    if (AlbumUtil.jdField_a_of_type_JavaUtilHashMap.containsKey(a.j)) {}
    for (int k = ((Integer)AlbumUtil.jdField_a_of_type_JavaUtilHashMap.get(a.j)).intValue();; k = 0)
    {
      int n = paramVarArgs.size();
      localObject = new ArrayList(n);
      i = 0;
      int m = 0;
      if (m < paramVarArgs.size())
      {
        LocalMediaInfo localLocalMediaInfo = (LocalMediaInfo)paramVarArgs.get(m);
        if (jdField_a_of_type_JavaLangString == null) {}
        for (;;)
        {
          m += 1;
          break;
          int i1 = AlbumUtil.a(localLocalMediaInfo);
          if (i1 == 0)
          {
            ((ArrayList)localObject).add(jdField_a_of_type_JavaLangString);
            j = i;
          }
          for (;;)
          {
            jdField_a_of_type_JavaLangInteger = Integer.valueOf(m - j);
            if (!a.c.contains(jdField_a_of_type_JavaLangString)) {
              break label507;
            }
            jdField_b_of_type_Int = 1;
            if (!a.d.contains(jdField_a_of_type_JavaLangInteger)) {
              a.d.add(jdField_a_of_type_JavaLangInteger);
            }
            i = j;
            if (!a.B) {
              break;
            }
            i = j;
            if (i1 != 1) {
              break;
            }
            PhotoListActivity localPhotoListActivity = a;
            jdField_s_of_type_Int += 1;
            i = j;
            if (a.jdField_s_of_type_Int != 1) {
              break;
            }
            a.jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = localLocalMediaInfo;
            i = j;
            break;
            j = i;
            if (i1 == 1) {
              j = i + 1;
            }
          }
          label507:
          if ((a.c.size() < a.n) && (a.u != null) && (jdField_a_of_type_JavaLangString.equals(a.u)))
          {
            jdField_b_of_type_Int = 1;
            a.c.add(jdField_a_of_type_JavaLangString);
            a.d.add(jdField_a_of_type_JavaLangInteger);
            i = j;
          }
          else if ((a.p) && (l1 - l2 <= 60000L) && (k == paramVarArgs.size()) && (jdField_a_of_type_JavaLangString.equals(AlbumUtil.jdField_a_of_type_JavaLangString)))
          {
            jdField_b_of_type_Int = 3;
            i = j;
          }
          else
          {
            jdField_b_of_type_Int = 2;
            i = j;
          }
        }
      }
      if (n > 1000) {
        PhotoListActivity.jdField_a_of_type_JavaUtilArrayList = (ArrayList)localObject;
      }
      for (a.jdField_s_of_type_Boolean = true;; a.jdField_s_of_type_Boolean = false)
      {
        return paramVarArgs;
        a.b = ((ArrayList)localObject);
      }
    }
  }
  
  protected void a(List paramList)
  {
    int m = 0;
    a.c();
    Object localObject;
    if (paramList == null)
    {
      localObject = paramList;
      if (a.w)
      {
        localObject = paramList;
        if (a.j.equals("$RecentAlbumId"))
        {
          paramList = new LocalMediaInfo();
          jdField_b_of_type_JavaLangString = "mobileqq/camera";
          localObject = new ArrayList();
          ((List)localObject).add(0, paramList);
        }
      }
      a.jdField_a_of_type_Mbi.a((List)localObject);
      a.jdField_a_of_type_Mbi.notifyDataSetChanged();
      a.d();
      QQToast.a(a, "暂无媒体文件", 1000).a();
      return;
    }
    if ((a.w) && (a.j.equals("$RecentAlbumId")))
    {
      localObject = new LocalMediaInfo();
      jdField_b_of_type_JavaLangString = "mobileqq/camera";
      paramList.add(0, localObject);
    }
    a.jdField_a_of_type_Mbi.a(paramList);
    if (paramList.isEmpty()) {
      QQToast.a(a, "暂无媒体文件", 1000).a();
    }
    int i;
    if (a.e)
    {
      a.e = false;
      i = PhotoListActivity.q;
      if (i != -1) {
        break label519;
      }
      localObject = (LinkedHashMap)AlbumUtil.b.get(a.j);
      if (localObject == null) {
        break label555;
      }
      j = ((LinkedHashMap)localObject).size();
      if (j <= 0) {
        break label555;
      }
    }
    label427:
    label456:
    label503:
    label519:
    label555:
    for (int j = ((Integer)((LinkedHashMap)localObject).get(localObject.keySet().toArray()[(j - 1)])).intValue();; j = i)
    {
      i = j;
      int k;
      if (j == -1)
      {
        i = j;
        if (a.p)
        {
          localObject = paramList.iterator();
          k = 0;
          i = j;
          if (((Iterator)localObject).hasNext())
          {
            if (nextjdField_b_of_type_Int != 3) {
              break label503;
            }
            i = k;
          }
        }
      }
      if ((i == -1) && (a.j.equals("$RecentAlbumId")) && (!a.c.isEmpty()))
      {
        k = paramList.size();
        localObject = (String)a.c.get(a.c.size() - 1);
        j = 0;
        if (j < k) {
          if (((String)localObject).equals(getjdField_a_of_type_JavaLangString)) {
            i = j;
          }
        }
      }
      for (;;)
      {
        j = a.jdField_a_of_type_Mbi.getCount();
        if (j == 0) {
          j = m;
        }
        for (;;)
        {
          a.jdField_a_of_type_ComTencentWidgetGestureSelectGridView.setSelection(j);
          a.jdField_a_of_type_Mbi.notifyDataSetChanged();
          a.d();
          return;
          k += 1;
          break;
          j += 1;
          break label427;
          PhotoListActivity.q = -1;
          break label456;
          if (i > j - 1)
          {
            j -= 1;
          }
          else
          {
            j = m;
            if (i >= 0) {
              j = i;
            }
          }
        }
      }
    }
  }
  
  protected void onPreExecute()
  {
    super.onPreExecute();
    a.b();
  }
}
