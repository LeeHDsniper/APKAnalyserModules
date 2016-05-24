package org.apache.http.message;

import java.util.NoSuchElementException;
import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.ParseException;
import org.apache.http.TokenIterator;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class BasicTokenIterator
  implements TokenIterator
{
  public static final String HTTP_SEPARATORS = " ,;=()<>@:\\\"/[]?{}\t";
  protected String currentHeader;
  protected String currentToken;
  protected final HeaderIterator headerIt;
  protected int searchPos;
  
  public BasicTokenIterator(HeaderIterator paramHeaderIterator)
  {
    headerIt = ((HeaderIterator)Args.notNull(paramHeaderIterator, "Header iterator"));
    searchPos = findNext(-1);
  }
  
  protected String createToken(String paramString, int paramInt1, int paramInt2)
  {
    return paramString.substring(paramInt1, paramInt2);
  }
  
  protected int findNext(int paramInt)
    throws ParseException
  {
    if (paramInt < 0)
    {
      if (!headerIt.hasNext()) {
        return -1;
      }
      currentHeader = headerIt.nextHeader().getValue();
    }
    for (paramInt = 0;; paramInt = findTokenSeparator(paramInt))
    {
      paramInt = findTokenStart(paramInt);
      if (paramInt >= 0) {
        break;
      }
      currentToken = null;
      return -1;
    }
    int i = findTokenEnd(paramInt);
    currentToken = createToken(currentHeader, paramInt, i);
    return i;
  }
  
  protected int findTokenEnd(int paramInt)
  {
    Args.notNegative(paramInt, "Search position");
    int i = currentHeader.length();
    paramInt += 1;
    while ((paramInt < i) && (isTokenChar(currentHeader.charAt(paramInt)))) {
      paramInt += 1;
    }
    return paramInt;
  }
  
  protected int findTokenSeparator(int paramInt)
  {
    paramInt = Args.notNegative(paramInt, "Search position");
    int i = 0;
    int j = currentHeader.length();
    while ((i == 0) && (paramInt < j))
    {
      char c = currentHeader.charAt(paramInt);
      if (isTokenSeparator(c))
      {
        i = 1;
      }
      else if (isWhitespace(c))
      {
        paramInt += 1;
      }
      else
      {
        if (isTokenChar(c)) {
          throw new ParseException("Tokens without separator (pos " + paramInt + "): " + currentHeader);
        }
        throw new ParseException("Invalid character after token (pos " + paramInt + "): " + currentHeader);
      }
    }
    return paramInt;
  }
  
  protected int findTokenStart(int paramInt)
  {
    paramInt = Args.notNegative(paramInt, "Search position");
    int j = 0;
    while ((j == 0) && (currentHeader != null))
    {
      int m = currentHeader.length();
      int k = paramInt;
      int i = j;
      while ((i == 0) && (k < m))
      {
        char c = currentHeader.charAt(k);
        if ((isTokenSeparator(c)) || (isWhitespace(c))) {
          k += 1;
        } else if (isTokenChar(currentHeader.charAt(k))) {
          i = 1;
        } else {
          throw new ParseException("Invalid character before token (pos " + k + "): " + currentHeader);
        }
      }
      j = i;
      paramInt = k;
      if (i == 0) {
        if (headerIt.hasNext())
        {
          currentHeader = headerIt.nextHeader().getValue();
          paramInt = 0;
          j = i;
        }
        else
        {
          currentHeader = null;
          j = i;
          paramInt = k;
        }
      }
    }
    if (j != 0) {
      return paramInt;
    }
    return -1;
  }
  
  public boolean hasNext()
  {
    return currentToken != null;
  }
  
  protected boolean isHttpSeparator(char paramChar)
  {
    return " ,;=()<>@:\\\"/[]?{}\t".indexOf(paramChar) >= 0;
  }
  
  protected boolean isTokenChar(char paramChar)
  {
    if (Character.isLetterOrDigit(paramChar)) {}
    do
    {
      return true;
      if (Character.isISOControl(paramChar)) {
        return false;
      }
    } while (!isHttpSeparator(paramChar));
    return false;
  }
  
  protected boolean isTokenSeparator(char paramChar)
  {
    return paramChar == ',';
  }
  
  protected boolean isWhitespace(char paramChar)
  {
    return (paramChar == '\t') || (Character.isSpaceChar(paramChar));
  }
  
  public final Object next()
    throws NoSuchElementException, ParseException
  {
    return nextToken();
  }
  
  public String nextToken()
    throws NoSuchElementException, ParseException
  {
    if (currentToken == null) {
      throw new NoSuchElementException("Iteration already finished.");
    }
    String str = currentToken;
    searchPos = findNext(searchPos);
    return str;
  }
  
  public final void remove()
    throws UnsupportedOperationException
  {
    throw new UnsupportedOperationException("Removing tokens is not supported.");
  }
}
