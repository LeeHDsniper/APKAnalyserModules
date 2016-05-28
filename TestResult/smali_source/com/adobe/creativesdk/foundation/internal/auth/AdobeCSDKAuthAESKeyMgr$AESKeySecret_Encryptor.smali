.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;
.super Ljava/lang/Object;
.source "AdobeCSDKAuthAESKeyMgr.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AESKeySecret_Encryptor"
.end annotation


# instance fields
.field private _app_privateRSAKey:Ljava/security/PrivateKey;

.field private _app_publicRSAKey:Ljava/security/PublicKey;

.field private _isRunningAPI_18_Above:Z

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;)V
    .registers 3

    .prologue
    .line 203
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 208
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_isRunningAPI_18_Above:Z

    .line 210
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_isRunningAPI_18_Above:Z

    if-nez v0, :cond_d

    .line 214
    :goto_c
    return-void

    .line 213
    :cond_d
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->initializeRSAKeyPairs()V

    goto :goto_c
.end method

.method private deCryptUsingPrivateKey([B)[B
    .registers 6
    .param p1, "inData"    # [B

    .prologue
    .line 280
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->getRSACipher()Ljavax/crypto/Cipher;

    move-result-object v0

    .line 282
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v2, 0x2

    :try_start_5
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_app_privateRSAKey:Ljava/security/PrivateKey;

    invoke-virtual {v0, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 283
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_d} :catch_f

    move-result-object v2

    return-object v2

    .line 285
    :catch_f
    move-exception v1

    .line 286
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 287
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Auth Foundation : Auth AESKeyMgr : Failed to decyrpt using private key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private encryptUsingPublicKey([B)[B
    .registers 6
    .param p1, "inData"    # [B

    .prologue
    .line 268
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->getRSACipher()Ljavax/crypto/Cipher;

    move-result-object v0

    .line 270
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v2, 0x1

    :try_start_5
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_app_publicRSAKey:Ljava/security/PublicKey;

    invoke-virtual {v0, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 271
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_d} :catch_f

    move-result-object v2

    return-object v2

    .line 273
    :catch_f
    move-exception v1

    .line 274
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 275
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Auth Foundation : Auth AESKeyMgr : Failed to encrypt using public key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private generateAppRSAPublicPrivateKeys()V
    .registers 14
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 310
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 311
    .local v1, "cal":Ljava/util/Calendar;
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v6

    .line 313
    .local v6, "now":Ljava/util/Date;
    const/16 v7, 0x19

    invoke-virtual {v1, v8, v7}, Ljava/util/Calendar;->add(II)V

    .line 314
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    .line 317
    .local v3, "end":Ljava/util/Date;
    :try_start_12
    const-string v7, "RSA"

    const-string v8, "AndroidKeyStore"

    invoke-static {v7, v8}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v4

    .line 318
    .local v4, "generator":Ljava/security/KeyPairGenerator;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 321
    .local v0, "appContext":Landroid/content/Context;
    new-instance v7, Landroid/security/KeyPairGeneratorSpec$Builder;

    invoke-direct {v7, v0}, Landroid/security/KeyPairGeneratorSpec$Builder;-><init>(Landroid/content/Context;)V

    const-string v8, "adb_auth_foundation_rsa_keypair_alias"

    .line 323
    invoke-virtual {v7, v8}, Landroid/security/KeyPairGeneratorSpec$Builder;->setAlias(Ljava/lang/String;)Landroid/security/KeyPairGeneratorSpec$Builder;

    move-result-object v7

    .line 324
    invoke-virtual {v7, v6}, Landroid/security/KeyPairGeneratorSpec$Builder;->setStartDate(Ljava/util/Date;)Landroid/security/KeyPairGeneratorSpec$Builder;

    move-result-object v7

    .line 325
    invoke-virtual {v7, v3}, Landroid/security/KeyPairGeneratorSpec$Builder;->setEndDate(Ljava/util/Date;)Landroid/security/KeyPairGeneratorSpec$Builder;

    move-result-object v7

    const-wide/16 v8, 0x1

    .line 326
    invoke-static {v8, v9}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/security/KeyPairGeneratorSpec$Builder;->setSerialNumber(Ljava/math/BigInteger;)Landroid/security/KeyPairGeneratorSpec$Builder;

    move-result-object v7

    new-instance v8, Ljavax/security/auth/x500/X500Principal;

    const-string v9, "CN=%s, OU=%s"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "adb_auth_foundation_rsa_keypair_alias"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    .line 328
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v12

    iget-object v12, v12, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    aput-object v12, v10, v11

    .line 327
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljavax/security/auth/x500/X500Principal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Landroid/security/KeyPairGeneratorSpec$Builder;->setSubject(Ljavax/security/auth/x500/X500Principal;)Landroid/security/KeyPairGeneratorSpec$Builder;

    move-result-object v5

    .line 330
    .local v5, "keyPairGeneratorBuilder":Landroid/security/KeyPairGeneratorSpec$Builder;
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x13

    if-lt v7, v8, :cond_6a

    .line 331
    const/16 v7, 0x800

    invoke-virtual {v5, v7}, Landroid/security/KeyPairGeneratorSpec$Builder;->setKeySize(I)Landroid/security/KeyPairGeneratorSpec$Builder;

    .line 334
    :cond_6a
    invoke-virtual {v5}, Landroid/security/KeyPairGeneratorSpec$Builder;->build()Landroid/security/KeyPairGeneratorSpec;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/security/KeyPairGenerator;->initialize(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 335
    invoke-virtual {v4}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_74} :catch_75

    .line 341
    return-void

    .line 337
    .end local v0    # "appContext":Landroid/content/Context;
    .end local v4    # "generator":Ljava/security/KeyPairGenerator;
    .end local v5    # "keyPairGeneratorBuilder":Landroid/security/KeyPairGeneratorSpec$Builder;
    :catch_75
    move-exception v2

    .line 338
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 339
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "Failed to generate RSA Public Private Key pair"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method private getRSACipher()Ljavax/crypto/Cipher;
    .registers 4

    .prologue
    .line 259
    :try_start_0
    const-string v1, "RSA/ECB/PKCS1Padding"

    const-string v2, "AndroidOpenSSL"

    invoke-static {v1, v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/Cipher;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 261
    :catch_9
    move-exception v0

    .line 262
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 263
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Auth Foundation : Auth AESKeyMgr : Failed to create Cipher"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private initializePublicPrivateKeys()V
    .registers 7

    .prologue
    .line 217
    const/4 v2, 0x0

    .line 219
    .local v2, "keyStore":Ljava/security/KeyStore;
    :try_start_1
    const-string v3, "AndroidKeyStore"

    invoke-static {v3}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v2

    .line 220
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 221
    const-string v3, "adb_auth_foundation_rsa_keypair_alias"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/security/KeyStore;->getEntry(Ljava/lang/String;Ljava/security/KeyStore$ProtectionParameter;)Ljava/security/KeyStore$Entry;

    move-result-object v1

    check-cast v1, Ljava/security/KeyStore$PrivateKeyEntry;

    .line 222
    .local v1, "entry":Ljava/security/KeyStore$PrivateKeyEntry;
    invoke-virtual {v1}, Ljava/security/KeyStore$PrivateKeyEntry;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_app_privateRSAKey:Ljava/security/PrivateKey;

    .line 223
    invoke-virtual {v1}, Ljava/security/KeyStore$PrivateKeyEntry;->getCertificate()Ljava/security/cert/Certificate;

    move-result-object v3

    invoke-virtual {v3}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_app_publicRSAKey:Ljava/security/PublicKey;
    :try_end_24
    .catch Ljava/security/KeyStoreException; {:try_start_1 .. :try_end_24} :catch_25
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_24} :catch_36
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_24} :catch_47
    .catch Ljava/security/UnrecoverableEntryException; {:try_start_1 .. :try_end_24} :catch_58
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_24} :catch_69

    .line 236
    .end local v1    # "entry":Ljava/security/KeyStore$PrivateKeyEntry;
    :goto_24
    return-void

    .line 224
    :catch_25
    move-exception v0

    .line 225
    .local v0, "e":Ljava/security/KeyStoreException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/security/KeyStoreException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    .line 226
    .end local v0    # "e":Ljava/security/KeyStoreException;
    :catch_36
    move-exception v0

    .line 227
    .local v0, "e":Ljava/security/cert/CertificateException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/security/cert/CertificateException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    .line 228
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    :catch_47
    move-exception v0

    .line 229
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    .line 230
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_58
    move-exception v0

    .line 231
    .local v0, "e":Ljava/security/UnrecoverableEntryException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/security/UnrecoverableEntryException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    .line 232
    .end local v0    # "e":Ljava/security/UnrecoverableEntryException;
    :catch_69
    move-exception v0

    .line 233
    .local v0, "e":Ljava/io/IOException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_24
.end method

.method private initializeRSAKeyPairs()V
    .registers 5

    .prologue
    .line 240
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->initializePublicPrivateKeys()V

    .line 241
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_app_privateRSAKey:Ljava/security/PrivateKey;

    if-eqz v2, :cond_b

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_app_publicRSAKey:Ljava/security/PublicKey;

    if-nez v2, :cond_1e

    :cond_b
    const/4 v1, 0x1

    .line 243
    .local v1, "isKeyNotGenerated":Z
    :goto_c
    if-eqz v1, :cond_26

    .line 245
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->getAuthFoundation_Encrypted_AES_Key_fromPreference()Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->access$000(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;)Ljava/lang/String;

    move-result-object v0

    .line 246
    .local v0, "aes_key_str":Ljava/lang/String;
    if-eqz v0, :cond_20

    .line 247
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Auth Foundation :AESKeyMgr Failed to initialize Private keys - but already have a valid aes key stored !!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 241
    .end local v0    # "aes_key_str":Ljava/lang/String;
    .end local v1    # "isKeyNotGenerated":Z
    :cond_1e
    const/4 v1, 0x0

    goto :goto_c

    .line 250
    .restart local v0    # "aes_key_str":Ljava/lang/String;
    .restart local v1    # "isKeyNotGenerated":Z
    :cond_20
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->generateAppRSAPublicPrivateKeys()V

    .line 251
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->initializePublicPrivateKeys()V

    .line 254
    .end local v0    # "aes_key_str":Ljava/lang/String;
    :cond_26
    return-void
.end method


# virtual methods
.method public deCryptData([B)[B
    .registers 3
    .param p1, "encryptedData"    # [B

    .prologue
    .line 301
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_isRunningAPI_18_Above:Z

    if-nez v0, :cond_5

    .line 304
    .end local p1    # "encryptedData":[B
    :goto_4
    return-object p1

    .restart local p1    # "encryptedData":[B
    :cond_5
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->deCryptUsingPrivateKey([B)[B

    move-result-object p1

    goto :goto_4
.end method

.method public encyrptData([B)[B
    .registers 3
    .param p1, "inRawData"    # [B

    .prologue
    .line 293
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->_isRunningAPI_18_Above:Z

    if-nez v0, :cond_5

    .line 296
    .end local p1    # "inRawData":[B
    :goto_4
    return-object p1

    .restart local p1    # "inRawData":[B
    :cond_5
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr$AESKeySecret_Encryptor;->encryptUsingPublicKey([B)[B

    move-result-object p1

    goto :goto_4
.end method
