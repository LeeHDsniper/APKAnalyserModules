import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.photo.AlbumListActivity;
import com.tencent.mobileqq.activity.photo.AlbumListAdapter;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.data.QQAlbumInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import cooperation.qzone.QZoneHelper;
import cooperation.qzone.QZoneHelper.UserInfo;
import mqq.app.AppRuntime;

public class lzt
  implements AdapterView.OnItemClickListener
{
  private lzt(AlbumListActivity paramAlbumListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = a.jdField_a_of_type_ComTencentMobileqqActivityPhotoAlbumListAdapter.a(paramInt);
    if ((paramAdapterView == null) || (mMediaFileCount <= 0) || (TextUtils.isEmpty(name)))
    {
      QQToast.a(a, 2131370000, 0).a();
      return;
    }
    if (_id == "qzone_album")
    {
      paramView = a.getIntent();
      paramAdapterView = paramView.getExtras();
      paramAdapterView.putInt("key_personal_album_enter_model", 1);
      paramAdapterView.putInt("PhotoConst.CURRENT_QUALITY_TYPE", paramView.getIntExtra("PhotoConst.CURRENT_QUALITY_TYPE", 0));
      paramAdapterView.putSerializable("PhotoConst.PHOTO_INFOS", paramView.getSerializableExtra("PhotoConst.PHOTO_INFOS"));
      paramAdapterView.putBoolean("PhotoConst.IS_SHOW_QZONE_ALBUM", true);
      paramAdapterView.putLong("PhotoConst.QZONE_ALBUM_NUM", paramView.getLongExtra("PhotoConst.QZONE_ALBUM_NUM", 0L));
      paramAdapterView.putStringArrayList("PhotoConst.PHOTO_PATHS", paramView.getStringArrayListExtra("PhotoConst.PHOTO_PATHS"));
      paramView = QZoneHelper.UserInfo.a();
      jdField_a_of_type_JavaLangString = BaseApplicationImpl.a().a().getAccount();
      c = BaseApplicationImpl.a().a().getSid();
      paramAdapterView.putString("keyAction", "actionSelectPicture");
      QZoneHelper.a(a, paramView, paramAdapterView, 0);
      a.finish();
      AlbumUtil.a(a, true, true);
      return;
    }
    paramView = a.getIntent();
    paramView.putExtra("ALBUM_ID", _id);
    paramView.putExtra("ALBUM_NAME", name);
    paramView.putExtra("PhotoConst.CURRENT_QUALITY_TYPE", paramView.getIntExtra("PhotoConst.CURRENT_QUALITY_TYPE", 0));
    paramView.putExtra("album_enter_directly", false);
    AlbumListActivity.a(a, true);
    paramView.setClass(a, PhotoListActivity.class);
    paramView.addFlags(603979776);
    a.startActivity(paramView);
    if ("$VideoAlbumId".equals(_id)) {
      ReportController.b(null, "CliOper", "", "", "0X8006131", "0X8006131", 0, 0, "", "", "", "");
    }
    try
    {
      a.finish();
      AlbumUtil.a(a, true, true);
      return;
    }
    catch (Exception paramAdapterView)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d(AlbumListActivity.jdField_a_of_type_JavaLangString, 2, "onItemClick finish() exception=" + paramAdapterView.getMessage());
        }
      }
    }
  }
}
