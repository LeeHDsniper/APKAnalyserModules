package com.adobe.creativesdk.aviary.internal.cds;

import com.adobe.creativesdk.aviary.internal.cds.json.CdsContentParser;
import java.io.IOException;
import java.io.InputStream;
import org.json.JSONException;

final class CdsManifestPackContentDownloader
  extends CdsManifestContentDownloader<CdsContentParser>
{
  public CdsManifestPackContentDownloader(String paramString, boolean paramBoolean)
  {
    super(paramString, paramBoolean);
  }
  
  CdsContentParser parseStream(InputStream paramInputStream)
    throws IOException, JSONException
  {
    CdsContentParser localCdsContentParser = new CdsContentParser();
    if (localCdsContentParser.parse(paramInputStream) != 0) {
      throw new JSONException(localCdsContentParser.getStatus());
    }
    return localCdsContentParser;
  }
}
