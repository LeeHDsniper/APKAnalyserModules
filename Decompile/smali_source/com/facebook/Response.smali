.class public Lcom/facebook/Response;
.super Ljava/lang/Object;
.source "Response.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static responseCache:Lcom/facebook/internal/FileLruCache;


# instance fields
.field private final connection:Ljava/net/HttpURLConnection;

.field private final error:Lcom/facebook/FacebookRequestError;

.field private final graphObject:Lcom/facebook/model/GraphObject;

.field private final graphObjectList:Lcom/facebook/model/GraphObjectList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/model/GraphObjectList",
            "<",
            "Lcom/facebook/model/GraphObject;",
            ">;"
        }
    .end annotation
.end field

.field private final isFromCache:Z

.field private final rawResponse:Ljava/lang/String;

.field private final request:Lcom/facebook/Request;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const-class v0, Lcom/facebook/Response;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/facebook/Response;->$assertionsDisabled:Z

    .line 69
    return-void

    .line 42
    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookRequestError;)V
    .registers 12
    .param p1, "request"    # Lcom/facebook/Request;
    .param p2, "connection"    # Ljava/net/HttpURLConnection;
    .param p3, "error"    # Lcom/facebook/FacebookRequestError;

    .prologue
    const/4 v3, 0x0

    .line 81
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    move-object v5, v3

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/String;Lcom/facebook/model/GraphObject;Lcom/facebook/model/GraphObjectList;ZLcom/facebook/FacebookRequestError;)V

    .line 82
    return-void
.end method

.method constructor <init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/String;Lcom/facebook/model/GraphObject;Lcom/facebook/model/GraphObjectList;ZLcom/facebook/FacebookRequestError;)V
    .registers 8
    .param p1, "request"    # Lcom/facebook/Request;
    .param p2, "connection"    # Ljava/net/HttpURLConnection;
    .param p3, "rawResponse"    # Ljava/lang/String;
    .param p4, "graphObject"    # Lcom/facebook/model/GraphObject;
    .param p6, "isFromCache"    # Z
    .param p7, "error"    # Lcom/facebook/FacebookRequestError;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/Request;",
            "Ljava/net/HttpURLConnection;",
            "Ljava/lang/String;",
            "Lcom/facebook/model/GraphObject;",
            "Lcom/facebook/model/GraphObjectList",
            "<",
            "Lcom/facebook/model/GraphObject;",
            ">;Z",
            "Lcom/facebook/FacebookRequestError;",
            ")V"
        }
    .end annotation

    .prologue
    .line 84
    .local p5, "graphObjects":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<Lcom/facebook/model/GraphObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Lcom/facebook/Response;->request:Lcom/facebook/Request;

    .line 86
    iput-object p2, p0, Lcom/facebook/Response;->connection:Ljava/net/HttpURLConnection;

    .line 87
    iput-object p3, p0, Lcom/facebook/Response;->rawResponse:Ljava/lang/String;

    .line 88
    iput-object p4, p0, Lcom/facebook/Response;->graphObject:Lcom/facebook/model/GraphObject;

    .line 89
    iput-object p5, p0, Lcom/facebook/Response;->graphObjectList:Lcom/facebook/model/GraphObjectList;

    .line 90
    iput-boolean p6, p0, Lcom/facebook/Response;->isFromCache:Z

    .line 91
    iput-object p7, p0, Lcom/facebook/Response;->error:Lcom/facebook/FacebookRequestError;

    .line 92
    return-void
.end method

.method constructor <init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/String;Lcom/facebook/model/GraphObject;Z)V
    .registers 14
    .param p1, "request"    # Lcom/facebook/Request;
    .param p2, "connection"    # Ljava/net/HttpURLConnection;
    .param p3, "rawResponse"    # Ljava/lang/String;
    .param p4, "graphObject"    # Lcom/facebook/model/GraphObject;
    .param p5, "isFromCache"    # Z

    .prologue
    const/4 v5, 0x0

    .line 72
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v6, p5

    move-object v7, v5

    invoke-direct/range {v0 .. v7}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/String;Lcom/facebook/model/GraphObject;Lcom/facebook/model/GraphObjectList;ZLcom/facebook/FacebookRequestError;)V

    .line 73
    return-void
.end method

