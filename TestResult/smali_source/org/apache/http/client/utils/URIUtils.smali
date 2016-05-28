.class public Lorg/apache/http/client/utils/URIUtils;
.super Ljava/lang/Object;
.source "URIUtils.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 425
    return-void
.end method

.method public static createURI(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/URI;
    .registers 9
    .param p0, "scheme"    # Ljava/lang/String;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "path"    # Ljava/lang/String;
    .param p4, "query"    # Ljava/lang/String;
    .param p5, "fragment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v0, "buffer":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_1e

    .line 87
    if-eqz p0, :cond_11

    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    :cond_11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    if-lez p2, :cond_1e

    .line 93
    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    :cond_1e
    if-eqz p3, :cond_28

    const-string v1, "/"

    invoke-virtual {p3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2d

    .line 98
    :cond_28
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 100
    :cond_2d
    if-eqz p3, :cond_32

    .line 101
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    :cond_32
    if-eqz p4, :cond_3c

    .line 104
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_3c
    if-eqz p5, :cond_46

    .line 108
    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_46
    new-instance v1, Ljava/net/URI;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method public static extractHost(Ljava/net/URI;)Lorg/apache/http/HttpHost;
    .registers 12
    .param p0, "uri"    # Ljava/net/URI;

    .prologue
    .line 323
    if-nez p0, :cond_4

    .line 324
    const/4 v8, 0x0

    .line 372
    :cond_3
    :goto_3
    return-object v8

    .line 326
    :cond_4
    const/4 v8, 0x0

    .line 327
    .local v8, "target":Lorg/apache/http/HttpHost;
    invoke-virtual {p0}, Ljava/net/URI;->isAbsolute()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 328
    invoke-virtual {p0}, Ljava/net/URI;->getPort()I

    move-result v5

    .line 329
    .local v5, "port":I
    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 330
    .local v2, "host":Ljava/lang/String;
    if-nez v2, :cond_67

    .line 332
    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v2

    .line 333
    if-eqz v2, :cond_67

    .line 335
    const/16 v9, 0x40

    invoke-virtual {v2, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 336
    .local v0, "at":I
    if-ltz v0, :cond_31

    .line 337
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v10, v0, 0x1

    if-le v9, v10, :cond_54

    .line 338
    add-int/lit8 v9, v0, 0x1

    invoke-virtual {v2, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 344
    :cond_31
    :goto_31
    if-eqz v2, :cond_67

    .line 345
    const/16 v9, 0x3a

    invoke-virtual {v2, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 346
    .local v1, "colon":I
    if-ltz v1, :cond_67

    .line 347
    add-int/lit8 v6, v1, 0x1

    .line 348
    .local v6, "pos":I
    const/4 v4, 0x0

    .line 349
    .local v4, "len":I
    move v3, v6

    .local v3, "i":I
    :goto_3f
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v3, v9, :cond_56

    .line 350
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v9

    if-eqz v9, :cond_56

    .line 351
    add-int/lit8 v4, v4, 0x1

    .line 349
    add-int/lit8 v3, v3, 0x1

    goto :goto_3f

    .line 340
    .end local v1    # "colon":I
    .end local v3    # "i":I
    .end local v4    # "len":I
    .end local v6    # "pos":I
    :cond_54
    const/4 v2, 0x0

    goto :goto_31

    .line 356
    .restart local v1    # "colon":I
    .restart local v3    # "i":I
    .restart local v4    # "len":I
    .restart local v6    # "pos":I
    :cond_56
    if-lez v4, :cond_62

    .line 358
    add-int v9, v6, v4

    :try_start_5a
    invoke-virtual {v2, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_61
    .catch Ljava/lang/NumberFormatException; {:try_start_5a .. :try_end_61} :catch_73

    move-result v5

    .line 362
    :cond_62
    :goto_62
    const/4 v9, 0x0

    invoke-virtual {v2, v9, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 367
    .end local v0    # "at":I
    .end local v1    # "colon":I
    .end local v3    # "i":I
    .end local v4    # "len":I
    .end local v6    # "pos":I
    :cond_67
    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v7

    .line 368
    .local v7, "scheme":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 369
    new-instance v8, Lorg/apache/http/HttpHost;

    .end local v8    # "target":Lorg/apache/http/HttpHost;
    invoke-direct {v8, v2, v5, v7}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .restart local v8    # "target":Lorg/apache/http/HttpHost;
    goto :goto_3

    .line 359
    .end local v7    # "scheme":Ljava/lang/String;
    .restart local v0    # "at":I
    .restart local v1    # "colon":I
    .restart local v3    # "i":I
    .restart local v4    # "len":I
    .restart local v6    # "pos":I
    :catch_73
    move-exception v9

    goto :goto_62
.end method

.method private static normalizeSyntax(Ljava/net/URI;)Ljava/net/URI;
    .registers 19
    .param p0, "uri"    # Ljava/net/URI;

    .prologue
    .line 262
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->isOpaque()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 307
    .end local p0    # "uri":Ljava/net/URI;
    .local v1, "ref":Ljava/net/URI;
    .local v2, "scheme":Ljava/lang/String;
    .local v3, "auth":Ljava/lang/String;
    .local v7, "arr$":[Ljava/lang/String;
    .local v9, "i$":Ljava/util/Iterator;
    .local v11, "inputSegments":[Ljava/lang/String;
    .local v12, "len$":I
    .local v13, "normalized":Ljava/lang/StringBuilder;
    .local v14, "outputBuffer":Ljava/lang/StringBuilder;
    .local v16, "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    .local v17, "path":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 265
    .end local v1    # "ref":Ljava/net/URI;
    .end local v2    # "scheme":Ljava/lang/String;
    .end local v3    # "auth":Ljava/lang/String;
    .end local v7    # "arr$":[Ljava/lang/String;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v11    # "inputSegments":[Ljava/lang/String;
    .end local v12    # "len$":I
    .end local v13    # "normalized":Ljava/lang/StringBuilder;
    .end local v14    # "outputBuffer":Ljava/lang/StringBuilder;
    .end local v16    # "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    .end local v17    # "path":Ljava/lang/String;
    .restart local p0    # "uri":Ljava/net/URI;
    :cond_7
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->isAbsolute()Z

    move-result v4

    const-string v5, "Base URI must be absolute"

    invoke-static {v4, v5}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 266
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3d

    const-string v17, ""

    .line 267
    .restart local v17    # "path":Ljava/lang/String;
    :goto_18
    const-string v4, "/"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 268
    .restart local v11    # "inputSegments":[Ljava/lang/String;
    new-instance v16, Ljava/util/Stack;

    invoke-direct/range {v16 .. v16}, Ljava/util/Stack;-><init>()V

    .line 269
    .restart local v16    # "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    move-object v7, v11

    .restart local v7    # "arr$":[Ljava/lang/String;
    array-length v12, v7

    .restart local v12    # "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_28
    if-ge v9, v12, :cond_5a

    aget-object v10, v7, v9

    .line 270
    .local v10, "inputSegment":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_3a

    const-string v4, "."

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42

    .line 269
    :cond_3a
    :goto_3a
    add-int/lit8 v9, v9, 0x1

    goto :goto_28

    .line 266
    .end local v7    # "arr$":[Ljava/lang/String;
    .end local v9    # "i$":I
    .end local v10    # "inputSegment":Ljava/lang/String;
    .end local v11    # "inputSegments":[Ljava/lang/String;
    .end local v12    # "len$":I
    .end local v16    # "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    .end local v17    # "path":Ljava/lang/String;
    :cond_3d
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v17

    goto :goto_18

    .line 273
    .restart local v7    # "arr$":[Ljava/lang/String;
    .restart local v9    # "i$":I
    .restart local v10    # "inputSegment":Ljava/lang/String;
    .restart local v11    # "inputSegments":[Ljava/lang/String;
    .restart local v12    # "len$":I
    .restart local v16    # "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    .restart local v17    # "path":Ljava/lang/String;
    :cond_42
    const-string v4, ".."

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_54

    .line 274
    invoke-virtual/range {v16 .. v16}, Ljava/util/Stack;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3a

    .line 275
    invoke-virtual/range {v16 .. v16}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_3a

    .line 278
    :cond_54
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3a

    .line 281
    .end local v10    # "inputSegment":Ljava/lang/String;
    :cond_5a
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 282
    .restart local v14    # "outputBuffer":Ljava/lang/StringBuilder;
    invoke-virtual/range {v16 .. v16}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_63
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_79

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 283
    .local v15, "outputSegment":Ljava/lang/String;
    const/16 v4, 0x2f

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_63

    .line 285
    .end local v15    # "outputSegment":Ljava/lang/String;
    :cond_79
    const/16 v4, 0x2f

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v4, v5, :cond_8e

    .line 287
    const/16 v4, 0x2f

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 290
    :cond_8e
    :try_start_8e
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 291
    .restart local v2    # "scheme":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 292
    .restart local v3    # "auth":Ljava/lang/String;
    new-instance v1, Ljava/net/URI;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    .restart local v1    # "ref":Ljava/net/URI;
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_b9

    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_b9

    move-object/from16 p0, v1

    .line 295
    goto/16 :goto_6

    .line 297
    :cond_b9
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v13, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 299
    .restart local v13    # "normalized":Ljava/lang/StringBuilder;
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_d5

    .line 301
    const/16 v4, 0x3f

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    :cond_d5
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_e8

    .line 305
    const/16 v4, 0x23

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    :cond_e8
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;
    :try_end_ef
    .catch Ljava/net/URISyntaxException; {:try_start_8e .. :try_end_ef} :catch_f2

    move-result-object p0

    goto/16 :goto_6

    .line 308
    .end local v1    # "ref":Ljava/net/URI;
    .end local v2    # "scheme":Ljava/lang/String;
    .end local v3    # "auth":Ljava/lang/String;
    .end local v13    # "normalized":Ljava/lang/StringBuilder;
    :catch_f2
    move-exception v8

    .line 309
    .local v8, "e":Ljava/net/URISyntaxException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static resolve(Ljava/net/URI;Ljava/lang/String;)Ljava/net/URI;
    .registers 3
    .param p0, "baseURI"    # Ljava/net/URI;
    .param p1, "reference"    # Ljava/lang/String;

    .prologue
    .line 207
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/http/client/utils/URIUtils;->resolve(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public static resolve(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;
    .registers 9
    .param p0, "baseURI"    # Ljava/net/URI;
    .param p1, "reference"    # Ljava/net/URI;

    .prologue
    const/4 v5, 0x0

    .line 219
    const-string v6, "Base URI"

    invoke-static {p0, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 220
    const-string v6, "Reference URI"

    invoke-static {p1, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 221
    move-object v1, p1

    .line 222
    .local v1, "ref":Ljava/net/URI;
    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v4

    .line 223
    .local v4, "s":Ljava/lang/String;
    const-string v6, "?"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1d

    .line 224
    invoke-static {p0, v1}, Lorg/apache/http/client/utils/URIUtils;->resolveReferenceStartingWithQueryString(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;

    move-result-object v5

    .line 236
    :goto_1c
    return-object v5

    .line 226
    :cond_1d
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_49

    const/4 v0, 0x1

    .line 227
    .local v0, "emptyReference":Z
    :goto_24
    if-eqz v0, :cond_2c

    .line 228
    const-string v6, "#"

    invoke-static {v6}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    .line 230
    :cond_2c
    invoke-virtual {p0, v1}, Ljava/net/URI;->resolve(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v2

    .line 231
    .local v2, "resolved":Ljava/net/URI;
    if-eqz v0, :cond_44

    .line 232
    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    .line 233
    .local v3, "resolvedString":Ljava/lang/String;
    const/16 v6, 0x23

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    .line 236
    .end local v3    # "resolvedString":Ljava/lang/String;
    :cond_44
    invoke-static {v2}, Lorg/apache/http/client/utils/URIUtils;->normalizeSyntax(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v5

    goto :goto_1c

    .end local v0    # "emptyReference":Z
    .end local v2    # "resolved":Ljava/net/URI;
    :cond_49
    move v0, v5

    .line 226
    goto :goto_24
.end method

.method public static resolve(Ljava/net/URI;Lorg/apache/http/HttpHost;Ljava/util/List;)Ljava/net/URI;
    .registers 7
    .param p0, "originalURI"    # Ljava/net/URI;
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Lorg/apache/http/HttpHost;",
            "Ljava/util/List",
            "<",
            "Ljava/net/URI;",
            ">;)",
            "Ljava/net/URI;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 395
    .local p2, "redirects":Ljava/util/List;, "Ljava/util/List<Ljava/net/URI;>;"
    const-string v3, "Request URI"

    invoke-static {p0, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 397
    if-eqz p2, :cond_d

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_41

    .line 398
    :cond_d
    new-instance v2, Lorg/apache/http/client/utils/URIBuilder;

    invoke-direct {v2, p0}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 409
    .local v2, "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    :goto_12
    invoke-virtual {v2}, Lorg/apache/http/client/utils/URIBuilder;->getFragment()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1f

    .line 410
    invoke-virtual {p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 413
    :cond_1f
    if-eqz p1, :cond_3c

    invoke-virtual {v2}, Lorg/apache/http/client/utils/URIBuilder;->isAbsolute()Z

    move-result v3

    if-nez v3, :cond_3c

    .line 414
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;->setScheme(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 415
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 416
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;->setPort(I)Lorg/apache/http/client/utils/URIBuilder;

    .line 418
    :cond_3c
    invoke-virtual {v2}, Lorg/apache/http/client/utils/URIBuilder;->build()Ljava/net/URI;

    move-result-object v3

    return-object v3

    .line 400
    .end local v2    # "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    :cond_41
    new-instance v2, Lorg/apache/http/client/utils/URIBuilder;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URI;

    invoke-direct {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 401
    .restart local v2    # "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    invoke-virtual {v2}, Lorg/apache/http/client/utils/URIBuilder;->getFragment()Ljava/lang/String;

    move-result-object v0

    .line 403
    .local v0, "frag":Ljava/lang/String;
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_5c
    if-nez v0, :cond_6d

    if-ltz v1, :cond_6d

    .line 404
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URI;

    invoke-virtual {v3}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v0

    .line 403
    add-int/lit8 v1, v1, -0x1

    goto :goto_5c

    .line 406
    :cond_6d
    invoke-virtual {v2, v0}, Lorg/apache/http/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    goto :goto_12
.end method

.method private static resolveReferenceStartingWithQueryString(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;
    .registers 6
    .param p0, "baseURI"    # Ljava/net/URI;
    .param p1, "reference"    # Ljava/net/URI;

    .prologue
    const/16 v3, 0x3f

    .line 248
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, "baseUri":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-le v1, v2, :cond_16

    const/4 v1, 0x0

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 251
    :cond_16
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    return-object v1
.end method

.method public static rewriteURI(Ljava/net/URI;)Ljava/net/URI;
    .registers 5
    .param p0, "uri"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 180
    const-string v1, "URI"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 181
    invoke-virtual {p0}, Ljava/net/URI;->isOpaque()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 195
    .end local p0    # "uri":Ljava/net/URI;
    :goto_c
    return-object p0

    .line 184
    .restart local p0    # "uri":Ljava/net/URI;
    :cond_d
    new-instance v0, Lorg/apache/http/client/utils/URIBuilder;

    invoke-direct {v0, p0}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 185
    .local v0, "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getUserInfo()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1b

    .line 186
    invoke-virtual {v0, v3}, Lorg/apache/http/client/utils/URIBuilder;->setUserInfo(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 188
    :cond_1b
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 189
    const-string v1, "/"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setPath(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 191
    :cond_2a
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3d

    .line 192
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getHost()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 194
    :cond_3d
    invoke-virtual {v0, v3}, Lorg/apache/http/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 195
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->build()Ljava/net/URI;

    move-result-object p0

    goto :goto_c
.end method

.method public static rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;)Ljava/net/URI;
    .registers 3
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 165
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public static rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;
    .registers 6
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "dropFragment"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 134
    const-string v1, "URI"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 135
    invoke-virtual {p0}, Ljava/net/URI;->isOpaque()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 154
    .end local p0    # "uri":Ljava/net/URI;
    :goto_c
    return-object p0

    .line 138
    .restart local p0    # "uri":Ljava/net/URI;
    :cond_d
    new-instance v0, Lorg/apache/http/client/utils/URIBuilder;

    invoke-direct {v0, p0}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 139
    .local v0, "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    if-eqz p1, :cond_42

    .line 140
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setScheme(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 141
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 142
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setPort(I)Lorg/apache/http/client/utils/URIBuilder;

    .line 148
    :goto_29
    if-eqz p2, :cond_2e

    .line 149
    invoke-virtual {v0, v2}, Lorg/apache/http/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 151
    :cond_2e
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 152
    const-string v1, "/"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setPath(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 154
    :cond_3d
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->build()Ljava/net/URI;

    move-result-object p0

    goto :goto_c

    .line 144
    :cond_42
    invoke-virtual {v0, v2}, Lorg/apache/http/client/utils/URIBuilder;->setScheme(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 145
    invoke-virtual {v0, v2}, Lorg/apache/http/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 146
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setPort(I)Lorg/apache/http/client/utils/URIBuilder;

    goto :goto_29
.end method
