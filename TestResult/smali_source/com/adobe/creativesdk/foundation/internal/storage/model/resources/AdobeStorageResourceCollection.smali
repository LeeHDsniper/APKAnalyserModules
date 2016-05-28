.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
.super Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
.source "AdobeStorageResourceCollection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection$1;
    }
.end annotation


# instance fields
.field private children:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;",
            ">;"
        }
    .end annotation
.end field

.field filterByType:Ljava/lang/String;

.field private limit:I

.field private nextStartIndex:Ljava/lang/String;

.field private order:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

.field private orderBy:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

.field private percentEncodedQuery:Ljava/lang/String;

.field private startIndex:Ljava/lang/String;

.field private total_children:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 97
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;-><init>()V

    .line 98
    const-string v0, "application/vnd.adobe.directory+json"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->type:Ljava/lang/String;

    .line 99
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->isCollection:Z

    .line 100
    return-void
.end method

.method public static collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 4
    .param p0, "href"    # Ljava/net/URI;

    .prologue
    .line 131
    if-nez p0, :cond_4

    .line 132
    const/4 v0, 0x0

    .line 142
    :goto_3
    return-object v0

    .line 134
    :cond_4
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;-><init>()V

    .line 135
    .local v0, "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->getLastPathComponent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 139
    .local v1, "name":Ljava/lang/String;
    iput-object p0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->href:Ljava/net/URI;

    .line 140
    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->name:Ljava/lang/String;

    goto :goto_3
.end method

.method private static mapToQueryString(Ljava/util/HashMap;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 454
    .local p0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 456
    .local v3, "stringBuilder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5b

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 458
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_24

    .line 459
    const-string v5, "&"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    :cond_24
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 462
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 464
    .local v4, "value":Ljava/lang/String;
    if-eqz v2, :cond_55

    :try_start_32
    const-string v5, "UTF-8"

    invoke-static {v2, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_38
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 465
    const-string v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    if-eqz v4, :cond_58

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_48
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_4b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_32 .. :try_end_4b} :catch_4c

    goto :goto_d

    .line 468
    :catch_4c
    move-exception v0

    .line 470
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "Problem encoding the collection params into query string"

    invoke-direct {v5, v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 464
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_55
    :try_start_55
    const-string v5, ""

    goto :goto_38

    .line 466
    :cond_58
    const-string v5, ""
    :try_end_5a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_55 .. :try_end_5a} :catch_4c

    goto :goto_48

    .line 473
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_5b
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public getChildren()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;",
            ">;"
        }
    .end annotation

    .prologue
    .line 378
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->children:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getNextStartIndex()Ljava/lang/String;
    .registers 2

    .prologue
    .line 370
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->nextStartIndex:Ljava/lang/String;

    return-object v0
.end method

.method public getNumChildren()I
    .registers 2

    .prologue
    .line 327
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->total_children:I

    return v0
.end method

.method public getOrder()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;
    .registers 2

    .prologue
    .line 331
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->order:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    return-object v0
.end method

.method public getOrderBy()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;
    .registers 2

    .prologue
    .line 344
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->orderBy:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    return-object v0
.end method

