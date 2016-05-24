.class public final Lcom/squareup/okhttp/CacheControl;
.super Ljava/lang/Object;
.source "CacheControl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/CacheControl$1;,
        Lcom/squareup/okhttp/CacheControl$Builder;
    }
.end annotation


# static fields
.field public static final FORCE_CACHE:Lcom/squareup/okhttp/CacheControl;

.field public static final FORCE_NETWORK:Lcom/squareup/okhttp/CacheControl;


# instance fields
.field private final isPublic:Z

.field private final maxAgeSeconds:I

.field private final maxStaleSeconds:I

.field private final minFreshSeconds:I

.field private final mustRevalidate:Z

.field private final noCache:Z

.field private final noStore:Z

.field private final noTransform:Z

.field private final onlyIfCached:Z

.field private final sMaxAgeSeconds:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 20
    new-instance v0, Lcom/squareup/okhttp/CacheControl$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/CacheControl$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl$Builder;->noCache()Lcom/squareup/okhttp/CacheControl$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl$Builder;->build()Lcom/squareup/okhttp/CacheControl;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/CacheControl;->FORCE_NETWORK:Lcom/squareup/okhttp/CacheControl;

    .line 28
    new-instance v0, Lcom/squareup/okhttp/CacheControl$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/CacheControl$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl$Builder;->onlyIfCached()Lcom/squareup/okhttp/CacheControl$Builder;

    move-result-object v0

    const v1, 0x7fffffff

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2}, Lcom/squareup/okhttp/CacheControl$Builder;->maxStale(ILjava/util/concurrent/TimeUnit;)Lcom/squareup/okhttp/CacheControl$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl$Builder;->build()Lcom/squareup/okhttp/CacheControl;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/CacheControl;->FORCE_CACHE:Lcom/squareup/okhttp/CacheControl;

    return-void
.end method

.method private constructor <init>(Lcom/squareup/okhttp/CacheControl$Builder;)V
    .registers 4
    .param p1, "builder"    # Lcom/squareup/okhttp/CacheControl$Builder;

    .prologue
    const/4 v1, 0x0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iget-boolean v0, p1, Lcom/squareup/okhttp/CacheControl$Builder;->noCache:Z

    iput-boolean v0, p0, Lcom/squareup/okhttp/CacheControl;->noCache:Z

    .line 61
    iget-boolean v0, p1, Lcom/squareup/okhttp/CacheControl$Builder;->noStore:Z

    iput-boolean v0, p0, Lcom/squareup/okhttp/CacheControl;->noStore:Z

    .line 62
    iget v0, p1, Lcom/squareup/okhttp/CacheControl$Builder;->maxAgeSeconds:I

    iput v0, p0, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds:I

    .line 63
    const/4 v0, -0x1

    iput v0, p0, Lcom/squareup/okhttp/CacheControl;->sMaxAgeSeconds:I

    .line 64
    iput-boolean v1, p0, Lcom/squareup/okhttp/CacheControl;->isPublic:Z

    .line 65
    iput-boolean v1, p0, Lcom/squareup/okhttp/CacheControl;->mustRevalidate:Z

    .line 66
    iget v0, p1, Lcom/squareup/okhttp/CacheControl$Builder;->maxStaleSeconds:I

    iput v0, p0, Lcom/squareup/okhttp/CacheControl;->maxStaleSeconds:I

    .line 67
    iget v0, p1, Lcom/squareup/okhttp/CacheControl$Builder;->minFreshSeconds:I

    iput v0, p0, Lcom/squareup/okhttp/CacheControl;->minFreshSeconds:I

    .line 68
    iget-boolean v0, p1, Lcom/squareup/okhttp/CacheControl$Builder;->onlyIfCached:Z

    iput-boolean v0, p0, Lcom/squareup/okhttp/CacheControl;->onlyIfCached:Z

    .line 69
    iget-boolean v0, p1, Lcom/squareup/okhttp/CacheControl$Builder;->noTransform:Z

    iput-boolean v0, p0, Lcom/squareup/okhttp/CacheControl;->noTransform:Z

    .line 70
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/CacheControl$Builder;Lcom/squareup/okhttp/CacheControl$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/CacheControl$Builder;
    .param p2, "x1"    # Lcom/squareup/okhttp/CacheControl$1;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/CacheControl;-><init>(Lcom/squareup/okhttp/CacheControl$Builder;)V

    return-void
