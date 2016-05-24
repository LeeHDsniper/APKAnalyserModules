.class Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;
.super Ljava/lang/Object;
.source "AdobeAssetProductFolder.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getNextPage(ILcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

.field final synthetic val$nextPageDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;

.field final synthetic val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$nextPageDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 14
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    const/4 v11, 0x1

    .line 241
    if-eqz p1, :cond_137

    .line 243
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    # setter for: Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v9, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->access$002(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .line 244
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    # setter for: Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->firstPageLoaded:Z
    invoke-static {v9, v11}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->access$102(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;Z)Z

    .line 246
    const-string v5, "assets/([-_\\w]+)/"

    .line 248
    .local v5, "pattern":Ljava/lang/String;
    const/4 v9, 0x2

    invoke-static {v5, v9}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v7

    .line 251
    .local v7, "regex":Ljava/util/regex/Pattern;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getChildren()Ljava/util/ArrayList;

    move-result-object v2

    .line 252
    .local v2, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 253
    .local v8, "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    if-eqz v2, :cond_12e

    .line 254
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_23
    :goto_23
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_12e

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;

    .line 258
    .local v0, "aChildren":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    instance-of v10, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    if-eqz v10, :cond_23

    move-object v1, v0

    .line 259
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .line 262
    .local v1, "asrc":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    iget-object v10, v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->href:Ljava/net/URI;

    invoke-virtual {v10}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 263
    .local v3, "m":Ljava/util/regex/Matcher;
    const-string v6, ""

    .line 264
    .local v6, "product":Ljava/lang/String;
    :goto_42
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v10

    if-eqz v10, :cond_4d

    .line 265
    invoke-virtual {v3, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_42

    .line 267
    :cond_4d
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 272
    const-string v10, "adobedraw"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_71

    .line 274
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetDrawFileInternal;

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    # invokes: Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->access$200(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v10

    invoke-direct {v4, v1, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetDrawFileInternal;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 275
    .local v4, "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetDrawFileInternal;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetDrawFileInternal;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 276
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_23

    .line 279
    .end local v4    # "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetDrawFileInternal;
    :cond_71
    const-string v10, "adobe-libraries"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_91

    .line 281
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLibraryInternal;

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    # invokes: Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->access$300(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v10

    invoke-direct {v4, v1, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLibraryInternal;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 282
    .local v4, "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLibraryInternal;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLibraryInternal;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 283
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_23

    .line 286
    .end local v4    # "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLibraryInternal;
    :cond_91
    const-string v10, "adobe-line"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b2

    .line 288
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLineFileInternal;

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    # invokes: Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->access$400(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v10

    invoke-direct {v4, v1, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLineFileInternal;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 289
    .local v4, "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLineFileInternal;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLineFileInternal;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 290
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_23

    .line 293
    .end local v4    # "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLineFileInternal;
    :cond_b2
    const-string v10, "adobesketch"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_d3

    .line 295
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookInternal;

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    # invokes: Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->access$500(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v10

    invoke-direct {v4, v1, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookInternal;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 296
    .local v4, "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookInternal;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookInternal;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 297
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_23

    .line 300
    .end local v4    # "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookInternal;
    :cond_d3
    const-string v10, "adobe-psmix"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_f4

    .line 302
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixFileInternal;

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    # invokes: Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->access$600(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v10

    invoke-direct {v4, v1, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixFileInternal;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 303
    .local v4, "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixFileInternal;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixFileInternal;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 304
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_23

    .line 306
    .end local v4    # "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixFileInternal;
    :cond_f4
    const-string v10, "adobe-layup"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_115

    .line 308
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetCompFileInternal;

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    # invokes: Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->access$700(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v10

    invoke-direct {v4, v1, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetCompFileInternal;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 309
    .local v4, "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetCompFileInternal;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetCompFileInternal;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 310
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_23

    .line 314
    .end local v4    # "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetCompFileInternal;
    :cond_115
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPackageInternal;

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    # invokes: Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->access$800(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v10

    invoke-direct {v4, v1, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPackageInternal;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 315
    .local v4, "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPackageInternal;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$self:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v10

    invoke-virtual {v4, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPackageInternal;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 316
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_23

    .line 326
    .end local v0    # "aChildren":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    .end local v1    # "asrc":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v3    # "m":Ljava/util/regex/Matcher;
    .end local v4    # "packageFile":Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPackageInternal;
    .end local v6    # "product":Ljava/lang/String;
    :cond_12e
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$nextPageDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getNumChildren()I

    move-result v10

    invoke-interface {v9, v8, v10}, Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;->onCompletion(Ljava/util/ArrayList;I)V

    .line 330
    .end local v2    # "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;>;"
    .end local v5    # "pattern":Ljava/lang/String;
    .end local v7    # "regex":Ljava/util/regex/Pattern;
    .end local v8    # "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_137
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 335
    if-eqz p1, :cond_7

    .line 336
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->val$nextPageDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;->onError(Ljava/lang/Object;)V

    .line 338
    :cond_7
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 236
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method