.method constructor <init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/String;Lcom/facebook/model/GraphObjectList;Z)V
    .registers 14
    .param p1, "request"    # Lcom/facebook/Request;
    .param p2, "connection"    # Ljava/net/HttpURLConnection;
    .param p3, "rawResponse"    # Ljava/lang/String;
    .param p5, "isFromCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/Request;",
            "Ljava/net/HttpURLConnection;",
            "Ljava/lang/String;",
            "Lcom/facebook/model/GraphObjectList",
            "<",
            "Lcom/facebook/model/GraphObject;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p4, "graphObjects":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<Lcom/facebook/model/GraphObject;>;"
    const/4 v4, 0x0

    .line 77
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move v6, p5

    move-object v7, v4

    invoke-direct/range {v0 .. v7}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/String;Lcom/facebook/model/GraphObject;Lcom/facebook/model/GraphObjectList;ZLcom/facebook/FacebookRequestError;)V

    .line 78
    return-void
.end method

.method static constructErrorResponses(Ljava/util/List;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)Ljava/util/List;
    .registers 9
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "error"    # Lcom/facebook/FacebookException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/Request;",
            ">;",
            "Ljava/net/HttpURLConnection;",
            "Lcom/facebook/FacebookException;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/Response;",
            ">;"
        }
    .end annotation

    .prologue
    .line 459
    .local p0, "requests":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/Request;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    .line 460
    .local v0, "count":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 461
    .local v3, "responses":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/Response;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    if-lt v1, v0, :cond_d

    .line 465
    return-object v3

    .line 462
    :cond_d
    new-instance v2, Lcom/facebook/Response;

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/Request;

    new-instance v5, Lcom/facebook/FacebookRequestError;

    invoke-direct {v5, p1, p2}, Lcom/facebook/FacebookRequestError;-><init>(Ljava/net/HttpURLConnection;Ljava/lang/Exception;)V

    invoke-direct {v2, v4, p1, v5}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookRequestError;)V

    .line 463
    .local v2, "response":Lcom/facebook/Response;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 461
    add-int/lit8 v1, v1, 0x1

    goto :goto_a
.end method

