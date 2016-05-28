package com.nostra13.universalimageloader.core;

import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import java.util.concurrent.locks.ReentrantLock;

final class ImageLoadingInfo
{
  final ImageAware imageAware;
  final ImageLoadingListener listener;
  final ReentrantLock loadFromUriLock;
  final String memoryCacheKey;
  final DisplayImageOptions options;
  final ImageLoadingProgressListener progressListener;
  final ImageSize targetSize;
  final String uri;
  
  public ImageLoadingInfo(String paramString1, ImageAware paramImageAware, ImageSize paramImageSize, String paramString2, DisplayImageOptions paramDisplayImageOptions, ImageLoadingListener paramImageLoadingListener, ImageLoadingProgressListener paramImageLoadingProgressListener, ReentrantLock paramReentrantLock)
  {
    uri = paramString1;
    imageAware = paramImageAware;
    targetSize = paramImageSize;
    options = paramDisplayImageOptions;
    listener = paramImageLoadingListener;
    progressListener = paramImageLoadingProgressListener;
    loadFromUriLock = paramReentrantLock;
    memoryCacheKey = paramString2;
  }
}
