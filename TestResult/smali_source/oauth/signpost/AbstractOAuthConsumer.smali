.class public abstract Loauth/signpost/AbstractOAuthConsumer;
.super Ljava/lang/Object;
.source "AbstractOAuthConsumer.java"

# interfaces
.implements Loauth/signpost/OAuthConsumer;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private additionalParameters:Loauth/signpost/http/HttpParameters;

.field private consumerKey:Ljava/lang/String;

.field private consumerSecret:Ljava/lang/String;

.field private messageSigner:Loauth/signpost/signature/OAuthMessageSigner;

.field private final random:Ljava/util/Random;

.field private requestParameters:Loauth/signpost/http/HttpParameters;

.field private sendEmptyTokens:Z

.field private signingStrategy:Loauth/signpost/signature/SigningStrategy;

.field private token:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "consumerKey"    # Ljava/lang/String;
    .param p2, "consumerSecret"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Random;-><init>(J)V

    iput-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->random:Ljava/util/Random;

    .line 63
    iput-object p1, p0, Loauth/signpost/AbstractOAuthConsumer;->consumerKey:Ljava/lang/String;

    .line 64
    iput-object p2, p0, Loauth/signpost/AbstractOAuthConsumer;->consumerSecret:Ljava/lang/String;

    .line 65
    new-instance v0, Loauth/signpost/signature/HmacSha1MessageSigner;

    invoke-direct {v0}, Loauth/signpost/signature/HmacSha1MessageSigner;-><init>()V

    invoke-virtual {p0, v0}, Loauth/signpost/AbstractOAuthConsumer;->setMessageSigner(Loauth/signpost/signature/OAuthMessageSigner;)V

    .line 66
    new-instance v0, Loauth/signpost/signature/AuthorizationHeaderSigningStrategy;

    invoke-direct {v0}, Loauth/signpost/signature/AuthorizationHeaderSigningStrategy;-><init>()V

    invoke-virtual {p0, v0}, Loauth/signpost/AbstractOAuthConsumer;->setSigningStrategy(Loauth/signpost/signature/SigningStrategy;)V

    .line 67
    return-void
.end method


# virtual methods
.method protected collectBodyParameters(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)V
    .registers 7
    .param p1, "request"    # Loauth/signpost/http/HttpRequest;
    .param p2, "out"    # Loauth/signpost/http/HttpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    invoke-interface {p1}, Loauth/signpost/http/HttpRequest;->getContentType()Ljava/lang/String;

    move-result-object v0

    .line 235
    .local v0, "contentType":Ljava/lang/String;
    if-eqz v0, :cond_1a

    const-string v2, "application/x-www-form-urlencoded"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 236
    invoke-interface {p1}, Loauth/signpost/http/HttpRequest;->getMessagePayload()Ljava/io/InputStream;

    move-result-object v1

    .line 237
    .local v1, "payload":Ljava/io/InputStream;
    invoke-static {v1}, Loauth/signpost/OAuth;->decodeForm(Ljava/io/InputStream;)Loauth/signpost/http/HttpParameters;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p2, v2, v3}, Loauth/signpost/http/HttpParameters;->putAll(Ljava/util/Map;Z)V

    .line 239
    .end local v1    # "payload":Ljava/io/InputStream;
    :cond_1a
    return-void
.end method

.method protected collectHeaderParameters(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)V
    .registers 5
    .param p1, "request"    # Loauth/signpost/http/HttpRequest;
    .param p2, "out"    # Loauth/signpost/http/HttpParameters;

    .prologue
    .line 222
    const-string v1, "Authorization"

    invoke-interface {p1, v1}, Loauth/signpost/http/HttpRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Loauth/signpost/OAuth;->oauthHeaderToParamsMap(Ljava/lang/String;)Loauth/signpost/http/HttpParameters;

    move-result-object v0

    .line 223
    .local v0, "headerParams":Loauth/signpost/http/HttpParameters;
    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Loauth/signpost/http/HttpParameters;->putAll(Ljava/util/Map;Z)V

    .line 224
    return-void
.end method