.method private static createResponseFromObject(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/Object;ZLjava/lang/Object;)Lcom/facebook/Response;
    .registers 28
    .param p0, "request"    # Lcom/facebook/Request;
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "isFromCache"    # Z
    .param p4, "originalResult"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 420
    move-object/from16 v0, p2

    instance-of v3, v0, Lorg/json/JSONObject;

    if-eqz v3, :cond_7e

    move-object/from16 v21, p2

    .line 421
    check-cast v21, Lorg/json/JSONObject;

    .line 424
    .local v21, "jsonObject":Lorg/json/JSONObject;
    move-object/from16 v0, v21

    move-object/from16 v1, p4

    move-object/from16 v2, p1

    invoke-static {v0, v1, v2}, Lcom/facebook/FacebookRequestError;->checkResponseAndCreateError(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/net/HttpURLConnection;)Lcom/facebook/FacebookRequestError;

    move-result-object v20

    .line 425
    .local v20, "error":Lcom/facebook/FacebookRequestError;
    if-eqz v20, :cond_33

    .line 426
    invoke-virtual/range {v20 .. v20}, Lcom/facebook/FacebookRequestError;->getErrorCode()I

    move-result v3

    const/16 v4, 0xbe

    if-ne v3, v4, :cond_27

    .line 427
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/Request;->getSession()Lcom/facebook/Session;

    move-result-object v22

    .line 428
    .local v22, "session":Lcom/facebook/Session;
    if-eqz v22, :cond_27

    .line 429
    invoke-virtual/range {v22 .. v22}, Lcom/facebook/Session;->closeAndClearTokenInformation()V

    .line 432
    .end local v22    # "session":Lcom/facebook/Session;
    :cond_27
    new-instance v3, Lcom/facebook/Response;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-direct {v3, v0, v1, v2}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookRequestError;)V

    .line 450
    .end local v20    # "error":Lcom/facebook/FacebookRequestError;
    .end local v21    # "jsonObject":Lorg/json/JSONObject;
    :goto_32
    return-object v3

    .line 435
    .restart local v20    # "error":Lcom/facebook/FacebookRequestError;
    .restart local v21    # "jsonObject":Lorg/json/JSONObject;
    :cond_33
    const-string v3, "body"

    const-string v4, "FACEBOOK_NON_JSON_RESULT"

    move-object/from16 v0, v21

    invoke-static {v0, v3, v4}, Lcom/facebook/internal/Utility;->getStringPropertyAsJSON(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    .line 437
    .local v19, "body":Ljava/lang/Object;
    move-object/from16 v0, v19

    instance-of v3, v0, Lorg/json/JSONObject;

    if-eqz v3, :cond_5b

    move-object/from16 v3, v19

    .line 438
    check-cast v3, Lorg/json/JSONObject;

    invoke-static {v3}, Lcom/facebook/model/GraphObject$Factory;->create(Lorg/json/JSONObject;)Lcom/facebook/model/GraphObject;

    move-result-object v7

    .line 439
    .local v7, "graphObject":Lcom/facebook/model/GraphObject;
    new-instance v3, Lcom/facebook/Response;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v8, p3

    invoke-direct/range {v3 .. v8}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/String;Lcom/facebook/model/GraphObject;Z)V

    goto :goto_32

    .line 440
    .end local v7    # "graphObject":Lcom/facebook/model/GraphObject;
    :cond_5b
    move-object/from16 v0, v19

    instance-of v3, v0, Lorg/json/JSONArray;

    if-eqz v3, :cond_7c

    move-object/from16 v3, v19

    .line 442
    check-cast v3, Lorg/json/JSONArray;

    const-class v4, Lcom/facebook/model/GraphObject;

    .line 441
    invoke-static {v3, v4}, Lcom/facebook/model/GraphObject$Factory;->createList(Lorg/json/JSONArray;Ljava/lang/Class;)Lcom/facebook/model/GraphObjectList;

    move-result-object v12

    .line 443
    .local v12, "graphObjectList":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<Lcom/facebook/model/GraphObject;>;"
    new-instance v8, Lcom/facebook/Response;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move/from16 v13, p3

    invoke-direct/range {v8 .. v13}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/String;Lcom/facebook/model/GraphObjectList;Z)V

    move-object v3, v8

    goto :goto_32

    .line 446
    .end local v12    # "graphObjectList":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<Lcom/facebook/model/GraphObject;>;"
    :cond_7c
    sget-object p2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 449
    .end local v19    # "body":Ljava/lang/Object;
    .end local v20    # "error":Lcom/facebook/FacebookRequestError;
    .end local v21    # "jsonObject":Lorg/json/JSONObject;
    :cond_7e
    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    move-object/from16 v0, p2

    if-ne v0, v3, :cond_97

    .line 450
    new-instance v13, Lcom/facebook/Response;

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    const/16 v17, 0x0

    move-object/from16 v14, p0

    move-object/from16 v15, p1

    move/from16 v18, p3

    invoke-direct/range {v13 .. v18}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/String;Lcom/facebook/model/GraphObject;Z)V

    move-object v3, v13

    goto :goto_32

    .line 452
    :cond_97
    new-instance v3, Lcom/facebook/FacebookException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Got unexpected object type in response, class: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 453
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 452
    invoke-direct {v3, v4}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static createResponsesFromObject(Ljava/net/HttpURLConnection;Ljava/util/List;Ljava/lang/Object;Z)Ljava/util/List;
    .registers 18
    .param p0, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "isFromCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/Request;",
            ">;",
            "Ljava/lang/Object;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/FacebookException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 367
    .local p1, "requests":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/Request;>;"
    sget-boolean v12, Lcom/facebook/Response;->$assertionsDisabled:Z

    if-nez v12, :cond_e

    if-nez p0, :cond_e

    if-nez p3, :cond_e

    new-instance v12, Ljava/lang/AssertionError;

    invoke-direct {v12}, Ljava/lang/AssertionError;-><init>()V

    throw v12

    .line 369
    :cond_e
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    .line 370
    .local v6, "numRequests":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 371
    .local v11, "responses":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/Response;>;"
    move-object/from16 v8, p2

    .line 373
    .local v8, "originalResult":Ljava/lang/Object;
    const/4 v12, 0x1

    if-ne v6, v12, :cond_44

    .line 374
    const/4 v12, 0x0

    invoke-interface {p1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/facebook/Request;

    .line 379
    .local v9, "request":Lcom/facebook/Request;
    :try_start_23
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 380
    .local v5, "jsonObject":Lorg/json/JSONObject;
    const-string v12, "body"

    move-object/from16 v0, p2

    invoke-virtual {v5, v12, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 381
    if-eqz p0, :cond_5c

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v10

    .line 382
    .local v10, "responseCode":I
    :goto_35
    const-string v12, "code"

    invoke-virtual {v5, v12, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 384
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 385
    .local v4, "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_42
    .catch Lorg/json/JSONException; {:try_start_23 .. :try_end_42} :catch_5f
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_42} :catch_6e

    .line 388
    move-object/from16 p2, v4

    .line 396
    .end local v4    # "jsonArray":Lorg/json/JSONArray;
    .end local v5    # "jsonObject":Lorg/json/JSONObject;
    .end local v9    # "request":Lcom/facebook/Request;
    .end local v10    # "responseCode":I
    .end local p2    # "object":Ljava/lang/Object;
    :cond_44
    :goto_44
    move-object/from16 v0, p2

    instance-of v12, v0, Lorg/json/JSONArray;

    if-eqz v12, :cond_54

    move-object/from16 v12, p2

    check-cast v12, Lorg/json/JSONArray;

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-eq v12, v6, :cond_7d

    .line 397
    :cond_54
    new-instance v2, Lcom/facebook/FacebookException;

    const-string v12, "Unexpected number of results"

    invoke-direct {v2, v12}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    .line 398
    .local v2, "exception":Lcom/facebook/FacebookException;
    throw v2

    .line 381
    .end local v2    # "exception":Lcom/facebook/FacebookException;
    .restart local v5    # "jsonObject":Lorg/json/JSONObject;
    .restart local v9    # "request":Lcom/facebook/Request;
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_5c
    const/16 v10, 0xc8

    goto :goto_35

    .line 389
    .end local v5    # "jsonObject":Lorg/json/JSONObject;
    :catch_5f
    move-exception v1

    .line 390
    .local v1, "e":Lorg/json/JSONException;
    new-instance v12, Lcom/facebook/Response;

    new-instance v13, Lcom/facebook/FacebookRequestError;

    invoke-direct {v13, p0, v1}, Lcom/facebook/FacebookRequestError;-><init>(Ljava/net/HttpURLConnection;Ljava/lang/Exception;)V

    invoke-direct {v12, v9, p0, v13}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookRequestError;)V

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_44

    .line 391
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_6e
    move-exception v1

    .line 392
    .local v1, "e":Ljava/io/IOException;
    new-instance v12, Lcom/facebook/Response;

    new-instance v13, Lcom/facebook/FacebookRequestError;

    invoke-direct {v13, p0, v1}, Lcom/facebook/FacebookRequestError;-><init>(Ljava/net/HttpURLConnection;Ljava/lang/Exception;)V

    invoke-direct {v12, v9, p0, v13}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookRequestError;)V

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_44

    .end local v1    # "e":Ljava/io/IOException;
    .end local v9    # "request":Lcom/facebook/Request;
    .end local p2    # "object":Ljava/lang/Object;
    :cond_7d
    move-object/from16 v4, p2

    .line 401
    check-cast v4, Lorg/json/JSONArray;

    .line 403
    .restart local v4    # "jsonArray":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_82
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-lt v3, v12, :cond_89

    .line 415
    return-object v11

    .line 404
    :cond_89
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/facebook/Request;

    .line 406
    .restart local v9    # "request":Lcom/facebook/Request;
    :try_start_8f
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    .line 407
    .local v7, "obj":Ljava/lang/Object;
    move/from16 v0, p3

    invoke-static {v9, p0, v7, v0, v8}, Lcom/facebook/Response;->createResponseFromObject(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Ljava/lang/Object;ZLjava/lang/Object;)Lcom/facebook/Response;

    move-result-object v12

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_9c
    .catch Lorg/json/JSONException; {:try_start_8f .. :try_end_9c} :catch_9f
    .catch Lcom/facebook/FacebookException; {:try_start_8f .. :try_end_9c} :catch_ae

    .line 403
    .end local v7    # "obj":Ljava/lang/Object;
    :goto_9c
    add-int/lit8 v3, v3, 0x1

    goto :goto_82

    .line 408
    :catch_9f
    move-exception v1

    .line 409
    .local v1, "e":Lorg/json/JSONException;
    new-instance v12, Lcom/facebook/Response;

    new-instance v13, Lcom/facebook/FacebookRequestError;

    invoke-direct {v13, p0, v1}, Lcom/facebook/FacebookRequestError;-><init>(Ljava/net/HttpURLConnection;Ljava/lang/Exception;)V

    invoke-direct {v12, v9, p0, v13}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookRequestError;)V

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9c

    .line 410
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_ae
    move-exception v1

    .line 411
    .local v1, "e":Lcom/facebook/FacebookException;
    new-instance v12, Lcom/facebook/Response;

    new-instance v13, Lcom/facebook/FacebookRequestError;

    invoke-direct {v13, p0, v1}, Lcom/facebook/FacebookRequestError;-><init>(Ljava/net/HttpURLConnection;Ljava/lang/Exception;)V

    invoke-direct {v12, v9, p0, v13}, Lcom/facebook/Response;-><init>(Lcom/facebook/Request;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookRequestError;)V

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9c
.end method

