.class public Lcom/adobe/creativesdk/aviary/internal/cds/util/Security;
.super Ljava/lang/Object;
.source "Security.java"


# direct methods
.method public static generatePublicKey(Ljava/lang/String;)Ljava/security/PublicKey;
    .registers 6
    .param p0, "encodedPublicKey"    # Ljava/lang/String;

    .prologue
    .line 75
    :try_start_0
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 76
    .local v0, "decodedKey":[B
    const-string v3, "RSA"

    invoke-static {v3}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v2

    .line 77
    .local v2, "keyFactory":Ljava/security/KeyFactory;
    new-instance v3, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v3, v0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v2, v3}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;
    :try_end_12
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_12} :catch_14
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_12} :catch_1b
    .catch Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException; {:try_start_0 .. :try_end_12} :catch_29

    move-result-object v3

    return-object v3

    .line 78
    .end local v0    # "decodedKey":[B
    .end local v2    # "keyFactory":Ljava/security/KeyFactory;
    :catch_14
    move-exception v1

    .line 79
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 80
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1b
    move-exception v1

    .line 81
    .local v1, "e":Ljava/security/spec/InvalidKeySpecException;
    const-string v3, "IABUtil/Security"

    const-string v4, "Invalid key specification."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 83
    .end local v1    # "e":Ljava/security/spec/InvalidKeySpecException;
    :catch_29
    move-exception v1

    .line 84
    .local v1, "e":Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;
    const-string v3, "IABUtil/Security"

    const-string v4, "Base64 decoding failed."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static verify(Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p0, "publicKey"    # Ljava/security/PublicKey;
    .param p1, "signedData"    # Ljava/lang/String;
    .param p2, "signature"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 101
    :try_start_1
    const-string v3, "SHA1withRSA"

    invoke-static {v3}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v1

    .line 102
    .local v1, "sig":Ljava/security/Signature;
    invoke-virtual {v1, p0}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 103
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/Signature;->update([B)V

    .line 104
    invoke-static {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/Signature;->verify([B)Z

    move-result v3

    if-nez v3, :cond_23

    .line 105
    const-string v3, "IABUtil/Security"

    const-string v4, "Signature verification failed."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_22
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_22} :catch_25
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_22} :catch_2e
    .catch Ljava/security/SignatureException; {:try_start_1 .. :try_end_22} :catch_37
    .catch Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException; {:try_start_1 .. :try_end_22} :catch_40

    .line 118
    .end local v1    # "sig":Ljava/security/Signature;
    :goto_22
    return v2

    .line 108
    .restart local v1    # "sig":Ljava/security/Signature;
    :cond_23
    const/4 v2, 0x1

    goto :goto_22

    .line 109
    .end local v1    # "sig":Ljava/security/Signature;
    :catch_25
    move-exception v0

    .line 110
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    const-string v3, "IABUtil/Security"

    const-string v4, "NoSuchAlgorithmException."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_22

    .line 111
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_2e
    move-exception v0

    .line 112
    .local v0, "e":Ljava/security/InvalidKeyException;
    const-string v3, "IABUtil/Security"

    const-string v4, "Invalid key specification."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_22

    .line 113
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :catch_37
    move-exception v0

    .line 114
    .local v0, "e":Ljava/security/SignatureException;
    const-string v3, "IABUtil/Security"

    const-string v4, "Signature exception."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_22

    .line 115
    .end local v0    # "e":Ljava/security/SignatureException;
    :catch_40
    move-exception v0

    .line 116
    .local v0, "e":Lcom/adobe/creativesdk/aviary/internal/cds/util/Base64DecoderException;
    const-string v3, "IABUtil/Security"

    const-string v4, "Base64 decoding failed."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_22
.end method

.method public static verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p0, "base64PublicKey"    # Ljava/lang/String;
    .param p1, "signedData"    # Ljava/lang/String;
    .param p2, "signature"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_12

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_12

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 58
    :cond_12
    const-string v1, "IABUtil/Security"

    const-string v2, "Purchase verification failed: missing data."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    const/4 v1, 0x0

    .line 63
    :goto_1a
    return v1

    .line 62
    :cond_1b
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Security;->generatePublicKey(Ljava/lang/String;)Ljava/security/PublicKey;

    move-result-object v0

    .line 63
    .local v0, "key":Ljava/security/PublicKey;
    invoke-static {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Security;->verify(Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_1a
.end method
