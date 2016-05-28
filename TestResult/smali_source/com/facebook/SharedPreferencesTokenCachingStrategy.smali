.class public Lcom/facebook/SharedPreferencesTokenCachingStrategy;
.super Lcom/facebook/TokenCachingStrategy;
.source "SharedPreferencesTokenCachingStrategy.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private cache:Landroid/content/SharedPreferences;

.field private cacheKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    const-class v0, Lcom/facebook/SharedPreferencesTokenCachingStrategy;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->TAG:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/facebook/SharedPreferencesTokenCachingStrategy;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cacheKey"    # Ljava/lang/String;

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/facebook/TokenCachingStrategy;-><init>()V

    .line 104
    const-string v1, "context"

    invoke-static {p1, v1}, Lcom/facebook/internal/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 106
    invoke-static {p2}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    const-string p2, "com.facebook.SharedPreferencesTokenCachingStrategy.DEFAULT_KEY"

    .end local p2    # "cacheKey":Ljava/lang/String;
    :cond_10
    iput-object p2, p0, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->cacheKey:Ljava/lang/String;

    .line 111
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 112
    .local v0, "applicationContext":Landroid/content/Context;
    if-eqz v0, :cond_19

    move-object p1, v0

    .line 115
    :cond_19
    iget-object v1, p0, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->cacheKey:Ljava/lang/String;

    .line 116
    const/4 v2, 0x0

    .line 114
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->cache:Landroid/content/SharedPreferences;

    .line 117
    return-void
.end method