.method static createResponsesFromStream(Ljava/io/InputStream;Ljava/net/HttpURLConnection;Lcom/facebook/RequestBatch;Z)Ljava/util/List;
    .registers 11
    .param p0, "stream"    # Ljava/io/InputStream;
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "requests"    # Lcom/facebook/RequestBatch;
    .param p3, "isFromCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/net/HttpURLConnection;",
            "Lcom/facebook/RequestBatch;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/FacebookException;,
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 345
    invoke-static {p0}, Lcom/facebook/internal/Utility;->readStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 346
    .local v0, "responseString":Ljava/lang/String;
    sget-object v1, Lcom/facebook/LoggingBehavior;->INCLUDE_RAW_RESPONSES:Lcom/facebook/LoggingBehavior;

    const-string v2, "Response"

    .line 347
    const-string v3, "Response (raw)\n  Size: %d\n  Response:\n%s\n"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    .line 348
    aput-object v0, v4, v5

    .line 346
    invoke-static {v1, v2, v3, v4}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 350
    invoke-static {v0, p1, p2, p3}, Lcom/facebook/Response;->createResponsesFromString(Ljava/lang/String;Ljava/net/HttpURLConnection;Lcom/facebook/RequestBatch;Z)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method static createResponsesFromString(Ljava/lang/String;Ljava/net/HttpURLConnection;Lcom/facebook/RequestBatch;Z)Ljava/util/List;
    .registers 13
    .param p0, "responseString"    # Ljava/lang/String;
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "requests"    # Lcom/facebook/RequestBatch;
    .param p3, "isFromCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/net/HttpURLConnection;",
            "Lcom/facebook/RequestBatch;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/FacebookException;,
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 355
    new-instance v2, Lorg/json/JSONTokener;

    invoke-direct {v2, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 356
    .local v2, "tokener":Lorg/json/JSONTokener;
    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    .line 358
    .local v1, "resultObject":Ljava/lang/Object;
    invoke-static {p1, p2, v1, p3}, Lcom/facebook/Response;->createResponsesFromObject(Ljava/net/HttpURLConnection;Ljava/util/List;Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    .line 359
    .local v0, "responses":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/Response;>;"
    sget-object v3, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    const-string v4, "Response"

    const-string v5, "Response\n  Id: %s\n  Size: %d\n  Responses:\n%s\n"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    .line 360
    invoke-virtual {p2}, Lcom/facebook/RequestBatch;->getId()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    aput-object v0, v6, v7

    .line 359
    invoke-static {v3, v4, v5, v6}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 362
    return-object v0
.end method

.method static fromHttpConnection(Ljava/net/HttpURLConnection;Lcom/facebook/RequestBatch;)Ljava/util/List;
    .registers 14
    .param p0, "connection"    # Ljava/net/HttpURLConnection;
    .param p1, "requests"    # Lcom/facebook/RequestBatch;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Lcom/facebook/RequestBatch;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/Response;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 276
    const/4 v6, 0x0

    .line 278
    .local v6, "stream":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 279
    .local v0, "cache":Lcom/facebook/internal/FileLruCache;
    const/4 v1, 0x0

    .line 280
    .local v1, "cacheKey":Ljava/lang/String;
    instance-of v7, p1, Lcom/facebook/internal/CacheableRequestBatch;

    if-eqz v7, :cond_54

    move-object v2, p1

    .line 281
    check-cast v2, Lcom/facebook/internal/CacheableRequestBatch;

    .line 282
    .local v2, "cacheableRequestBatch":Lcom/facebook/internal/CacheableRequestBatch;
    invoke-static {}, Lcom/facebook/Response;->getResponseCache()Lcom/facebook/internal/FileLruCache;

    move-result-object v0

    .line 283
    invoke-virtual {v2}, Lcom/facebook/internal/CacheableRequestBatch;->getCacheKeyOverride()Ljava/lang/String;

    move-result-object v1

    .line 284
    invoke-static {v1}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_28

    .line 285
    invoke-virtual {p1}, Lcom/facebook/RequestBatch;->size()I

    move-result v7

    if-ne v7, v9, :cond_46

    .line 287
    invoke-virtual {p1, v8}, Lcom/facebook/RequestBatch;->get(I)Lcom/facebook/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/facebook/Request;->getUrlForSingleRequest()Ljava/lang/String;

    move-result-object v1

    .line 295
    :cond_28
    :goto_28
    invoke-virtual {v2}, Lcom/facebook/internal/CacheableRequestBatch;->getForceRoundTrip()Z

    move-result v7

    if-nez v7, :cond_54

    if-eqz v0, :cond_54

    invoke-static {v1}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_54

    .line 297
    :try_start_36
    invoke-virtual {v0, v1}, Lcom/facebook/internal/FileLruCache;->get(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 298
    if-eqz v6, :cond_78

    .line 299
    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {v6, v7, p1, v8}, Lcom/facebook/Response;->createResponsesFromStream(Ljava/io/InputStream;Ljava/net/HttpURLConnection;Lcom/facebook/RequestBatch;Z)Ljava/util/List;
    :try_end_41
    .catch Lcom/facebook/FacebookException; {:try_start_36 .. :try_end_41} :catch_50
    .catch Lorg/json/JSONException; {:try_start_36 .. :try_end_41} :catch_69
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_41} :catch_6e
    .catchall {:try_start_36 .. :try_end_41} :catchall_73

    move-result-object v7

    .line 305
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    .line 336
    .end local v2    # "cacheableRequestBatch":Lcom/facebook/internal/CacheableRequestBatch;
    :goto_45
    return-object v7

    .line 289
    .restart local v2    # "cacheableRequestBatch":Lcom/facebook/internal/CacheableRequestBatch;
    :cond_46
    sget-object v7, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    const-string v8, "ResponseCache"

    .line 290
    const-string v9, "Not using cache for cacheable request because no key was specified"

    .line 289
    invoke-static {v7, v8, v9}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_28

    .line 301
    :catch_50
    move-exception v7

    .line 305
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    .line 312
    .end local v2    # "cacheableRequestBatch":Lcom/facebook/internal/CacheableRequestBatch;
    :cond_54
    :goto_54
    :try_start_54
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    const/16 v8, 0x190

    if-lt v7, v8, :cond_7c

    .line 313
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v6

    .line 324
    :cond_60
    :goto_60
    const/4 v7, 0x0

    invoke-static {v6, p0, p1, v7}, Lcom/facebook/Response;->createResponsesFromStream(Ljava/io/InputStream;Ljava/net/HttpURLConnection;Lcom/facebook/RequestBatch;Z)Ljava/util/List;
    :try_end_64
    .catch Lcom/facebook/FacebookException; {:try_start_54 .. :try_end_64} :catch_8e
    .catch Lorg/json/JSONException; {:try_start_54 .. :try_end_64} :catch_a6
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_64} :catch_c3
    .catch Ljava/lang/SecurityException; {:try_start_54 .. :try_end_64} :catch_e1
    .catchall {:try_start_54 .. :try_end_64} :catchall_ff

    move-result-object v7

    .line 338
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_45

    .line 302
    .restart local v2    # "cacheableRequestBatch":Lcom/facebook/internal/CacheableRequestBatch;
    :catch_69
    move-exception v7

    .line 305
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_54

    .line 303
    :catch_6e
    move-exception v7

    .line 305
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_54

    .line 304
    :catchall_73
    move-exception v7

    .line 305
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    .line 306
    throw v7

    .line 305
    :cond_78
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_54

    .line 315
    .end local v2    # "cacheableRequestBatch":Lcom/facebook/internal/CacheableRequestBatch;
    :cond_7c
    :try_start_7c
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    .line 316
    if-eqz v0, :cond_60

    if-eqz v1, :cond_60

    if-eqz v6, :cond_60

    .line 317
    invoke-virtual {v0, v1, v6}, Lcom/facebook/internal/FileLruCache;->interceptAndPut(Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/InputStream;
    :try_end_89
    .catch Lcom/facebook/FacebookException; {:try_start_7c .. :try_end_89} :catch_8e
    .catch Lorg/json/JSONException; {:try_start_7c .. :try_end_89} :catch_a6
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_89} :catch_c3
    .catch Ljava/lang/SecurityException; {:try_start_7c .. :try_end_89} :catch_e1
    .catchall {:try_start_7c .. :try_end_89} :catchall_ff

    move-result-object v5

    .line 318
    .local v5, "interceptStream":Ljava/io/InputStream;
    if-eqz v5, :cond_60

    .line 319
    move-object v6, v5

    goto :goto_60

    .line 325
    .end local v5    # "interceptStream":Ljava/io/InputStream;
    :catch_8e
    move-exception v4

    .line 326
    .local v4, "facebookException":Lcom/facebook/FacebookException;
    :try_start_8f
    sget-object v7, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    const-string v8, "Response"

    const-string v9, "Response <Error>: %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    invoke-static {v7, v8, v9, v10}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 327
    invoke-static {p1, p0, v4}, Lcom/facebook/Response;->constructErrorResponses(Ljava/util/List;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)Ljava/util/List;
    :try_end_a1
    .catchall {:try_start_8f .. :try_end_a1} :catchall_ff

    move-result-object v7

    .line 338
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_45

    .line 328
    .end local v4    # "facebookException":Lcom/facebook/FacebookException;
    :catch_a6
    move-exception v3

    .line 329
    .local v3, "exception":Lorg/json/JSONException;
    :try_start_a7
    sget-object v7, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    const-string v8, "Response"

    const-string v9, "Response <Error>: %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v3, v10, v11

    invoke-static {v7, v8, v9, v10}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 330
    new-instance v7, Lcom/facebook/FacebookException;

    invoke-direct {v7, v3}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/Throwable;)V

    invoke-static {p1, p0, v7}, Lcom/facebook/Response;->constructErrorResponses(Ljava/util/List;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)Ljava/util/List;
    :try_end_be
    .catchall {:try_start_a7 .. :try_end_be} :catchall_ff

    move-result-object v7

    .line 338
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_45

    .line 331
    .end local v3    # "exception":Lorg/json/JSONException;
    :catch_c3
    move-exception v3

    .line 332
    .local v3, "exception":Ljava/io/IOException;
    :try_start_c4
    sget-object v7, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    const-string v8, "Response"

    const-string v9, "Response <Error>: %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v3, v10, v11

    invoke-static {v7, v8, v9, v10}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 333
    new-instance v7, Lcom/facebook/FacebookException;

    invoke-direct {v7, v3}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/Throwable;)V

    invoke-static {p1, p0, v7}, Lcom/facebook/Response;->constructErrorResponses(Ljava/util/List;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)Ljava/util/List;
    :try_end_db
    .catchall {:try_start_c4 .. :try_end_db} :catchall_ff

    move-result-object v7

    .line 338
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto/16 :goto_45

    .line 334
    .end local v3    # "exception":Ljava/io/IOException;
    :catch_e1
    move-exception v3

    .line 335
    .local v3, "exception":Ljava/lang/SecurityException;
    :try_start_e2
    sget-object v7, Lcom/facebook/LoggingBehavior;->REQUESTS:Lcom/facebook/LoggingBehavior;

    const-string v8, "Response"

    const-string v9, "Response <Error>: %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v3, v10, v11

    invoke-static {v7, v8, v9, v10}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 336
    new-instance v7, Lcom/facebook/FacebookException;

    invoke-direct {v7, v3}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/Throwable;)V

    invoke-static {p1, p0, v7}, Lcom/facebook/Response;->constructErrorResponses(Ljava/util/List;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)Ljava/util/List;
    :try_end_f9
    .catchall {:try_start_e2 .. :try_end_f9} :catchall_ff

    move-result-object v7

    .line 338
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    goto/16 :goto_45

    .line 337
    .end local v3    # "exception":Ljava/lang/SecurityException;
    :catchall_ff
    move-exception v7

    .line 338
    invoke-static {v6}, Lcom/facebook/internal/Utility;->closeQuietly(Ljava/io/Closeable;)V

    .line 339
    throw v7
