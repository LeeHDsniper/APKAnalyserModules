package it.sephiroth.android.library.picasso;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import java.io.IOException;

class ResourceRequestHandler
  extends RequestHandler
{
  private final Context context;
  
  ResourceRequestHandler(Context paramContext)
  {
    context = paramContext;
  }
  
  private static Bitmap decodeResource(Resources paramResources, int paramInt, Request paramRequest)
  {
    BitmapFactory.Options localOptions = createBitmapOptions(paramRequest);
    if (requiresInSampleSize(localOptions))
    {
      BitmapFactory.decodeResource(paramResources, paramInt, localOptions);
      calculateInSampleSize(targetWidth, targetHeight, localOptions, paramRequest);
    }
    return BitmapFactory.decodeResource(paramResources, paramInt, localOptions);
  }
  
  public boolean canHandleRequest(Request paramRequest)
  {
    if (resourceId != 0) {
      return true;
    }
    return "android.resource".equals(uri.getScheme());
  }
  
  public RequestHandler.Result load(Request paramRequest, int paramInt)
    throws IOException
  {
    Resources localResources = Utils.getResources(context, paramRequest);
    return new RequestHandler.Result(decodeResource(localResources, Utils.getResourceId(localResources, paramRequest), paramRequest), Picasso.LoadedFrom.DISK);
  }
}
