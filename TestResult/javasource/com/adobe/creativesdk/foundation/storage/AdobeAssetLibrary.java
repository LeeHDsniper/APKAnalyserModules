package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXComponent;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifest;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXUtils;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemCharacterStyle;
import com.adobe.creativesdk.foundation.adobeinternal.storage.library.AdobeAssetLibraryItemLayoutStyle;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceItem;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.lang.ref.WeakReference;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

public class AdobeAssetLibrary
  extends AdobeAssetPackage
{
  private HashMap<String, AdobeAssetLibraryItemBrush> brushes;
  private HashMap<String, AdobeAssetLibraryItemCharacterStyle> characterStyles;
  private HashMap<String, AdobeAssetLibraryItemColorTheme> colorThemes;
  private HashMap<String, AdobeAssetLibraryItemColor> colors;
  private HashMap<String, AdobeAssetLibraryItemImage> images;
  private HashMap<String, AdobeAssetLibraryItemLayoutStyle> layoutStyles;
  private HashMap<String, AdobeAssetLibraryItemLook> looks;
  
  public AdobeAssetLibrary()
  {
    initcommon();
  }
  
  public AdobeAssetLibrary(AdobeStorageResourceCollection paramAdobeStorageResourceCollection1, AdobeStorageResourceCollection paramAdobeStorageResourceCollection2)
  {
    super(paramAdobeStorageResourceCollection1, paramAdobeStorageResourceCollection2);
    initcommon();
  }
  
  private void initcommon()
  {
    brushes = new HashMap();
    characterStyles = new HashMap();
    colors = new HashMap();
    colorThemes = new HashMap();
    layoutStyles = new HashMap();
    images = new HashMap();
    looks = new HashMap();
  }
  
  AdobeDCXManifestNode characterStyleNodeForNode(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    paramAdobeDCXManifestNode = getManifest().getChildrenOf(paramAdobeDCXManifestNode).iterator();
    while (paramAdobeDCXManifestNode.hasNext())
    {
      AdobeDCXManifestNode localAdobeDCXManifestNode = (AdobeDCXManifestNode)paramAdobeDCXManifestNode.next();
      if ((localAdobeDCXManifestNode.getType() != null) && (localAdobeDCXManifestNode.getType().equals("application/vnd.adobe.characterstyle+json"))) {
        return localAdobeDCXManifestNode;
      }
    }
    return null;
  }
  
  AdobeDCXManifestNode colorNodeForNode(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    paramAdobeDCXManifestNode = getManifest().getChildrenOf(paramAdobeDCXManifestNode).iterator();
    while (paramAdobeDCXManifestNode.hasNext())
    {
      AdobeDCXManifestNode localAdobeDCXManifestNode = (AdobeDCXManifestNode)paramAdobeDCXManifestNode.next();
      if ((localAdobeDCXManifestNode.getType() != null) && (localAdobeDCXManifestNode.getType().equals("application/vnd.adobe.color+json"))) {
        return localAdobeDCXManifestNode;
      }
    }
    return null;
  }
  
  AdobeDCXManifestNode colorRenditionNodeForNode(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    paramAdobeDCXManifestNode = getManifest().getChildrenOf(paramAdobeDCXManifestNode).iterator();
    while (paramAdobeDCXManifestNode.hasNext())
    {
      AdobeDCXManifestNode localAdobeDCXManifestNode = (AdobeDCXManifestNode)paramAdobeDCXManifestNode.next();
      if ((localAdobeDCXManifestNode.get("library#rel") != null) && (localAdobeDCXManifestNode.get("library#rel").equals("rendition"))) {
        return localAdobeDCXManifestNode;
      }
    }
    return null;
  }
  
  AdobeDCXManifestNode colorThemeNodeForNode(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    paramAdobeDCXManifestNode = getManifest().getChildrenOf(paramAdobeDCXManifestNode).iterator();
    while (paramAdobeDCXManifestNode.hasNext())
    {
      AdobeDCXManifestNode localAdobeDCXManifestNode = (AdobeDCXManifestNode)paramAdobeDCXManifestNode.next();
      if ((localAdobeDCXManifestNode.getType() != null) && (localAdobeDCXManifestNode.getType().equals("application/vnd.adobe.colortheme+json"))) {
        return localAdobeDCXManifestNode;
      }
    }
    return null;
  }
  
  public int count()
  {
    int i2 = 0;
    int i;
    int j;
    label33:
    int k;
    label48:
    int m;
    label64:
    int n;
    if (colors != null)
    {
      i = colors.size();
      if (colorThemes == null) {
        break label135;
      }
      j = colorThemes.size();
      if (images == null) {
        break label140;
      }
      k = images.size();
      if (characterStyles == null) {
        break label145;
      }
      m = characterStyles.size();
      if (brushes == null) {
        break label151;
      }
      n = brushes.size();
      label80:
      if (layoutStyles == null) {
        break label157;
      }
    }
    label135:
    label140:
    label145:
    label151:
    label157:
    for (int i1 = layoutStyles.size();; i1 = 0)
    {
      if (looks != null) {
        i2 = looks.size();
      }
      return i1 + (j + i + k + m + n) + i2;
      i = 0;
      break;
      j = 0;
      break label33;
      k = 0;
      break label48;
      m = 0;
      break label64;
      n = 0;
      break label80;
    }
  }
  
  public HashMap<String, AdobeAssetLibraryItemBrush> getBrushes()
  {
    return brushes;
  }
  
  public HashMap<String, AdobeAssetLibraryItemCharacterStyle> getCharacterStyles()
  {
    return characterStyles;
  }
  
  public HashMap<String, AdobeAssetLibraryItemColorTheme> getColorThemes()
  {
    return colorThemes;
  }
  
  public HashMap<String, AdobeAssetLibraryItemColor> getColors()
  {
    return colors;
  }
  
  public HashMap<String, AdobeAssetLibraryItemImage> getImages()
  {
    return images;
  }
  
  public HashMap<String, AdobeAssetLibraryItemLayoutStyle> getLayoutStyles()
  {
    return layoutStyles;
  }
  
  public HashMap<String, AdobeAssetLibraryItemLook> getLooks()
  {
    return looks;
  }
  
  public void loadMetadata(final IAdobeRequestCompletionCallback paramIAdobeRequestCompletionCallback, IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    super.loadMetadata(new IAdobeRequestCompletionCallback()
    {
      public void onCompletion()
      {
        if ((val$weakThis.get() != null) && (((AdobeAssetLibrary)val$weakThis.get()).getManifest() != null))
        {
          Object localObject1 = ((AdobeAssetLibrary)val$weakThis.get()).getManifest().getAllChildren();
          HashMap localHashMap1 = new HashMap();
          HashMap localHashMap2 = new HashMap();
          HashMap localHashMap3 = new HashMap();
          HashMap localHashMap4 = new HashMap();
          HashMap localHashMap5 = new HashMap();
          HashMap localHashMap6 = new HashMap();
          HashMap localHashMap7 = new HashMap();
          ArrayList localArrayList = new ArrayList(((LinkedHashMap)localObject1).size());
          Object localObject2 = ((LinkedHashMap)localObject1).entrySet().iterator();
          Object localObject3;
          Object localObject4;
          while (((Iterator)localObject2).hasNext())
          {
            localObject3 = (Map.Entry)((Iterator)localObject2).next();
            localObject4 = (String)((Map.Entry)localObject3).getKey();
            localObject3 = (AdobeDCXManifestNode)((Map.Entry)localObject3).getValue();
            localArrayList.add((int)((AdobeDCXManifestNode)localObject3).getAbsoluteIndex(), localObject3);
          }
          int i1 = ((LinkedHashMap)localObject1).size();
          int i = 0;
          if (i < i1)
          {
            AdobeDCXManifestNode localAdobeDCXManifestNode1 = (AdobeDCXManifestNode)localArrayList.get(i);
            int j;
            int k;
            if ((localAdobeDCXManifestNode1.getType() != null) && (localAdobeDCXManifestNode1.getType().equals("application/vnd.adobe.element.brush+dcx")))
            {
              localObject2 = ((AdobeAssetLibrary)val$weakThis.get()).primaryComponentForNode(localAdobeDCXManifestNode1);
              localObject1 = null;
              if (localObject2 != null) {
                localObject1 = ((AdobeDCXComponent)localObject2).getComponentId();
              }
              localObject1 = AdobeStorageResourceItem.resourceFromHref(URI.create(AdobeDCXUtils.stringByAppendingLastPathComponent(val$weakThis.get()).href.getRawPath(), (String)localObject1)));
              type = localAdobeDCXManifestNode1.getType();
              localObject3 = new AdobeAssetFile((AdobeStorageResourceItem)localObject1, ((AdobeAssetLibrary)val$weakThis.get()).resourceCollection());
              ((AdobeAssetFile)localObject3).setCloud(jdField_this.getCloud());
              localObject4 = ((AdobeAssetLibrary)val$weakThis.get()).renditionComponentForNode(localAdobeDCXManifestNode1);
              localObject1 = null;
              localObject2 = null;
              j = 0;
              k = 0;
              if (localObject4 != null)
              {
                localObject1 = ((AdobeDCXComponent)localObject4).getName();
                localObject2 = AdobeStorageResourceItem.resourceFromHref(URI.create(AdobeDCXUtils.stringByAppendingLastPathComponent(val$weakThis.get()).href.getRawPath(), ((AdobeDCXComponent)localObject4).getComponentId())));
                type = "image/png";
                localObject2 = new AdobeAssetFile((AdobeStorageResourceItem)localObject2, ((AdobeAssetLibrary)val$weakThis.get()).resourceCollection());
                ((AdobeAssetFile)localObject2).setCloud(jdField_this.getCloud());
                j = ((AdobeDCXComponent)localObject4).getHeight();
                k = ((AdobeDCXComponent)localObject4).getWidth();
              }
              localObject1 = new AdobeAssetLibraryItemBrush(localAdobeDCXManifestNode1, (String)localObject1, (AdobeAssetFile)localObject3, (AdobeAssetFile)localObject2, j, k, (AdobeAssetLibrary)val$weakThis.get());
              localHashMap1.put(localAdobeDCXManifestNode1.getNodeId(), localObject1);
            }
            for (;;)
            {
              i += 1;
              break;
              if ((localAdobeDCXManifestNode1.getType() != null) && (localAdobeDCXManifestNode1.getType().equals("application/vnd.adobe.element.characterstyle+dcx")))
              {
                localObject3 = (JSONObject)((AdobeAssetLibrary)val$weakThis.get()).characterStyleNodeForNode(localAdobeDCXManifestNode1).get("characterstyle#data");
                localObject4 = ((AdobeAssetLibrary)val$weakThis.get()).renditionComponentForNode(localAdobeDCXManifestNode1);
                localObject1 = null;
                localObject2 = null;
                j = 0;
                k = 0;
                if (localObject4 != null)
                {
                  localObject1 = ((AdobeDCXComponent)localObject4).getName();
                  localObject2 = AdobeStorageResourceItem.resourceFromHref(URI.create(AdobeDCXUtils.stringByAppendingLastPathComponent(val$weakThis.get()).href.getRawPath(), ((AdobeDCXComponent)localObject4).getComponentId())));
                  type = "image/png";
                  localObject2 = new AdobeAssetFile((AdobeStorageResourceItem)localObject2, ((AdobeAssetLibrary)val$weakThis.get()).resourceCollection());
                  ((AdobeAssetFile)localObject2).setCloud(jdField_this.getCloud());
                  j = ((AdobeDCXComponent)localObject4).getHeight();
                  k = ((AdobeDCXComponent)localObject4).getWidth();
                }
                localObject1 = new AdobeAssetLibraryItemCharacterStyle(localAdobeDCXManifestNode1, (String)localObject1, (JSONObject)localObject3, (AdobeAssetFile)localObject2, j, k, (AdobeAssetLibrary)val$weakThis.get());
                localHashMap2.put(localAdobeDCXManifestNode1.getNodeId(), localObject1);
              }
              else
              {
                Object localObject5;
                if ((localAdobeDCXManifestNode1.getType() != null) && (localAdobeDCXManifestNode1.getType().equals("application/vnd.adobe.element.color+dcx")))
                {
                  Object localObject6 = ((AdobeAssetLibrary)val$weakThis.get()).colorNodeForNode(localAdobeDCXManifestNode1);
                  localObject1 = null;
                  localObject2 = null;
                  localObject3 = null;
                  localObject4 = null;
                  localObject5 = null;
                  if (localObject6 != null)
                  {
                    localObject5 = (JSONObject)((AdobeDCXManifestNode)localObject6).get("color#data");
                    localObject1 = ((JSONObject)localObject5).optString("type");
                    localObject2 = ((JSONObject)localObject5).optString("mode");
                    localObject3 = ((JSONObject)localObject5).opt("value");
                    localObject4 = (Number)((JSONObject)localObject5).opt("alpha");
                    localObject5 = ((JSONObject)localObject5).optString("profileName");
                  }
                  AdobeDCXManifestNode localAdobeDCXManifestNode2 = ((AdobeAssetLibrary)val$weakThis.get()).colorRenditionNodeForNode(localAdobeDCXManifestNode1);
                  localObject6 = null;
                  String str1 = null;
                  String str2 = null;
                  Object localObject7 = null;
                  Number localNumber = null;
                  Object localObject8 = null;
                  if (localAdobeDCXManifestNode2 != null)
                  {
                    localObject6 = localAdobeDCXManifestNode2.getName();
                    localObject8 = (JSONObject)localAdobeDCXManifestNode2.get("color#data");
                    str1 = ((JSONObject)localObject8).optString("type");
                    str2 = ((JSONObject)localObject8).optString("mode");
                    localObject7 = ((JSONObject)localObject8).opt("value");
                    localNumber = (Number)((JSONObject)localObject8).opt("alpha");
                    localObject8 = ((JSONObject)localObject8).optString("profileName");
                  }
                  localObject1 = new AdobeAssetLibraryItemColor(localAdobeDCXManifestNode1, (String)localObject6, (String)localObject1, (String)localObject2, localObject3, (Number)localObject4, (String)localObject5, str1, str2, localObject7, localNumber, (String)localObject8, (AdobeAssetLibrary)val$weakThis.get());
                  if (localObject1 != null) {
                    ((AdobeAssetLibraryItemColor)localObject1).color();
                  }
                  for (;;)
                  {
                    localHashMap3.put(localAdobeDCXManifestNode1.getNodeId(), localObject1);
                    break;
                  }
                }
                if ((localAdobeDCXManifestNode1.getType() != null) && (localAdobeDCXManifestNode1.getType().equals("application/vnd.adobe.element.colortheme+dcx")))
                {
                  localObject1 = ((AdobeAssetLibrary)val$weakThis.get()).colorThemeNodeForNode(localAdobeDCXManifestNode1);
                  if (localObject1 != null)
                  {
                    localObject1 = (JSONObject)((AdobeDCXManifestNode)localObject1).get("colortheme#data");
                    localObject1 = new AdobeAssetLibraryItemColorTheme(localAdobeDCXManifestNode1, (JSONArray)((JSONObject)localObject1).opt("tags"), ((JSONObject)localObject1).optString("rule"), ((JSONObject)localObject1).optString("mood"), (JSONArray)((JSONObject)localObject1).opt("swatches"), (AdobeAssetLibrary)val$weakThis.get());
                    localHashMap4.put(localAdobeDCXManifestNode1.getNodeId(), localObject1);
                  }
                }
                else if ((localAdobeDCXManifestNode1.getType() != null) && (localAdobeDCXManifestNode1.getType().equals("application/vnd.adobe.element.image+dcx")))
                {
                  localObject3 = ((AdobeAssetLibrary)val$weakThis.get()).primaryComponentForNode(localAdobeDCXManifestNode1);
                  localObject2 = "";
                  j = 0;
                  k = 0;
                  localObject1 = "";
                  if (localObject3 != null)
                  {
                    localObject2 = ((AdobeDCXComponent)localObject3).getComponentId();
                    j = ((AdobeDCXComponent)localObject3).getHeight();
                    k = ((AdobeDCXComponent)localObject3).getWidth();
                    localObject1 = ((AdobeDCXComponent)localObject3).getType();
                  }
                  localObject2 = AdobeStorageResourceItem.resourceFromHref(URI.create(AdobeDCXUtils.stringByAppendingLastPathComponent(val$weakThis.get()).href.getRawPath(), (String)localObject2)));
                  type = localAdobeDCXManifestNode1.getType();
                  localObject4 = new AdobeAssetFile((AdobeStorageResourceItem)localObject2, ((AdobeAssetLibrary)val$weakThis.get()).getAsrCollection());
                  ((AdobeAssetFile)localObject4).setCloud(jdField_this.getCloud());
                  localObject5 = ((AdobeAssetLibrary)val$weakThis.get()).renditionComponentForNode(localAdobeDCXManifestNode1);
                  localObject2 = null;
                  localObject3 = null;
                  int m = 0;
                  int n = 0;
                  if (localObject5 != null)
                  {
                    localObject2 = ((AdobeDCXComponent)localObject5).getName();
                    localObject3 = AdobeStorageResourceItem.resourceFromHref(URI.create(AdobeDCXUtils.stringByAppendingLastPathComponent(val$weakThis.get()).href.getRawPath(), ((AdobeDCXComponent)localObject5).getComponentId())));
                    type = "image/png";
                    localObject3 = new AdobeAssetFile((AdobeStorageResourceItem)localObject3, ((AdobeAssetLibrary)val$weakThis.get()).getAsrCollection());
                    ((AdobeAssetFile)localObject3).setCloud(jdField_this.getCloud());
                    m = ((AdobeDCXComponent)localObject5).getHeight();
                    n = ((AdobeDCXComponent)localObject5).getWidth();
                  }
                  localObject1 = new AdobeAssetLibraryItemImage(localAdobeDCXManifestNode1, (String)localObject2, (AdobeAssetFile)localObject4, j, k, (AdobeAssetFile)localObject3, m, n, (String)localObject1, (AdobeAssetLibrary)val$weakThis.get());
                  localHashMap6.put(localAdobeDCXManifestNode1.getNodeId(), localObject1);
                }
                else if ((localAdobeDCXManifestNode1.getType() != null) && (localAdobeDCXManifestNode1.getType().equals("application/vnd.adobe.element.layerstyle+dcx")))
                {
                  localObject1 = ((AdobeAssetLibrary)val$weakThis.get()).primaryComponentForNode(localAdobeDCXManifestNode1);
                  localObject1 = AdobeStorageResourceItem.resourceFromHref(URI.create(AdobeDCXUtils.stringByAppendingLastPathComponent(val$weakThis.get()).href.getRawPath(), ((AdobeDCXComponent)localObject1).getComponentId())));
                  type = localAdobeDCXManifestNode1.getType();
                  localObject3 = new AdobeAssetFile((AdobeStorageResourceItem)localObject1, ((AdobeAssetLibrary)val$weakThis.get()).getAsrCollection());
                  ((AdobeAssetFile)localObject3).setCloud(jdField_this.getCloud());
                  localObject4 = ((AdobeAssetLibrary)val$weakThis.get()).renditionComponentForNode(localAdobeDCXManifestNode1);
                  localObject1 = null;
                  localObject2 = null;
                  j = 0;
                  k = 0;
                  if (localObject4 != null)
                  {
                    localObject1 = ((AdobeDCXComponent)localObject4).getName();
                    localObject2 = AdobeStorageResourceItem.resourceFromHref(URI.create(AdobeDCXUtils.stringByAppendingLastPathComponent(val$weakThis.get()).href.getRawPath(), ((AdobeDCXComponent)localObject4).getComponentId())));
                    type = "image/png";
                    localObject2 = new AdobeAssetFile((AdobeStorageResourceItem)localObject2, ((AdobeAssetLibrary)val$weakThis.get()).getAsrCollection());
                    ((AdobeAssetFile)localObject2).setCloud(jdField_this.getCloud());
                    j = ((AdobeDCXComponent)localObject4).getHeight();
                    k = ((AdobeDCXComponent)localObject4).getWidth();
                  }
                  localObject1 = new AdobeAssetLibraryItemLayoutStyle(localAdobeDCXManifestNode1, (String)localObject1, (AdobeAssetFile)localObject3, (AdobeAssetFile)localObject2, j, k, (AdobeAssetLibrary)val$weakThis.get());
                  localHashMap5.put(localAdobeDCXManifestNode1.getNodeId(), localObject1);
                }
                else if ((localAdobeDCXManifestNode1.getType() != null) && (localAdobeDCXManifestNode1.getType().equals("application/vnd.adobe.element.look+dcx")))
                {
                  localObject3 = ((AdobeAssetLibrary)val$weakThis.get()).renditionComponentForNode(localAdobeDCXManifestNode1);
                  localObject1 = null;
                  localObject2 = null;
                  j = 0;
                  k = 0;
                  if (localObject3 != null)
                  {
                    localObject1 = ((AdobeDCXComponent)localObject3).getName();
                    localObject2 = AdobeStorageResourceItem.resourceFromHref(URI.create(AdobeDCXUtils.stringByAppendingLastPathComponent(val$weakThis.get()).href.getRawPath(), ((AdobeDCXComponent)localObject3).getComponentId())));
                    type = "image/png";
                    localObject2 = new AdobeAssetFile((AdobeStorageResourceItem)localObject2, ((AdobeAssetLibrary)val$weakThis.get()).resourceCollection());
                    ((AdobeAssetFile)localObject2).setCloud(jdField_this.getCloud());
                    j = ((AdobeDCXComponent)localObject3).getHeight();
                    k = ((AdobeDCXComponent)localObject3).getWidth();
                  }
                  localObject1 = new AdobeAssetLibraryItemLook(localAdobeDCXManifestNode1, (String)localObject1, (AdobeAssetFile)localObject2, j, k, (AdobeAssetLibrary)val$weakThis.get());
                  localHashMap7.put(localAdobeDCXManifestNode1.getNodeId(), localObject1);
                }
              }
            }
          }
          localObject1 = (AdobeAssetLibrary)val$weakThis.get();
          if (localHashMap1.size() > 0) {
            AdobeAssetLibrary.access$002((AdobeAssetLibrary)localObject1, localHashMap1);
          }
          if (localHashMap2.size() > 0) {
            AdobeAssetLibrary.access$102((AdobeAssetLibrary)localObject1, localHashMap2);
          }
          if (localHashMap3.size() > 0) {
            AdobeAssetLibrary.access$202((AdobeAssetLibrary)localObject1, localHashMap3);
          }
          if (localHashMap4.size() > 0) {
            AdobeAssetLibrary.access$302((AdobeAssetLibrary)localObject1, localHashMap4);
          }
          if (localHashMap5.size() > 0) {
            AdobeAssetLibrary.access$402((AdobeAssetLibrary)localObject1, localHashMap5);
          }
          if (localHashMap6.size() > 0) {
            AdobeAssetLibrary.access$502((AdobeAssetLibrary)localObject1, localHashMap6);
          }
          if (localHashMap7.size() > 0) {
            AdobeAssetLibrary.access$602((AdobeAssetLibrary)localObject1, localHashMap7);
          }
          if (paramIAdobeRequestCompletionCallback != null) {
            paramIAdobeRequestCompletionCallback.onCompletion();
          }
        }
      }
    }, paramIAdobeGenericErrorCallback);
  }
  
  AdobeDCXComponent primaryComponentForNode(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    paramAdobeDCXManifestNode = getManifest().getComponentsOfChild(paramAdobeDCXManifestNode).iterator();
    while (paramAdobeDCXManifestNode.hasNext())
    {
      AdobeDCXComponent localAdobeDCXComponent = (AdobeDCXComponent)paramAdobeDCXManifestNode.next();
      if ((localAdobeDCXComponent.getRelationship() != null) && (localAdobeDCXComponent.getRelationship().equals("primary"))) {
        return localAdobeDCXComponent;
      }
    }
    return null;
  }
  
  AdobeDCXComponent renditionComponentForNode(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    paramAdobeDCXManifestNode = getManifest().getComponentsOfChild(paramAdobeDCXManifestNode).iterator();
    while (paramAdobeDCXManifestNode.hasNext())
    {
      AdobeDCXComponent localAdobeDCXComponent = (AdobeDCXComponent)paramAdobeDCXManifestNode.next();
      if ((localAdobeDCXComponent.getRelationship() != null) && (localAdobeDCXComponent.getRelationship().equals("rendition")) && (localAdobeDCXComponent.getType() != null) && ((localAdobeDCXComponent.getType().equals("image/png")) || (localAdobeDCXComponent.getType().equals("image/jpg")))) {
        return localAdobeDCXComponent;
      }
    }
    return null;
  }
}