.end method

.method static getResponseCache()Lcom/facebook/internal/FileLruCache;
    .registers 4

    .prologue
    .line 264
    sget-object v1, Lcom/facebook/Response;->responseCache:Lcom/facebook/internal/FileLruCache;

    if-nez v1, :cond_18

    .line 265
    invoke-static {}, Lcom/facebook/Session;->getStaticContext()Landroid/content/Context;

    move-result-object v0

    .line 266
    .local v0, "applicationContext":Landroid/content/Context;
    if-eqz v0, :cond_18

    .line 267
    new-instance v1, Lcom/facebook/internal/FileLruCache;

    const-string v2, "ResponseCache"

    new-instance v3, Lcom/facebook/internal/FileLruCache$Limits;

    invoke-direct {v3}, Lcom/facebook/internal/FileLruCache$Limits;-><init>()V

    invoke-direct {v1, v0, v2, v3}, Lcom/facebook/internal/FileLruCache;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/internal/FileLruCache$Limits;)V

    sput-object v1, Lcom/facebook/Response;->responseCache:Lcom/facebook/internal/FileLruCache;

    .line 271
    :cond_18
    sget-object v1, Lcom/facebook/Response;->responseCache:Lcom/facebook/internal/FileLruCache;

    return-object v1
.end method


