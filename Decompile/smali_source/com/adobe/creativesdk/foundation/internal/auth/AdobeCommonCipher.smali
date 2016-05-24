.class final Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;
.super Ljava/lang/Object;
.source "AdobeCommonCipher.java"


# static fields
.field private static instance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;


# instance fields
.field private decryptionCipher:Ljavax/crypto/Cipher;

.field private encryptionCipher:Ljavax/crypto/Cipher;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->instance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    return-void
.end method

.method public constructor <init>([B)V
    .registers 5
    .param p1, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    const-string v1, "AES"

    invoke-direct {v0, p1, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 41
    .local v0, "secretKeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const-string v1, "AES"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->encryptionCipher:Ljavax/crypto/Cipher;

    .line 42
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->encryptionCipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 43
    const-string v1, "AES"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->decryptionCipher:Ljavax/crypto/Cipher;

    .line 44
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->decryptionCipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 46
    return-void
.end method

.method static createInstance([B)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;
    .registers 2
    .param p0, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 55
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->instance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    if-nez v0, :cond_b

    .line 56
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;-><init>([B)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->instance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    .line 58
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->instance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    return-object v0
.end method


# virtual methods
.method decrypt(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 90
    const/4 v1, 0x0

    .line 91
    .local v1, "decryptedVal":Ljava/lang/String;
    if-eqz p1, :cond_1c

    .line 94
    :try_start_3
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->decryptionCipher:Ljavax/crypto/Cipher;

    const-string v5, "UTF-8"

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    const/4 v6, 0x2

    invoke-static {v5, v6}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    .line 95
    .local v0, "decodedBytes":[B
    new-instance v2, Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-direct {v2, v0, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_1b} :catch_1d

    .end local v1    # "decryptedVal":Ljava/lang/String;
    .local v2, "decryptedVal":Ljava/lang/String;
    move-object v1, v2

    .line 100
    .end local v0    # "decodedBytes":[B
    .end local v2    # "decryptedVal":Ljava/lang/String;
    .restart local v1    # "decryptedVal":Ljava/lang/String;
    :cond_1c
    :goto_1c
    return-object v1

    .line 96
    :catch_1d
    move-exception v3

    .line 97
    .local v3, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Decryption error"

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c
.end method

.method encrypt(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 69
    const/4 v2, 0x0

    .line 70
    .local v2, "encryptedVal":Ljava/lang/String;
    if-eqz p1, :cond_1c

    .line 73
    :try_start_3
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->encryptionCipher:Ljavax/crypto/Cipher;

    const-string v5, "UTF-8"

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 74
    .local v1, "encodedBytes":[B
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x2

    invoke-static {v1, v4}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_1b} :catch_1d

    .end local v2    # "encryptedVal":Ljava/lang/String;
    .local v3, "encryptedVal":Ljava/lang/String;
    move-object v2, v3

    .line 79
    .end local v1    # "encodedBytes":[B
    .end local v3    # "encryptedVal":Ljava/lang/String;
    .restart local v2    # "encryptedVal":Ljava/lang/String;
    :cond_1c
    :goto_1c
    return-object v2

    .line 75
    :catch_1d
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Encryption error"

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c
.end method
