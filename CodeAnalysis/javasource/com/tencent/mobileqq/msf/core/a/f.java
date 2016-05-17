package com.tencent.mobileqq.msf.core.a;

import java.util.Map;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

class f
  extends DefaultHandler
{
  Map a;
  String b;
  private String c = null;
  
  public f(String paramString, Map paramMap)
  {
    b = paramString;
    a = paramMap;
  }
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    if (c != null)
    {
      paramArrayOfChar = new String(paramArrayOfChar, paramInt1, paramInt2);
      if (paramArrayOfChar != null) {
        a.put(b + c, paramArrayOfChar);
      }
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    c = null;
  }
  
  public void startDocument()
    throws SAXException
  {}
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    c = paramString2;
  }
}
