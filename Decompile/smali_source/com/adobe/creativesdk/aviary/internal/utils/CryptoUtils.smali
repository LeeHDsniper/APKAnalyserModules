.class public final Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils;
.super Ljava/lang/Object;
.source "CryptoUtils.java"


# static fields
.field private static final SIGNATURE_PARAMS_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils$1;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils$1;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils;->SIGNATURE_PARAMS_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method public static addSignature(Ljava/util/List;Ljava/lang/String;)V
    .registers 10
    .param p1, "secret"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils;->SIGNATURE_PARAMS_COMPARATOR:Ljava/util/Comparator;

    invoke-static {p0, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 42
    const-string v6, "utf-8"

    invoke-static {p0, v6}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 46
    .local v5, "string":Ljava/lang/String;
    :try_start_b
    const-string v6, "SHA-256"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_10
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_b .. :try_end_10} :catch_43

    move-result-object v3

    .line 52
    .local v3, "md":Ljava/security/MessageDigest;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_48

    .end local p1    # "secret":Ljava/lang/String;
    :goto_20
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 57
    .local v4, "query":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/security/MessageDigest;->update([B)V

    .line 58
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 60
    .local v0, "bytes":[B
    const/4 v6, 0x2

    invoke-static {v0, v6}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, "hash":Ljava/lang/String;
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v7, "signature"

    invoke-direct {v6, v7, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .end local v0    # "bytes":[B
    .end local v2    # "hash":Ljava/lang/String;
    .end local v3    # "md":Ljava/security/MessageDigest;
    .end local v4    # "query":Ljava/lang/String;
    :goto_42
    return-void

    .line 47
    .restart local p1    # "secret":Ljava/lang/String;
    :catch_43
    move-exception v1

    .line 48
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_42

    .line 52
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v3    # "md":Ljava/security/MessageDigest;
    :cond_48
    const-string p1, ""

    goto :goto_20
.end method
