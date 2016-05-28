package it.sephiroth.android.library.ab;

import android.content.Context;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;
import java.util.UUID;

class ABFilePreference
  extends ABSettingsFactory.ABSettingsManager
{
  final String uuid = generate(paramContext);
  
  ABFilePreference(Context paramContext)
    throws IOException
  {}
  
  private String createFile(File paramFile)
    throws IOException
  {
    String str = generateNew().toString();
    paramFile.createNewFile();
    paramFile = new FileOutputStream(paramFile);
    paramFile.write(str.getBytes());
    paramFile.flush();
    paramFile.close();
    return str;
  }
  
  private String generate(Context paramContext)
    throws IOException
  {
    paramContext = new File(paramContext.getFilesDir(), "ab");
    if (!paramContext.exists()) {
      paramContext.mkdir();
    }
    paramContext = new File(paramContext, ".alpha-beta");
    if (!paramContext.exists()) {
      return createFile(paramContext);
    }
    return readFile(paramContext);
  }
  
  private String readFile(File paramFile)
    throws IOException
  {
    paramFile = new FileInputStream(paramFile);
    String str = readStream(paramFile);
    paramFile.close();
    return str;
  }
  
  private String readStream(InputStream paramInputStream)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    paramInputStream = new Scanner(paramInputStream);
    while (paramInputStream.hasNextLine()) {
      localStringBuilder.append(paramInputStream.nextLine());
    }
    return localStringBuilder.toString();
  }
  
  public String getUUID()
  {
    return uuid;
  }
}
