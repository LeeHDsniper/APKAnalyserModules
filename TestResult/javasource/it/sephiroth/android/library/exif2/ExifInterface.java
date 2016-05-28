package it.sephiroth.android.library.exif2;

import android.util.Log;
import android.util.SparseIntArray;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;
import org.apache.commons.io.IOUtils;

public class ExifInterface
{
  public static final ByteOrder DEFAULT_BYTE_ORDER;
  public static final int TAG_APERTURE_VALUE;
  public static final int TAG_ARTIST;
  public static final int TAG_BITS_PER_SAMPLE;
  public static final int TAG_BRIGHTNESS_VALUE;
  public static final int TAG_CFA_PATTERN;
  public static final int TAG_COLOR_SPACE;
  public static final int TAG_COMPONENTS_CONFIGURATION;
  public static final int TAG_COMPRESSED_BITS_PER_PIXEL;
  public static final int TAG_COMPRESSION;
  public static final int TAG_CONTRAST;
  public static final int TAG_COPYRIGHT;
  public static final int TAG_CUSTOM_RENDERED;
  public static final int TAG_DATE_TIME;
  public static final int TAG_DATE_TIME_DIGITIZED;
  public static final int TAG_DATE_TIME_ORIGINAL;
  public static final int TAG_DEVICE_SETTING_DESCRIPTION;
  public static final int TAG_DIGITAL_ZOOM_RATIO;
  public static final int TAG_EXIF_IFD;
  public static final int TAG_EXIF_VERSION;
  public static final int TAG_EXPOSURE_BIAS_VALUE;
  public static final int TAG_EXPOSURE_INDEX;
  public static final int TAG_EXPOSURE_MODE;
  public static final int TAG_EXPOSURE_PROGRAM;
  public static final int TAG_EXPOSURE_TIME;
  public static final int TAG_FILE_SOURCE;
  public static final int TAG_FLASH;
  public static final int TAG_FLASHPIX_VERSION;
  public static final int TAG_FLASH_ENERGY;
  public static final int TAG_FOCAL_LENGTH;
  public static final int TAG_FOCAL_LENGTH_IN_35_MM_FILE;
  public static final int TAG_FOCAL_PLANE_RESOLUTION_UNIT;
  public static final int TAG_FOCAL_PLANE_X_RESOLUTION;
  public static final int TAG_FOCAL_PLANE_Y_RESOLUTION;
  public static final int TAG_F_NUMBER;
  public static final int TAG_GAIN_CONTROL;
  public static final int TAG_GPS_ALTITUDE;
  public static final int TAG_GPS_ALTITUDE_REF;
  public static final int TAG_GPS_AREA_INFORMATION;
  public static final int TAG_GPS_DATE_STAMP;
  public static final int TAG_GPS_DEST_BEARING;
  public static final int TAG_GPS_DEST_BEARING_REF;
  public static final int TAG_GPS_DEST_DISTANCE;
  public static final int TAG_GPS_DEST_DISTANCE_REF;
  public static final int TAG_GPS_DEST_LATITUDE;
  public static final int TAG_GPS_DEST_LATITUDE_REF;
  public static final int TAG_GPS_DEST_LONGITUDE;
  public static final int TAG_GPS_DEST_LONGITUDE_REF;
  public static final int TAG_GPS_DIFFERENTIAL;
  public static final int TAG_GPS_DOP;
  public static final int TAG_GPS_IFD;
  public static final int TAG_GPS_IMG_DIRECTION;
  public static final int TAG_GPS_IMG_DIRECTION_REF;
  public static final int TAG_GPS_LATITUDE;
  public static final int TAG_GPS_LATITUDE_REF;
  public static final int TAG_GPS_LONGITUDE;
  public static final int TAG_GPS_LONGITUDE_REF;
  public static final int TAG_GPS_MAP_DATUM;
  public static final int TAG_GPS_MEASURE_MODE;
  public static final int TAG_GPS_PROCESSING_METHOD;
  public static final int TAG_GPS_SATTELLITES;
  public static final int TAG_GPS_SPEED;
  public static final int TAG_GPS_SPEED_REF;
  public static final int TAG_GPS_STATUS;
  public static final int TAG_GPS_TIME_STAMP;
  public static final int TAG_GPS_TRACK;
  public static final int TAG_GPS_TRACK_REF;
  public static final int TAG_GPS_VERSION_ID;
  public static final int TAG_IMAGE_DESCRIPTION;
  public static final int TAG_IMAGE_LENGTH;
  public static final int TAG_IMAGE_UNIQUE_ID;
  public static final int TAG_IMAGE_WIDTH = defineTag(0, (short)256);
  public static final int TAG_INTEROPERABILITY_IFD;
  public static final int TAG_INTEROPERABILITY_INDEX;
  public static final int TAG_INTEROP_VERSION;
  public static final int TAG_ISO_SPEED_RATINGS;
  public static final int TAG_JPEG_INTERCHANGE_FORMAT;
  public static final int TAG_JPEG_INTERCHANGE_FORMAT_LENGTH;
  public static final int TAG_LENS_MAKE;
  public static final int TAG_LENS_MODEL;
  public static final int TAG_LENS_SPECS;
  public static final int TAG_LIGHT_SOURCE;
  public static final int TAG_MAKE;
  public static final int TAG_MAKER_NOTE;
  public static final int TAG_MAX_APERTURE_VALUE;
  public static final int TAG_METERING_MODE;
  public static final int TAG_MODEL;
  public static final int TAG_OECF;
  public static final int TAG_ORIENTATION;
  public static final int TAG_PHOTOMETRIC_INTERPRETATION;
  public static final int TAG_PIXEL_X_DIMENSION;
  public static final int TAG_PIXEL_Y_DIMENSION;
  public static final int TAG_PLANAR_CONFIGURATION;
  public static final int TAG_PRIMARY_CHROMATICITIES;
  public static final int TAG_REFERENCE_BLACK_WHITE;
  public static final int TAG_RELATED_SOUND_FILE;
  public static final int TAG_RESOLUTION_UNIT;
  public static final int TAG_ROWS_PER_STRIP;
  public static final int TAG_SAMPLES_PER_PIXEL;
  public static final int TAG_SATURATION;
  public static final int TAG_SCENE_CAPTURE_TYPE;
  public static final int TAG_SCENE_TYPE;
  public static final int TAG_SENSING_METHOD;
  public static final int TAG_SENSITIVITY_TYPE;
  public static final int TAG_SHARPNESS;
  public static final int TAG_SHUTTER_SPEED_VALUE;
  public static final int TAG_SOFTWARE;
  public static final int TAG_SPATIAL_FREQUENCY_RESPONSE;
  public static final int TAG_SPECTRAL_SENSITIVITY;
  public static final int TAG_STRIP_BYTE_COUNTS;
  public static final int TAG_STRIP_OFFSETS;
  public static final int TAG_SUBJECT_AREA;
  public static final int TAG_SUBJECT_DISTANCE;
  public static final int TAG_SUBJECT_DISTANCE_RANGE;
  public static final int TAG_SUBJECT_LOCATION;
  public static final int TAG_SUB_SEC_TIME;
  public static final int TAG_SUB_SEC_TIME_DIGITIZED;
  public static final int TAG_SUB_SEC_TIME_ORIGINAL;
  public static final int TAG_TRANSFER_FUNCTION;
  public static final int TAG_USER_COMMENT;
  public static final int TAG_WHITE_BALANCE;
  public static final int TAG_WHITE_POINT;
  public static final int TAG_X_RESOLUTION;
  public static final int TAG_Y_CB_CR_COEFFICIENTS;
  public static final int TAG_Y_CB_CR_POSITIONING;
  public static final int TAG_Y_CB_CR_SUB_SAMPLING;
  public static final int TAG_Y_RESOLUTION;
  private static final DateFormat mDateTimeStampFormat;
  private static final DateFormat mGPSDateStampFormat;
  protected static HashSet<Short> sBannedDefines;
  private static HashSet<Short> sOffsetTags;
  private ExifData mData = new ExifData(DEFAULT_BYTE_ORDER);
  private final Calendar mGPSTimeStampCalendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
  private SparseIntArray mTagInfo = null;
  
