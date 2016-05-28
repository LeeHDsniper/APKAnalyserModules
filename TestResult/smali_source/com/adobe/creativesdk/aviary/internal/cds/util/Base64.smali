.class public final Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final ALPHABET:[B

.field private static final DECODABET:[B

.field private static final WEBSAFE_ALPHABET:[B

.field private static final WEBSAFE_DECODABET:[B


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/16 v2, 0x80

    const/16 v1, 0x40

    .line 52
    new-array v0, v1, [B

    fill-array-data v0, :array_22

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->ALPHABET:[B

    .line 64
    new-array v0, v1, [B

    fill-array-data v0, :array_46

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->WEBSAFE_ALPHABET:[B

    .line 77
    new-array v0, v2, [B

    fill-array-data v0, :array_6a

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->DECODABET:[B

    .line 111
    new-array v0, v2, [B

    fill-array-data v0, :array_ae

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->WEBSAFE_DECODABET:[B

    return-void

    .line 52
    nop

    :array_22
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    .line 64
    :array_46
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data

    .line 77
    :array_6a
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    .line 111
    :array_ae
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data
.end method

.method public static decode(Ljava/lang/String;)[B
    .registers 4
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;
        }
    .end annotation

    .prologue
    .line 387
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 388
    .local v0, "bytes":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->decode([BII)[B

    move-result-object v1

    return-object v1
.end method

.method public static decode([BII)[B
    .registers 4
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;
        }
    .end annotation

    .prologue
    .line 440
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->DECODABET:[B

    invoke-static {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->decode([BII[B)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode([BII[B)[B
    .registers 20
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "decodabet"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;
        }
    .end annotation

    .prologue
    .line 469
    mul-int/lit8 v13, p2, 0x3

    div-int/lit8 v7, v13, 0x4

    .line 470
    .local v7, "len34":I
    add-int/lit8 v13, v7, 0x2

    new-array v9, v13, [B

    .line 471
    .local v9, "outBuff":[B
    const/4 v10, 0x0

    .line 473
    .local v10, "outBuffPosn":I
    const/4 v13, 0x4

    new-array v1, v13, [B

    .line 474
    .local v1, "b4":[B
    const/4 v2, 0x0

    .line 475
    .local v2, "b4Posn":I
    const/4 v5, 0x0

    .line 476
    .local v5, "i":I
    const/4 v11, 0x0

    .line 477
    .local v11, "sbiCrop":B
    const/4 v12, 0x0

    .line 478
    .local v12, "sbiDecode":B
    const/4 v5, 0x0

    move v3, v2

    .end local v2    # "b4Posn":I
    .local v3, "b4Posn":I
    :goto_12
    move/from16 v0, p2

    if-ge v5, v0, :cond_c9

    .line 479
    add-int v13, v5, p1

    aget-byte v13, p0, v13

    and-int/lit8 v13, v13, 0x7f

    int-to-byte v11, v13

    .line 480
    aget-byte v12, p3, v11

    .line 482
    const/4 v13, -0x5

    if-lt v12, v13, :cond_9c

    .line 483
    const/4 v13, -0x1

    if-lt v12, v13, :cond_101

    .line 486
    const/16 v13, 0x3d

    if-ne v11, v13, :cond_87

    .line 487
    sub-int v4, p2, v5

    .line 488
    .local v4, "bytesLeft":I
    add-int/lit8 v13, p2, -0x1

    add-int v13, v13, p1

    aget-byte v13, p0, v13

    and-int/lit8 v13, v13, 0x7f

    int-to-byte v6, v13

    .line 489
    .local v6, "lastByte":B
    if-eqz v3, :cond_39

    const/4 v13, 0x1

    if-ne v3, v13, :cond_52

    .line 490
    :cond_39
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "invalid padding byte \'=\' at byte offset "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 491
    :cond_52
    const/4 v13, 0x3

    if-ne v3, v13, :cond_58

    const/4 v13, 0x2

    if-gt v4, v13, :cond_5e

    :cond_58
    const/4 v13, 0x4

    if-ne v3, v13, :cond_77

    const/4 v13, 0x1

    if-le v4, v13, :cond_77

    .line 492
    :cond_5e
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "padding byte \'=\' falsely signals end of encoded value at offset "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 494
    :cond_77
    const/16 v13, 0x3d

    if-eq v6, v13, :cond_c9

    const/16 v13, 0xa

    if-eq v6, v13, :cond_c9

    .line 495
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;

    const-string v14, "encoded value has invalid trailing byte"

    invoke-direct {v13, v14}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 500
    .end local v4    # "bytesLeft":I
    .end local v6    # "lastByte":B
    :cond_87
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "b4Posn":I
    .restart local v2    # "b4Posn":I
    aput-byte v11, v1, v3

    .line 501
    const/4 v13, 0x4

    if-ne v2, v13, :cond_97

    .line 502
    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-static {v1, v13, v9, v10, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->decode4to3([BI[BI[B)I

    move-result v13

    add-int/2addr v10, v13

    .line 503
    const/4 v2, 0x0

    .line 478
    :cond_97
    :goto_97
    add-int/lit8 v5, v5, 0x1

    move v3, v2

    .end local v2    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    goto/16 :goto_12

    .line 507
    :cond_9c
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Bad Base64 input character at "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ": "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    add-int v15, v5, p1

    aget-byte v15, p0, v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "(decimal)"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 517
    :cond_c9
    if-eqz v3, :cond_ff

    .line 518
    const/4 v13, 0x1

    if-ne v3, v13, :cond_e9

    .line 519
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "single trailing character at offset "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    add-int/lit8 v15, p2, -0x1

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 521
    :cond_e9
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "b4Posn":I
    .restart local v2    # "b4Posn":I
    const/16 v13, 0x3d

    aput-byte v13, v1, v3

    .line 522
    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-static {v1, v13, v9, v10, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->decode4to3([BI[BI[B)I

    move-result v13

    add-int/2addr v10, v13

    .line 525
    :goto_f7
    new-array v8, v10, [B

    .line 526
    .local v8, "out":[B
    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static {v9, v13, v8, v14, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 527
    return-object v8

    .end local v2    # "b4Posn":I
    .end local v8    # "out":[B
    .restart local v3    # "b4Posn":I
    :cond_ff
    move v2, v3

    .end local v3    # "b4Posn":I
    .restart local v2    # "b4Posn":I
    goto :goto_f7

    .end local v2    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    :cond_101
    move v2, v3

    .end local v3    # "b4Posn":I
    .restart local v2    # "b4Posn":I
    goto :goto_97
.end method

.method private static decode4to3([BI[BI[B)I
    .registers 8
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "destination"    # [B
    .param p3, "destOffset"    # I
    .param p4, "decodabet"    # [B

    .prologue
    const/16 v2, 0x3d

    .line 354
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    if-ne v1, v2, :cond_23

    .line 355
    aget-byte v1, p0, p1

    aget-byte v1, p4, v1

    shl-int/lit8 v1, v1, 0x18

    ushr-int/lit8 v1, v1, 0x6

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v2, p4, v2

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0xc

    or-int v0, v1, v2

    .line 357
    .local v0, "outBuff":I
    ushr-int/lit8 v1, v0, 0x10

    int-to-byte v1, v1

    aput-byte v1, p2, p3

    .line 358
    const/4 v1, 0x1

    .line 375
    :goto_22
    return v1

    .line 359
    .end local v0    # "outBuff":I
    :cond_23
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    if-ne v1, v2, :cond_56

    .line 361
    aget-byte v1, p0, p1

    aget-byte v1, p4, v1

    shl-int/lit8 v1, v1, 0x18

    ushr-int/lit8 v1, v1, 0x6

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v2, p4, v2

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    aget-byte v2, p4, v2

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0x12

    or-int v0, v1, v2

    .line 364
    .restart local v0    # "outBuff":I
    ushr-int/lit8 v1, v0, 0x10

    int-to-byte v1, v1

    aput-byte v1, p2, p3

    .line 365
    add-int/lit8 v1, p3, 0x1

    ushr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    aput-byte v2, p2, v1

    .line 366
    const/4 v1, 0x2

    goto :goto_22

    .line 369
    .end local v0    # "outBuff":I
    :cond_56
    aget-byte v1, p0, p1

    aget-byte v1, p4, v1

    shl-int/lit8 v1, v1, 0x18

    ushr-int/lit8 v1, v1, 0x6

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v2, p4, v2

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    aget-byte v2, p4, v2

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0x12

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    aget-byte v2, p4, v2

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0x18

    or-int v0, v1, v2

    .line 372
    .restart local v0    # "outBuff":I
    shr-int/lit8 v1, v0, 0x10

    int-to-byte v1, v1

    aput-byte v1, p2, p3

    .line 373
    add-int/lit8 v1, p3, 0x1

    shr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    aput-byte v2, p2, v1

    .line 374
    add-int/lit8 v1, p3, 0x2

    int-to-byte v2, v0

    aput-byte v2, p2, v1

    .line 375
    const/4 v1, 0x3

    goto :goto_22
.end method
