.class Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;
.super Ljava/lang/Object;
.source "NTLMEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/auth/NTLMEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HMACMD5"
.end annotation


# instance fields
.field protected ipad:[B

.field protected md5:Ljava/security/MessageDigest;

.field protected opad:[B


# direct methods
.method constructor <init>([B)V
    .registers 9
    .param p1, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x40

    .line 1562
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1563
    move-object v2, p1

    .line 1565
    .local v2, "key":[B
    :try_start_6
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_e} :catch_3d

    .line 1574
    new-array v4, v6, [B

    iput-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->ipad:[B

    .line 1575
    new-array v4, v6, [B

    iput-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->opad:[B

    .line 1577
    array-length v3, v2

    .line 1578
    .local v3, "keyLength":I
    if-le v3, v6, :cond_25

    .line 1580
    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v4, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 1581
    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 1582
    array-length v3, v2

    .line 1584
    :cond_25
    const/4 v1, 0x0

    .line 1585
    .local v1, "i":I
    :goto_26
    if-ge v1, v3, :cond_5b

    .line 1586
    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->ipad:[B

    aget-byte v5, v2, v1

    xor-int/lit8 v5, v5, 0x36

    int-to-byte v5, v5

    aput-byte v5, v4, v1

    .line 1587
    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->opad:[B

    aget-byte v5, v2, v1

    xor-int/lit8 v5, v5, 0x5c

    int-to-byte v5, v5

    aput-byte v5, v4, v1

    .line 1588
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 1566
    .end local v1    # "i":I
    .end local v3    # "keyLength":I
    :catch_3d
    move-exception v0

    .line 1569
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v4, Lorg/apache/http/impl/auth/NTLMEngineException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error getting md5 message digest implementation: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 1590
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v1    # "i":I
    .restart local v3    # "keyLength":I
    :cond_5b
    :goto_5b
    if-ge v1, v6, :cond_6c

    .line 1591
    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->ipad:[B

    const/16 v5, 0x36

    aput-byte v5, v4, v1

    .line 1592
    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->opad:[B

    const/16 v5, 0x5c

    aput-byte v5, v4, v1

    .line 1593
    add-int/lit8 v1, v1, 0x1

    goto :goto_5b

    .line 1597
    :cond_6c
    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v4}, Ljava/security/MessageDigest;->reset()V

    .line 1598
    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;

    iget-object v5, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->ipad:[B

    invoke-virtual {v4, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 1600
    return-void
.end method


# virtual methods
.method getOutput()[B
    .registers 4

    .prologue
    .line 1604
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 1605
    .local v0, "digest":[B
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;

    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->opad:[B

    invoke-virtual {v1, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 1606
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v1, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    return-object v1
.end method

.method update([B)V
    .registers 3
    .param p1, "input"    # [B

    .prologue
    .line 1611
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 1612
    return-void
.end method

.method update([BII)V
    .registers 5
    .param p1, "input"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 1616
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    .line 1617
    return-void
.end method
