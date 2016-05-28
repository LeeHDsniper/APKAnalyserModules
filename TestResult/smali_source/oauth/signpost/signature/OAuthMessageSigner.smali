.class public abstract Loauth/signpost/signature/OAuthMessageSigner;
.super Ljava/lang/Object;
.source "OAuthMessageSigner.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x3db29529c4356102L


# instance fields
.field private transient base64:Lorg/apache/commons/codec/binary/Base64;

.field private consumerSecret:Ljava/lang/String;

.field private tokenSecret:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lorg/apache/commons/codec/binary/Base64;

    invoke-direct {v0}, Lorg/apache/commons/codec/binary/Base64;-><init>()V

    iput-object v0, p0, Loauth/signpost/signature/OAuthMessageSigner;->base64:Lorg/apache/commons/codec/binary/Base64;

    .line 38
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 72
    new-instance v0, Lorg/apache/commons/codec/binary/Base64;

    invoke-direct {v0}, Lorg/apache/commons/codec/binary/Base64;-><init>()V

    iput-object v0, p0, Loauth/signpost/signature/OAuthMessageSigner;->base64:Lorg/apache/commons/codec/binary/Base64;

    .line 73
    return-void
.end method


# virtual methods
.method protected base64Encode([B)Ljava/lang/String;
    .registers 4
    .param p1, "b"    # [B

    .prologue
    .line 66
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Loauth/signpost/signature/OAuthMessageSigner;->base64:Lorg/apache/commons/codec/binary/Base64;

    invoke-virtual {v1, p1}, Lorg/apache/commons/codec/binary/Base64;->encode([B)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public getConsumerSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Loauth/signpost/signature/OAuthMessageSigner;->consumerSecret:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getSignatureMethod()Ljava/lang/String;
.end method

.method public getTokenSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Loauth/signpost/signature/OAuthMessageSigner;->tokenSecret:Ljava/lang/String;

    return-object v0
.end method

.method public setConsumerSecret(Ljava/lang/String;)V
    .registers 2
    .param p1, "consumerSecret"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Loauth/signpost/signature/OAuthMessageSigner;->consumerSecret:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setTokenSecret(Ljava/lang/String;)V
    .registers 2
    .param p1, "tokenSecret"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-object p1, p0, Loauth/signpost/signature/OAuthMessageSigner;->tokenSecret:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public abstract sign(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Loauth/signpost/exception/OAuthMessageSignerException;
        }
    .end annotation
.end method