.method protected collectQueryParameters(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)V
    .registers 7
    .param p1, "request"    # Loauth/signpost/http/HttpRequest;
    .param p2, "out"    # Loauth/signpost/http/HttpParameters;

    .prologue
    .line 247
    invoke-interface {p1}, Loauth/signpost/http/HttpRequest;->getRequestUrl()Ljava/lang/String;

    move-result-object v1

    .line 248
    .local v1, "url":Ljava/lang/String;
    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 249
    .local v0, "q":I
    if-ltz v0, :cond_1a

    .line 251
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Loauth/signpost/OAuth;->decodeForm(Ljava/lang/String;)Loauth/signpost/http/HttpParameters;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p2, v2, v3}, Loauth/signpost/http/HttpParameters;->putAll(Ljava/util/Map;Z)V

    .line 253
    :cond_1a
    return-void
.end method

.method protected completeOAuthParameters(Loauth/signpost/http/HttpParameters;)V
    .registers 5
    .param p1, "out"    # Loauth/signpost/http/HttpParameters;

    .prologue
    const/4 v2, 0x1

    .line 187
    const-string v0, "oauth_consumer_key"

    invoke-virtual {p1, v0}, Loauth/signpost/http/HttpParameters;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 188
    const-string v0, "oauth_consumer_key"

    iget-object v1, p0, Loauth/signpost/AbstractOAuthConsumer;->consumerKey:Ljava/lang/String;

    invoke-virtual {p1, v0, v1, v2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 190
    :cond_10
    const-string v0, "oauth_signature_method"

    invoke-virtual {p1, v0}, Loauth/signpost/http/HttpParameters;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    .line 191
    const-string v0, "oauth_signature_method"

    iget-object v1, p0, Loauth/signpost/AbstractOAuthConsumer;->messageSigner:Loauth/signpost/signature/OAuthMessageSigner;

    invoke-virtual {v1}, Loauth/signpost/signature/OAuthMessageSigner;->getSignatureMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 193
    :cond_23
    const-string v0, "oauth_timestamp"

    invoke-virtual {p1, v0}, Loauth/signpost/http/HttpParameters;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    .line 194
    const-string v0, "oauth_timestamp"

    invoke-virtual {p0}, Loauth/signpost/AbstractOAuthConsumer;->generateTimestamp()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 196
    :cond_34
    const-string v0, "oauth_nonce"

    invoke-virtual {p1, v0}, Loauth/signpost/http/HttpParameters;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_45

    .line 197
    const-string v0, "oauth_nonce"

    invoke-virtual {p0}, Loauth/signpost/AbstractOAuthConsumer;->generateNonce()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 199
    :cond_45
    const-string v0, "oauth_version"

    invoke-virtual {p1, v0}, Loauth/signpost/http/HttpParameters;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    .line 200
    const-string v0, "oauth_version"

    const-string v1, "1.0"

    invoke-virtual {p1, v0, v1, v2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 202
    :cond_54
    const-string v0, "oauth_token"

    invoke-virtual {p1, v0}, Loauth/signpost/http/HttpParameters;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_75

    .line 203
    iget-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->token:Ljava/lang/String;

    if-eqz v0, :cond_6a

    iget-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->token:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6e

    :cond_6a
    iget-boolean v0, p0, Loauth/signpost/AbstractOAuthConsumer;->sendEmptyTokens:Z

    if-eqz v0, :cond_75

    .line 204
    :cond_6e
    const-string v0, "oauth_token"

    iget-object v1, p0, Loauth/signpost/AbstractOAuthConsumer;->token:Ljava/lang/String;

    invoke-virtual {p1, v0, v1, v2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 207
    :cond_75
    return-void
.end method

.method protected generateNonce()Ljava/lang/String;
    .registers 3

    .prologue
    .line 260
    iget-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->random:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected generateTimestamp()Ljava/lang/String;
    .registers 5

    .prologue
    .line 256
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConsumerKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->consumerKey:Ljava/lang/String;

    return-object v0
.end method

.method public getConsumerSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->consumerSecret:Ljava/lang/String;

    return-object v0
.end method

.method public getToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->token:Ljava/lang/String;

    return-object v0
.end method

.method public getTokenSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->messageSigner:Loauth/signpost/signature/OAuthMessageSigner;

    invoke-virtual {v0}, Loauth/signpost/signature/OAuthMessageSigner;->getTokenSecret()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAdditionalParameters(Loauth/signpost/http/HttpParameters;)V
    .registers 2
    .param p1, "additionalParameters"    # Loauth/signpost/http/HttpParameters;

    .prologue
    .line 79
    iput-object p1, p0, Loauth/signpost/AbstractOAuthConsumer;->additionalParameters:Loauth/signpost/http/HttpParameters;

    .line 80
    return-void
.end method

.method public setMessageSigner(Loauth/signpost/signature/OAuthMessageSigner;)V
    .registers 3
    .param p1, "messageSigner"    # Loauth/signpost/signature/OAuthMessageSigner;

    .prologue
    .line 70
    iput-object p1, p0, Loauth/signpost/AbstractOAuthConsumer;->messageSigner:Loauth/signpost/signature/OAuthMessageSigner;

    .line 71
    iget-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->consumerSecret:Ljava/lang/String;

    invoke-virtual {p1, v0}, Loauth/signpost/signature/OAuthMessageSigner;->setConsumerSecret(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public setSigningStrategy(Loauth/signpost/signature/SigningStrategy;)V
    .registers 2
    .param p1, "signingStrategy"    # Loauth/signpost/signature/SigningStrategy;

    .prologue
    .line 75
    iput-object p1, p0, Loauth/signpost/AbstractOAuthConsumer;->signingStrategy:Loauth/signpost/signature/SigningStrategy;

    .line 76
    return-void
.end method

.method public setTokenWithSecret(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "tokenSecret"    # Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Loauth/signpost/AbstractOAuthConsumer;->token:Ljava/lang/String;

    .line 151
    iget-object v0, p0, Loauth/signpost/AbstractOAuthConsumer;->messageSigner:Loauth/signpost/signature/OAuthMessageSigner;

    invoke-virtual {v0, p2}, Loauth/signpost/signature/OAuthMessageSigner;->setTokenSecret(Ljava/lang/String;)V

    .line 152
    return-void
.end method

.method public declared-synchronized sign(Ljava/lang/Object;)Loauth/signpost/http/HttpRequest;
    .registers 3
    .param p1, "request"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Loauth/signpost/exception/OAuthMessageSignerException;,
            Loauth/signpost/exception/OAuthExpectationFailedException;,
            Loauth/signpost/exception/OAuthCommunicationException;
        }
    .end annotation

    .prologue
    .line 120
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Loauth/signpost/AbstractOAuthConsumer;->wrap(Ljava/lang/Object;)Loauth/signpost/http/HttpRequest;

    move-result-object v0

    invoke-virtual {p0, v0}, Loauth/signpost/AbstractOAuthConsumer;->sign(Loauth/signpost/http/HttpRequest;)Loauth/signpost/http/HttpRequest;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized sign(Loauth/signpost/http/HttpRequest;)Loauth/signpost/http/HttpRequest;
    .registers 7
    .param p1, "request"    # Loauth/signpost/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Loauth/signpost/exception/OAuthMessageSignerException;,
            Loauth/signpost/exception/OAuthExpectationFailedException;,
            Loauth/signpost/exception/OAuthCommunicationException;
        }
    .end annotation

    .prologue
    .line 84
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->consumerKey:Ljava/lang/String;

    if-nez v2, :cond_10

    .line 85
    new-instance v2, Loauth/signpost/exception/OAuthExpectationFailedException;

    const-string v3, "consumer key not set"

    invoke-direct {v2, v3}, Loauth/signpost/exception/OAuthExpectationFailedException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    .line 84
    :catchall_d
    move-exception v2

    monitor-exit p0

    throw v2

    .line 87
    :cond_10
    :try_start_10
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->consumerSecret:Ljava/lang/String;

    if-nez v2, :cond_1c

    .line 88
    new-instance v2, Loauth/signpost/exception/OAuthExpectationFailedException;

    const-string v3, "consumer secret not set"

    invoke-direct {v2, v3}, Loauth/signpost/exception/OAuthExpectationFailedException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 91
    :cond_1c
    new-instance v2, Loauth/signpost/http/HttpParameters;

    invoke-direct {v2}, Loauth/signpost/http/HttpParameters;-><init>()V

    iput-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->requestParameters:Loauth/signpost/http/HttpParameters;
    :try_end_23
    .catchall {:try_start_10 .. :try_end_23} :catchall_d

    .line 93
    :try_start_23
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->additionalParameters:Loauth/signpost/http/HttpParameters;

    if-eqz v2, :cond_2f

    .line 94
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->requestParameters:Loauth/signpost/http/HttpParameters;

    iget-object v3, p0, Loauth/signpost/AbstractOAuthConsumer;->additionalParameters:Loauth/signpost/http/HttpParameters;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Loauth/signpost/http/HttpParameters;->putAll(Ljava/util/Map;Z)V

    .line 96
    :cond_2f
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->requestParameters:Loauth/signpost/http/HttpParameters;

    invoke-virtual {p0, p1, v2}, Loauth/signpost/AbstractOAuthConsumer;->collectHeaderParameters(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)V

    .line 97
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->requestParameters:Loauth/signpost/http/HttpParameters;

    invoke-virtual {p0, p1, v2}, Loauth/signpost/AbstractOAuthConsumer;->collectQueryParameters(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)V

    .line 98
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->requestParameters:Loauth/signpost/http/HttpParameters;

    invoke-virtual {p0, p1, v2}, Loauth/signpost/AbstractOAuthConsumer;->collectBodyParameters(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)V

    .line 101
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->requestParameters:Loauth/signpost/http/HttpParameters;

    invoke-virtual {p0, v2}, Loauth/signpost/AbstractOAuthConsumer;->completeOAuthParameters(Loauth/signpost/http/HttpParameters;)V

    .line 103
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->requestParameters:Loauth/signpost/http/HttpParameters;

    const-string v3, "oauth_signature"

    invoke-virtual {v2, v3}, Loauth/signpost/http/HttpParameters;->remove(Ljava/lang/Object;)Ljava/util/SortedSet;
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_4a} :catch_69
    .catchall {:try_start_23 .. :try_end_4a} :catchall_d

    .line 109
    :try_start_4a
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->messageSigner:Loauth/signpost/signature/OAuthMessageSigner;

    iget-object v3, p0, Loauth/signpost/AbstractOAuthConsumer;->requestParameters:Loauth/signpost/http/HttpParameters;

    invoke-virtual {v2, p1, v3}, Loauth/signpost/signature/OAuthMessageSigner;->sign(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)Ljava/lang/String;

    move-result-object v1

    .line 110
    .local v1, "signature":Ljava/lang/String;
    const-string v2, "signature"

    invoke-static {v2, v1}, Loauth/signpost/OAuth;->debugOut(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    iget-object v2, p0, Loauth/signpost/AbstractOAuthConsumer;->signingStrategy:Loauth/signpost/signature/SigningStrategy;

    iget-object v3, p0, Loauth/signpost/AbstractOAuthConsumer;->requestParameters:Loauth/signpost/http/HttpParameters;

    invoke-interface {v2, v1, p1, v3}, Loauth/signpost/signature/SigningStrategy;->writeSignature(Ljava/lang/String;Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)Ljava/lang/String;

    .line 113
    const-string v2, "Request URL"

    invoke-interface {p1}, Loauth/signpost/http/HttpRequest;->getRequestUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Loauth/signpost/OAuth;->debugOut(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_67
    .catchall {:try_start_4a .. :try_end_67} :catchall_d

    .line 115
    monitor-exit p0

    return-object p1

    .line 105
    .end local v1    # "signature":Ljava/lang/String;
    :catch_69
    move-exception v0

    .line 106
    .local v0, "e":Ljava/io/IOException;
    :try_start_6a
    new-instance v2, Loauth/signpost/exception/OAuthCommunicationException;

    invoke-direct {v2, v0}, Loauth/signpost/exception/OAuthCommunicationException;-><init>(Ljava/lang/Exception;)V

    throw v2
    :try_end_70
    .catchall {:try_start_6a .. :try_end_70} :catchall_d
.end method

.method protected abstract wrap(Ljava/lang/Object;)Loauth/signpost/http/HttpRequest;
.end method
