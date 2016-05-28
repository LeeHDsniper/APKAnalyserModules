.class public Lcom/adobe/creativesdk/foundation/internal/utils/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public static bytesToHexString([B)Ljava/lang/String;
    .registers 9
    .param p0, "bytes"    # [B

    .prologue
    const/4 v3, 0x0

    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .local v1, "stringBuilder":Ljava/lang/StringBuilder;
    array-length v4, p0

    move v2, v3

    :goto_8
    if-ge v2, v4, :cond_23

    aget-byte v0, p0, v2

    .line 32
    .local v0, "b":B
    const-string v5, "%02x"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    and-int/lit16 v7, v0, 0xff

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 34
    .end local v0    # "b":B
    :cond_23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static convertByteArrayToString([B)Ljava/lang/String;
    .registers 4
    .param p0, "bytes"    # [B

    .prologue
    .line 39
    :try_start_0
    new-instance v0, Ljava/lang/String;

    const/4 v1, 0x2

    invoke-static {p0, v1}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_d

    .line 43
    :goto_c
    return-object v0

    .line 41
    :catch_d
    move-exception v0

    .line 43
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public static convertStringToByteArray(Ljava/lang/String;)[B
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 48
    const/4 v0, 0x2

    :try_start_1
    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_6

    move-result-object v0

    .line 52
    :goto_5
    return-object v0

    .line 50
    :catch_6
    move-exception v0

    .line 52
    const/4 v0, 0x0

    goto :goto_5
.end method
