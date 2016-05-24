.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;
.super Ljava/lang/Object;
.source "AdobeAssetDrawFile.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;->loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

.field final synthetic val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

.field final synthetic val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion()V
    .registers 19

    .prologue
    .line 45
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v14

    if-eqz v14, :cond_51

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v14

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getAllChildren()Ljava/util/LinkedHashMap;

    move-result-object v9

    .line 46
    .local v9, "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    :goto_16
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .local v11, "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    if-eqz v9, :cond_a1

    .line 56
    invoke-virtual {v9}, Ljava/util/LinkedHashMap;->size()I

    move-result v10

    .line 57
    .local v10, "nodeChildrenCount":I
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 60
    .local v12, "pagesByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-virtual {v9}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_2e
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_53

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 61
    .local v5, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 62
    .local v7, "key":Ljava/lang/String;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 63
    .local v8, "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getAbsoluteIndex()J

    move-result-wide v16

    move-wide/from16 v0, v16

    long-to-int v15, v0

    invoke-virtual {v12, v15, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2e

    .line 45
    .end local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v7    # "key":Ljava/lang/String;
    .end local v8    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v9    # "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v10    # "nodeChildrenCount":I
    .end local v11    # "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    .end local v12    # "pagesByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    :cond_51
    const/4 v9, 0x0

    goto :goto_16

    .line 66
    .restart local v9    # "nodeChildren":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .restart local v10    # "nodeChildrenCount":I
    .restart local v11    # "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    .restart local v12    # "pagesByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    :cond_53
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_54
    if-ge v6, v10, :cond_a1

    .line 67
    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 69
    .restart local v8    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v14

    invoke-virtual {v14, v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getComponentsOfChild(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;

    move-result-object v3

    .line 71
    .local v3, "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    const/4 v13, 0x0

    .line 73
    .local v13, "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_6d
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_8c

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    .line 74
    .local v2, "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_6d

    .line 75
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v15

    const-string v16, "rendition"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6d

    .line 76
    move-object v13, v2

    .line 81
    .end local v2    # "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_8c
    if-eqz v13, :cond_9e

    .line 82
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetDrawPage;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getName()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    invoke-direct {v4, v14, v6, v13, v15}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetDrawPage;-><init>(Ljava/lang/String;ILcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 84
    .local v4, "drawPage":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetDrawPage;
    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .end local v4    # "drawPage":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetDrawPage;
    :cond_9e
    add-int/lit8 v6, v6, 0x1

    goto :goto_54

    .line 89
    .end local v3    # "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    .end local v6    # "i":I
    .end local v8    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v10    # "nodeChildrenCount":I
    .end local v12    # "pagesByAbsoluteIndex":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    .end local v13    # "renditionComponent":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_a1
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-lez v14, :cond_ad

    .line 90
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    iput-object v11, v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;->pages:Ljava/util/ArrayList;

    .line 93
    :cond_ad
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    if-eqz v14, :cond_ba

    .line 94
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile$1;->val$successCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;

    invoke-interface {v14}, Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;->onCompletion()V

    .line 97
    :cond_ba
    return-void
.end method
