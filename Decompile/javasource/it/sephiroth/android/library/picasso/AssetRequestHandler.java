package it.sephiroth.android.library.picasso;

import android.content.Context;
import android.content.res.AssetManager;
import android.net.Uri;
import java.io.IOException;
import java.util.List;

class AssetRequestHandler
  extends RequestHandler
{
  private static final int ASSET_PREFIX_LENGTH = "file:///android_asset/".length();
  private final AssetManager assetManager;
  
  public AssetRequestHandler(Context paramContext)
  {
    assetManager = paramContext.getAssets();
  }
  
  static String getFilePath(Request paramRequest)
  {
    return uri.toString().substring(ASSET_PREFIX_LENGTH);
  }
  
  public boolean canHandleRequest(Request paramRequest)
  {
    boolean bool2 = false;
    paramRequest = uri;
    boolean bool1 = bool2;
    if ("file".equals(paramRequest.getScheme()))
    {
      bool1 = bool2;
      if (!paramRequest.getPathSegments().isEmpty())
      {
        bool1 = bool2;
        if ("android_asset".equals(paramRequest.getPathSegments().get(0))) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public RequestHandler.Result load(Request paramRequest, int paramInt)
    throws IOException
  {
    return new RequestHandler.Result(assetManager.open(getFilePath(paramRequest)), Picasso.LoadedFrom.DISK);
  }
}
