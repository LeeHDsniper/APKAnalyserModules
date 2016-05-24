.class public Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
.super Ljava/lang/Object;
.source "AdobeDCXManifest.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static staticDateFormatter:Ljava/text/SimpleDateFormat;


# instance fields
.field private _absolutePaths:Lorg/json/JSONObject;

.field private _allChildren:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;",
            ">;"
        }
    .end annotation
.end field

.field private _allComponents:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;",
            ">;"
        }
    .end annotation
.end field

.field private _dictionary:Lorg/json/JSONObject;

.field public isDirty:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->$assertionsDisabled:Z

    .line 53
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->staticDateFormatter:Ljava/text/SimpleDateFormat;

    return-void

    .line 46
    :cond_f
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 8
    .param p1, "jsonData"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;
        }
    .end annotation

    .prologue
    .line 1445
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1447
    if-nez p1, :cond_e

    .line 1448
    sget-object v4, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;->AdobeDCXErrorMissingManifest:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;

    const-string v5, "Missing Data"

    invoke-static {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createDCXError(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;

    move-result-object v4

    throw v4

    .line 1450
    :cond_e
    const/4 v0, 0x0

    .line 1451
    .local v0, "dict":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .line 1453
    .local v3, "jsonParsingException":Ljava/lang/Exception;
    :try_start_10
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_15
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_15} :catch_21

    .end local v0    # "dict":Lorg/json/JSONObject;
    .local v1, "dict":Lorg/json/JSONObject;
    move-object v0, v1

    .line 1457
    .end local v1    # "dict":Lorg/json/JSONObject;
    .restart local v0    # "dict":Lorg/json/JSONObject;
    :goto_16
    if-nez v0, :cond_24

    .line 1458
    sget-object v4, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;->AdobeDCXErrorInvalidManifest:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;

    const-string v5, "Invalid JSON"

    invoke-static {v4, v5, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createDCXError(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;Ljava/lang/Exception;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;

    move-result-object v4

    throw v4

    .line 1454
    :catch_21
    move-exception v2

    .line 1455
    .local v2, "e":Lorg/json/JSONException;
    move-object v3, v2

    goto :goto_16

    .line 1460
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_24
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->recursiveRemoveEmptyArrays(Lorg/json/JSONObject;)V

    .line 1461
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->init(Lorg/json/JSONObject;)V

    .line 1462
    return-void
.end method

.method private buildHashes()V
    .registers 3

    .prologue
    .line 593
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_allComponents:Ljava/util/LinkedHashMap;

    .line 594
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_allChildren:Ljava/util/LinkedHashMap;

    .line 595
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_absolutePaths:Lorg/json/JSONObject;

    .line 596
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    const-string v1, "/"

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->recursiveBuildHashesFrom(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 597
    return-void
.end method

.method private createChildListFromArray(Lorg/json/JSONArray;Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 6
    .param p1, "array"    # Lorg/json/JSONArray;
    .param p2, "parentPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1277
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1278
    .local v1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    if-eqz p1, :cond_1c

    .line 1279
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_1c

    .line 1280
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2, p0, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->createManifestNodeFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1279
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 1283
    .end local v0    # "i":I
    :cond_1c
    return-object v1
.end method

.method private createComponentListFromArray(Lorg/json/JSONArray;Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 6
    .param p1, "array"    # Lorg/json/JSONArray;
    .param p2, "parentPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 972
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 973
    .local v1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    if-eqz p1, :cond_1c

    .line 974
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_1c

    .line 975
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2, p0, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->createComponentFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 974
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 978
    .end local v0    # "i":I
    :cond_1c
    return-object v1
.end method

.method private findNodeById(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 3
    .param p1, "nodeId"    # Ljava/lang/String;

    .prologue
    .line 784
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->recursiveFindNodeById(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method private init(Lorg/json/JSONObject;)V
    .registers 10
    .param p1, "dictionary"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x5

    .line 600
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->initialize()V

    .line 601
    if-nez p1, :cond_10

    .line 602
    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;->AdobeDCXErrorInvalidManifest:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;

    const-string v3, "dict is missing"

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createDCXError(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;

    move-result-object v2

    throw v2

    .line 605
    :cond_10
    :try_start_10
    const-string v2, "manifest-format-version"

    const-wide/16 v4, 0x0

    invoke-virtual {p1, v2, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 606
    .local v0, "fversion":J
    cmp-long v2, v0, v6

    if-gez v2, :cond_23

    .line 607
    invoke-static {p1, v0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->updateManifestDictionary(Lorg/json/JSONObject;J)Z

    move-result v2

    if-nez v2, :cond_32

    .line 628
    .end local v0    # "fversion":J
    :goto_22
    return-void

    .line 610
    .restart local v0    # "fversion":J
    :cond_23
    cmp-long v2, v0, v6

    if-lez v2, :cond_32

    .line 613
    const-string v2, "manifest-format-version"

    const-wide/16 v4, 0x5

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 615
    :cond_32
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    .line 616
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_49

    .line 617
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    const-string v3, "id"

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->generateUuid()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 619
    :cond_49
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->verify()V

    .line 620
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->buildHashes()V

    .line 622
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->isDirty:Z
    :try_end_52
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_52} :catch_53

    goto :goto_22

    .line 623
    .end local v0    # "fversion":J
    :catch_53
    move-exception v2

    goto :goto_22
.end method

.method private static initialize()V
    .registers 3

    .prologue
    .line 517
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->staticDateFormatter:Ljava/text/SimpleDateFormat;

    if-nez v0, :cond_1a

    .line 518
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSS"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->staticDateFormatter:Ljava/text/SimpleDateFormat;

    .line 519
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->staticDateFormatter:Ljava/text/SimpleDateFormat;

    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 522
    :cond_1a
    return-void
.end method

.method private parentPathForDescendantsOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/lang/String;
    .registers 3
    .param p1, "parentNode"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .prologue
    .line 1388
    if-nez p1, :cond_5

    const-string v0, "/"

    :goto_4
    return-object v0

    :cond_5
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getPath()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_10

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getParentPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_10
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method

.method private recursiveBuildHashesFrom(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 14
    .param p1, "dict"    # Lorg/json/JSONObject;
    .param p2, "parentPath"    # Ljava/lang/String;

    .prologue
    .line 538
    const-string v9, "components"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 540
    .local v4, "components":Lorg/json/JSONArray;
    if-eqz v4, :cond_3e

    .line 541
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_9
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v5, v9, :cond_3e

    .line 545
    :try_start_f
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 546
    .local v2, "componentData":Lorg/json/JSONObject;
    const-string v9, "id"

    const/4 v10, 0x0

    invoke-virtual {v2, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 547
    .local v3, "componentId":Ljava/lang/String;
    if-nez v3, :cond_25

    .line 548
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->generateUuid()Ljava/lang/String;

    move-result-object v3

    .line 549
    const-string v9, "id"

    invoke-virtual {v2, v9, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 551
    :cond_25
    invoke-static {v2, p0, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->createComponentFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    move-result-object v1

    .line 552
    .local v1, "comp":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_allComponents:Ljava/util/LinkedHashMap;

    invoke-virtual {v9, v3, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 553
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_absolutePaths:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3b
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_3b} :catch_94

    .line 541
    .end local v1    # "comp":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .end local v2    # "componentData":Lorg/json/JSONObject;
    .end local v3    # "componentId":Ljava/lang/String;
    :goto_3b
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 562
    .end local v5    # "i":I
    :cond_3e
    const-string v9, "children"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 563
    .local v0, "children":Lorg/json/JSONArray;
    if-eqz v0, :cond_93

    .line 564
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_47
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v5, v9, :cond_93

    .line 568
    :try_start_4d
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 569
    .local v7, "nodeData":Lorg/json/JSONObject;
    const-string v9, "id"

    const/4 v10, 0x0

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 570
    .local v8, "nodeId":Ljava/lang/String;
    if-nez v8, :cond_63

    .line 571
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->generateUuid()Ljava/lang/String;

    move-result-object v8

    .line 572
    const-string v9, "id"

    invoke-virtual {v7, v9, v8}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 574
    :cond_63
    invoke-static {v7, p0, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->createManifestNodeFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    move-result-object v6

    .line 575
    .local v6, "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_allChildren:Ljava/util/LinkedHashMap;

    invoke-virtual {v9, v8, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 576
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getPath()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_8d

    .line 577
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_absolutePaths:Lorg/json/JSONObject;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 578
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-static {p2, v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->stringByAppendingLastPathComponent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v7, v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->recursiveBuildHashesFrom(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 564
    .end local v6    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v7    # "nodeData":Lorg/json/JSONObject;
    .end local v8    # "nodeId":Ljava/lang/String;
    :goto_8a
    add-int/lit8 v5, v5, 0x1

    goto :goto_47

    .line 580
    .restart local v6    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .restart local v7    # "nodeData":Lorg/json/JSONObject;
    .restart local v8    # "nodeId":Ljava/lang/String;
    :cond_8d
    invoke-direct {p0, v7, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->recursiveBuildHashesFrom(Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_90
    .catch Lorg/json/JSONException; {:try_start_4d .. :try_end_90} :catch_91

    goto :goto_8a

    .line 583
    .end local v6    # "node":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .end local v7    # "nodeData":Lorg/json/JSONObject;
    .end local v8    # "nodeId":Ljava/lang/String;
    :catch_91
    move-exception v9

    goto :goto_8a

    .line 590
    .end local v5    # "i":I
    :cond_93
    return-void

    .line 554
    .end local v0    # "children":Lorg/json/JSONArray;
    .restart local v5    # "i":I
    :catch_94
    move-exception v9

    goto :goto_3b
.end method

.method private recursiveFindNodeById(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 8
    .param p1, "nodeId"    # Ljava/lang/String;
    .param p2, "dict"    # Lorg/json/JSONObject;

    .prologue
    .line 765
    const-string v4, "id"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 780
    .end local p2    # "dict":Lorg/json/JSONObject;
    :goto_c
    return-object p2

    .line 769
    .restart local p2    # "dict":Lorg/json/JSONObject;
    :cond_d
    const-string v4, "children"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 770
    .local v1, "children":Lorg/json/JSONArray;
    if-eqz v1, :cond_2b

    .line 771
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_16
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_2b

    .line 772
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 773
    .local v0, "child":Lorg/json/JSONObject;
    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->recursiveFindNodeById(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 774
    .local v2, "found":Lorg/json/JSONObject;
    if-eqz v2, :cond_28

    move-object p2, v2

    .line 775
    goto :goto_c

    .line 771
    :cond_28
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 780
    .end local v0    # "child":Lorg/json/JSONObject;
    .end local v2    # "found":Lorg/json/JSONObject;
    .end local v3    # "i":I
    :cond_2b
    const/4 p2, 0x0

    goto :goto_c
.end method

.method private recursiveGetAbsoluteIndexOfNodeId(Ljava/lang/String;Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;)J
    .registers 16
    .param p1, "nodeId"    # Ljava/lang/String;
    .param p2, "dict"    # Lorg/json/JSONObject;
    .param p3, "indexWrapper"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;

    .prologue
    const-wide/16 v6, -0x1

    .line 1255
    const-string v5, "children"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 1257
    .local v0, "children":Lorg/json/JSONArray;
    if-eqz v0, :cond_36

    .line 1258
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_36

    .line 1259
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 1260
    .local v4, "node":Lorg/json/JSONObject;
    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_24

    .line 1261
    iget-wide v2, p3, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    .line 1273
    .end local v1    # "i":I
    .end local v4    # "node":Lorg/json/JSONObject;
    :cond_23
    :goto_23
    return-wide v2

    .line 1263
    .restart local v1    # "i":I
    .restart local v4    # "node":Lorg/json/JSONObject;
    :cond_24
    iget-wide v8, p3, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    iput-wide v8, p3, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    .line 1264
    invoke-direct {p0, p1, v4, p3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->recursiveGetAbsoluteIndexOfNodeId(Ljava/lang/String;Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;)J

    move-result-wide v2

    .line 1265
    .local v2, "foundIndex":J
    cmp-long v5, v2, v6

    if-nez v5, :cond_23

    .line 1258
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .end local v1    # "i":I
    .end local v2    # "foundIndex":J
    .end local v4    # "node":Lorg/json/JSONObject;
    :cond_36
    move-wide v2, v6

    .line 1273
    goto :goto_23
.end method

.method private recursiveRemoveEmptyArrays(Lorg/json/JSONObject;)V
    .registers 6
    .param p1, "dict"    # Lorg/json/JSONObject;

    .prologue
    .line 641
    const-string v3, "_links"

    invoke-direct {p0, v3, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->removeArrayIfEmptyWithName(Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 642
    const-string v3, "components"

    invoke-direct {p0, v3, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->removeArrayIfEmptyWithName(Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 643
    const-string v3, "children"

    invoke-direct {p0, v3, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->removeArrayIfEmptyWithName(Ljava/lang/String;Lorg/json/JSONObject;)Z

    move-result v3

    if-nez v3, :cond_2d

    .line 644
    const-string v3, "children"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 645
    .local v1, "children":Lorg/json/JSONArray;
    if-eqz v1, :cond_2d

    .line 646
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1b
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_2d

    .line 647
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 648
    .local v0, "child":Lorg/json/JSONObject;
    if-eqz v0, :cond_2a

    .line 649
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->recursiveRemoveEmptyArrays(Lorg/json/JSONObject;)V

    .line 646
    :cond_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 654
    .end local v0    # "child":Lorg/json/JSONObject;
    .end local v1    # "children":Lorg/json/JSONArray;
    .end local v2    # "i":I
    :cond_2d
    return-void
.end method

.method private removeArrayIfEmptyWithName(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "dict"    # Lorg/json/JSONObject;

    .prologue
    .line 631
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 632
    .local v0, "array":Lorg/json/JSONArray;
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-nez v1, :cond_11

    .line 633
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 634
    const/4 v1, 0x1

    .line 636
    :goto_10
    return v1

    :cond_11
    const/4 v1, 0x0

    goto :goto_10
.end method

.method private verify()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;
        }
    .end annotation

    .prologue
    .line 525
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 526
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;->AdobeDCXErrorInvalidManifest:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;

    const-string v1, "Manifest is missing an id"

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createDCXError(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;

    move-result-object v0

    throw v0

    .line 528
    :cond_13
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    const-string v1, "name"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 529
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;->AdobeDCXErrorInvalidManifest:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;

    const-string v1, "Manifest is missing a name"

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createDCXError(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;

    move-result-object v0

    throw v0

    .line 531
    :cond_26
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    const-string v1, "type"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 532
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;->AdobeDCXErrorInvalidManifest:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;

    const-string v1, "Manifest is missing a type"

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createDCXError(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;

    move-result-object v0

    throw v0

    .line 534
    :cond_39
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 2437
    new-instance v0, Ljava/lang/CloneNotSupportedException;

    const-string v1, "Yet to be implemented"

    invoke-direct {v0, v1}, Ljava/lang/CloneNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getAbsoluteIndexOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)J
    .registers 6
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .prologue
    .line 2282
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;-><init>()V

    .line 2283
    .local v0, "indexWrapper":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;
    const-wide/16 v2, 0x0

    iput-wide v2, v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    .line 2284
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    invoke-direct {p0, v1, v2, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->recursiveGetAbsoluteIndexOfNodeId(Ljava/lang/String;Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;)J

    move-result-wide v2

    return-wide v2
.end method

.method public final getAllChildren()Ljava/util/LinkedHashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1401
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_allChildren:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method public getChildrenOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;
    .registers 5
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1766
    sget-boolean v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->$assertionsDisabled:Z

    if-nez v1, :cond_e

    if-nez p1, :cond_e

    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Node must not be null"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 1768
    :cond_e
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->findNodeById(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 1769
    .local v0, "nodeObj":Lorg/json/JSONObject;
    if-nez v0, :cond_1a

    .line 1770
    const/4 v1, 0x0

    .line 1772
    :goto_19
    return-object v1

    :cond_1a
    const-string v1, "children"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 1773
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->parentPathForDescendantsOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/lang/String;

    move-result-object v2

    .line 1772
    invoke-direct {p0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->createChildListFromArray(Lorg/json/JSONArray;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_19
.end method

.method public getComponents()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1589
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    const-string v1, "components"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->parentPathForDescendantsOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->createComponentListFromArray(Lorg/json/JSONArray;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getComponentsOfChild(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;
    .registers 5
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1593
    sget-boolean v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->$assertionsDisabled:Z

    if-nez v1, :cond_e

    if-nez p1, :cond_e

    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Node must not be null"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 1595
    :cond_e
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->findNodeById(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 1596
    .local v0, "nodeObj":Lorg/json/JSONObject;
    if-nez v0, :cond_1a

    .line 1597
    const/4 v1, 0x0

    .line 1599
    :goto_19
    return-object v1

    :cond_1a
    const-string v1, "components"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->parentPathForDescendantsOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->createComponentListFromArray(Lorg/json/JSONArray;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_19
.end method

.method public getCompositeId()Ljava/lang/String;
    .registers 4

    .prologue
    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    const-string v1, "id"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->_dictionary:Lorg/json/JSONObject;

    const-string v1, "name"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