.end method

.method private constructor <init>(ZZIIZZIIZZ)V
    .registers 11
    .param p1, "noCache"    # Z
    .param p2, "noStore"    # Z
    .param p3, "maxAgeSeconds"    # I
    .param p4, "sMaxAgeSeconds"    # I
    .param p5, "isPublic"    # Z
    .param p6, "mustRevalidate"    # Z
    .param p7, "maxStaleSeconds"    # I
    .param p8, "minFreshSeconds"    # I
    .param p9, "onlyIfCached"    # Z
    .param p10, "noTransform"    # Z

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-boolean p1, p0, Lcom/squareup/okhttp/CacheControl;->noCache:Z

    .line 48
    iput-boolean p2, p0, Lcom/squareup/okhttp/CacheControl;->noStore:Z

    .line 49
    iput p3, p0, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds:I

    .line 50
    iput p4, p0, Lcom/squareup/okhttp/CacheControl;->sMaxAgeSeconds:I

    .line 51
    iput-boolean p5, p0, Lcom/squareup/okhttp/CacheControl;->isPublic:Z

    .line 52
    iput-boolean p6, p0, Lcom/squareup/okhttp/CacheControl;->mustRevalidate:Z

    .line 53
    iput p7, p0, Lcom/squareup/okhttp/CacheControl;->maxStaleSeconds:I

    .line 54
    iput p8, p0, Lcom/squareup/okhttp/CacheControl;->minFreshSeconds:I

    .line 55
    iput-boolean p9, p0, Lcom/squareup/okhttp/CacheControl;->onlyIfCached:Z

    .line 56
    iput-boolean p10, p0, Lcom/squareup/okhttp/CacheControl;->noTransform:Z

    .line 57
    return-void
.end method

