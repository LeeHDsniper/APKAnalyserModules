package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import java.io.File;
import junit.framework.Assert;

final class CdsPreviewValidator
  extends CdsValidatorFactory.Validator
{
  public CdsPreviewValidator(Cds.PackType paramPackType)
  {
    super(paramPackType);
  }
  
  public boolean validate(Context paramContext, long paramLong, File paramFile, boolean paramBoolean)
  {
    Assert.assertNotNull("input dir is null", paramFile);
    Assert.assertNotNull("context is null", paramContext);
    paramContext = paramContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(paramContext, "pack/" + paramLong + "/item/list"), new String[] { "item_id", "item_identifier" }, null, null, null);
    Assert.assertNotNull("cursor is null", paramContext);
    String str = Cds.getPreviewItemExt(mPackType);
    if (paramContext != null)
    {
      for (;;)
      {
        try
        {
          int i = paramContext.getColumnIndex("item_identifier");
          if (i > -1)
          {
            paramBoolean = true;
            Assert.assertTrue("index column < 0", paramBoolean);
            if (paramContext.getCount() <= 0) {
              break label241;
            }
            paramBoolean = true;
            Assert.assertTrue("cursor is empty", paramBoolean);
            if (!paramContext.moveToNext()) {
              break;
            }
            Object localObject = paramContext.getString(i);
            Assert.assertNotNull("identifier is null", localObject);
            localObject = new File(paramFile, (String)localObject + str);
            Assert.assertTrue("file '" + ((File)localObject).getAbsolutePath() + "' does not exists", ((File)localObject).exists());
            continue;
          }
          paramBoolean = false;
        }
        finally
        {
          IOUtils.closeSilently(paramContext);
        }
        continue;
        label241:
        paramBoolean = false;
      }
      IOUtils.closeSilently(paramContext);
      return true;
    }
    return false;
  }
}