.method private deserializeKey(Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 23
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 296
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->cache:Landroid/content/SharedPreferences;

    move-object/from16 v17, v0

    const-string v18, "{}"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 297
    .local v12, "jsonString":Ljava/lang/String;
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10, v12}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 299
    .local v10, "json":Lorg/json/JSONObject;
    const-string v17, "valueType"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 301
    .local v16, "valueType":Ljava/lang/String;
    const-string v17, "bool"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_39

    .line 302
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v17

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 402
    :cond_38
    :goto_38
    return-void

    .line 303
    :cond_39
    const-string v17, "bool[]"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6a

    .line 304
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 305
    .local v11, "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    new-array v4, v0, [Z

    .line 306
    .local v4, "array":[Z
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_52
    array-length v0, v4

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v9, v0, :cond_61

    .line 309
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putBooleanArray(Ljava/lang/String;[Z)V

    goto :goto_38

    .line 307
    :cond_61
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v17

    aput-boolean v17, v4, v9

    .line 306
    add-int/lit8 v9, v9, 0x1

    goto :goto_52

    .line 310
    .end local v4    # "array":[Z
    .end local v9    # "i":I
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    :cond_6a
    const-string v17, "byte"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_89

    .line 311
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    int-to-byte v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putByte(Ljava/lang/String;B)V

    goto :goto_38

    .line 312
    :cond_89
    const-string v17, "byte[]"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_bf

    .line 313
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 314
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    new-array v4, v0, [B

    .line 315
    .local v4, "array":[B
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_a2
    array-length v0, v4

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v9, v0, :cond_b1

    .line 318
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    goto :goto_38

    .line 316
    :cond_b1
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->getInt(I)I

    move-result v17

    move/from16 v0, v17

    int-to-byte v0, v0

    move/from16 v17, v0

    aput-byte v17, v4, v9

    .line 315
    add-int/lit8 v9, v9, 0x1

    goto :goto_a2

    .line 319
    .end local v4    # "array":[B
    .end local v9    # "i":I
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    :cond_bf
    const-string v17, "short"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_df

    .line 320
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    int-to-short v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putShort(Ljava/lang/String;S)V

    goto/16 :goto_38

    .line 321
    :cond_df
    const-string v17, "short[]"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_116

    .line 322
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 323
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    new-array v4, v0, [S

    .line 324
    .local v4, "array":[S
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_f8
    array-length v0, v4

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v9, v0, :cond_108

    .line 327
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putShortArray(Ljava/lang/String;[S)V

    goto/16 :goto_38

    .line 325
    :cond_108
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->getInt(I)I

    move-result v17

    move/from16 v0, v17

    int-to-short v0, v0

    move/from16 v17, v0

    aput-short v17, v4, v9

    .line 324
    add-int/lit8 v9, v9, 0x1

    goto :goto_f8

    .line 328
    .end local v4    # "array":[S
    .end local v9    # "i":I
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    :cond_116
    const-string v17, "int"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_131

    .line 329
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v17

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_38

    .line 330
    :cond_131
    const-string v17, "int[]"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_163

    .line 331
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 332
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    new-array v4, v0, [I

    .line 333
    .local v4, "array":[I
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_14a
    array-length v0, v4

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v9, v0, :cond_15a

    .line 336
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    goto/16 :goto_38

    .line 334
    :cond_15a
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->getInt(I)I

    move-result v17

    aput v17, v4, v9

    .line 333
    add-int/lit8 v9, v9, 0x1

    goto :goto_14a

    .line 337
    .end local v4    # "array":[I
    .end local v9    # "i":I
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    :cond_163
    const-string v17, "long"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_17e

    .line 338
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v18

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move-wide/from16 v2, v18

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_38

    .line 339
    :cond_17e
    const-string v17, "long[]"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1b0

    .line 340
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 341
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    new-array v4, v0, [J

    .line 342
    .local v4, "array":[J
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_197
    array-length v0, v4

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v9, v0, :cond_1a7

    .line 345
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    goto/16 :goto_38

    .line 343
    :cond_1a7
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v18

    aput-wide v18, v4, v9

    .line 342
    add-int/lit8 v9, v9, 0x1

    goto :goto_197

    .line 346
    .end local v4    # "array":[J
    .end local v9    # "i":I
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    :cond_1b0
    const-string v17, "float"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1d0

    .line 347
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-float v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    goto/16 :goto_38

    .line 348
    :cond_1d0
    const-string v17, "float[]"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_207

    .line 349
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 350
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    new-array v4, v0, [F

    .line 351
    .local v4, "array":[F
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_1e9
    array-length v0, v4

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v9, v0, :cond_1f9

    .line 354
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    goto/16 :goto_38

    .line 352
    :cond_1f9
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-float v0, v0

    move/from16 v17, v0

    aput v17, v4, v9

    .line 351
    add-int/lit8 v9, v9, 0x1

    goto :goto_1e9

    .line 355
    .end local v4    # "array":[F
    .end local v9    # "i":I
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    :cond_207
    const-string v17, "double"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_222

    .line 356
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v18

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move-wide/from16 v2, v18

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    goto/16 :goto_38

    .line 357
    :cond_222
    const-string v17, "double[]"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_254

    .line 358
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 359
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    new-array v4, v0, [D

    .line 360
    .local v4, "array":[D
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_23b
    array-length v0, v4

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v9, v0, :cond_24b

    .line 363
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putDoubleArray(Ljava/lang/String;[D)V

    goto/16 :goto_38

    .line 361
    :cond_24b
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v18

    aput-wide v18, v4, v9

    .line 360
    add-int/lit8 v9, v9, 0x1

    goto :goto_23b

    .line 364
    .end local v4    # "array":[D
    .end local v9    # "i":I
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    :cond_254
    const-string v17, "char"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_285

    .line 365
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 366
    .local v5, "charString":Ljava/lang/String;
    if-eqz v5, :cond_38

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_38

    .line 367
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/String;->charAt(I)C

    move-result v17

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putChar(Ljava/lang/String;C)V

    goto/16 :goto_38

    .line 369
    .end local v5    # "charString":Ljava/lang/String;
    :cond_285
    const-string v17, "char[]"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2cd

    .line 370
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 371
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    new-array v4, v0, [C

    .line 372
    .local v4, "array":[C
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_29e
    array-length v0, v4

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v9, v0, :cond_2ae

    .line 378
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->putCharArray(Ljava/lang/String;[C)V

    goto/16 :goto_38

    .line 373
    :cond_2ae
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 374
    .restart local v5    # "charString":Ljava/lang/String;
    if-eqz v5, :cond_2ca

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_2ca

    .line 375
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/String;->charAt(I)C

    move-result v17

    aput-char v17, v4, v9

    .line 372
    :cond_2ca
    add-int/lit8 v9, v9, 0x1

    goto :goto_29e

    .line 379
    .end local v4    # "array":[C
    .end local v5    # "charString":Ljava/lang/String;
    .end local v9    # "i":I
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    :cond_2cd
    const-string v17, "string"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2e8

    .line 380
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_38

    .line 381
    :cond_2e8
    const-string v17, "stringList"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_321

    .line 382
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 383
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v14

    .line 384
    .local v14, "numStrings":I
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15, v14}, Ljava/util/ArrayList;-><init>(I)V

    .line 385
    .local v15, "stringList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_302
    if-lt v9, v14, :cond_30d

    .line 389
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v15}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto/16 :goto_38

    .line 386
    :cond_30d
    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    .line 387
    .local v13, "jsonStringValue":Ljava/lang/Object;
    sget-object v17, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    move-object/from16 v0, v17

    if-ne v13, v0, :cond_31e

    const/4 v13, 0x0

    .end local v13    # "jsonStringValue":Ljava/lang/Object;
    :goto_318
    invoke-virtual {v15, v9, v13}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 385
    add-int/lit8 v9, v9, 0x1

    goto :goto_302

    .line 387
    .restart local v13    # "jsonStringValue":Ljava/lang/Object;
    :cond_31e
    check-cast v13, Ljava/lang/String;

    goto :goto_318

    .line 390
    .end local v9    # "i":I
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    .end local v13    # "jsonStringValue":Ljava/lang/Object;
    .end local v14    # "numStrings":I
    .end local v15    # "stringList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_321
    const-string v17, "enum"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_38

    .line 392
    :try_start_329
    const-string v17, "enumType"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 394
    .local v7, "enumType":Ljava/lang/String;
    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 396
    .local v6, "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Enum;>;"
    const-string v17, "value"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v6, v0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v8

    .line 397
    .local v8, "enumValue":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v8}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V
    :try_end_34a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_329 .. :try_end_34a} :catch_34c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_329 .. :try_end_34a} :catch_34f

    goto/16 :goto_38

    .line 398
    .end local v6    # "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Enum;>;"
    .end local v7    # "enumType":Ljava/lang/String;
    .end local v8    # "enumValue":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    :catch_34c
    move-exception v17

    goto/16 :goto_38

    .line 399
    :catch_34f
    move-exception v17

    goto/16 :goto_38
.end method

.method private serializeKey(Ljava/lang/String;Landroid/os/Bundle;Landroid/content/SharedPreferences$Editor;)V
    .registers 16
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bundle"    # Landroid/os/Bundle;
    .param p3, "editor"    # Landroid/content/SharedPreferences$Editor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 182
    invoke-virtual {p2, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 183
    .local v5, "value":Ljava/lang/Object;
    if-nez v5, :cond_8

    .line 292
    .end local v5    # "value":Ljava/lang/Object;
    :cond_7
    :goto_7
    return-void

    .line 188
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_8
    const/4 v4, 0x0

    .line 189
    .local v4, "supportedType":Ljava/lang/String;
    const/4 v1, 0x0

    .line 190
    .local v1, "jsonArray":Lorg/json/JSONArray;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 192
    .local v0, "json":Lorg/json/JSONObject;
    instance-of v9, v5, Ljava/lang/Byte;

    if-eqz v9, :cond_36

    .line 193
    const-string v4, "byte"

    .line 194
    const-string v8, "value"

    check-cast v5, Ljava/lang/Byte;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Byte;->intValue()I

    move-result v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 281
    :cond_20
    :goto_20
    if-eqz v4, :cond_7

    .line 282
    const-string v8, "valueType"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 283
    if-eqz v1, :cond_2e

    .line 286
    const-string v8, "value"

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 289
    :cond_2e
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    .line 290
    .local v2, "jsonString":Ljava/lang/String;
    invoke-interface {p3, p1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_7

    .line 195
    .end local v2    # "jsonString":Ljava/lang/String;
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_36
    instance-of v9, v5, Ljava/lang/Short;

    if-eqz v9, :cond_48

    .line 196
    const-string v4, "short"

    .line 197
    const-string v8, "value"

    check-cast v5, Ljava/lang/Short;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Short;->intValue()I

    move-result v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_20

    .line 198
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_48
    instance-of v9, v5, Ljava/lang/Integer;

    if-eqz v9, :cond_5a

    .line 199
    const-string v4, "int"

    .line 200
    const-string v8, "value"

    check-cast v5, Ljava/lang/Integer;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_20

    .line 201
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_5a
    instance-of v9, v5, Ljava/lang/Long;

    if-eqz v9, :cond_6c

    .line 202
    const-string v4, "long"

    .line 203
    const-string v8, "value"

    check-cast v5, Ljava/lang/Long;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    invoke-virtual {v0, v8, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_20

    .line 204
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_6c
    instance-of v9, v5, Ljava/lang/Float;

    if-eqz v9, :cond_7e

    .line 205
    const-string v4, "float"

    .line 206
    const-string v8, "value"

    check-cast v5, Ljava/lang/Float;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Float;->doubleValue()D

    move-result-wide v10

    invoke-virtual {v0, v8, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_20

    .line 207
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_7e
    instance-of v9, v5, Ljava/lang/Double;

    if-eqz v9, :cond_90

    .line 208
    const-string v4, "double"

    .line 209
    const-string v8, "value"

    check-cast v5, Ljava/lang/Double;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    invoke-virtual {v0, v8, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_20

    .line 210
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_90
    instance-of v9, v5, Ljava/lang/Boolean;

    if-eqz v9, :cond_a3

    .line 211
    const-string v4, "bool"

    .line 212
    const-string v8, "value"

    check-cast v5, Ljava/lang/Boolean;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    goto/16 :goto_20

    .line 213
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_a3
    instance-of v9, v5, Ljava/lang/Character;

    if-eqz v9, :cond_b4

    .line 214
    const-string v4, "char"

    .line 215
    const-string v8, "value"

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_20

    .line 216
    :cond_b4
    instance-of v9, v5, Ljava/lang/String;

    if-eqz v9, :cond_c3

    .line 217
    const-string v4, "string"

    .line 218
    const-string v8, "value"

    check-cast v5, Ljava/lang/String;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v0, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_20

    .line 219
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_c3
    instance-of v9, v5, Ljava/lang/Enum;

    if-eqz v9, :cond_e1

    .line 220
    const-string v4, "enum"

    .line 221
    const-string v8, "value"

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 222
    const-string v8, "enumType"

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_20

    .line 226
    :cond_e1
    new-instance v1, Lorg/json/JSONArray;

    .end local v1    # "jsonArray":Lorg/json/JSONArray;
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 227
    .restart local v1    # "jsonArray":Lorg/json/JSONArray;
    instance-of v9, v5, [B

    if-eqz v9, :cond_f9

    .line 228
    const-string v4, "byte[]"

    .line 229
    check-cast v5, [B

    .end local v5    # "value":Ljava/lang/Object;
    array-length v9, v5

    :goto_ef
    if-ge v8, v9, :cond_20

    aget-byte v6, v5, v8

    .line 230
    .local v6, "v":B
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 229
    add-int/lit8 v8, v8, 0x1

    goto :goto_ef

    .line 232
    .end local v6    # "v":B
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_f9
    instance-of v9, v5, [S

    if-eqz v9, :cond_10c

    .line 233
    const-string v4, "short[]"

    .line 234
    check-cast v5, [S

    .end local v5    # "value":Ljava/lang/Object;
    array-length v9, v5

    :goto_102
    if-ge v8, v9, :cond_20

    aget-short v6, v5, v8

    .line 235
    .local v6, "v":S
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 234
    add-int/lit8 v8, v8, 0x1

    goto :goto_102

    .line 237
    .end local v6    # "v":S
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_10c
    instance-of v9, v5, [I

    if-eqz v9, :cond_11f

    .line 238
    const-string v4, "int[]"

    .line 239
    check-cast v5, [I

    .end local v5    # "value":Ljava/lang/Object;
    array-length v9, v5

    :goto_115
    if-ge v8, v9, :cond_20

    aget v6, v5, v8

    .line 240
    .local v6, "v":I
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 239
    add-int/lit8 v8, v8, 0x1

    goto :goto_115

    .line 242
    .end local v6    # "v":I
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_11f
    instance-of v9, v5, [J

    if-eqz v9, :cond_132

    .line 243
    const-string v4, "long[]"

    .line 244
    check-cast v5, [J

    .end local v5    # "value":Ljava/lang/Object;
    array-length v9, v5

    :goto_128
    if-ge v8, v9, :cond_20

    aget-wide v6, v5, v8

    .line 245
    .local v6, "v":J
    invoke-virtual {v1, v6, v7}, Lorg/json/JSONArray;->put(J)Lorg/json/JSONArray;

    .line 244
    add-int/lit8 v8, v8, 0x1

    goto :goto_128

    .line 247
    .end local v6    # "v":J
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_132
    instance-of v9, v5, [F

    if-eqz v9, :cond_146

    .line 248
    const-string v4, "float[]"

    .line 249
    check-cast v5, [F

    .end local v5    # "value":Ljava/lang/Object;
    array-length v9, v5

    :goto_13b
    if-ge v8, v9, :cond_20

    aget v6, v5, v8

    .line 250
    .local v6, "v":F
    float-to-double v10, v6

    invoke-virtual {v1, v10, v11}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 249
    add-int/lit8 v8, v8, 0x1

    goto :goto_13b

    .line 252
    .end local v6    # "v":F
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_146
    instance-of v9, v5, [D

    if-eqz v9, :cond_159

    .line 253
    const-string v4, "double[]"

    .line 254
    check-cast v5, [D

    .end local v5    # "value":Ljava/lang/Object;
    array-length v9, v5

    :goto_14f
    if-ge v8, v9, :cond_20

    aget-wide v6, v5, v8

    .line 255
    .local v6, "v":D
    invoke-virtual {v1, v6, v7}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 254
    add-int/lit8 v8, v8, 0x1

    goto :goto_14f

    .line 257
    .end local v6    # "v":D
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_159
    instance-of v9, v5, [Z

    if-eqz v9, :cond_16c

    .line 258
    const-string v4, "bool[]"

    .line 259
    check-cast v5, [Z

    .end local v5    # "value":Ljava/lang/Object;
    array-length v9, v5

    :goto_162
    if-ge v8, v9, :cond_20

    aget-boolean v6, v5, v8

    .line 260
    .local v6, "v":Z
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 259
    add-int/lit8 v8, v8, 0x1

    goto :goto_162

    .line 262
    .end local v6    # "v":Z
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_16c
    instance-of v9, v5, [C

    if-eqz v9, :cond_183

    .line 263
    const-string v4, "char[]"

    .line 264
    check-cast v5, [C

    .end local v5    # "value":Ljava/lang/Object;
    array-length v9, v5

    :goto_175
    if-ge v8, v9, :cond_20

    aget-char v6, v5, v8

    .line 265
    .local v6, "v":C
    invoke-static {v6}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 264
    add-int/lit8 v8, v8, 0x1

    goto :goto_175

    .line 267
    .end local v6    # "v":C
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_183
    instance-of v8, v5, Ljava/util/List;

    if-eqz v8, :cond_1a4

    .line 268
    const-string v4, "stringList"

    move-object v3, v5

    .line 270
    check-cast v3, Ljava/util/List;

    .line 271
    .local v3, "stringList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_190
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_20

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 272
    .local v6, "v":Ljava/lang/String;
    if-nez v6, :cond_1a0

    sget-object v6, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .end local v6    # "v":Ljava/lang/String;
    :cond_1a0
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_190

    .line 277
    .end local v3    # "stringList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1a4
    const/4 v1, 0x0

    goto/16 :goto_20
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 177
    iget-object v0, p0, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->cache:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 178
    return-void
.end method

.method public load()Landroid/os/Bundle;
    .registers 10

    .prologue
    .line 125
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 127
    .local v3, "settings":Landroid/os/Bundle;
    iget-object v4, p0, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->cache:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 129
    .local v0, "allCachedEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_13
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1a

    .line 140
    .end local v3    # "settings":Landroid/os/Bundle;
    :goto_19
    return-object v3

    .line 129
    .restart local v3    # "settings":Landroid/os/Bundle;
    :cond_1a
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 131
    .local v2, "key":Ljava/lang/String;
    :try_start_20
    invoke-direct {p0, v2, v3}, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->deserializeKey(Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_23
    .catch Lorg/json/JSONException; {:try_start_20 .. :try_end_23} :catch_24

    goto :goto_13

    .line 132
    :catch_24
    move-exception v1

    .line 134
    .local v1, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    const/4 v5, 0x5

    sget-object v6, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->TAG:Ljava/lang/String;

    .line 135
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Error reading cached value for key: \'"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\' -- "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 134
    invoke-static {v4, v5, v6, v7}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V

    .line 136
    const/4 v3, 0x0

    goto :goto_19
.end method

.method public save(Landroid/os/Bundle;)V
    .registers 11
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x5

    .line 151
    const-string v4, "bundle"

    invoke-static {p1, v4}, Lcom/facebook/internal/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 153
    iget-object v4, p0, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->cache:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 155
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_14
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2a

    .line 167
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v3

    .line 168
    .local v3, "successfulCommit":Z
    if-nez v3, :cond_29

    .line 169
    sget-object v4, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    sget-object v5, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->TAG:Ljava/lang/String;

    const-string v6, "SharedPreferences.Editor.commit() was not successful"

    invoke-static {v4, v8, v5, v6}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V

    .line 171
    .end local v3    # "successfulCommit":Z
    :cond_29
    :goto_29
    return-void

    .line 155
    :cond_2a
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 157
    .local v2, "key":Ljava/lang/String;
    :try_start_30
    invoke-direct {p0, v2, p1, v1}, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->serializeKey(Ljava/lang/String;Landroid/os/Bundle;Landroid/content/SharedPreferences$Editor;)V
    :try_end_33
    .catch Lorg/json/JSONException; {:try_start_30 .. :try_end_33} :catch_34

    goto :goto_14

    .line 158
    :catch_34
    move-exception v0

    .line 160
    .local v0, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    sget-object v5, Lcom/facebook/SharedPreferencesTokenCachingStrategy;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Error processing value for key: \'"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\' -- "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v8, v5, v6}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_29
.end method
