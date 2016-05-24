package org.apache.http.auth;

import java.security.Principal;

public abstract interface Credentials
{
  public abstract String getPassword();
  
  public abstract Principal getUserPrincipal();
}
