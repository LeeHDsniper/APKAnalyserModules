.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;
.super Ljava/lang/Object;
.source "AdobeAssetLibrary.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

.field final synthetic val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

.field final synthetic val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

.field final synthetic val$weakThis:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/lang/ref/WeakReference;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 143
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion()V
    .registers 86

    .prologue
    .line 147
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_69b

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v9

    if-eqz v9, :cond_69b

    .line 149
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v9

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getAllChildren()Ljava/util/LinkedHashMap;

    move-result-object v76

    .line 151
    .local v76, "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    new-instance v55, Ljava/util/HashMap;

    invoke-direct/range {v55 .. v55}, Ljava/util/HashMap;-><init>()V

    .line 152
    .local v55, "brushItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;>;"
    new-instance v56, Ljava/util/HashMap;

    invoke-direct/range {v56 .. v56}, Ljava/util/HashMap;-><init>()V

    .line 153
    .local v56, "characterStyleItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;>;"
    new-instance v58, Ljava/util/HashMap;

    invoke-direct/range {v58 .. v58}, Ljava/util/HashMap;-><init>()V

    .line 154
    .local v58, "colorItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;>;"
    new-instance v60, Ljava/util/HashMap;

    invoke-direct/range {v60 .. v60}, Ljava/util/HashMap;-><init>()V

    .line 155
    .local v60, "colorThemeItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;>;"
    new-instance v74, Ljava/util/HashMap;

    invoke-direct/range {v74 .. v74}, Ljava/util/HashMap;-><init>()V

    .line 156
    .local v74, "layoutStyleItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;>;"
    new-instance v69, Ljava/util/HashMap;

    invoke-direct/range {v69 .. v69}, Ljava/util/HashMap;-><init>()V

    .line 157
    .local v69, "imageItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;>;"
    new-instance v75, Ljava/util/HashMap;

    invoke-direct/range {v75 .. v75}, Ljava/util/HashMap;-><init>()V

    .line 163
    .local v75, "lookItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;>;"
    new-instance v70, Ljava/util/ArrayList;

    invoke-virtual/range {v76 .. v76}, Ljava/util/LinkedHashMap;->size()I

    move-result v9

    move-object/from16 v0, v70

    invoke-direct {v0, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 166
    .local v70, "itemsByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-virtual/range {v76 .. v76}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_62
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_85

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/util/Map$Entry;

    .line 167
    .local v64, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-interface/range {v64 .. v64}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v71

    check-cast v71, Ljava/lang/String;

    .line 168
    .local v71, "key":Ljava/lang/String;
    invoke-interface/range {v64 .. v64}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 170
    .local v3, "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getAbsoluteIndex()J

    move-result-wide v10

    long-to-int v10, v10

    move-object/from16 v0, v70

    invoke-virtual {v0, v10, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_62

    .line 175
    .end local v3    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v64    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v71    # "key":Ljava/lang/String;
    :cond_85
    invoke-virtual/range {v76 .. v76}, Ljava/util/LinkedHashMap;->size()I

    move-result v77

    .line 177
    .local v77, "nodeChildrenCount":I
    const/16 v66, 0x0

    .local v66, "i":I
    :goto_8b
    move/from16 v0, v66

    move/from16 v1, v77

    if-ge v0, v1, :cond_629

    .line 178
    move-object/from16 v0, v70

    move/from16 v1, v66

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 180
    .restart local v3    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_18b

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    const-string v10, "application/vnd.adobe.element.brush+dcx"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_18b

    .line 181
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->primaryComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v54

    .line 182
    .local v54, "brushComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    const/16 v63, 0x0

    .line 183
    .local v63, "componentID":Ljava/lang/String;
    if-eqz v54, :cond_c3

    .line 184
    invoke-virtual/range {v54 .. v54}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v63

    .line 187
    :cond_c3
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iget-object v9, v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->href:Ljava/net/URI;

    invoke-virtual {v9}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v63

    invoke-static {v9, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v53

    .line 188
    .local v53, "brushASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v53

    iput-object v9, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    .line 189
    new-instance v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v9

    move-object/from16 v0, v53

    invoke-direct {v5, v0, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 190
    .local v5, "brushFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v9

    invoke-virtual {v5, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 192
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->renditionComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v79

    .line 193
    .local v79, "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    const/4 v4, 0x0

    .line 194
    .local v4, "renditionName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 195
    .local v6, "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    const/4 v7, 0x0

    .line 196
    .local v7, "renditionHeight":I
    const/4 v8, 0x0

    .line 197
    .local v8, "renditionWidth":I
    if-eqz v79, :cond_16f

    .line 198
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getName()Ljava/lang/String;

    move-result-object v4

    .line 199
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iget-object v9, v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->href:Ljava/net/URI;

    invoke-virtual {v9}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v78

    .line 200
    .local v78, "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    const-string v9, "image/png"

    move-object/from16 v0, v78

    iput-object v9, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    .line 201
    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v9

    move-object/from16 v0, v78

    invoke-direct {v6, v0, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 202
    .restart local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 204
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getHeight()I

    move-result v7

    .line 205
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getWidth()I

    move-result v8

    .line 208
    .end local v78    # "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    :cond_16f
    new-instance v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-direct/range {v2 .. v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 211
    .local v2, "style":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v55

    invoke-virtual {v0, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .end local v2    # "style":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;
    .end local v4    # "renditionName":Ljava/lang/String;
    .end local v5    # "brushFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v7    # "renditionHeight":I
    .end local v8    # "renditionWidth":I
    .end local v53    # "brushASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .end local v54    # "brushComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .end local v63    # "componentID":Ljava/lang/String;
    .end local v79    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_187
    :goto_187
    add-int/lit8 v66, v66, 0x1

    goto/16 :goto_8b

    .line 213
    :cond_18b
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_23b

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    const-string v10, "application/vnd.adobe.element.characterstyle+dcx"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_23b

    .line 214
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->characterStyleNodeForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    move-result-object v82

    .line 216
    .local v82, "styleNode":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    const-string v9, "characterstyle#data"

    move-object/from16 v0, v82

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/json/JSONObject;

    .line 218
    .local v12, "styleData":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->renditionComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v79

    .line 219
    .restart local v79    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    const/4 v4, 0x0

    .line 220
    .restart local v4    # "renditionName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 221
    .restart local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    const/4 v7, 0x0

    .line 222
    .restart local v7    # "renditionHeight":I
    const/4 v8, 0x0

    .line 223
    .restart local v8    # "renditionWidth":I
    if-eqz v79, :cond_21b

    .line 224
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getName()Ljava/lang/String;

    move-result-object v4

    .line 225
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iget-object v9, v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->href:Ljava/net/URI;

    invoke-virtual {v9}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v78

    .line 226
    .restart local v78    # "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    const-string v9, "image/png"

    move-object/from16 v0, v78

    iput-object v9, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    .line 227
    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v9

    move-object/from16 v0, v78

    invoke-direct {v6, v0, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 228
    .restart local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 230
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getHeight()I

    move-result v7

    .line 231
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getWidth()I

    move-result v8

    .line 234
    .end local v78    # "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    :cond_21b
    new-instance v2, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-object v9, v2

    move-object v10, v3

    move-object v11, v4

    move-object v13, v6

    move v14, v7

    move v15, v8

    invoke-direct/range {v9 .. v16}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 236
    .local v2, "style":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v56

    invoke-virtual {v0, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_187

    .line 238
    .end local v2    # "style":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;
    .end local v4    # "renditionName":Ljava/lang/String;
    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v7    # "renditionHeight":I
    .end local v8    # "renditionWidth":I
    .end local v12    # "styleData":Lorg/json/JSONObject;
    .end local v79    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .end local v82    # "styleNode":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    :cond_23b
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_315

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    const-string v10, "application/vnd.adobe.element.color+dcx"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_315

    .line 240
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colorNodeForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    move-result-object v59

    .line 241
    .local v59, "colorNode":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    const/16 v57, 0x0

    .line 242
    .local v57, "colorData":Lorg/json/JSONObject;
    const/16 v16, 0x0

    .line 243
    .local v16, "colorType":Ljava/lang/String;
    const/16 v17, 0x0

    .line 244
    .local v17, "colorMode":Ljava/lang/String;
    const/16 v18, 0x0

    .line 245
    .local v18, "colorComponents":Ljava/lang/Object;
    const/16 v19, 0x0

    .line 246
    .local v19, "colorAlpha":Ljava/lang/Number;
    const/16 v20, 0x0

    .line 248
    .local v20, "colorProfileName":Ljava/lang/String;
    if-eqz v59, :cond_29d

    .line 249
    const-string v9, "color#data"

    move-object/from16 v0, v59

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v57

    .end local v57    # "colorData":Lorg/json/JSONObject;
    check-cast v57, Lorg/json/JSONObject;

    .line 250
    .restart local v57    # "colorData":Lorg/json/JSONObject;
    const-string v9, "type"

    move-object/from16 v0, v57

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 251
    const-string v9, "mode"

    move-object/from16 v0, v57

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 252
    const-string v9, "value"

    move-object/from16 v0, v57

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    .line 253
    const-string v9, "alpha"

    move-object/from16 v0, v57

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    .end local v19    # "colorAlpha":Ljava/lang/Number;
    check-cast v19, Ljava/lang/Number;

    .line 254
    .restart local v19    # "colorAlpha":Ljava/lang/Number;
    const-string v9, "profileName"

    move-object/from16 v0, v57

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 256
    .end local v18    # "colorComponents":Ljava/lang/Object;
    :cond_29d
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colorRenditionNodeForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    move-result-object v81

    .line 257
    .local v81, "renditionNode":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    const/4 v4, 0x0

    .line 258
    .restart local v4    # "renditionName":Ljava/lang/String;
    const/16 v21, 0x0

    .line 259
    .local v21, "renditionType":Ljava/lang/String;
    const/16 v22, 0x0

    .line 260
    .local v22, "renditionMode":Ljava/lang/String;
    const/16 v23, 0x0

    .line 261
    .local v23, "renditionComponents":Ljava/lang/Object;
    const/16 v24, 0x0

    .line 262
    .local v24, "renditionAlpha":Ljava/lang/Number;
    const/16 v25, 0x0

    .line 263
    .local v25, "renditionProfileName":Ljava/lang/String;
    if-eqz v81, :cond_2f0

    .line 264
    invoke-virtual/range {v81 .. v81}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getName()Ljava/lang/String;

    move-result-object v4

    .line 265
    const-string v9, "color#data"

    move-object/from16 v0, v81

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v80

    check-cast v80, Lorg/json/JSONObject;

    .line 266
    .local v80, "renditionData":Lorg/json/JSONObject;
    const-string v9, "type"

    move-object/from16 v0, v80

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 267
    const-string v9, "mode"

    move-object/from16 v0, v80

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 268
    const-string v9, "value"

    move-object/from16 v0, v80

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v23

    .line 269
    const-string v9, "alpha"

    move-object/from16 v0, v80

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v24

    .end local v24    # "renditionAlpha":Ljava/lang/Number;
    check-cast v24, Ljava/lang/Number;

    .line 270
    .restart local v24    # "renditionAlpha":Ljava/lang/Number;
    const-string v9, "profileName"

    move-object/from16 v0, v80

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 274
    .end local v23    # "renditionComponents":Ljava/lang/Object;
    .end local v80    # "renditionData":Lorg/json/JSONObject;
    :cond_2f0
    new-instance v13, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    .line 275
    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-object v14, v3

    move-object v15, v4

    invoke-direct/range {v13 .. v26}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Number;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Number;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 281
    .local v13, "color":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;
    if-eqz v13, :cond_312

    invoke-virtual {v13}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->color()I

    move-result v62

    .line 282
    .local v62, "colorVal":I
    :goto_307
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v58

    invoke-virtual {v0, v9, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_187

    .line 281
    .end local v62    # "colorVal":I
    :cond_312
    const/16 v62, -0x1

    goto :goto_307

    .line 283
    .end local v4    # "renditionName":Ljava/lang/String;
    .end local v13    # "color":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;
    .end local v16    # "colorType":Ljava/lang/String;
    .end local v17    # "colorMode":Ljava/lang/String;
    .end local v19    # "colorAlpha":Ljava/lang/Number;
    .end local v20    # "colorProfileName":Ljava/lang/String;
    .end local v21    # "renditionType":Ljava/lang/String;
    .end local v22    # "renditionMode":Ljava/lang/String;
    .end local v24    # "renditionAlpha":Ljava/lang/Number;
    .end local v25    # "renditionProfileName":Ljava/lang/String;
    .end local v57    # "colorData":Lorg/json/JSONObject;
    .end local v59    # "colorNode":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v81    # "renditionNode":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    :cond_315
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_383

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    const-string v10, "application/vnd.adobe.element.colortheme+dcx"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_383

    .line 284
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colorThemeNodeForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    move-result-object v61

    .line 285
    .local v61, "colorThemeNode":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    if-eqz v61, :cond_187

    .line 286
    const-string v9, "colortheme#data"

    move-object/from16 v0, v61

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v83

    check-cast v83, Lorg/json/JSONObject;

    .line 287
    .local v83, "themeData":Lorg/json/JSONObject;
    const-string v9, "tags"

    move-object/from16 v0, v83

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/json/JSONArray;

    .line 288
    .local v28, "tags":Lorg/json/JSONArray;
    const-string v9, "rule"

    move-object/from16 v0, v83

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 289
    .local v29, "rule":Ljava/lang/String;
    const-string v9, "mood"

    move-object/from16 v0, v83

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 290
    .local v30, "mood":Ljava/lang/String;
    const-string v9, "swatches"

    move-object/from16 v0, v83

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lorg/json/JSONArray;

    .line 293
    .local v31, "swatches":Lorg/json/JSONArray;
    new-instance v26, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-object/from16 v27, v3

    invoke-direct/range {v26 .. v32}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 295
    .local v26, "theme":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v60

    move-object/from16 v1, v26

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_187

    .line 298
    .end local v26    # "theme":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;
    .end local v28    # "tags":Lorg/json/JSONArray;
    .end local v29    # "rule":Ljava/lang/String;
    .end local v30    # "mood":Ljava/lang/String;
    .end local v31    # "swatches":Lorg/json/JSONArray;
    .end local v61    # "colorThemeNode":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v83    # "themeData":Lorg/json/JSONObject;
    :cond_383
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_493

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    const-string v10, "application/vnd.adobe.element.image+dcx"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_493

    .line 299
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->primaryComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v68

    .line 300
    .local v68, "imageComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    const-string v65, ""

    .line 301
    .local v65, "fileName":Ljava/lang/String;
    const/16 v36, 0x0

    .line 302
    .local v36, "imageHeight":I
    const/16 v37, 0x0

    .line 303
    .local v37, "imageWidth":I
    const-string v41, ""

    .line 305
    .local v41, "type":Ljava/lang/String;
    if-eqz v68, :cond_3bd

    .line 306
    invoke-virtual/range {v68 .. v68}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v65

    .line 307
    invoke-virtual/range {v68 .. v68}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getHeight()I

    move-result v36

    .line 308
    invoke-virtual/range {v68 .. v68}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getWidth()I

    move-result v37

    .line 309
    invoke-virtual/range {v68 .. v68}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getType()Ljava/lang/String;

    move-result-object v41

    .line 312
    :cond_3bd
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iget-object v9, v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->href:Ljava/net/URI;

    invoke-virtual {v9}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v65

    invoke-static {v9, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v67

    .line 314
    .local v67, "imageASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v67

    iput-object v9, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    .line 315
    new-instance v35, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getAsrCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v9

    move-object/from16 v0, v35

    move-object/from16 v1, v67

    invoke-direct {v0, v1, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 316
    .local v35, "imageFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v9

    move-object/from16 v0, v35

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 318
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->renditionComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v79

    .line 319
    .restart local v79    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    const/4 v4, 0x0

    .line 320
    .restart local v4    # "renditionName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 321
    .restart local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    const/4 v7, 0x0

    .line 322
    .restart local v7    # "renditionHeight":I
    const/4 v8, 0x0

    .line 323
    .restart local v8    # "renditionWidth":I
    if-eqz v79, :cond_46d

    .line 324
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getName()Ljava/lang/String;

    move-result-object v4

    .line 325
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iget-object v9, v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->href:Ljava/net/URI;

    invoke-virtual {v9}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v78

    .line 327
    .restart local v78    # "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    const-string v9, "image/png"

    move-object/from16 v0, v78

    iput-object v9, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    .line 328
    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getAsrCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v9

    move-object/from16 v0, v78

    invoke-direct {v6, v0, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 329
    .restart local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 331
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getHeight()I

    move-result v7

    .line 332
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getWidth()I

    move-result v8

    .line 335
    .end local v78    # "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    :cond_46d
    new-instance v32, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    .line 336
    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-object/from16 v33, v3

    move-object/from16 v34, v4

    move-object/from16 v38, v6

    move/from16 v39, v7

    move/from16 v40, v8

    invoke-direct/range {v32 .. v42}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILjava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 338
    .local v32, "image":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v69

    move-object/from16 v1, v32

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_187

    .line 341
    .end local v4    # "renditionName":Ljava/lang/String;
    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v7    # "renditionHeight":I
    .end local v8    # "renditionWidth":I
    .end local v32    # "image":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    .end local v35    # "imageFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v36    # "imageHeight":I
    .end local v37    # "imageWidth":I
    .end local v41    # "type":Ljava/lang/String;
    .end local v65    # "fileName":Ljava/lang/String;
    .end local v67    # "imageASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .end local v68    # "imageComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .end local v79    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_493
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_58b

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    const-string v10, "application/vnd.adobe.element.layerstyle+dcx"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_58b

    .line 342
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->primaryComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v73

    .line 343
    .local v73, "layoutComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iget-object v9, v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->href:Ljava/net/URI;

    invoke-virtual {v9}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v73 .. v73}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v72

    .line 345
    .local v72, "layoutASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v72

    iput-object v9, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    .line 346
    new-instance v45, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getAsrCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v9

    move-object/from16 v0, v45

    move-object/from16 v1, v72

    invoke-direct {v0, v1, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 347
    .local v45, "layoutFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v9

    move-object/from16 v0, v45

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 349
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->renditionComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v79

    .line 350
    .restart local v79    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    const/4 v4, 0x0

    .line 351
    .restart local v4    # "renditionName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 352
    .restart local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    const/4 v7, 0x0

    .line 353
    .restart local v7    # "renditionHeight":I
    const/4 v8, 0x0

    .line 354
    .restart local v8    # "renditionWidth":I
    if-eqz v79, :cond_565

    .line 355
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getName()Ljava/lang/String;

    move-result-object v4

    .line 356
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iget-object v9, v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->href:Ljava/net/URI;

    invoke-virtual {v9}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v78

    .line 358
    .restart local v78    # "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    const-string v9, "image/png"

    move-object/from16 v0, v78

    iput-object v9, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    .line 359
    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getAsrCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v9

    move-object/from16 v0, v78

    invoke-direct {v6, v0, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 360
    .restart local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 362
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getHeight()I

    move-result v7

    .line 363
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getWidth()I

    move-result v8

    .line 367
    .end local v78    # "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    :cond_565
    new-instance v2, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-object/from16 v42, v2

    move-object/from16 v43, v3

    move-object/from16 v44, v4

    move-object/from16 v46, v6

    move/from16 v47, v7

    move/from16 v48, v8

    invoke-direct/range {v42 .. v49}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 369
    .local v2, "style":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v74

    invoke-virtual {v0, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_187

    .line 370
    .end local v2    # "style":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;
    .end local v4    # "renditionName":Ljava/lang/String;
    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v7    # "renditionHeight":I
    .end local v8    # "renditionWidth":I
    .end local v45    # "layoutFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v72    # "layoutASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .end local v73    # "layoutComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .end local v79    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_58b
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_187

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v9

    const-string v10, "application/vnd.adobe.element.look+dcx"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_187

    .line 371
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->renditionComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v79

    .line 372
    .restart local v79    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    const/4 v4, 0x0

    .line 373
    .restart local v4    # "renditionName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 374
    .restart local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    const/4 v7, 0x0

    .line 375
    .restart local v7    # "renditionHeight":I
    const/4 v8, 0x0

    .line 376
    .restart local v8    # "renditionWidth":I
    if-eqz v79, :cond_603

    .line 377
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getName()Ljava/lang/String;

    move-result-object v4

    .line 378
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iget-object v9, v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->href:Ljava/net/URI;

    invoke-virtual {v9}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v78

    .line 379
    .restart local v78    # "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    const-string v9, "image/png"

    move-object/from16 v0, v78

    iput-object v9, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    .line 380
    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v9

    move-object/from16 v0, v78

    invoke-direct {v6, v0, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 381
    .restart local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$self:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 383
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getHeight()I

    move-result v7

    .line 384
    invoke-virtual/range {v79 .. v79}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getWidth()I

    move-result v8

    .line 387
    .end local v78    # "renditionASR":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    :cond_603
    new-instance v46, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-object/from16 v47, v3

    move-object/from16 v48, v4

    move-object/from16 v49, v6

    move/from16 v50, v7

    move/from16 v51, v8

    invoke-direct/range {v46 .. v52}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 388
    .local v46, "look":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, v75

    move-object/from16 v1, v46

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_187

    .line 392
    .end local v3    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v4    # "renditionName":Ljava/lang/String;
    .end local v6    # "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v7    # "renditionHeight":I
    .end local v8    # "renditionWidth":I
    .end local v46    # "look":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;
    .end local v79    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_629
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v84

    check-cast v84, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .line 393
    .local v84, "thisObj":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    invoke-virtual/range {v55 .. v55}, Ljava/util/HashMap;->size()I

    move-result v9

    if-lez v9, :cond_640

    .line 394
    move-object/from16 v0, v84

    move-object/from16 v1, v55

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->brushes:Ljava/util/HashMap;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->access$002(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 396
    :cond_640
    invoke-virtual/range {v56 .. v56}, Ljava/util/HashMap;->size()I

    move-result v9

    if-lez v9, :cond_64d

    .line 397
    move-object/from16 v0, v84

    move-object/from16 v1, v56

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->characterStyles:Ljava/util/HashMap;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->access$102(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 399
    :cond_64d
    invoke-virtual/range {v58 .. v58}, Ljava/util/HashMap;->size()I

    move-result v9

    if-lez v9, :cond_65a

    .line 400
    move-object/from16 v0, v84

    move-object/from16 v1, v58

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colors:Ljava/util/HashMap;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->access$202(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 402
    :cond_65a
    invoke-virtual/range {v60 .. v60}, Ljava/util/HashMap;->size()I

    move-result v9

    if-lez v9, :cond_667

    .line 403
    move-object/from16 v0, v84

    move-object/from16 v1, v60

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colorThemes:Ljava/util/HashMap;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->access$302(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 405
    :cond_667
    invoke-virtual/range {v74 .. v74}, Ljava/util/HashMap;->size()I

    move-result v9

    if-lez v9, :cond_674

    .line 406
    move-object/from16 v0, v84

    move-object/from16 v1, v74

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->layoutStyles:Ljava/util/HashMap;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->access$402(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 408
    :cond_674
    invoke-virtual/range {v69 .. v69}, Ljava/util/HashMap;->size()I

    move-result v9

    if-lez v9, :cond_681

    .line 409
    move-object/from16 v0, v84

    move-object/from16 v1, v69

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->images:Ljava/util/HashMap;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->access$502(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 411
    :cond_681
    invoke-virtual/range {v75 .. v75}, Ljava/util/HashMap;->size()I

    move-result v9

    if-lez v9, :cond_68e

    .line 412
    move-object/from16 v0, v84

    move-object/from16 v1, v75

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->looks:Ljava/util/HashMap;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->access$602(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 415
    :cond_68e
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    if-eqz v9, :cond_69b

    .line 416
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-interface {v9}, Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;->onCompletion()V

    .line 419
    .end local v55    # "brushItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;>;"
    .end local v56    # "characterStyleItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;>;"
    .end local v58    # "colorItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;>;"
    .end local v60    # "colorThemeItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;>;"
    .end local v66    # "i":I
    .end local v69    # "imageItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;>;"
    .end local v70    # "itemsByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v74    # "layoutStyleItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;>;"
    .end local v75    # "lookItems":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;>;"
    .end local v76    # "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v77    # "nodeChildrenCount":I
    .end local v84    # "thisObj":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    :cond_69b
    return-void
.end method