.method public getPercentEncodedQuery()Ljava/lang/String;
    .registers 5

    .prologue
    .line 397
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->percentEncodedQuery:Ljava/lang/String;

    if-nez v2, :cond_5a

    .line 399
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 401
    .local v1, "paramDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->startIndex:Ljava/lang/String;

    if-eqz v2, :cond_14

    .line 403
    const-string v2, "start"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->startIndex:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    :cond_14
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->limit:I

    if-lez v2, :cond_23

    .line 407
    const-string v2, "limit"

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->limit:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    :cond_23
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->order:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->ADOBE_STORAGE_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    if-ne v2, v3, :cond_5d

    .line 411
    const-string v2, "order"

    const-string v3, "desc"

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    :goto_30
    const/4 v0, 0x0

    .line 418
    .local v0, "orderBy_val":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->orderBy:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    if-eqz v2, :cond_42

    .line 419
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$storage$model$resources$AdobeStorageOrderByProperty:[I

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->orderBy:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_76

    .line 433
    :cond_42
    :goto_42
    if-eqz v0, :cond_6e

    .line 435
    const-string v2, "orderby"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    :goto_49
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->filterByType:Ljava/lang/String;

    if-eqz v2, :cond_54

    .line 443
    const-string v2, "type"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->filterByType:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    :cond_54
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->mapToQueryString(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->percentEncodedQuery:Ljava/lang/String;

    .line 449
    .end local v0    # "orderBy_val":Ljava/lang/String;
    .end local v1    # "paramDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5a
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->percentEncodedQuery:Ljava/lang/String;

    return-object v2

    .line 415
    .restart local v1    # "paramDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5d
    const-string v2, "order"

    const-string v3, "asc"

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_30

    .line 421
    .restart local v0    # "orderBy_val":Ljava/lang/String;
    :pswitch_65
    const-string v0, "name"

    .line 422
    goto :goto_42

    .line 424
    :pswitch_68
    const-string v0, "modified"

    .line 425
    goto :goto_42

    .line 427
    :pswitch_6b
    const-string v0, "ordinal"

    .line 428
    goto :goto_42

    .line 438
    :cond_6e
    const-string v2, "orderby"

    const-string v3, "name"

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_49

    .line 419
    :pswitch_data_76
    .packed-switch 0x1
        :pswitch_65
        :pswitch_68
        :pswitch_6b
    .end packed-switch
.end method

.method public isComplete()Z
    .registers 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->nextStartIndex:Ljava/lang/String;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public resetPageIndex()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 171
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->startIndex:Ljava/lang/String;

    .line 172
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->nextStartIndex:Ljava/lang/String;

    .line 173
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->percentEncodedQuery:Ljava/lang/String;

    .line 174
    return-void
.end method

.method public setLimit(I)V
    .registers 3
    .param p1, "limit"    # I

    .prologue
    .line 318
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->limit:I

    if-eq p1, v0, :cond_9

    .line 320
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->limit:I

    .line 321
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->percentEncodedQuery:Ljava/lang/String;

    .line 323
    :cond_9
    return-void
.end method

.method public setNextStartIndex(Ljava/lang/String;)V
    .registers 2
    .param p1, "nextStartIndex"    # Ljava/lang/String;

    .prologue
    .line 374
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->nextStartIndex:Ljava/lang/String;

    .line 375
    return-void
.end method

.method public setOrder(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;)V
    .registers 3
    .param p1, "order"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    .prologue
    .line 336
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->order:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    if-eq p1, v0, :cond_9

    .line 338
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->order:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    .line 339
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->resetPageIndex()V

    .line 341
    :cond_9
    return-void
.end method

.method public setOrderBy(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;)V
    .registers 3
    .param p1, "orderBy"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    .prologue
    .line 349
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->orderBy:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    if-eq p1, v0, :cond_9

    .line 351
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->orderBy:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    .line 352
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->resetPageIndex()V

    .line 354
    :cond_9
    return-void
.end method

.method public setStartIndex(Ljava/lang/String;)V
    .registers 3
    .param p1, "startIndex"    # Ljava/lang/String;

    .prologue
    .line 305
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->startIndex:Ljava/lang/String;

    if-eq p1, v0, :cond_9

    .line 307
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->startIndex:Ljava/lang/String;

    .line 308
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->percentEncodedQuery:Ljava/lang/String;

    .line 310
    :cond_9
    return-void
.end method

.method public updateFromData(Ljava/lang/String;Z)V
    .registers 7
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;
        }
    .end annotation

    .prologue
    .line 286
    const/4 v0, 0x0

    .line 289
    .local v0, "error":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 290
    .local v1, "parsedData":Lorg/json/JSONObject;
    if-eqz v1, :cond_b

    .line 291
    invoke-virtual {p0, v1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->updateFromDictionary(Lorg/json/JSONObject;Z)V

    .line 297
    return-void

    .line 293
    :cond_b
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v3, "Parsed collection data is not of type dictionary."

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 295
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;

    invoke-direct {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    throw v2
.end method

.method updateFromDictionary(Lorg/json/JSONObject;Z)V
    .registers 20
    .param p1, "data"    # Lorg/json/JSONObject;
    .param p2, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;
        }
    .end annotation

    .prologue
    .line 187
    const/4 v10, 0x0

    .line 189
    .local v10, "error":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    const-string v14, "id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->internalID:Ljava/lang/String;

    .line 190
    const-string v14, "name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->name:Ljava/lang/String;

    .line 191
    const-string v14, "etag"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->etag:Ljava/lang/String;

    .line 192
    const-string v14, "modified"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->modified:Ljava/lang/String;

    .line 193
    const-string v14, "ordinal"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v14

    int-to-long v14, v14

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->ordinal:J

    .line 194
    const-string v14, "type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->type:Ljava/lang/String;

    .line 195
    const-string v14, "total_children"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_74

    const-string v14, "total_children"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v14

    :goto_5c
    move-object/from16 v0, p0

    iput v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->total_children:I

    .line 196
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->name:Ljava/lang/String;

    if-nez v14, :cond_8d

    .line 197
    sget-object v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v15, "Collection doesn\'t have a name."

    invoke-static {v14, v15}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v10

    .line 199
    new-instance v14, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;

    invoke-direct {v14, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    throw v14

    .line 195
    :cond_74
    const-string v14, "children"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v14

    if-eqz v14, :cond_8b

    const-string v14, "children"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v14

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v14

    goto :goto_5c

    :cond_8b
    const/4 v14, 0x0

    goto :goto_5c

    .line 201
    :cond_8d
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->etag:Ljava/lang/String;

    if-nez v14, :cond_a1

    .line 202
    sget-object v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v15, "Collection doesn\'t have an etag."

    invoke-static {v14, v15}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v10

    .line 204
    new-instance v14, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;

    invoke-direct {v14, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    throw v14

    .line 206
    :cond_a1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->modified:Ljava/lang/String;

    if-nez v14, :cond_b5

    .line 207
    sget-object v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v15, "Collection doesn\'t have a modified time."

    invoke-static {v14, v15}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v10

    .line 209
    new-instance v14, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;

    invoke-direct {v14, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    throw v14

    .line 212
    :cond_b5
    const-string v14, "collaboration"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 213
    .local v8, "collaboration":Ljava/lang/String;
    if-nez v8, :cond_12e

    .line 214
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;->ADOBE_COLLABORATION_TYPE_PRIVATE:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collaboration:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    .line 225
    :cond_c5
    :goto_c5
    const-string v14, "children"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    .line 226
    .local v12, "items":Lorg/json/JSONArray;
    if-nez v10, :cond_194

    .line 228
    if-eqz v12, :cond_18e

    .line 230
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 232
    .local v7, "childrenArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_d7
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v11, v14, :cond_16c

    .line 236
    :try_start_dd
    invoke-virtual {v12, v11}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 237
    .local v2, "child":Lorg/json/JSONObject;
    const-string v14, "name"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 238
    .local v6, "childName":Ljava/lang/String;
    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->escapeAssetName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 239
    new-instance v4, Ljava/net/URI;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->href:Ljava/net/URI;

    invoke-virtual {v14}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v4, v14}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 240
    .local v4, "childHref":Ljava/net/URI;
    const-string v14, "type"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 242
    .local v13, "type":Ljava/lang/String;
    const-string v14, "application/vnd.adobe.directory+json"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_155

    .line 244
    new-instance v14, Ljava/net/URI;

    invoke-virtual {v4}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v15

    const-string v16, "/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-static {v14}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v3

    .line 245
    .local v3, "childCollection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v14

    invoke-virtual {v3, v14}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 246
    const/4 v14, 0x0

    invoke-virtual {v3, v2, v14}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->updateFromDictionary(Lorg/json/JSONObject;Z)V

    .line 248
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_12b
    .catch Ljava/net/URISyntaxException; {:try_start_dd .. :try_end_12b} :catch_167

    .line 232
    .end local v2    # "child":Lorg/json/JSONObject;
    .end local v3    # "childCollection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v4    # "childHref":Ljava/net/URI;
    .end local v6    # "childName":Ljava/lang/String;
    .end local v13    # "type":Ljava/lang/String;
    :goto_12b
    add-int/lit8 v11, v11, 0x1

    goto :goto_d7

    .line 216
    .end local v7    # "childrenArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;>;"
    .end local v11    # "i":I
    .end local v12    # "items":Lorg/json/JSONArray;
    :cond_12e
    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v14

    const-string v15, "outgoing"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_141

    .line 217
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;->ADOBE_COLLABORATION_TYPE_SHAREDBYUSER:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collaboration:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    goto :goto_c5

    .line 219
    :cond_141
    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v14

    const-string v15, "incoming"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c5

    .line 220
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;->ADOBE_COLLABORATION_TYPE_SHAREDWITHUSER:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collaboration:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    goto/16 :goto_c5

    .line 252
    .restart local v2    # "child":Lorg/json/JSONObject;
    .restart local v4    # "childHref":Ljava/net/URI;
    .restart local v6    # "childName":Ljava/lang/String;
    .restart local v7    # "childrenArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;>;"
    .restart local v11    # "i":I
    .restart local v12    # "items":Lorg/json/JSONArray;
    .restart local v13    # "type":Ljava/lang/String;
    :cond_155
    :try_start_155
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    move-result-object v5

    .line 253
    .local v5, "childItem":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v14

    invoke-virtual {v5, v14}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 254
    invoke-virtual {v5, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->updateFromCollectionDictionary(Lorg/json/JSONObject;)V

    .line 256
    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_166
    .catch Ljava/net/URISyntaxException; {:try_start_155 .. :try_end_166} :catch_167

    goto :goto_12b

    .line 260
    .end local v2    # "child":Lorg/json/JSONObject;
    .end local v4    # "childHref":Ljava/net/URI;
    .end local v5    # "childItem":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .end local v6    # "childName":Ljava/lang/String;
    .end local v13    # "type":Ljava/lang/String;
    :catch_167
    move-exception v9

    .line 262
    .local v9, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v9}, Ljava/net/URISyntaxException;->printStackTrace()V

    goto :goto_12b

    .line 266
    .end local v9    # "e":Ljava/net/URISyntaxException;
    :cond_16c
    if-eqz p2, :cond_189

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->children:Ljava/util/ArrayList;

    if-eqz v14, :cond_189

    .line 267
    const/4 v11, 0x0

    :goto_175
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-ge v11, v14, :cond_18d

    .line 268
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->children:Ljava/util/ArrayList;

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 267
    add-int/lit8 v11, v11, 0x1

    goto :goto_175

    .line 273
    :cond_189
    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->children:Ljava/util/ArrayList;

    .line 282
    .end local v7    # "childrenArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;>;"
    .end local v11    # "i":I
    :cond_18d
    :goto_18d
    return-void

    .line 277
    :cond_18e
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->children:Ljava/util/ArrayList;

    goto :goto_18d

    .line 280
    :cond_194
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->children:Ljava/util/ArrayList;

    goto :goto_18d
.end method