  static
  {
    TAG_IMAGE_LENGTH = defineTag(0, (short)257);
    TAG_BITS_PER_SAMPLE = defineTag(0, (short)258);
    TAG_COMPRESSION = defineTag(0, (short)259);
    TAG_PHOTOMETRIC_INTERPRETATION = defineTag(0, (short)262);
    TAG_IMAGE_DESCRIPTION = defineTag(0, (short)270);
    TAG_MAKE = defineTag(0, (short)271);
    TAG_MODEL = defineTag(0, (short)272);
    TAG_STRIP_OFFSETS = defineTag(0, (short)273);
    TAG_ORIENTATION = defineTag(0, (short)274);
    TAG_SAMPLES_PER_PIXEL = defineTag(0, (short)277);
    TAG_ROWS_PER_STRIP = defineTag(0, (short)278);
    TAG_STRIP_BYTE_COUNTS = defineTag(0, (short)279);
    TAG_INTEROP_VERSION = defineTag(3, (short)2);
    TAG_X_RESOLUTION = defineTag(0, (short)282);
    TAG_Y_RESOLUTION = defineTag(0, (short)283);
    TAG_PLANAR_CONFIGURATION = defineTag(0, (short)284);
    TAG_RESOLUTION_UNIT = defineTag(0, (short)296);
    TAG_TRANSFER_FUNCTION = defineTag(0, (short)301);
    TAG_SOFTWARE = defineTag(0, (short)305);
    TAG_DATE_TIME = defineTag(0, (short)306);
    TAG_ARTIST = defineTag(0, (short)315);
    TAG_WHITE_POINT = defineTag(0, (short)318);
    TAG_PRIMARY_CHROMATICITIES = defineTag(0, (short)319);
    TAG_Y_CB_CR_COEFFICIENTS = defineTag(0, (short)529);
    TAG_Y_CB_CR_SUB_SAMPLING = defineTag(0, (short)530);
    TAG_Y_CB_CR_POSITIONING = defineTag(0, (short)531);
    TAG_REFERENCE_BLACK_WHITE = defineTag(0, (short)532);
    TAG_COPYRIGHT = defineTag(0, (short)33432);
    TAG_EXIF_IFD = defineTag(0, (short)34665);
    TAG_GPS_IFD = defineTag(0, (short)34853);
    TAG_JPEG_INTERCHANGE_FORMAT = defineTag(1, (short)513);
    TAG_JPEG_INTERCHANGE_FORMAT_LENGTH = defineTag(1, (short)514);
    TAG_EXPOSURE_TIME = defineTag(2, (short)33434);
    TAG_F_NUMBER = defineTag(2, (short)33437);
    TAG_EXPOSURE_PROGRAM = defineTag(2, (short)34850);
    TAG_SPECTRAL_SENSITIVITY = defineTag(2, (short)34852);
    TAG_ISO_SPEED_RATINGS = defineTag(2, (short)34855);
    TAG_OECF = defineTag(2, (short)34856);
    TAG_EXIF_VERSION = defineTag(2, (short)36864);
    TAG_DATE_TIME_ORIGINAL = defineTag(2, (short)36867);
    TAG_DATE_TIME_DIGITIZED = defineTag(2, (short)36868);
    TAG_COMPONENTS_CONFIGURATION = defineTag(2, (short)37121);
    TAG_COMPRESSED_BITS_PER_PIXEL = defineTag(2, (short)37122);
    TAG_SHUTTER_SPEED_VALUE = defineTag(2, (short)37377);
    TAG_APERTURE_VALUE = defineTag(2, (short)37378);
    TAG_BRIGHTNESS_VALUE = defineTag(2, (short)37379);
    TAG_EXPOSURE_BIAS_VALUE = defineTag(2, (short)37380);
    TAG_MAX_APERTURE_VALUE = defineTag(2, (short)37381);
    TAG_SUBJECT_DISTANCE = defineTag(2, (short)37382);
    TAG_METERING_MODE = defineTag(2, (short)37383);
    TAG_LIGHT_SOURCE = defineTag(2, (short)37384);
    TAG_FLASH = defineTag(2, (short)37385);
    TAG_FOCAL_LENGTH = defineTag(2, (short)37386);
    TAG_SUBJECT_AREA = defineTag(2, (short)37396);
    TAG_MAKER_NOTE = defineTag(2, (short)37500);
    TAG_USER_COMMENT = defineTag(2, (short)37510);
    TAG_SUB_SEC_TIME = defineTag(2, (short)37520);
    TAG_SUB_SEC_TIME_ORIGINAL = defineTag(2, (short)37521);
    TAG_SUB_SEC_TIME_DIGITIZED = defineTag(2, (short)37522);
    TAG_FLASHPIX_VERSION = defineTag(2, (short)40960);
    TAG_COLOR_SPACE = defineTag(2, (short)40961);
    TAG_PIXEL_X_DIMENSION = defineTag(2, (short)40962);
    TAG_PIXEL_Y_DIMENSION = defineTag(2, (short)40963);
    TAG_RELATED_SOUND_FILE = defineTag(2, (short)40964);
    TAG_INTEROPERABILITY_IFD = defineTag(2, (short)40965);
    TAG_FLASH_ENERGY = defineTag(2, (short)41483);
    TAG_SPATIAL_FREQUENCY_RESPONSE = defineTag(2, (short)41484);
    TAG_FOCAL_PLANE_X_RESOLUTION = defineTag(2, (short)41486);
    TAG_FOCAL_PLANE_Y_RESOLUTION = defineTag(2, (short)41487);
    TAG_FOCAL_PLANE_RESOLUTION_UNIT = defineTag(2, (short)41488);
    TAG_SUBJECT_LOCATION = defineTag(2, (short)41492);
    TAG_EXPOSURE_INDEX = defineTag(2, (short)41493);
    TAG_SENSING_METHOD = defineTag(2, (short)41495);
    TAG_FILE_SOURCE = defineTag(2, (short)41728);
    TAG_SCENE_TYPE = defineTag(2, (short)41729);
    TAG_CFA_PATTERN = defineTag(2, (short)41730);
    TAG_CUSTOM_RENDERED = defineTag(2, (short)41985);
    TAG_EXPOSURE_MODE = defineTag(2, (short)41986);
    TAG_WHITE_BALANCE = defineTag(2, (short)41987);
    TAG_DIGITAL_ZOOM_RATIO = defineTag(2, (short)41988);
    TAG_FOCAL_LENGTH_IN_35_MM_FILE = defineTag(2, (short)41989);
    TAG_SCENE_CAPTURE_TYPE = defineTag(2, (short)41990);
    TAG_GAIN_CONTROL = defineTag(2, (short)41991);
    TAG_CONTRAST = defineTag(2, (short)41992);
    TAG_SATURATION = defineTag(2, (short)41993);
    TAG_SHARPNESS = defineTag(2, (short)41994);
    TAG_DEVICE_SETTING_DESCRIPTION = defineTag(2, (short)41995);
    TAG_SUBJECT_DISTANCE_RANGE = defineTag(2, (short)41996);
    TAG_IMAGE_UNIQUE_ID = defineTag(2, (short)42016);
    TAG_LENS_SPECS = defineTag(2, (short)42034);
    TAG_LENS_MAKE = defineTag(2, (short)42035);
    TAG_LENS_MODEL = defineTag(2, (short)42036);
    TAG_SENSITIVITY_TYPE = defineTag(2, (short)34864);
    TAG_GPS_VERSION_ID = defineTag(4, (short)0);
    TAG_GPS_LATITUDE_REF = defineTag(4, (short)1);
    TAG_GPS_LATITUDE = defineTag(4, (short)2);
    TAG_GPS_LONGITUDE_REF = defineTag(4, (short)3);
    TAG_GPS_LONGITUDE = defineTag(4, (short)4);
    TAG_GPS_ALTITUDE_REF = defineTag(4, (short)5);
    TAG_GPS_ALTITUDE = defineTag(4, (short)6);
    TAG_GPS_TIME_STAMP = defineTag(4, (short)7);
    TAG_GPS_SATTELLITES = defineTag(4, (short)8);
    TAG_GPS_STATUS = defineTag(4, (short)9);
    TAG_GPS_MEASURE_MODE = defineTag(4, (short)10);
    TAG_GPS_DOP = defineTag(4, (short)11);
    TAG_GPS_SPEED_REF = defineTag(4, (short)12);
    TAG_GPS_SPEED = defineTag(4, (short)13);
    TAG_GPS_TRACK_REF = defineTag(4, (short)14);
    TAG_GPS_TRACK = defineTag(4, (short)15);
    TAG_GPS_IMG_DIRECTION_REF = defineTag(4, (short)16);
    TAG_GPS_IMG_DIRECTION = defineTag(4, (short)17);
    TAG_GPS_MAP_DATUM = defineTag(4, (short)18);
    TAG_GPS_DEST_LATITUDE_REF = defineTag(4, (short)19);
    TAG_GPS_DEST_LATITUDE = defineTag(4, (short)20);
    TAG_GPS_DEST_LONGITUDE_REF = defineTag(4, (short)21);
    TAG_GPS_DEST_LONGITUDE = defineTag(4, (short)22);
    TAG_GPS_DEST_BEARING_REF = defineTag(4, (short)23);
    TAG_GPS_DEST_BEARING = defineTag(4, (short)24);
    TAG_GPS_DEST_DISTANCE_REF = defineTag(4, (short)25);
    TAG_GPS_DEST_DISTANCE = defineTag(4, (short)26);
    TAG_GPS_PROCESSING_METHOD = defineTag(4, (short)27);
    TAG_GPS_AREA_INFORMATION = defineTag(4, (short)28);
    TAG_GPS_DATE_STAMP = defineTag(4, (short)29);
    TAG_GPS_DIFFERENTIAL = defineTag(4, (short)30);
    TAG_INTEROPERABILITY_INDEX = defineTag(3, (short)1);
    DEFAULT_BYTE_ORDER = ByteOrder.BIG_ENDIAN;
    mGPSDateStampFormat = new SimpleDateFormat("yyyy:MM:dd");
    mDateTimeStampFormat = new SimpleDateFormat("yyyy:MM:dd kk:mm:ss");
    sOffsetTags = new HashSet();
    sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_GPS_IFD)));
    sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_EXIF_IFD)));
    sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_JPEG_INTERCHANGE_FORMAT)));
    sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_INTEROPERABILITY_IFD)));
    sOffsetTags.add(Short.valueOf(getTrueTagKey(TAG_STRIP_OFFSETS)));
    sBannedDefines = new HashSet(sOffsetTags);
    sBannedDefines.add(Short.valueOf(getTrueTagKey(-1)));
    sBannedDefines.add(Short.valueOf(getTrueTagKey(TAG_JPEG_INTERCHANGE_FORMAT_LENGTH)));
    sBannedDefines.add(Short.valueOf(getTrueTagKey(TAG_STRIP_BYTE_COUNTS)));
  }
  
  public ExifInterface()
  {
    mGPSDateStampFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
  }
  
  public static int defineTag(int paramInt, short paramShort)
  {
    return 0xFFFF & paramShort | paramInt << 16;
  }
  
  protected static int getAllowedIfdFlagsFromInfo(int paramInt)
  {
    return paramInt >>> 24;
  }
  
  protected static int getComponentCountFromInfo(int paramInt)
  {
    return 0xFFFF & paramInt;
  }
  
  protected static int getFlagsFromAllowedIfds(int[] paramArrayOfInt)
  {
    if ((paramArrayOfInt == null) || (paramArrayOfInt.length == 0)) {
      k = 0;
    }
    int i;
    int[] arrayOfInt;
    int j;
    do
    {
      return k;
      i = 0;
      arrayOfInt = IfdData.getIfds();
      j = 0;
      k = i;
    } while (j >= 5);
    int n = paramArrayOfInt.length;
    int k = 0;
    for (;;)
    {
      int m = i;
      if (k < n)
      {
        m = paramArrayOfInt[k];
        if (arrayOfInt[j] == m) {
          m = i | 1 << j;
        }
      }
      else
      {
        j += 1;
        i = m;
        break;
      }
      k += 1;
    }
  }
  
  public static int getRotationForOrientationValue(short paramShort)
  {
    switch (paramShort)
    {
    case 1: 
    case 2: 
    case 4: 
    case 5: 
    case 7: 
    default: 
      return 0;
    case 6: 
      return 90;
    case 3: 
      return 180;
    }
    return 270;
  }
  
  public static int getTrueIfd(int paramInt)
  {
    return paramInt >>> 16;
  }
  
  public static short getTrueTagKey(int paramInt)
  {
    return (short)paramInt;
  }
  
  protected static short getTypeFromInfo(int paramInt)
  {
    return (short)(paramInt >> 16 & 0xFF);
  }
  
  private void initTagInfo()
  {
    int i = getFlagsFromAllowedIfds(new int[] { 0, 1 }) << 24;
    mTagInfo.put(TAG_MAKE, 0x20000 | i);
    mTagInfo.put(TAG_IMAGE_WIDTH, 0x40000 | i | 0x1);
    mTagInfo.put(TAG_IMAGE_LENGTH, 0x40000 | i | 0x1);
    mTagInfo.put(TAG_BITS_PER_SAMPLE, 0x30000 | i | 0x3);
    mTagInfo.put(TAG_COMPRESSION, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_PHOTOMETRIC_INTERPRETATION, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_ORIENTATION, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_SAMPLES_PER_PIXEL, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_PLANAR_CONFIGURATION, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_Y_CB_CR_SUB_SAMPLING, 0x30000 | i | 0x2);
    mTagInfo.put(TAG_Y_CB_CR_POSITIONING, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_X_RESOLUTION, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_Y_RESOLUTION, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_RESOLUTION_UNIT, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_STRIP_OFFSETS, 0x40000 | i);
    mTagInfo.put(TAG_ROWS_PER_STRIP, 0x40000 | i | 0x1);
    mTagInfo.put(TAG_STRIP_BYTE_COUNTS, 0x40000 | i);
    mTagInfo.put(TAG_TRANSFER_FUNCTION, 0x30000 | i | 0x300);
    mTagInfo.put(TAG_WHITE_POINT, 0x50000 | i | 0x2);
    mTagInfo.put(TAG_PRIMARY_CHROMATICITIES, 0x50000 | i | 0x6);
    mTagInfo.put(TAG_Y_CB_CR_COEFFICIENTS, 0x50000 | i | 0x3);
    mTagInfo.put(TAG_REFERENCE_BLACK_WHITE, 0x50000 | i | 0x6);
    mTagInfo.put(TAG_DATE_TIME, 0x20000 | i | 0x14);
    mTagInfo.put(TAG_IMAGE_DESCRIPTION, 0x20000 | i);
    mTagInfo.put(TAG_MODEL, 0x20000 | i);
    mTagInfo.put(TAG_SOFTWARE, 0x20000 | i);
    mTagInfo.put(TAG_ARTIST, 0x20000 | i);
    mTagInfo.put(TAG_COPYRIGHT, 0x20000 | i);
    mTagInfo.put(TAG_EXIF_IFD, 0x40000 | i | 0x1);
    mTagInfo.put(TAG_GPS_IFD, 0x40000 | i | 0x1);
    i = getFlagsFromAllowedIfds(new int[] { 1 }) << 24;
    mTagInfo.put(TAG_JPEG_INTERCHANGE_FORMAT, 0x40000 | i | 0x1);
    mTagInfo.put(TAG_JPEG_INTERCHANGE_FORMAT_LENGTH, 0x40000 | i | 0x1);
    i = getFlagsFromAllowedIfds(new int[] { 2 }) << 24;
    mTagInfo.put(TAG_EXIF_VERSION, 0x70000 | i | 0x4);
    mTagInfo.put(TAG_FLASHPIX_VERSION, 0x70000 | i | 0x4);
    mTagInfo.put(TAG_COLOR_SPACE, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_COMPONENTS_CONFIGURATION, 0x70000 | i | 0x4);
    mTagInfo.put(TAG_COMPRESSED_BITS_PER_PIXEL, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_PIXEL_X_DIMENSION, 0x40000 | i | 0x1);
    mTagInfo.put(TAG_PIXEL_Y_DIMENSION, 0x40000 | i | 0x1);
    mTagInfo.put(TAG_MAKER_NOTE, 0x70000 | i);
    mTagInfo.put(TAG_USER_COMMENT, 0x70000 | i);
    mTagInfo.put(TAG_RELATED_SOUND_FILE, 0x20000 | i | 0xD);
    mTagInfo.put(TAG_DATE_TIME_ORIGINAL, 0x20000 | i | 0x14);
    mTagInfo.put(TAG_DATE_TIME_DIGITIZED, 0x20000 | i | 0x14);
    mTagInfo.put(TAG_SUB_SEC_TIME, 0x20000 | i);
    mTagInfo.put(TAG_SUB_SEC_TIME_ORIGINAL, 0x20000 | i);
    mTagInfo.put(TAG_SUB_SEC_TIME_DIGITIZED, 0x20000 | i);
    mTagInfo.put(TAG_IMAGE_UNIQUE_ID, 0x20000 | i | 0x21);
    mTagInfo.put(TAG_LENS_SPECS, 0xA0000 | i | 0x3);
    mTagInfo.put(TAG_LENS_MAKE, 0x20000 | i);
    mTagInfo.put(TAG_LENS_MODEL, 0x20000 | i);
    mTagInfo.put(TAG_SENSITIVITY_TYPE, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_EXPOSURE_TIME, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_F_NUMBER, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_EXPOSURE_PROGRAM, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_SPECTRAL_SENSITIVITY, 0x20000 | i);
    mTagInfo.put(TAG_ISO_SPEED_RATINGS, 0x30000 | i);
    mTagInfo.put(TAG_OECF, 0x70000 | i);
    mTagInfo.put(TAG_SHUTTER_SPEED_VALUE, 0xA0000 | i | 0x1);
    mTagInfo.put(TAG_APERTURE_VALUE, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_BRIGHTNESS_VALUE, 0xA0000 | i | 0x1);
    mTagInfo.put(TAG_EXPOSURE_BIAS_VALUE, 0xA0000 | i | 0x1);
    mTagInfo.put(TAG_MAX_APERTURE_VALUE, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_SUBJECT_DISTANCE, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_METERING_MODE, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_LIGHT_SOURCE, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_FLASH, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_FOCAL_LENGTH, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_SUBJECT_AREA, 0x30000 | i);
    mTagInfo.put(TAG_FLASH_ENERGY, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_SPATIAL_FREQUENCY_RESPONSE, 0x70000 | i);
    mTagInfo.put(TAG_FOCAL_PLANE_X_RESOLUTION, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_FOCAL_PLANE_Y_RESOLUTION, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_FOCAL_PLANE_RESOLUTION_UNIT, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_SUBJECT_LOCATION, 0x30000 | i | 0x2);
    mTagInfo.put(TAG_EXPOSURE_INDEX, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_SENSING_METHOD, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_FILE_SOURCE, 0x70000 | i | 0x1);
    mTagInfo.put(TAG_SCENE_TYPE, 0x70000 | i | 0x1);
    mTagInfo.put(TAG_CFA_PATTERN, 0x70000 | i);
    mTagInfo.put(TAG_CUSTOM_RENDERED, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_EXPOSURE_MODE, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_WHITE_BALANCE, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_DIGITAL_ZOOM_RATIO, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_FOCAL_LENGTH_IN_35_MM_FILE, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_SCENE_CAPTURE_TYPE, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_GAIN_CONTROL, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_CONTRAST, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_SATURATION, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_SHARPNESS, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_DEVICE_SETTING_DESCRIPTION, 0x70000 | i);
    mTagInfo.put(TAG_SUBJECT_DISTANCE_RANGE, 0x30000 | i | 0x1);
    mTagInfo.put(TAG_INTEROPERABILITY_IFD, 0x40000 | i | 0x1);
    i = getFlagsFromAllowedIfds(new int[] { 4 }) << 24;
    mTagInfo.put(TAG_GPS_VERSION_ID, 0x10000 | i | 0x4);
    mTagInfo.put(TAG_GPS_LATITUDE_REF, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_LONGITUDE_REF, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_LATITUDE, 0xA0000 | i | 0x3);
    mTagInfo.put(TAG_GPS_LONGITUDE, 0xA0000 | i | 0x3);
    mTagInfo.put(TAG_GPS_ALTITUDE_REF, 0x10000 | i | 0x1);
    mTagInfo.put(TAG_GPS_ALTITUDE, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_GPS_TIME_STAMP, 0x50000 | i | 0x3);
    mTagInfo.put(TAG_GPS_SATTELLITES, 0x20000 | i);
    mTagInfo.put(TAG_GPS_STATUS, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_MEASURE_MODE, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_DOP, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_GPS_SPEED_REF, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_SPEED, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_GPS_TRACK_REF, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_TRACK, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_GPS_IMG_DIRECTION_REF, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_IMG_DIRECTION, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_GPS_MAP_DATUM, 0x20000 | i);
    mTagInfo.put(TAG_GPS_DEST_LATITUDE_REF, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_DEST_LATITUDE, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_GPS_DEST_BEARING_REF, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_DEST_BEARING, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_GPS_DEST_DISTANCE_REF, 0x20000 | i | 0x2);
    mTagInfo.put(TAG_GPS_DEST_DISTANCE, 0x50000 | i | 0x1);
    mTagInfo.put(TAG_GPS_PROCESSING_METHOD, 0x70000 | i);
    mTagInfo.put(TAG_GPS_AREA_INFORMATION, 0x70000 | i);
    mTagInfo.put(TAG_GPS_DATE_STAMP, 0x20000 | i | 0xB);
    mTagInfo.put(TAG_GPS_DIFFERENTIAL, 0x30000 | i | 0xB);
    i = getFlagsFromAllowedIfds(new int[] { 3 }) << 24;
    mTagInfo.put(TAG_INTEROPERABILITY_INDEX, 0x20000 | i);
    mTagInfo.put(TAG_INTEROP_VERSION, 0x70000 | i | 0x4);
  }
  
  protected static boolean isIfdAllowed(int paramInt1, int paramInt2)
  {
    int[] arrayOfInt = IfdData.getIfds();
    int i = getAllowedIfdFlagsFromInfo(paramInt1);
    paramInt1 = 0;
    while (paramInt1 < arrayOfInt.length)
    {
      if ((paramInt2 == arrayOfInt[paramInt1]) && ((i >> paramInt1 & 0x1) == 1)) {
        return true;
      }
      paramInt1 += 1;
    }
    return false;
  }
  
  protected static boolean isOffsetTag(short paramShort)
  {
    return sOffsetTags.contains(Short.valueOf(paramShort));
  }
  
  private static int writeExif_internal(InputStream paramInputStream, OutputStream paramOutputStream, ExifData paramExifData)
    throws IOException
  {
    ExifInterface localExifInterface = new ExifInterface();
    localExifInterface.readExif(paramInputStream, 0);
    paramOutputStream.write(255);
    paramOutputStream.write(216);
    paramInputStream = mData.getSections();
    if (get0type != 224)
    {
      Log.w("ExifInterface", "first section is not a JFIF or EXIF tag");
      paramOutputStream.write(JpegHeader.JFIF_HEADER);
    }
    ExifOutputStream localExifOutputStream = new ExifOutputStream(localExifInterface);
    localExifOutputStream.setExifData(paramExifData);
    localExifOutputStream.writeExifData(paramOutputStream);
    int i = 0;
    while (i < paramInputStream.size() - 1)
    {
      paramExifData = (ExifParser.Section)paramInputStream.get(i);
      paramOutputStream.write(255);
      paramOutputStream.write(type);
      paramOutputStream.write(data);
      i += 1;
    }
    paramInputStream = (ExifParser.Section)paramInputStream.get(paramInputStream.size() - 1);
    paramOutputStream.write(255);
    paramOutputStream.write(type);
    paramOutputStream.write(data);
    return mData.mUncompressedDataPosition;
  }
  
  public ExifTag buildTag(int paramInt1, int paramInt2, Object paramObject)
  {
    int i = getTagInfo().get(paramInt1);
    Object localObject;
    if ((i == 0) || (paramObject == null)) {
      localObject = null;
    }
    ExifTag localExifTag;
    do
    {
      return localObject;
      short s = getTypeFromInfo(i);
      int j = getComponentCountFromInfo(i);
      if (j != 0) {}
      for (boolean bool = true; !isIfdAllowed(i, paramInt2); bool = false) {
        return null;
      }
      localExifTag = new ExifTag(getTrueTagKey(paramInt1), s, j, paramInt2, bool);
      localObject = localExifTag;
    } while (localExifTag.setValue(paramObject));
    return null;
  }
  
  public ExifTag buildTag(int paramInt, Object paramObject)
  {
    return buildTag(paramInt, getTrueIfd(paramInt), paramObject);
  }
  
  protected ExifTag buildUninitializedTag(int paramInt)
  {
    int i = getTagInfo().get(paramInt);
    if (i == 0) {
      return null;
    }
    short s = getTypeFromInfo(i);
    i = getComponentCountFromInfo(i);
    if (i != 0) {}
    for (boolean bool = true;; bool = false)
    {
      int j = getTrueIfd(paramInt);
      return new ExifTag(getTrueTagKey(paramInt), s, i, j, bool);
    }
  }
  
  public void deleteTag(int paramInt)
  {
    deleteTag(paramInt, getDefinedTagDefaultIfd(paramInt));
  }
  
  public void deleteTag(int paramInt1, int paramInt2)
  {
    mData.removeTag(getTrueTagKey(paramInt1), paramInt2);
  }
  
  public List<ExifTag> getAllTags()
  {
    return mData.getAllTags();
  }
  
  public int getDefinedTagDefaultIfd(int paramInt)
  {
    if (getTagInfo().get(paramInt) == 0) {
      return -1;
    }
    return getTrueIfd(paramInt);
  }
  
  public int[] getImageSize()
  {
    return mData.getImageSize();
  }
  
  public ExifTag getTag(int paramInt1, int paramInt2)
  {
    if (!ExifTag.isValidIfd(paramInt2)) {
      return null;
    }
    return mData.getTag(getTrueTagKey(paramInt1), paramInt2);
  }
  
  protected SparseIntArray getTagInfo()
  {
    if (mTagInfo == null)
    {
      mTagInfo = new SparseIntArray();
      initTagInfo();
    }
    return mTagInfo;
  }
  
  public Integer getTagIntValue(int paramInt)
  {
    return getTagIntValue(paramInt, getDefinedTagDefaultIfd(paramInt));
  }
  
  public Integer getTagIntValue(int paramInt1, int paramInt2)
  {
    int[] arrayOfInt = getTagIntValues(paramInt1, paramInt2);
    if ((arrayOfInt == null) || (arrayOfInt.length <= 0)) {
      return null;
    }
    return new Integer(arrayOfInt[0]);
  }
  
  public int[] getTagIntValues(int paramInt1, int paramInt2)
  {
    ExifTag localExifTag = getTag(paramInt1, paramInt2);
    if (localExifTag == null) {
      return null;
    }
    return localExifTag.getValueAsInts();
  }
  
  public void readExif(InputStream paramInputStream, int paramInt)
    throws IOException
  {
    if (paramInputStream == null) {
      throw new IllegalArgumentException("Argument is null");
    }
    try
    {
      paramInputStream = new ExifReader(this).read(paramInputStream, paramInt);
      mData = paramInputStream;
      return;
    }
    catch (ExifInvalidFormatException paramInputStream)
    {
      throw new IOException("Invalid exif format : " + paramInputStream);
    }
  }
  
  public ExifTag setTag(ExifTag paramExifTag)
  {
    return mData.addTag(paramExifTag);
  }
  
  public void setTags(Collection<ExifTag> paramCollection)
  {
    if (paramCollection == null) {}
    for (;;)
    {
      return;
      paramCollection = paramCollection.iterator();
      while (paramCollection.hasNext()) {
        setTag((ExifTag)paramCollection.next());
      }
    }
  }
  
  public void writeExif(String paramString)
    throws IOException
  {
    Log.i("ExifInterface", "writeExif: " + paramString);
    File localFile = new File(paramString);
    paramString = new File(paramString + ".t");
    paramString.delete();
    try
    {
      writeExif(localFile.getAbsolutePath(), paramString.getAbsolutePath());
      paramString.renameTo(localFile);
      return;
    }
    catch (IOException localIOException)
    {
      throw localIOException;
    }
    finally
    {
      paramString.delete();
    }
  }
  
  public void writeExif(String paramString1, String paramString2)
    throws IOException
  {
    Log.i("ExifInterface", "writeExif: " + paramString2);
    if (paramString1.equals(paramString2)) {
      return;
    }
    paramString1 = new FileInputStream(paramString1);
    paramString2 = new FileOutputStream(paramString2);
    int i = writeExif_internal(paramString1, paramString2, mData);
    FileChannel localFileChannel1 = paramString1.getChannel();
    FileChannel localFileChannel2 = paramString2.getChannel();
    localFileChannel1.transferTo(i, localFileChannel1.size() - i, localFileChannel2);
    paramString2.flush();
    IOUtils.closeQuietly(paramString1);
    IOUtils.closeQuietly(paramString2);
  }
}
