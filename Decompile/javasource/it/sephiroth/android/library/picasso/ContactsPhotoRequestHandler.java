package it.sephiroth.android.library.picasso;

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Context;
import android.content.UriMatcher;
import android.net.Uri;
import android.os.Build.VERSION;
import android.provider.ContactsContract.Contacts;
import java.io.IOException;
import java.io.InputStream;

class ContactsPhotoRequestHandler
  extends RequestHandler
{
  private static final UriMatcher matcher = new UriMatcher(-1);
  private final Context context;
  
  static
  {
    matcher.addURI("com.android.contacts", "contacts/lookup/*/#", 1);
    matcher.addURI("com.android.contacts", "contacts/lookup/*", 1);
    matcher.addURI("com.android.contacts", "contacts/#/photo", 2);
    matcher.addURI("com.android.contacts", "contacts/#", 3);
    matcher.addURI("com.android.contacts", "display_photo/#", 4);
  }
  
  ContactsPhotoRequestHandler(Context paramContext)
  {
    context = paramContext;
  }
  
  private InputStream getInputStream(Request paramRequest)
    throws IOException
  {
    ContentResolver localContentResolver = context.getContentResolver();
    Uri localUri = uri;
    paramRequest = localUri;
    switch (matcher.match(localUri))
    {
    default: 
      throw new IllegalStateException("Invalid uri: " + localUri);
    case 1: 
      localUri = ContactsContract.Contacts.lookupContact(localContentResolver, localUri);
      paramRequest = localUri;
      if (localUri == null) {
        return null;
      }
    case 3: 
      if (Build.VERSION.SDK_INT < 14) {
        return ContactsContract.Contacts.openContactPhotoInputStream(localContentResolver, paramRequest);
      }
      return ContactPhotoStreamIcs.get(localContentResolver, paramRequest);
    }
    return localContentResolver.openInputStream(localUri);
  }
  
  public boolean canHandleRequest(Request paramRequest)
  {
    Uri localUri = uri;
    return ("content".equals(localUri.getScheme())) && (ContactsContract.Contacts.CONTENT_URI.getHost().equals(localUri.getHost())) && (matcher.match(uri) != -1);
  }
  
  public RequestHandler.Result load(Request paramRequest, int paramInt)
    throws IOException
  {
    paramRequest = getInputStream(paramRequest);
    if (paramRequest != null) {
      return new RequestHandler.Result(paramRequest, Picasso.LoadedFrom.DISK);
    }
    return null;
  }
  
  @TargetApi(14)
  private static class ContactPhotoStreamIcs
  {
    static InputStream get(ContentResolver paramContentResolver, Uri paramUri)
    {
      return ContactsContract.Contacts.openContactPhotoInputStream(paramContentResolver, paramUri, true);
    }
  }
}