# virtual methods
.method public final getError()Lcom/facebook/FacebookRequestError;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/facebook/Response;->error:Lcom/facebook/FacebookRequestError;

    return-object v0
.end method

.method public final getGraphObject()Lcom/facebook/model/GraphObject;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/facebook/Response;->graphObject:Lcom/facebook/model/GraphObject;

    return-object v0
.end method

.method public final getGraphObjectAs(Ljava/lang/Class;)Lcom/facebook/model/GraphObject;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/facebook/model/GraphObject;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 120
    .local p1, "graphObjectClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/facebook/Response;->graphObject:Lcom/facebook/model/GraphObject;

    if-nez v0, :cond_6

    .line 121
    const/4 v0, 0x0

    .line 126
    :goto_5
    return-object v0

    .line 123
    :cond_6
    if-nez p1, :cond_10

    .line 124
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Must pass in a valid interface that extends GraphObject"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_10
    iget-object v0, p0, Lcom/facebook/Response;->graphObject:Lcom/facebook/model/GraphObject;

    invoke-interface {v0, p1}, Lcom/facebook/model/GraphObject;->cast(Ljava/lang/Class;)Lcom/facebook/model/GraphObject;

    move-result-object v0

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 243
    :try_start_0
    const-string v3, "%d"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v2, p0, Lcom/facebook/Response;->connection:Ljava/net/HttpURLConnection;

    if-eqz v2, :cond_5e

    iget-object v2, p0, Lcom/facebook/Response;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    :goto_10
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_19} :catch_61

    move-result-object v1

    .line 248
    .local v1, "responseCode":Ljava/lang/String;
    :goto_1a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "{Response: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " responseCode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 249
    const-string v3, ", graphObject: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/Response;->graphObject:Lcom/facebook/model/GraphObject;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/Response;->error:Lcom/facebook/FacebookRequestError;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 250
    const-string v3, ", isFromCache:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/facebook/Response;->isFromCache:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 251
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 248
    return-object v2

    .line 243
    .end local v1    # "responseCode":Ljava/lang/String;
    :cond_5e
    const/16 v2, 0xc8

    goto :goto_10

    .line 244
    :catch_61
    move-exception v0

    .line 245
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "unknown"

    .restart local v1    # "responseCode":Ljava/lang/String;
    goto :goto_1a
.end method
