package com.adobe.creativesdk.aviary.internal.cds;

import com.adobe.creativesdk.aviary.internal.cds.json.CdsMessageContentParser;
import java.io.IOException;
import java.io.InputStream;
import org.json.JSONException;

final class CdsManifestMessageContentDownloader
  extends CdsManifestContentDownloader<CdsMessageContentParser>
{
  public CdsManifestMessageContentDownloader(String paramString, boolean paramBoolean)
  {
    super(paramString, paramBoolean);
  }
  
  CdsMessageContentParser parseStream(InputStream paramInputStream)
    throws IOException, JSONException
  {
    CdsMessageContentParser localCdsMessageContentParser = new CdsMessageContentParser();
    if (localCdsMessageContentParser.parse(paramInputStream) != 0) {
      throw new JSONException(localCdsMessageContentParser.getStatus());
    }
    return localCdsMessageContentParser;
  }
}
