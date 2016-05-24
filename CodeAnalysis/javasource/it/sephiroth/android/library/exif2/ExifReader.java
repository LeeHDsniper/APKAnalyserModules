package it.sephiroth.android.library.exif2;

import android.util.Log;
import java.io.IOException;
import java.io.InputStream;

class ExifReader
{
  private final ExifInterface mInterface;
  
  ExifReader(ExifInterface paramExifInterface)
  {
    mInterface = paramExifInterface;
  }
  
  protected ExifData read(InputStream paramInputStream, int paramInt)
    throws ExifInvalidFormatException, IOException
  {
    paramInputStream = ExifParser.parse(paramInputStream, paramInt, mInterface);
    ExifData localExifData = new ExifData(paramInputStream.getByteOrder());
    localExifData.setSections(paramInputStream.getSections());
    mUncompressedDataPosition = paramInputStream.getUncompressedDataPosition();
    localExifData.setQualityGuess(paramInputStream.getQualityGuess());
    localExifData.setJpegProcess(paramInputStream.getJpegProcess());
    paramInt = paramInputStream.getImageWidth();
    int i = paramInputStream.getImageLength();
    if ((paramInt > 0) && (i > 0)) {
      localExifData.setImageSize(paramInt, i);
    }
    paramInt = paramInputStream.next();
    if (paramInt != 5)
    {
      switch (paramInt)
      {
      }
      for (;;)
      {
        paramInt = paramInputStream.next();
        break;
        localExifData.addIfdData(new IfdData(paramInputStream.getCurrentIfd()));
        continue;
        Object localObject = paramInputStream.getTag();
        if (!((ExifTag)localObject).hasValue())
        {
          paramInputStream.registerForTagValue((ExifTag)localObject);
        }
        else if (paramInputStream.isDefinedTag(((ExifTag)localObject).getIfd(), ((ExifTag)localObject).getTagId()))
        {
          localExifData.getIfdData(((ExifTag)localObject).getIfd()).setTag((ExifTag)localObject);
        }
        else
        {
          Log.w("ExifReader", "skip tag because not registered in the tag table:" + localObject);
          continue;
          localObject = paramInputStream.getTag();
          if (((ExifTag)localObject).getDataType() == 7) {
            paramInputStream.readFullTagValue((ExifTag)localObject);
          }
          localExifData.getIfdData(((ExifTag)localObject).getIfd()).setTag((ExifTag)localObject);
          continue;
          localObject = new byte[paramInputStream.getCompressedImageSize()];
          if (localObject.length == paramInputStream.read((byte[])localObject))
          {
            localExifData.setCompressedThumbnail((byte[])localObject);
          }
          else
          {
            Log.w("ExifReader", "Failed to read the compressed thumbnail");
            continue;
            localObject = new byte[paramInputStream.getStripSize()];
            if (localObject.length == paramInputStream.read((byte[])localObject)) {
              localExifData.setStripBytes(paramInputStream.getStripIndex(), (byte[])localObject);
            } else {
              Log.w("ExifReader", "Failed to read the strip bytes");
            }
          }
        }
      }
    }
    return localExifData;
  }
}
