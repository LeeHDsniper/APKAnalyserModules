package com.nostra13.universalimageloader.cache.disc.impl;

import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import java.io.File;

public class UnlimitedDiscCache
  extends BaseDiscCache
{
  public UnlimitedDiscCache(File paramFile1, File paramFile2, FileNameGenerator paramFileNameGenerator)
  {
    super(paramFile1, paramFile2, paramFileNameGenerator);
  }
}
