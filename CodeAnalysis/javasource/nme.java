import android.os.Bundle;
import android.os.SystemClock;
import com.tencent.map.geolocation.TencentLocation;
import com.tencent.map.geolocation.TencentLocationListener;
import com.tencent.map.geolocation.internal.TencentExtraKeys;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import mqq.os.MqqHandler;

public final class nme
  implements TencentLocationListener
{
  public nme()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onLocationChanged(TencentLocation paramTencentLocation, int paramInt, String paramString)
  {
    boolean bool4;
    long l;
    String str;
    boolean bool1;
    int k;
    boolean bool5;
    Object localObject7;
    label112:
    Object localObject2;
    Object localObject1;
    label151:
    int i;
    label222:
    boolean bool2;
    Object localObject4;
    Object localObject6;
    Object localObject5;
    Object localObject3;
    Object localObject8;
    if (paramInt == 0)
    {
      bool4 = true;
      com.tencent.mobileqq.app.NearbyHandler.d = paramInt;
      l = SystemClock.elapsedRealtime() - SosoInterface.a() - SosoInterface.a();
      SosoInterface.a(SystemClock.elapsedRealtime());
      SosoInterface.a(2000);
      str = paramTencentLocation.getExtra().getString("qq_caller");
      bool1 = paramTencentLocation.getExtra().getBoolean("qq_goonListener");
      k = paramTencentLocation.getExtra().getInt("qq_level");
      bool5 = paramTencentLocation.getExtra().getBoolean("qq_reqLocation");
      localObject7 = TencentExtraKeys.getRawData(paramTencentLocation);
      if (bool5)
      {
        if (!bool4) {
          break label619;
        }
        SosoInterface.b(0);
      }
      if (QLog.isColorLevel())
      {
        localObject2 = new StringBuilder().append("onLocationChanged() err=").append(paramInt);
        if ((paramString != null) && (paramString.length() != 0)) {
          break label626;
        }
        localObject1 = "";
        localObject1 = ((StringBuilder)localObject2).append((String)localObject1).append(" detail=").append(paramInt).append(" caller=").append(str).append(" level=").append(k).append(" reqLocation=").append(bool5).append(" consume=").append(l).append(" rawData=");
        if (localObject7 != null) {
          break label650;
        }
        i = 0;
        QLog.d("SOSO.LBS", 2, i + " isGoonCallback=" + bool1 + " failInt=" + SosoInterface.c());
      }
      bool2 = false;
      bool1 = false;
      localObject4 = null;
      localObject6 = null;
      localObject5 = null;
      localObject2 = null;
      localObject3 = null;
      localObject1 = null;
      localObject8 = SosoInterface.a;
      if ((paramInt == 0) && (!bool5)) {}
    }
    boolean bool3;
    for (;;)
    {
      try
      {
        SosoInterface.a(k, paramTencentLocation);
        if ((localObject7 != null) && (localObject7.length > 0)) {
          SosoInterface.a(paramTencentLocation.getProvider(), (byte[])localObject7);
        }
        if (SosoInterface.a().size() <= 0) {
          break label1056;
        }
        if (bool5)
        {
          localSosoLbsInfo = SosoInterface.b();
          i = SosoInterface.a().size() - 1;
          paramTencentLocation = localObject6;
          localObject3 = localObject1;
          localObject5 = localObject2;
          localObject4 = paramTencentLocation;
          bool2 = bool1;
          if (i < 0) {
            break label1056;
          }
          localObject3 = (SosoInterface.OnLocationListener)SosoInterface.a().get(i);
          if (g == bool5) {
            if (g)
            {
              if (jdField_b_of_type_Int != 1) {
                continue;
              }
              if (jdField_b_of_type_Int != k) {}
            }
            else
            {
              if (!e) {
                continue;
              }
              SosoInterface.a((SosoInterface.OnLocationListener)localObject3, paramInt, localSosoLbsInfo);
              if (!f) {
                break label696;
              }
              if (QLog.isColorLevel()) {
                QLog.d("SOSO.LBS", 2, "onLocationChanged() lis=" + jdField_b_of_type_JavaLangString + " goon...");
              }
            }
          }
          localObject7 = localObject1;
          localObject6 = localObject2;
          localObject5 = paramTencentLocation;
          bool3 = bool1;
          if (SosoInterface.OnLocationListener.a((SosoInterface.OnLocationListener)localObject3)) {
            break label1454;
          }
          if (!f) {
            break label779;
          }
          if (localObject2 != null) {
            break label755;
          }
          localObject4 = localObject3;
          if (SosoInterface.OnLocationListener.b((SosoInterface.OnLocationListener)localObject3)) {
            localObject1 = localObject3;
          }
          localObject7 = localObject1;
          localObject6 = localObject4;
          localObject5 = paramTencentLocation;
          bool3 = bool1;
          if (SosoInterface.c() <= 0) {
            break label1454;
          }
          ((SosoInterface.OnLocationListener)localObject3).a(paramInt, SosoInterface.c());
          localObject3 = localObject1;
          localObject1 = localObject4;
          localObject2 = paramTencentLocation;
          paramTencentLocation = (TencentLocation)localObject3;
          i -= 1;
          localObject3 = localObject2;
          localObject2 = localObject1;
          localObject1 = paramTencentLocation;
          paramTencentLocation = (TencentLocation)localObject3;
          continue;
          bool4 = false;
          break;
          label619:
          SosoInterface.b();
          break label112;
          label626:
          localObject1 = " reason=" + paramString;
          break label151;
          label650:
          i = localObject7.length;
          break label222;
        }
        SosoInterface.SosoLbsInfo localSosoLbsInfo = SosoInterface.a();
        continue;
        if (jdField_b_of_type_Int > k) {
          continue;
        }
        continue;
        ((SosoInterface.OnLocationListener)localObject3).a(paramInt, localSosoLbsInfo);
        continue;
        SosoInterface.a().remove(i);
      }
      finally {}
      label696:
      SosoInterface.OnLocationListener.a((SosoInterface.OnLocationListener)localObject3, true);
      if (QLog.isColorLevel())
      {
        QLog.d("SOSO.LBS", 2, "onLocationChanged() lis=" + jdField_b_of_type_JavaLangString + " removed normally.");
        continue;
        label755:
        localObject4 = localObject2;
        if (jdField_b_of_type_Int < jdField_b_of_type_Int) {
          localObject4 = localObject3;
        }
      }
    }
    label779:
    label827:
    int j;
    if (SystemClock.elapsedRealtime() - d > 30000L)
    {
      SosoInterface.a().remove(i);
      SosoInterface.OnLocationListener.a((SosoInterface.OnLocationListener)localObject3, true);
      if (g)
      {
        localObject4 = SosoInterface.b();
        break label1418;
        ((SosoInterface.OnLocationListener)localObject3).a(j, (SosoInterface.SosoLbsInfo)localObject4);
        if (!QLog.isColorLevel()) {
          break label1431;
        }
        QLog.d("SOSO.LBS", 2, "lis=" + jdField_b_of_type_JavaLangString + " err_timeout.reqRaw=" + g + ". Force 2 remove it.");
        break label1431;
      }
      else
      {
        localObject4 = SosoInterface.a();
      }
    }
    else
    {
      if (!g) {
        break label1472;
      }
      if (paramTencentLocation == null)
      {
        localObject4 = localObject3;
        bool2 = bool1;
      }
    }
    for (;;)
    {
      localObject7 = localObject1;
      localObject6 = localObject2;
      localObject5 = localObject4;
      bool3 = bool2;
      if (QLog.isColorLevel())
      {
        QLog.d("SOSO.LBS", 2, "onLocationChanged() lis=" + jdField_b_of_type_JavaLangString + " goon=" + f + " reqLocation=" + g + " hasReqRaw=" + bool2);
        localObject7 = localObject1;
        localObject6 = localObject2;
        localObject5 = localObject4;
        bool3 = bool2;
        break label1454;
        localObject4 = paramTencentLocation;
        bool2 = bool1;
        if (jdField_b_of_type_Int >= jdField_b_of_type_Int) {
          continue;
        }
        localObject4 = localObject3;
        bool2 = bool1;
        continue;
        label1056:
        SosoInterface.a().set(0);
        if (SosoInterface.a().size() == 0)
        {
          if (QLog.isColorLevel()) {
            QLog.d("SOSO.LBS", 4, "listener is empty.");
          }
          SosoInterface.b();
        }
        for (;;)
        {
          SosoInterface.a(bool4, bool5, l, paramInt, paramInt, str, paramString);
          return;
          if (bool2)
          {
            if (QLog.isColorLevel())
            {
              localObject1 = new StringBuilder().append("onLocationChanged()");
              if (localObject5 != null) {
                break label1181;
              }
            }
            label1181:
            for (paramTencentLocation = "";; paramTencentLocation = " goonLis been truncated:" + jdField_b_of_type_JavaLangString)
            {
              QLog.d("SOSO.LBS", 2, paramTencentLocation + " start:reqRawData");
              if (localObject3 != null) {
                SosoInterface.OnLocationListener.b((SosoInterface.OnLocationListener)localObject3, false);
              }
              SosoInterface.a(SosoInterface.a());
              break;
            }
          }
          if (localObject4 != null)
          {
            if (QLog.isColorLevel())
            {
              localObject1 = new StringBuilder().append("onLocationChanged()");
              if (localObject5 != null) {
                break label1291;
              }
            }
            label1291:
            for (paramTencentLocation = "";; paramTencentLocation = " goonLis been truncated:" + jdField_b_of_type_JavaLangString)
            {
              QLog.d("SOSO.LBS", 2, paramTencentLocation + " start:" + jdField_b_of_type_JavaLangString);
              if (localObject3 != null) {
                SosoInterface.OnLocationListener.b((SosoInterface.OnLocationListener)localObject3, false);
              }
              SosoInterface.a((SosoInterface.OnLocationListener)localObject4);
              break;
            }
          }
          if (localObject5 != null)
          {
            if (QLog.isColorLevel()) {
              QLog.d("SOSO.LBS", 2, "onLocationChanged() goonLis goon after 1000ms:" + jdField_b_of_type_JavaLangString);
            }
            if ((localObject3 != null) && (localObject3 != localObject5)) {
              SosoInterface.OnLocationListener.b((SosoInterface.OnLocationListener)localObject3, false);
            }
            if ((!SosoInterface.OnLocationListener.b((SosoInterface.OnLocationListener)localObject5)) && (!SosoInterface.OnLocationListener.a((SosoInterface.OnLocationListener)localObject5))) {
              ThreadManager.b().postDelayed(new nmf(this, (SosoInterface.OnLocationListener)localObject5), 1000L);
            }
          }
        }
        label1418:
        if (localObject4 == null)
        {
          j = 55536;
          break label827;
          label1431:
          localObject3 = paramTencentLocation;
          paramTencentLocation = (TencentLocation)localObject1;
          localObject1 = localObject2;
          localObject2 = localObject3;
          break;
        }
        j = 0;
        break label827;
      }
      label1454:
      paramTencentLocation = (TencentLocation)localObject7;
      localObject1 = localObject6;
      localObject2 = localObject5;
      bool1 = bool3;
      break;
      label1472:
      bool2 = true;
      localObject4 = paramTencentLocation;
    }
  }
  
  public void onStatusUpdate(String paramString1, int paramInt, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SOSO.LBS", 2, "onStatusUpdate name: " + paramString1 + " status: " + paramInt + " desc: " + paramString2);
    }
  }
}
