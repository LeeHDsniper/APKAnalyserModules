package com.behance.sdk.files;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore.Images.Media;
import com.behance.sdk.dto.BehanceSDKAlbumDTO;
import com.behance.sdk.enums.BehanceSDKAlbumType;
import com.behance.sdk.project.modules.ImageModule;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class LocalImageLoader
{
  private static List<BehanceSDKAlbumDTO> albumsAndImageSourcesList;
  private static volatile boolean cacheCleared = false;
  private static volatile boolean inProgress = false;
  private static Object lockObject = new Object();
  
  public static void clearCachedAlbumAndImagesData()
  {
    synchronized (lockObject)
    {
      if (albumsAndImageSourcesList == null) {
        break label104;
      }
      Iterator localIterator = albumsAndImageSourcesList.iterator();
      while (localIterator.hasNext())
      {
        Object localObject3 = ((BehanceSDKAlbumDTO)localIterator.next()).getImages();
        if ((localObject3 != null) && (!((List)localObject3).isEmpty()))
        {
          localObject3 = ((List)localObject3).iterator();
          if (((Iterator)localObject3).hasNext()) {
            ((ImageModule)((Iterator)localObject3).next()).recycleBitmaps();
          }
        }
      }
    }
    albumsAndImageSourcesList.clear();
    albumsAndImageSourcesList = null;
    label104:
    if (inProgress) {
      cacheCleared = true;
    }
  }
  
  public static List<BehanceSDKAlbumDTO> getAlbumsList(Context arg0, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramBoolean1) || (albumsAndImageSourcesList == null) || (albumsAndImageSourcesList.isEmpty()))
    {
      synchronized (lockObject)
      {
        inProgress = true;
        cacheCleared = false;
        ??? = getListOfAlbums(???);
      }
      synchronized (lockObject)
      {
        albumsAndImageSourcesList = new ArrayList();
        if (cacheCleared)
        {
          cacheCleared = false;
          ??? = albumsAndImageSourcesList;
          return ???;
          ??? = finally;
          throw ???;
        }
        Object localObject3;
        if (paramBoolean2)
        {
          localObject3 = new BehanceSDKAlbumDTO("", BehanceSDKAlbumType.CAMERA);
          albumsAndImageSourcesList.add(localObject3);
          localObject3 = new BehanceSDKAlbumDTO("", BehanceSDKAlbumType.CREATIVE_CLOUD);
          albumsAndImageSourcesList.add(localObject3);
        }
        if ((??? != null) && (!((List)???).isEmpty()))
        {
          ??? = ((List)???).iterator();
          if (((Iterator)???).hasNext())
          {
            localObject3 = (ImageAlbum)((Iterator)???).next();
            BehanceSDKAlbumDTO localBehanceSDKAlbumDTO = new BehanceSDKAlbumDTO(((ImageAlbum)localObject3).getName(), BehanceSDKAlbumType.DEVICE_ALBUM);
            localBehanceSDKAlbumDTO.setImages(((ImageAlbum)localObject3).getImages());
            albumsAndImageSourcesList.add(localBehanceSDKAlbumDTO);
          }
        }
      }
      inProgress = false;
    }
    return albumsAndImageSourcesList;
  }
  
  public static BehanceSDKAlbumDTO getFromAlbumWithImageSelectionSources(Context paramContext, int paramInt)
  {
    paramContext = getAlbumsList(paramContext, false, false);
    if ((paramContext != null) && (paramContext.size() > paramInt)) {
      return (BehanceSDKAlbumDTO)paramContext.get(paramInt);
    }
    return null;
  }
  
  private static List<ImageAlbum> getListOfAlbums(Context paramContext)
  {
    paramContext = getListOfImages(paramContext);
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramContext.iterator();
    if (localIterator.hasNext())
    {
      ImageModule localImageModule = (ImageModule)localIterator.next();
      String str = localImageModule.getAlbumName();
      if (localHashMap.containsKey(str)) {
        paramContext = (ImageAlbum)localHashMap.get(str);
      }
      for (;;)
      {
        paramContext.addImage(localImageModule);
        break;
        paramContext = new ImageAlbum(str);
        localHashMap.put(str, paramContext);
      }
    }
    paramContext = new ArrayList(localHashMap.size());
    paramContext.addAll(localHashMap.values());
    return paramContext;
  }
  
  private static List<ImageModule> getListOfImages(Context paramContext)
  {
    ArrayList localArrayList = new ArrayList();
    Cursor[] arrayOfCursor = new Cursor[1];
    paramContext = paramContext.getContentResolver();
    Object localObject1 = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
    Object localObject2 = (String[])null;
    arrayOfCursor[0] = paramContext.query((Uri)localObject1, new String[] { "_id", "_data", "bucket_display_name" }, "", (String[])localObject2, "_data ASC");
    int j = arrayOfCursor.length;
    int i = 0;
    while (i < j)
    {
      paramContext = arrayOfCursor[i];
      while (paramContext.moveToNext())
      {
        localObject2 = paramContext.getString(paramContext.getColumnIndex("_id"));
        String str = paramContext.getString(paramContext.getColumnIndex("_data"));
        localObject1 = paramContext.getString(paramContext.getColumnIndex("bucket_display_name"));
        localObject2 = new LocalImage(Long.parseLong((String)localObject2), str);
        ((LocalImage)localObject2).setAlbumName((String)localObject1);
        if (((LocalImage)localObject2).getWidth() > 0) {
          localArrayList.add(localObject2);
        }
      }
      i += 1;
    }
    return localArrayList;
  }
}
