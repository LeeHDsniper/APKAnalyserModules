.class public Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;
.super Ljava/lang/Object;
.source "CacheStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/CacheStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# instance fields
.field private ageSeconds:I

.field final cacheResponse:Lcom/squareup/okhttp/Response;

.field private etag:Ljava/lang/String;

.field private expires:Ljava/util/Date;

.field private lastModified:Ljava/util/Date;

.field private lastModifiedString:Ljava/lang/String;

.field final nowMillis:J

.field private receivedResponseMillis:J

.field final request:Lcom/squareup/okhttp/Request;

.field private sentRequestMillis:J

.field private servedDate:Ljava/util/Date;

.field private servedDateString:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)V
    .registers 12
    .param p1, "nowMillis"    # J
    .param p3, "request"    # Lcom/squareup/okhttp/Request;
    .param p4, "cacheResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    const/4 v6, -0x1

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput v6, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->ageSeconds:I

    .line 101
    iput-wide p1, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->nowMillis:J

    .line 102
    iput-object p3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    .line 103
    iput-object p4, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 105
    if-eqz p4, :cond_94

    .line 106
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    invoke-virtual {p4}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v3

    if-ge v1, v3, :cond_94

    .line 107
    invoke-virtual {p4}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "fieldName":Ljava/lang/String;
    invoke-virtual {p4}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v2

    .line 109
    .local v2, "value":Ljava/lang/String;
    const-string v3, "Date"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 110
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 111
    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDateString:Ljava/lang/String;

    .line 106
    :cond_39
    :goto_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 112
    :cond_3c
    const-string v3, "Expires"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 113
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    goto :goto_39

    .line 114
    :cond_4b
    const-string v3, "Last-Modified"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5c

    .line 115
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    .line 116
    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModifiedString:Ljava/lang/String;

    goto :goto_39

    .line 117
    :cond_5c
    const-string v3, "ETag"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_67

    .line 118
    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->etag:Ljava/lang/String;

    goto :goto_39

    .line 119
    :cond_67
    const-string v3, "Age"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_76

    .line 120
    invoke-static {v2, v6}, Lcom/squareup/okhttp/internal/http/HeaderParser;->parseSeconds(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->ageSeconds:I

    goto :goto_39

    .line 121
    :cond_76
    sget-object v3, Lcom/squareup/okhttp/internal/http/OkHeaders;->SENT_MILLIS:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_85

    .line 122
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->sentRequestMillis:J

    goto :goto_39

    .line 123
    :cond_85
    sget-object v3, Lcom/squareup/okhttp/internal/http/OkHeaders;->RECEIVED_MILLIS:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_39

    .line 124
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    goto :goto_39

    .line 128
    .end local v0    # "fieldName":Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "value":Ljava/lang/String;
    :cond_94
    return-void
.end method

.method private cacheResponseAge()J
    .registers 13

    .prologue
    const-wide/16 v0, 0x0

    .line 251
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v8, :cond_13

    iget-wide v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    iget-object v10, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    invoke-virtual {v10}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 254
    .local v0, "apparentReceivedAge":J
    :cond_13
    iget v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->ageSeconds:I

    const/4 v9, -0x1

    if-eq v8, v9, :cond_35

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget v9, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->ageSeconds:I

    int-to-long v10, v9

    invoke-virtual {v8, v10, v11}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 257
    .local v2, "receivedAge":J
    :goto_25
    iget-wide v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    iget-wide v10, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->sentRequestMillis:J

    sub-long v6, v8, v10

    .line 258
    .local v6, "responseDuration":J
    iget-wide v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->nowMillis:J

    iget-wide v10, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    sub-long v4, v8, v10

    .line 259
    .local v4, "residentDuration":J
    add-long v8, v2, v6

    add-long/2addr v8, v4

    return-wide v8

    .end local v2    # "receivedAge":J
    .end local v4    # "residentDuration":J
    .end local v6    # "responseDuration":J
    :cond_35
    move-wide v2, v0

    .line 254
    goto :goto_25
.end method

.method private computeFreshnessLifetime()J
    .registers 11

    .prologue
    const-wide/16 v6, 0x0

    .line 222
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v2

    .line 223
    .local v2, "responseCaching":Lcom/squareup/okhttp/CacheControl;
    invoke-virtual {v2}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v3

    const/4 v8, -0x1

    if-eq v3, v8, :cond_1b

    .line 224
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v3, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    .line 243
    :cond_1a
    :goto_1a
    return-wide v6

    .line 225
    :cond_1b
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    if-eqz v3, :cond_3c

    .line 226
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v3, :cond_37

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 229
    .local v4, "servedMillis":J
    :goto_29
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long v0, v8, v4

    .line 230
    .local v0, "delta":J
    cmp-long v3, v0, v6

    if-lez v3, :cond_3a

    .end local v0    # "delta":J
    :goto_35
    move-wide v6, v0

    goto :goto_1a

    .line 226
    .end local v4    # "servedMillis":J
    :cond_37
    iget-wide v4, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    goto :goto_29

    .restart local v0    # "delta":J
    .restart local v4    # "servedMillis":J
    :cond_3a
    move-wide v0, v6

    .line 230
    goto :goto_35

    .line 231
    .end local v0    # "delta":J
    .end local v4    # "servedMillis":J
    :cond_3c
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    if-eqz v3, :cond_1a

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->request()Lcom/squareup/okhttp/Request;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1a

    .line 237
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v3, :cond_6b

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 240
    .restart local v4    # "servedMillis":J
    :goto_5a
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long v0, v4, v8

    .line 241
    .restart local v0    # "delta":J
    cmp-long v3, v0, v6

    if-lez v3, :cond_1a

    const-wide/16 v6, 0xa

    div-long v6, v0, v6

    goto :goto_1a

    .line 237
    .end local v0    # "delta":J
    .end local v4    # "servedMillis":J
    :cond_6b
    iget-wide v4, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->sentRequestMillis:J

    goto :goto_5a
.end method

.method private getCandidate()Lcom/squareup/okhttp/internal/http/CacheStrategy;
    .registers 25

    .prologue
    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v19, v0

    if-nez v19, :cond_18

    .line 149
    new-instance v19, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-direct/range {v19 .. v22}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    .line 212
    :goto_17
    return-object v19

    .line 153
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/squareup/okhttp/Request;->isHttps()Z

    move-result v19

    if-eqz v19, :cond_40

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/squareup/okhttp/Response;->handshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v19

    if-nez v19, :cond_40

    .line 154
    new-instance v19, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-direct/range {v19 .. v22}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto :goto_17

    .line 160
    :cond_40
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v20, v0

    invoke-static/range {v19 .. v20}, Lcom/squareup/okhttp/internal/http/CacheStrategy;->isCacheable(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Request;)Z

    move-result v19

    if-nez v19, :cond_62

    .line 161
    new-instance v19, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-direct/range {v19 .. v22}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto :goto_17

    .line 164
    :cond_62
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/squareup/okhttp/Request;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v9

    .line 165
    .local v9, "requestCaching":Lcom/squareup/okhttp/CacheControl;
    invoke-virtual {v9}, Lcom/squareup/okhttp/CacheControl;->noCache()Z

    move-result v19

    if-nez v19, :cond_7e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->hasConditions(Lcom/squareup/okhttp/Request;)Z

    move-result v19

    if-eqz v19, :cond_8e

    .line 166
    :cond_7e
    new-instance v19, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-direct/range {v19 .. v22}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto :goto_17

    .line 169
    :cond_8e
    invoke-direct/range {p0 .. p0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponseAge()J

    move-result-wide v4

    .line 170
    .local v4, "ageMillis":J
    invoke-direct/range {p0 .. p0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->computeFreshnessLifetime()J

    move-result-wide v10

    .line 172
    .local v10, "freshMillis":J
    invoke-virtual {v9}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v19

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_b7

    .line 173
    sget-object v19, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v20

    move-wide/from16 v0, v20

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    .line 176
    :cond_b7
    const-wide/16 v14, 0x0

    .line 177
    .local v14, "minFreshMillis":J
    invoke-virtual {v9}, Lcom/squareup/okhttp/CacheControl;->minFreshSeconds()I

    move-result v19

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_d4

    .line 178
    sget-object v19, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9}, Lcom/squareup/okhttp/CacheControl;->minFreshSeconds()I

    move-result v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v14

    .line 181
    :cond_d4
    const-wide/16 v12, 0x0

    .line 182
    .local v12, "maxStaleMillis":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v18

    .line 183
    .local v18, "responseCaching":Lcom/squareup/okhttp/CacheControl;
    invoke-virtual/range {v18 .. v18}, Lcom/squareup/okhttp/CacheControl;->mustRevalidate()Z

    move-result v19

    if-nez v19, :cond_101

    invoke-virtual {v9}, Lcom/squareup/okhttp/CacheControl;->maxStaleSeconds()I

    move-result v19

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_101

    .line 184
    sget-object v19, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9}, Lcom/squareup/okhttp/CacheControl;->maxStaleSeconds()I

    move-result v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    .line 187
    :cond_101
    invoke-virtual/range {v18 .. v18}, Lcom/squareup/okhttp/CacheControl;->noCache()Z

    move-result v19

    if-nez v19, :cond_151

    add-long v20, v4, v14

    add-long v22, v10, v12

    cmp-long v19, v20, v22

    if-gez v19, :cond_151

    .line 188
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v6

    .line 189
    .local v6, "builder":Lcom/squareup/okhttp/Response$Builder;
    add-long v20, v4, v14

    cmp-long v19, v20, v10

    if-ltz v19, :cond_12a

    .line 190
    const-string v19, "Warning"

    const-string v20, "110 HttpURLConnection \"Response is stale\""

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Lcom/squareup/okhttp/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    .line 192
    :cond_12a
    const-wide/32 v16, 0x5265c00

    .line 193
    .local v16, "oneDayMillis":J
    cmp-long v19, v4, v16

    if-lez v19, :cond_142

    invoke-direct/range {p0 .. p0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->isFreshnessLifetimeHeuristic()Z

    move-result v19

    if-eqz v19, :cond_142

    .line 194
    const-string v19, "Warning"

    const-string v20, "113 HttpURLConnection \"Heuristic expiration\""

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Lcom/squareup/okhttp/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    .line 196
    :cond_142
    new-instance v19, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    const/16 v20, 0x0

    invoke-virtual {v6}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v21

    const/16 v22, 0x0

    invoke-direct/range {v19 .. v22}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto/16 :goto_17

    .line 199
    .end local v6    # "builder":Lcom/squareup/okhttp/Response$Builder;
    .end local v16    # "oneDayMillis":J
    :cond_151
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v8

    .line 201
    .local v8, "conditionalRequestBuilder":Lcom/squareup/okhttp/Request$Builder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1a8

    .line 202
    const-string v19, "If-Modified-Since"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModifiedString:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v8, v0, v1}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 207
    :cond_172
    :goto_172
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->etag:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_189

    .line 208
    const-string v19, "If-None-Match"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->etag:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v8, v0, v1}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 211
    :cond_189
    invoke-virtual {v8}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v7

    .line 212
    .local v7, "conditionalRequest":Lcom/squareup/okhttp/Request;
    invoke-static {v7}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->hasConditions(Lcom/squareup/okhttp/Request;)Z

    move-result v19

    if-eqz v19, :cond_1c0

    new-instance v19, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v7, v1, v2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto/16 :goto_17

    .line 203
    .end local v7    # "conditionalRequest":Lcom/squareup/okhttp/Request;
    :cond_1a8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    move-object/from16 v19, v0

    if-eqz v19, :cond_172

    .line 204
    const-string v19, "If-Modified-Since"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDateString:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v8, v0, v1}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    goto :goto_172

    .line 212
    .restart local v7    # "conditionalRequest":Lcom/squareup/okhttp/Request;
    :cond_1c0
    new-instance v19, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v7, v1, v2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto/16 :goto_17
.end method

.method private static hasConditions(Lcom/squareup/okhttp/Request;)Z
    .registers 2
    .param p0, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 277
    const-string v0, "If-Modified-Since"

    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_10

    const-string v0, "If-None-Match"

    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private isFreshnessLifetimeHeuristic()Z
    .registers 3

    .prologue
    .line 268
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_13

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method


# virtual methods
.method public get()Lcom/squareup/okhttp/internal/http/CacheStrategy;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 135
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->getCandidate()Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-result-object v0

    .line 137
    .local v0, "candidate":Lcom/squareup/okhttp/internal/http/CacheStrategy;
    iget-object v1, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy;->networkRequest:Lcom/squareup/okhttp/Request;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/CacheControl;->onlyIfCached()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 139
    new-instance v0, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    .end local v0    # "candidate":Lcom/squareup/okhttp/internal/http/CacheStrategy;
    invoke-direct {v0, v2, v2, v2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    .line 142
    :cond_1a
    return-object v0
.end method