.method public static parse(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/CacheControl;
    .registers 23
    .param p0, "headers"    # Lcom/squareup/okhttp/Headers;

    .prologue
    .line 142
    const/4 v4, 0x0

    .line 143
    .local v4, "noCache":Z
    const/4 v5, 0x0

    .line 144
    .local v5, "noStore":Z
    const/4 v6, -0x1

    .line 145
    .local v6, "maxAgeSeconds":I
    const/4 v7, -0x1

    .line 146
    .local v7, "sMaxAgeSeconds":I
    const/4 v8, 0x0

    .line 147
    .local v8, "isPublic":Z
    const/4 v9, 0x0

    .line 148
    .local v9, "mustRevalidate":Z
    const/4 v10, -0x1

    .line 149
    .local v10, "maxStaleSeconds":I
    const/4 v11, -0x1

    .line 150
    .local v11, "minFreshSeconds":I
    const/4 v12, 0x0

    .line 151
    .local v12, "onlyIfCached":Z
    const/4 v13, 0x0

    .line 153
    .local v13, "noTransform":Z
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_b
    invoke-virtual/range {p0 .. p0}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v3

    if-ge v15, v3, :cond_163

    .line 154
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    const-string v21, "Cache-Control"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_34

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    const-string v21, "Pragma"

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_34

    .line 153
    :cond_31
    add-int/lit8 v15, v15, 0x1

    goto :goto_b

    .line 159
    :cond_34
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v19

    .line 160
    .local v19, "string":Ljava/lang/String;
    const/16 v18, 0x0

    .line 161
    .local v18, "pos":I
    :cond_3c
    :goto_3c
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v3

    move/from16 v0, v18

    if-ge v0, v3, :cond_31

    .line 162
    move/from16 v20, v18

    .line 163
    .local v20, "tokenStart":I
    const-string v3, "=,;"

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-static {v0, v1, v3}, Lcom/squareup/okhttp/internal/http/HeaderParser;->skipUntil(Ljava/lang/String;ILjava/lang/String;)I

    move-result v18

    .line 164
    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 167
    .local v14, "directive":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v3

    move/from16 v0, v18

    if-eq v0, v3, :cond_82

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v21, 0x2c

    move/from16 v0, v21

    if-eq v3, v0, :cond_82

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v21, 0x3b

    move/from16 v0, v21

    if-ne v3, v0, :cond_90

    .line 168
    :cond_82
    add-int/lit8 v18, v18, 0x1

    .line 169
    const/16 v16, 0x0

    .line 190
    .local v16, "parameter":Ljava/lang/String;
    :goto_86
    const-string v3, "no-cache"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e6

    .line 191
    const/4 v4, 0x1

    goto :goto_3c

    .line 171
    .end local v16    # "parameter":Ljava/lang/String;
    :cond_90
    add-int/lit8 v18, v18, 0x1

    .line 172
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/http/HeaderParser;->skipWhitespace(Ljava/lang/String;I)I

    move-result v18

    .line 175
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v3

    move/from16 v0, v18

    if-ge v0, v3, :cond_cb

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v21, 0x22

    move/from16 v0, v21

    if-ne v3, v0, :cond_cb

    .line 176
    add-int/lit8 v18, v18, 0x1

    .line 177
    move/from16 v17, v18

    .line 178
    .local v17, "parameterStart":I
    const-string v3, "\""

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-static {v0, v1, v3}, Lcom/squareup/okhttp/internal/http/HeaderParser;->skipUntil(Ljava/lang/String;ILjava/lang/String;)I

    move-result v18

    .line 179
    move-object/from16 v0, v19

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 180
    .restart local v16    # "parameter":Ljava/lang/String;
    add-int/lit8 v18, v18, 0x1

    .line 183
    goto :goto_86

    .line 184
    .end local v16    # "parameter":Ljava/lang/String;
    .end local v17    # "parameterStart":I
    :cond_cb
    move/from16 v17, v18

    .line 185
    .restart local v17    # "parameterStart":I
    const-string v3, ",;"

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-static {v0, v1, v3}, Lcom/squareup/okhttp/internal/http/HeaderParser;->skipUntil(Ljava/lang/String;ILjava/lang/String;)I

    move-result v18

    .line 186
    move-object/from16 v0, v19

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v16

    .restart local v16    # "parameter":Ljava/lang/String;
    goto :goto_86

    .line 192
    .end local v17    # "parameterStart":I
    :cond_e6
    const-string v3, "no-store"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f1

    .line 193
    const/4 v5, 0x1

    goto/16 :goto_3c

    .line 194
    :cond_f1
    const-string v3, "max-age"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_102

    .line 195
    const/4 v3, -0x1

    move-object/from16 v0, v16

    invoke-static {v0, v3}, Lcom/squareup/okhttp/internal/http/HeaderParser;->parseSeconds(Ljava/lang/String;I)I

    move-result v6

    goto/16 :goto_3c

    .line 196
    :cond_102
    const-string v3, "s-maxage"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_113

    .line 197
    const/4 v3, -0x1

    move-object/from16 v0, v16

    invoke-static {v0, v3}, Lcom/squareup/okhttp/internal/http/HeaderParser;->parseSeconds(Ljava/lang/String;I)I

    move-result v7

    goto/16 :goto_3c

    .line 198
    :cond_113
    const-string v3, "public"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11e

    .line 199
    const/4 v8, 0x1

    goto/16 :goto_3c

    .line 200
    :cond_11e
    const-string v3, "must-revalidate"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_129

    .line 201
    const/4 v9, 0x1

    goto/16 :goto_3c

    .line 202
    :cond_129
    const-string v3, "max-stale"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_13c

    .line 203
    const v3, 0x7fffffff

    move-object/from16 v0, v16

    invoke-static {v0, v3}, Lcom/squareup/okhttp/internal/http/HeaderParser;->parseSeconds(Ljava/lang/String;I)I

    move-result v10

    goto/16 :goto_3c

    .line 204
    :cond_13c
    const-string v3, "min-fresh"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_14d

    .line 205
    const/4 v3, -0x1

    move-object/from16 v0, v16

    invoke-static {v0, v3}, Lcom/squareup/okhttp/internal/http/HeaderParser;->parseSeconds(Ljava/lang/String;I)I

    move-result v11

    goto/16 :goto_3c

    .line 206
    :cond_14d
    const-string v3, "only-if-cached"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_158

    .line 207
    const/4 v12, 0x1

    goto/16 :goto_3c

    .line 208
    :cond_158
    const-string v3, "no-transform"

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 209
    const/4 v13, 0x1

    goto/16 :goto_3c

    .line 214
    .end local v14    # "directive":Ljava/lang/String;
    .end local v16    # "parameter":Ljava/lang/String;
    .end local v18    # "pos":I
    .end local v19    # "string":Ljava/lang/String;
    .end local v20    # "tokenStart":I
    :cond_163
    new-instance v3, Lcom/squareup/okhttp/CacheControl;

    invoke-direct/range {v3 .. v13}, Lcom/squareup/okhttp/CacheControl;-><init>(ZZIIZZIIZZ)V

    return-object v3
.end method


# virtual methods
.method public maxAgeSeconds()I
    .registers 2

    .prologue
    .line 94
    iget v0, p0, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds:I

    return v0
.end method

.method public maxStaleSeconds()I
    .registers 2

    .prologue
    .line 115
    iget v0, p0, Lcom/squareup/okhttp/CacheControl;->maxStaleSeconds:I

    return v0
.end method

.method public minFreshSeconds()I
    .registers 2

    .prologue
    .line 119
    iget v0, p0, Lcom/squareup/okhttp/CacheControl;->minFreshSeconds:I

    return v0
.end method

.method public mustRevalidate()Z
    .registers 2

    .prologue
    .line 111
    iget-boolean v0, p0, Lcom/squareup/okhttp/CacheControl;->mustRevalidate:Z

    return v0
.end method

.method public noCache()Z
    .registers 2

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/squareup/okhttp/CacheControl;->noCache:Z

    return v0
.end method

.method public noStore()Z
    .registers 2

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/squareup/okhttp/CacheControl;->noStore:Z

    return v0
.end method

.method public onlyIfCached()Z
    .registers 2

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/squareup/okhttp/CacheControl;->onlyIfCached:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v3, -0x1

    .line 219
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 220
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-boolean v1, p0, Lcom/squareup/okhttp/CacheControl;->noCache:Z

    if-eqz v1, :cond_f

    const-string v1, "no-cache, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    :cond_f
    iget-boolean v1, p0, Lcom/squareup/okhttp/CacheControl;->noStore:Z

    if-eqz v1, :cond_18

    const-string v1, "no-store, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    :cond_18
    iget v1, p0, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds:I

    if-eq v1, v3, :cond_2d

    const-string v1, "max-age="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    :cond_2d
    iget v1, p0, Lcom/squareup/okhttp/CacheControl;->sMaxAgeSeconds:I

    if-eq v1, v3, :cond_42

    const-string v1, "s-maxage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/squareup/okhttp/CacheControl;->sMaxAgeSeconds:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    :cond_42
    iget-boolean v1, p0, Lcom/squareup/okhttp/CacheControl;->isPublic:Z

    if-eqz v1, :cond_4b

    const-string v1, "public, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    :cond_4b
    iget-boolean v1, p0, Lcom/squareup/okhttp/CacheControl;->mustRevalidate:Z

    if-eqz v1, :cond_54

    const-string v1, "must-revalidate, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    :cond_54
    iget v1, p0, Lcom/squareup/okhttp/CacheControl;->maxStaleSeconds:I

    if-eq v1, v3, :cond_69

    const-string v1, "max-stale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/squareup/okhttp/CacheControl;->maxStaleSeconds:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    :cond_69
    iget v1, p0, Lcom/squareup/okhttp/CacheControl;->minFreshSeconds:I

    if-eq v1, v3, :cond_7e

    const-string v1, "min-fresh="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/squareup/okhttp/CacheControl;->minFreshSeconds:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    :cond_7e
    iget-boolean v1, p0, Lcom/squareup/okhttp/CacheControl;->onlyIfCached:Z

    if-eqz v1, :cond_87

    const-string v1, "only-if-cached, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    :cond_87
    iget-boolean v1, p0, Lcom/squareup/okhttp/CacheControl;->noTransform:Z

    if-eqz v1, :cond_90

    const-string v1, "no-transform, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    :cond_90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-nez v1, :cond_99

    const-string v1, ""

    .line 232
    :goto_98
    return-object v1

    .line 231
    :cond_99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 232
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_98
.end method
