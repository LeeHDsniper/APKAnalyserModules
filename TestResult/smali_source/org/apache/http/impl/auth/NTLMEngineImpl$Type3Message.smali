.class Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;
.super Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;
.source "NTLMEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/auth/NTLMEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Type3Message"
.end annotation


# instance fields
.field protected domainBytes:[B

.field protected hostBytes:[B

.field protected lmResp:[B

.field protected ntResp:[B

.field protected sessionKey:[B

.field protected type2Flags:I

.field protected userBytes:[B


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BILjava/lang/String;[B)V
    .registers 20
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "nonce"    # [B
    .param p6, "type2Flags"    # I
    .param p7, "target"    # Ljava/lang/String;
    .param p8, "targetInformation"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 1169
    invoke-direct {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;-><init>()V

    .line 1171
    move/from16 v0, p6

    iput v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    .line 1174
    # invokes: Lorg/apache/http/impl/auth/NTLMEngineImpl;->convertHost(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1176
    .local v9, "unqualifiedHost":Ljava/lang/String;
    # invokes: Lorg/apache/http/impl/auth/NTLMEngineImpl;->convertDomain(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1500(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1179
    .local v2, "unqualifiedDomain":Ljava/lang/String;
    new-instance v1, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    invoke-direct/range {v1 .. v7}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B)V

    .line 1187
    .local v1, "gen":Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;
    const/high16 v3, 0x800000

    and-int v3, v3, p6

    if-eqz v3, :cond_78

    if-eqz p8, :cond_78

    if-eqz p7, :cond_78

    .line 1190
    :try_start_26
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMv2Response()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    .line 1191
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMv2Response()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    .line 1192
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_73

    .line 1193
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLanManagerSessionKey()[B
    :try_end_3b
    .catch Lorg/apache/http/impl/auth/NTLMEngineException; {:try_start_26 .. :try_end_3b} :catch_b6

    move-result-object v10

    .line 1226
    .local v10, "userSessionKey":[B
    :goto_3c
    and-int/lit8 v3, p6, 0x10

    if-eqz v3, :cond_d8

    .line 1227
    const/high16 v3, 0x40000000

    and-int v3, v3, p6

    if-eqz v3, :cond_d4

    .line 1228
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getSecondaryKey()[B

    move-result-object v3

    invoke-static {v3, v10}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->RC4([B[B)[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    .line 1236
    :goto_50
    if-eqz v9, :cond_dd

    :try_start_52
    const-string v3, "UnicodeLittleUnmarked"

    invoke-virtual {v9, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    :goto_58
    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->hostBytes:[B

    .line 1238
    if-eqz v2, :cond_e0

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "UnicodeLittleUnmarked"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    :goto_68
    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->domainBytes:[B

    .line 1240
    const-string v3, "UnicodeLittleUnmarked"

    invoke-virtual {p3, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->userBytes:[B
    :try_end_72
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_52 .. :try_end_72} :catch_e2

    .line 1244
    return-void

    .line 1195
    .end local v10    # "userSessionKey":[B
    :cond_73
    :try_start_73
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMv2UserSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_3c

    .line 1198
    .end local v10    # "userSessionKey":[B
    :cond_78
    const/high16 v3, 0x80000

    and-int v3, v3, p6

    if-eqz v3, :cond_9a

    .line 1200
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLM2SessionResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    .line 1201
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLM2SessionResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    .line 1202
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_95

    .line 1203
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLanManagerSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_3c

    .line 1205
    .end local v10    # "userSessionKey":[B
    :cond_95
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLM2SessionResponseUserSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_3c

    .line 1207
    .end local v10    # "userSessionKey":[B
    :cond_9a
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    .line 1208
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    .line 1209
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_b1

    .line 1210
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLanManagerSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_3c

    .line 1212
    .end local v10    # "userSessionKey":[B
    :cond_b1
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getNTLMUserSessionKey()[B
    :try_end_b4
    .catch Lorg/apache/http/impl/auth/NTLMEngineException; {:try_start_73 .. :try_end_b4} :catch_b6

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto :goto_3c

    .line 1215
    .end local v10    # "userSessionKey":[B
    :catch_b6
    move-exception v8

    .line 1218
    .local v8, "e":Lorg/apache/http/impl/auth/NTLMEngineException;
    const/4 v3, 0x0

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    .line 1219
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMResponse()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    .line 1220
    move/from16 v0, p6

    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_ce

    .line 1221
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLanManagerSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto/16 :goto_3c

    .line 1223
    .end local v10    # "userSessionKey":[B
    :cond_ce
    invoke-virtual {v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$CipherGen;->getLMUserSessionKey()[B

    move-result-object v10

    .restart local v10    # "userSessionKey":[B
    goto/16 :goto_3c

    .line 1230
    .end local v8    # "e":Lorg/apache/http/impl/auth/NTLMEngineException;
    :cond_d4
    iput-object v10, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    goto/16 :goto_50

    .line 1232
    :cond_d8
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    goto/16 :goto_50

    .line 1236
    :cond_dd
    const/4 v3, 0x0

    goto/16 :goto_58

    .line 1238
    :cond_e0
    const/4 v3, 0x0

    goto :goto_68

    .line 1241
    :catch_e2
    move-exception v8

    .line 1242
    .local v8, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lorg/apache/http/impl/auth/NTLMEngineException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unicode not supported: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v8}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v8}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method getResponse()Ljava/lang/String;
    .registers 18

    .prologue
    .line 1249
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    array-length v8, v14

    .line 1250
    .local v8, "ntRespLen":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    array-length v6, v14

    .line 1252
    .local v6, "lmRespLen":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->domainBytes:[B

    if-eqz v14, :cond_15e

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->domainBytes:[B

    array-length v1, v14

    .line 1253
    .local v1, "domainLen":I
    :goto_15
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->hostBytes:[B

    if-eqz v14, :cond_161

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->hostBytes:[B

    array-length v4, v14

    .line 1254
    .local v4, "hostLen":I
    :goto_20
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->userBytes:[B

    array-length v12, v14

    .line 1256
    .local v12, "userLen":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    if-eqz v14, :cond_164

    .line 1257
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    array-length v10, v14

    .line 1262
    .local v10, "sessionKeyLen":I
    :goto_30
    const/16 v7, 0x48

    .line 1263
    .local v7, "lmRespOffset":I
    add-int/lit8 v9, v6, 0x48

    .line 1264
    .local v9, "ntRespOffset":I
    add-int v2, v9, v8

    .line 1265
    .local v2, "domainOffset":I
    add-int v13, v2, v1

    .line 1266
    .local v13, "userOffset":I
    add-int v5, v13, v12

    .line 1267
    .local v5, "hostOffset":I
    add-int v11, v5, v4

    .line 1268
    .local v11, "sessionKeyOffset":I
    add-int v3, v11, v10

    .line 1271
    .local v3, "finalLength":I
    const/4 v14, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->prepareResponse(II)V

    .line 1274
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1275
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1278
    const/16 v14, 0x48

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1281
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1282
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1285
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1288
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1289
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1292
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1295
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1296
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1299
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1302
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1303
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1306
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1309
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1310
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1313
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1316
    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit16 v14, v14, 0x80

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit16 v15, v15, 0x200

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, 0x80000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    const/high16 v15, 0x2000000

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const v16, 0x8000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x20

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x10

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, 0x20000000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, -0x80000000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, 0x40000000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    const/high16 v16, 0x800000

    and-int v15, v15, v16

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x1

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->type2Flags:I

    and-int/lit8 v15, v15, 0x4

    or-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1344
    const/16 v14, 0x105

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1346
    const/16 v14, 0xa28

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addULong(I)V

    .line 1348
    const/16 v14, 0xf00

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addUShort(I)V

    .line 1351
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->lmResp:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1352
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->ntResp:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1353
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->domainBytes:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1354
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->userBytes:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1355
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->hostBytes:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1356
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    if-eqz v14, :cond_159

    .line 1357
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->sessionKey:[B

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type3Message;->addBytes([B)V

    .line 1359
    :cond_159
    invoke-super/range {p0 .. p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->getResponse()Ljava/lang/String;

    move-result-object v14

    return-object v14

    .line 1252
    .end local v1    # "domainLen":I
    .end local v2    # "domainOffset":I
    .end local v3    # "finalLength":I
    .end local v4    # "hostLen":I
    .end local v5    # "hostOffset":I
    .end local v7    # "lmRespOffset":I
    .end local v9    # "ntRespOffset":I
    .end local v10    # "sessionKeyLen":I
    .end local v11    # "sessionKeyOffset":I
    .end local v12    # "userLen":I
    .end local v13    # "userOffset":I
    :cond_15e
    const/4 v1, 0x0

    goto/16 :goto_15

    .line 1253
    .restart local v1    # "domainLen":I
    :cond_161
    const/4 v4, 0x0

    goto/16 :goto_20

    .line 1259
    .restart local v4    # "hostLen":I
    .restart local v12    # "userLen":I
    :cond_164
    const/4 v10, 0x0

    .restart local v10    # "sessionKeyLen":I
    goto/16 :goto_30
.end method
