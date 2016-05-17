package com.tencent.qphone.base.util;

import LBS.Cell;
import android.telephony.CellLocation;
import android.telephony.PhoneStateListener;
import android.telephony.SignalStrength;
import android.telephony.TelephonyManager;
import android.telephony.gsm.GsmCellLocation;
import java.util.ArrayList;

final class d
  extends PhoneStateListener
{
  private short a = 0;
  
  d() {}
  
  public void onCellLocationChanged(CellLocation paramCellLocation)
  {
    if (paramCellLocation == null) {
      return;
    }
    for (;;)
    {
      try
      {
        if ((paramCellLocation instanceof GsmCellLocation))
        {
          c.a(new ArrayList());
          localCell = new Cell();
          iLac = ((GsmCellLocation)paramCellLocation).getLac();
          iCellId = ((GsmCellLocation)paramCellLocation).getCid();
          str = c.a().getNetworkOperator();
          if (str != null)
          {
            int i = str.length();
            if (i < 5) {}
          }
        }
      }
      catch (Exception localException)
      {
        Cell localCell;
        String str;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.i("LocationUtil", 2, "onCellLocationChanged exception:" + localException.getMessage());
        continue;
      }
      try
      {
        shMcc = Short.valueOf(str.substring(0, 3)).shortValue();
        shMnc = Short.valueOf(str.substring(3, 5)).shortValue();
        shRssi = a;
        if ((iLac != -1) && (iCellId != -1)) {
          c.b().add(0, localCell);
        }
        super.onCellLocationChanged(paramCellLocation);
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        localNumberFormatException.printStackTrace();
      }
    }
  }
  
  public void onSignalStrengthsChanged(SignalStrength paramSignalStrength)
  {
    if (paramSignalStrength.isGsm()) {
      if (paramSignalStrength.getGsmSignalStrength() != 99) {
        a = ((short)(paramSignalStrength.getGsmSignalStrength() * 2 - 113));
      }
    }
    for (;;)
    {
      super.onSignalStrengthsChanged(paramSignalStrength);
      return;
      a = ((short)paramSignalStrength.getGsmSignalStrength());
      continue;
      a = ((short)paramSignalStrength.getCdmaDbm());
    }
  }
}
