package com.google.ads.mediation;

import com.google.android.gms.ads.internal.util.client.zzb;
import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

@Deprecated
public abstract class MediationServerParameters
{
  public MediationServerParameters() {}
  
  public void load(Map<String, String> paramMap)
    throws MediationServerParameters.MappingException
  {
    Object localObject1 = new HashMap();
    Object localObject2 = getClass().getFields();
    int j = localObject2.length;
    int i = 0;
    Object localObject3;
    while (i < j)
    {
      localObject3 = localObject2[i];
      Parameter localParameter = (Parameter)((Field)localObject3).getAnnotation(Parameter.class);
      if (localParameter != null) {
        ((Map)localObject1).put(localParameter.name(), localObject3);
      }
      i += 1;
    }
    if (((Map)localObject1).isEmpty()) {
      zzb.zzaE("No server options fields detected. To suppress this message either add a field with the @Parameter annotation, or override the load() method.");
    }
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      localObject2 = (Map.Entry)paramMap.next();
      localObject3 = (Field)((Map)localObject1).remove(((Map.Entry)localObject2).getKey());
      if (localObject3 != null) {
        try
        {
          ((Field)localObject3).set(this, ((Map.Entry)localObject2).getValue());
        }
        catch (IllegalAccessException localIllegalAccessException)
        {
          zzb.zzaE("Server option \"" + (String)((Map.Entry)localObject2).getKey() + "\" could not be set: Illegal Access");
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          zzb.zzaE("Server option \"" + (String)((Map.Entry)localObject2).getKey() + "\" could not be set: Bad Type");
        }
      } else {
        zzb.zzaC("Unexpected server option: " + (String)((Map.Entry)localObject2).getKey() + " = \"" + (String)((Map.Entry)localObject2).getValue() + "\"");
      }
    }
    paramMap = new StringBuilder();
    localObject1 = ((Map)localObject1).values().iterator();
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Field)((Iterator)localObject1).next();
      if (((Parameter)((Field)localObject2).getAnnotation(Parameter.class)).required())
      {
        zzb.zzaE("Required server option missing: " + ((Parameter)((Field)localObject2).getAnnotation(Parameter.class)).name());
        if (paramMap.length() > 0) {
          paramMap.append(", ");
        }
        paramMap.append(((Parameter)((Field)localObject2).getAnnotation(Parameter.class)).name());
      }
    }
    if (paramMap.length() > 0) {
      throw new MappingException("Required server option(s) missing: " + paramMap.toString());
    }
    zzz();
  }
  
  protected void zzz() {}
  
  public static final class MappingException
    extends Exception
  {
    public MappingException(String paramString)
    {
      super();
    }
  }
  
  @Retention(RetentionPolicy.RUNTIME)
  @Target({java.lang.annotation.ElementType.FIELD})
  protected static @interface Parameter
  {
    String name();
    
    boolean required() default true;
  }
}
