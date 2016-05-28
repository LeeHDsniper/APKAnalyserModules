.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;
.super Ljava/lang/Object;
.source "AdobeAssetSketchbook.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;->loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

.field final synthetic val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

.field final synthetic val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion()V
    .registers 19

    .prologue
    .line 43
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v14

    if-eqz v14, :cond_51

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v14

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getAllChildren()Ljava/util/LinkedHashMap;

    move-result-object v8

    .line 44
    .local v8, "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    :goto_16
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .local v10, "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    if-eqz v8, :cond_a1

    .line 54
    invoke-virtual {v8}, Ljava/util/LinkedHashMap;->size()I

    move-result v9

    .line 55
    .local v9, "nodeChildrenCount":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 58
    .local v11, "pagesByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-virtual {v8}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_2e
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_53

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 59
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 60
    .local v6, "key":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 61
    .local v7, "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getAbsoluteIndex()J

    move-result-wide v16

    move-wide/from16 v0, v16

    long-to-int v15, v0

    invoke-virtual {v11, v15, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2e

    .line 43
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v8    # "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v9    # "nodeChildrenCount":I
    .end local v10    # "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    .end local v11    # "pagesByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    :cond_51
    const/4 v8, 0x0

    goto :goto_16

    .line 64
    .restart local v8    # "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .restart local v9    # "nodeChildrenCount":I
    .restart local v10    # "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    .restart local v11    # "pagesByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    :cond_53
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_54
    if-ge v5, v9, :cond_a1

    .line 65
    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 67
    .restart local v7    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v14

    invoke-virtual {v14, v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getComponentsOfChild(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;

    move-result-object v3

    .line 69
    .local v3, "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    const/4 v12, 0x0

    .line 71
    .local v12, "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_6d
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_8c

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    .line 72
    .local v2, "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_6d

    .line 73
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v15

    const-string v16, "rendition"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6d

    .line 74
    move-object v12, v2

    .line 79
    .end local v2    # "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_8c
    if-eqz v12, :cond_9e

    .line 80
    new-instance v13, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getName()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    invoke-direct {v13, v14, v5, v12, v15}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;-><init>(Ljava/lang/String;ILcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 82
    .local v13, "sketchbookPage":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;
    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .end local v13    # "sketchbookPage":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;
    :cond_9e
    add-int/lit8 v5, v5, 0x1

    goto :goto_54

    .line 87
    .end local v3    # "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    .end local v5    # "i":I
    .end local v7    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v9    # "nodeChildrenCount":I
    .end local v11    # "pagesByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v12    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_a1
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-lez v14, :cond_ad

    .line 88
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    iput-object v10, v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;->pages:Ljava/util/ArrayList;

    .line 91
    :cond_ad
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    if-eqz v14, :cond_ba

    .line 92
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-interface {v14}, Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;->onCompletion()V

    .line 95
    :cond_ba
    return-void
.end method
