.class public abstract Loauth/signpost/AbstractOAuthProvider;
.super Ljava/lang/Object;
.source "AbstractOAuthProvider.java"

# interfaces
.implements Loauth/signpost/OAuthProvider;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private accessTokenEndpointUrl:Ljava/lang/String;

.field private authorizationWebsiteUrl:Ljava/lang/String;

.field private defaultHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private isOAuth10a:Z

.field private transient listener:Loauth/signpost/OAuthProviderListener;

.field private requestTokenEndpointUrl:Ljava/lang/String;

.field private responseParameters:Loauth/signpost/http/HttpParameters;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "requestTokenEndpointUrl"    # Ljava/lang/String;
    .param p2, "accessTokenEndpointUrl"    # Ljava/lang/String;
    .param p3, "authorizationWebsiteUrl"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Loauth/signpost/AbstractOAuthProvider;->requestTokenEndpointUrl:Ljava/lang/String;

    .line 54
    iput-object p2, p0, Loauth/signpost/AbstractOAuthProvider;->accessTokenEndpointUrl:Ljava/lang/String;

    .line 55
    iput-object p3, p0, Loauth/signpost/AbstractOAuthProvider;->authorizationWebsiteUrl:Ljava/lang/String;

    .line 56
    new-instance v0, Loauth/signpost/http/HttpParameters;

    invoke-direct {v0}, Loauth/signpost/http/HttpParameters;-><init>()V

    iput-object v0, p0, Loauth/signpost/AbstractOAuthProvider;->responseParameters:Loauth/signpost/http/HttpParameters;

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Loauth/signpost/AbstractOAuthProvider;->defaultHeaders:Ljava/util/Map;

    .line 58
    return-void
.end method


# virtual methods
.method protected closeConnection(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)V
    .registers 3
    .param p1, "request"    # Loauth/signpost/http/HttpRequest;
    .param p2, "response"    # Loauth/signpost/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 287
    return-void
.end method

.method protected abstract createRequest(Ljava/lang/String;)Loauth/signpost/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public getRequestHeaders()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 335
    iget-object v0, p0, Loauth/signpost/AbstractOAuthProvider;->defaultHeaders:Ljava/util/Map;

    return-object v0
.end method

.method protected handleUnexpectedResponse(ILoauth/signpost/http/HttpResponse;)V
    .registers 9
    .param p1, "statusCode"    # I
    .param p2, "response"    # Loauth/signpost/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 229
    if-nez p2, :cond_3

    .line 230
    return-void

    .line 232
    :cond_3
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-interface {p2}, Loauth/signpost/http/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 233
    .local v1, "reader":Ljava/io/BufferedReader;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .local v2, "responseBody":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, "line":Ljava/lang/String;
    :goto_1a
    if-eqz v0, :cond_24

    .line 237
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_1a

    .line 241
    :cond_24
    packed-switch p1, :pswitch_data_62

    .line 245
    new-instance v3, Loauth/signpost/exception/OAuthCommunicationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Service provider responded in error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p2}, Loauth/signpost/http/HttpResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Loauth/signpost/exception/OAuthCommunicationException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v3

    .line 243
    :pswitch_58
    new-instance v3, Loauth/signpost/exception/OAuthNotAuthorizedException;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Loauth/signpost/exception/OAuthNotAuthorizedException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 241
    :pswitch_data_62
    .packed-switch 0x191
        :pswitch_58
    .end packed-switch
.end method

.method public varargs declared-synchronized retrieveAccessToken(Loauth/signpost/OAuthConsumer;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 7
    .param p1, "consumer"    # Loauth/signpost/OAuthConsumer;
    .param p2, "oauthVerifier"    # Ljava/lang/String;
    .param p3, "customOAuthParams"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Loauth/signpost/exception/OAuthMessageSignerException;,
            Loauth/signpost/exception/OAuthNotAuthorizedException;,
            Loauth/signpost/exception/OAuthExpectationFailedException;,
            Loauth/signpost/exception/OAuthCommunicationException;
        }
    .end annotation

    .prologue
    .line 96
    monitor-enter p0

    :try_start_1
    invoke-interface {p1}, Loauth/signpost/OAuthConsumer;->getToken()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_d

    invoke-interface {p1}, Loauth/signpost/OAuthConsumer;->getTokenSecret()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_18

    .line 97
    :cond_d
    new-instance v1, Loauth/signpost/exception/OAuthExpectationFailedException;

    const-string v2, "Authorized request token or token secret not set. Did you retrieve an authorized request token before?"

    invoke-direct {v1, v2}, Loauth/signpost/exception/OAuthExpectationFailedException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_15

    .line 96
    :catchall_15
    move-exception v1

    monitor-exit p0

    throw v1

    .line 102
    :cond_18
    :try_start_18
    new-instance v0, Loauth/signpost/http/HttpParameters;

    invoke-direct {v0}, Loauth/signpost/http/HttpParameters;-><init>()V

    .line 103
    .local v0, "params":Loauth/signpost/http/HttpParameters;
    const/4 v1, 0x1

    invoke-virtual {v0, p3, v1}, Loauth/signpost/http/HttpParameters;->putAll([Ljava/lang/String;Z)V

    .line 105
    iget-boolean v1, p0, Loauth/signpost/AbstractOAuthProvider;->isOAuth10a:Z

    if-eqz v1, :cond_2d

    if-eqz p2, :cond_2d

    .line 106
    const-string v1, "oauth_verifier"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p2, v2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 108
    :cond_2d
    iget-object v1, p0, Loauth/signpost/AbstractOAuthProvider;->accessTokenEndpointUrl:Ljava/lang/String;

    invoke-virtual {p0, p1, v1, v0}, Loauth/signpost/AbstractOAuthProvider;->retrieveToken(Loauth/signpost/OAuthConsumer;Ljava/lang/String;Loauth/signpost/http/HttpParameters;)V
    :try_end_32
    .catchall {:try_start_18 .. :try_end_32} :catchall_15

    .line 109
    monitor-exit p0

    return-void
.end method

.method public varargs declared-synchronized retrieveRequestToken(Loauth/signpost/OAuthConsumer;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p1, "consumer"    # Loauth/signpost/OAuthConsumer;
    .param p2, "callbackUrl"    # Ljava/lang/String;
    .param p3, "customOAuthParams"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Loauth/signpost/exception/OAuthMessageSignerException;,
            Loauth/signpost/exception/OAuthNotAuthorizedException;,
            Loauth/signpost/exception/OAuthExpectationFailedException;,
            Loauth/signpost/exception/OAuthCommunicationException;
        }
    .end annotation

    .prologue
    .line 66
    monitor-enter p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_3
    invoke-interface {p1, v2, v3}, Loauth/signpost/OAuthConsumer;->setTokenWithSecret(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    new-instance v1, Loauth/signpost/http/HttpParameters;

    invoke-direct {v1}, Loauth/signpost/http/HttpParameters;-><init>()V

    .line 71
    .local v1, "params":Loauth/signpost/http/HttpParameters;
    const/4 v2, 0x1

    invoke-virtual {v1, p3, v2}, Loauth/signpost/http/HttpParameters;->putAll([Ljava/lang/String;Z)V

    .line 72
    const-string v2, "oauth_callback"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, p2, v3}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 74
    iget-object v2, p0, Loauth/signpost/AbstractOAuthProvider;->requestTokenEndpointUrl:Ljava/lang/String;

    invoke-virtual {p0, p1, v2, v1}, Loauth/signpost/AbstractOAuthProvider;->retrieveToken(Loauth/signpost/OAuthConsumer;Ljava/lang/String;Loauth/signpost/http/HttpParameters;)V

    .line 76
    iget-object v2, p0, Loauth/signpost/AbstractOAuthProvider;->responseParameters:Loauth/signpost/http/HttpParameters;

    const-string v3, "oauth_callback_confirmed"

    invoke-virtual {v2, v3}, Loauth/signpost/http/HttpParameters;->getFirst(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, "callbackConfirmed":Ljava/lang/String;
    iget-object v2, p0, Loauth/signpost/AbstractOAuthProvider;->responseParameters:Loauth/signpost/http/HttpParameters;

    const-string v3, "oauth_callback_confirmed"

    invoke-virtual {v2, v3}, Loauth/signpost/http/HttpParameters;->remove(Ljava/lang/Object;)Ljava/util/SortedSet;

    .line 78
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iput-boolean v2, p0, Loauth/signpost/AbstractOAuthProvider;->isOAuth10a:Z

    .line 82
    iget-boolean v2, p0, Loauth/signpost/AbstractOAuthProvider;->isOAuth10a:Z

    if-eqz v2, :cond_50

    .line 83
    iget-object v2, p0, Loauth/signpost/AbstractOAuthProvider;->authorizationWebsiteUrl:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "oauth_token"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-interface {p1}, Loauth/signpost/OAuthConsumer;->getToken()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Loauth/signpost/OAuth;->addQueryParameters(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    :try_end_4d
    .catchall {:try_start_3 .. :try_end_4d} :catchall_6e

    move-result-object v2

    .line 86
    :goto_4e
    monitor-exit p0

    return-object v2

    :cond_50
    :try_start_50
    iget-object v2, p0, Loauth/signpost/AbstractOAuthProvider;->authorizationWebsiteUrl:Ljava/lang/String;

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "oauth_token"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-interface {p1}, Loauth/signpost/OAuthConsumer;->getToken()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "oauth_callback"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    aput-object p2, v3, v4

    invoke-static {v2, v3}, Loauth/signpost/OAuth;->addQueryParameters(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    :try_end_6c
    .catchall {:try_start_50 .. :try_end_6c} :catchall_6e

    move-result-object v2

    goto :goto_4e

    .line 66
    .end local v0    # "callbackConfirmed":Ljava/lang/String;
    .end local v1    # "params":Loauth/signpost/http/HttpParameters;
    :catchall_6e
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected retrieveToken(Loauth/signpost/OAuthConsumer;Ljava/lang/String;Loauth/signpost/http/HttpParameters;)V
    .registers 18
    .param p1, "consumer"    # Loauth/signpost/OAuthConsumer;
    .param p2, "endpointUrl"    # Ljava/lang/String;
    .param p3, "customOAuthParams"    # Loauth/signpost/http/HttpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Loauth/signpost/exception/OAuthMessageSignerException;,
            Loauth/signpost/exception/OAuthCommunicationException;,
            Loauth/signpost/exception/OAuthNotAuthorizedException;,
            Loauth/signpost/exception/OAuthExpectationFailedException;
        }
    .end annotation

    .prologue
    .line 154
    invoke-virtual {p0}, Loauth/signpost/AbstractOAuthProvider;->getRequestHeaders()Ljava/util/Map;

    move-result-object v1

    .line 156
    .local v1, "defaultHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Loauth/signpost/OAuthConsumer;->getConsumerKey()Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_10

    invoke-interface {p1}, Loauth/signpost/OAuthConsumer;->getConsumerSecret()Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_18

    .line 157
    :cond_10
    new-instance v12, Loauth/signpost/exception/OAuthExpectationFailedException;

    const-string v13, "Consumer key or secret not set"

    invoke-direct {v12, v13}, Loauth/signpost/exception/OAuthExpectationFailedException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 160
    :cond_18
    const/4 v5, 0x0

    .line 161
    .local v5, "request":Loauth/signpost/http/HttpRequest;
    const/4 v7, 0x0

    .line 163
    .local v7, "response":Loauth/signpost/http/HttpResponse;
    :try_start_1a
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Loauth/signpost/AbstractOAuthProvider;->createRequest(Ljava/lang/String;)Loauth/signpost/http/HttpRequest;

    move-result-object v5

    .line 164
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_28
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_45

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 165
    .local v3, "header":Ljava/lang/String;
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-interface {v5, v3, v12}, Loauth/signpost/http/HttpRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3d
    .catch Loauth/signpost/exception/OAuthNotAuthorizedException; {:try_start_1a .. :try_end_3d} :catch_3e
    .catch Loauth/signpost/exception/OAuthExpectationFailedException; {:try_start_1a .. :try_end_3d} :catch_bb
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_3d} :catch_cb
    .catchall {:try_start_1a .. :try_end_3d} :catchall_40

    goto :goto_28

    .line 213
    .end local v3    # "header":Ljava/lang/String;
    .end local v4    # "i$":Ljava/util/Iterator;
    :catch_3e
    move-exception v2

    .line 214
    .local v2, "e":Loauth/signpost/exception/OAuthNotAuthorizedException;
    :try_start_3f
    throw v2
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_40

    .line 220
    .end local v2    # "e":Loauth/signpost/exception/OAuthNotAuthorizedException;
    :catchall_40
    move-exception v12

    .line 221
    :try_start_41
    invoke-virtual {p0, v5, v7}, Loauth/signpost/AbstractOAuthProvider;->closeConnection(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_44} :catch_d2

    .line 223
    throw v12

    .line 167
    .restart local v4    # "i$":Ljava/util/Iterator;
    :cond_45
    if-eqz p3, :cond_52

    :try_start_47
    invoke-virtual/range {p3 .. p3}, Loauth/signpost/http/HttpParameters;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_52

    .line 168
    move-object/from16 v0, p3

    invoke-interface {p1, v0}, Loauth/signpost/OAuthConsumer;->setAdditionalParameters(Loauth/signpost/http/HttpParameters;)V

    .line 171
    :cond_52
    iget-object v12, p0, Loauth/signpost/AbstractOAuthProvider;->listener:Loauth/signpost/OAuthProviderListener;

    if-eqz v12, :cond_5b

    .line 172
    iget-object v12, p0, Loauth/signpost/AbstractOAuthProvider;->listener:Loauth/signpost/OAuthProviderListener;

    invoke-interface {v12, v5}, Loauth/signpost/OAuthProviderListener;->prepareRequest(Loauth/signpost/http/HttpRequest;)V

    .line 175
    :cond_5b
    invoke-interface {p1, v5}, Loauth/signpost/OAuthConsumer;->sign(Loauth/signpost/http/HttpRequest;)Loauth/signpost/http/HttpRequest;

    .line 177
    iget-object v12, p0, Loauth/signpost/AbstractOAuthProvider;->listener:Loauth/signpost/OAuthProviderListener;

    if-eqz v12, :cond_67

    .line 178
    iget-object v12, p0, Loauth/signpost/AbstractOAuthProvider;->listener:Loauth/signpost/OAuthProviderListener;

    invoke-interface {v12, v5}, Loauth/signpost/OAuthProviderListener;->prepareSubmission(Loauth/signpost/http/HttpRequest;)V

    .line 181
    :cond_67
    invoke-virtual {p0, v5}, Loauth/signpost/AbstractOAuthProvider;->sendRequest(Loauth/signpost/http/HttpRequest;)Loauth/signpost/http/HttpResponse;

    move-result-object v7

    .line 182
    invoke-interface {v7}, Loauth/signpost/http/HttpResponse;->getStatusCode()I

    move-result v10

    .line 184
    .local v10, "statusCode":I
    const/4 v6, 0x0

    .line 185
    .local v6, "requestHandled":Z
    iget-object v12, p0, Loauth/signpost/AbstractOAuthProvider;->listener:Loauth/signpost/OAuthProviderListener;

    if-eqz v12, :cond_7a

    .line 186
    iget-object v12, p0, Loauth/signpost/AbstractOAuthProvider;->listener:Loauth/signpost/OAuthProviderListener;

    invoke-interface {v12, v5, v7}, Loauth/signpost/OAuthProviderListener;->onResponseReceived(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)Z
    :try_end_79
    .catch Loauth/signpost/exception/OAuthNotAuthorizedException; {:try_start_47 .. :try_end_79} :catch_3e
    .catch Loauth/signpost/exception/OAuthExpectationFailedException; {:try_start_47 .. :try_end_79} :catch_bb
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_79} :catch_cb
    .catchall {:try_start_47 .. :try_end_79} :catchall_40

    move-result v6

    .line 188
    :cond_7a
    if-eqz v6, :cond_87

    .line 221
    :try_start_7c
    invoke-virtual {p0, v5, v7}, Loauth/signpost/AbstractOAuthProvider;->closeConnection(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)V
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_7f} :catch_80

    .line 226
    :goto_7f
    return-void

    .line 222
    :catch_80
    move-exception v2

    .line 223
    .local v2, "e":Ljava/lang/Exception;
    new-instance v12, Loauth/signpost/exception/OAuthCommunicationException;

    invoke-direct {v12, v2}, Loauth/signpost/exception/OAuthCommunicationException;-><init>(Ljava/lang/Exception;)V

    throw v12

    .line 192
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_87
    const/16 v12, 0x12c

    if-lt v10, v12, :cond_8e

    .line 193
    :try_start_8b
    invoke-virtual {p0, v10, v7}, Loauth/signpost/AbstractOAuthProvider;->handleUnexpectedResponse(ILoauth/signpost/http/HttpResponse;)V

    .line 196
    :cond_8e
    invoke-interface {v7}, Loauth/signpost/http/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v12

    invoke-static {v12}, Loauth/signpost/OAuth;->decodeForm(Ljava/io/InputStream;)Loauth/signpost/http/HttpParameters;

    move-result-object v8

    .line 198
    .local v8, "responseParams":Loauth/signpost/http/HttpParameters;
    const-string v12, "oauth_token"

    invoke-virtual {v8, v12}, Loauth/signpost/http/HttpParameters;->getFirst(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 199
    .local v11, "token":Ljava/lang/String;
    const-string v12, "oauth_token_secret"

    invoke-virtual {v8, v12}, Loauth/signpost/http/HttpParameters;->getFirst(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 200
    .local v9, "secret":Ljava/lang/String;
    const-string v12, "oauth_token"

    invoke-virtual {v8, v12}, Loauth/signpost/http/HttpParameters;->remove(Ljava/lang/Object;)Ljava/util/SortedSet;

    .line 201
    const-string v12, "oauth_token_secret"

    invoke-virtual {v8, v12}, Loauth/signpost/http/HttpParameters;->remove(Ljava/lang/Object;)Ljava/util/SortedSet;

    .line 203
    invoke-virtual {p0, v8}, Loauth/signpost/AbstractOAuthProvider;->setResponseParameters(Loauth/signpost/http/HttpParameters;)V

    .line 205
    if-eqz v11, :cond_b3

    if-nez v9, :cond_bd

    .line 206
    :cond_b3
    new-instance v12, Loauth/signpost/exception/OAuthExpectationFailedException;

    const-string v13, "Request token or token secret not set in server reply. The service provider you use is probably buggy."

    invoke-direct {v12, v13}, Loauth/signpost/exception/OAuthExpectationFailedException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_bb
    .catch Loauth/signpost/exception/OAuthNotAuthorizedException; {:try_start_8b .. :try_end_bb} :catch_3e
    .catch Loauth/signpost/exception/OAuthExpectationFailedException; {:try_start_8b .. :try_end_bb} :catch_bb
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_bb} :catch_cb
    .catchall {:try_start_8b .. :try_end_bb} :catchall_40

    .line 215
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "requestHandled":Z
    .end local v8    # "responseParams":Loauth/signpost/http/HttpParameters;
    .end local v9    # "secret":Ljava/lang/String;
    .end local v10    # "statusCode":I
    .end local v11    # "token":Ljava/lang/String;
    :catch_bb
    move-exception v2

    .line 216
    .local v2, "e":Loauth/signpost/exception/OAuthExpectationFailedException;
    :try_start_bc
    throw v2
    :try_end_bd
    .catchall {:try_start_bc .. :try_end_bd} :catchall_40

    .line 211
    .end local v2    # "e":Loauth/signpost/exception/OAuthExpectationFailedException;
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v6    # "requestHandled":Z
    .restart local v8    # "responseParams":Loauth/signpost/http/HttpParameters;
    .restart local v9    # "secret":Ljava/lang/String;
    .restart local v10    # "statusCode":I
    .restart local v11    # "token":Ljava/lang/String;
    :cond_bd
    :try_start_bd
    invoke-interface {p1, v11, v9}, Loauth/signpost/OAuthConsumer;->setTokenWithSecret(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c0
    .catch Loauth/signpost/exception/OAuthNotAuthorizedException; {:try_start_bd .. :try_end_c0} :catch_3e
    .catch Loauth/signpost/exception/OAuthExpectationFailedException; {:try_start_bd .. :try_end_c0} :catch_bb
    .catch Ljava/lang/Exception; {:try_start_bd .. :try_end_c0} :catch_cb
    .catchall {:try_start_bd .. :try_end_c0} :catchall_40

    .line 221
    :try_start_c0
    invoke-virtual {p0, v5, v7}, Loauth/signpost/AbstractOAuthProvider;->closeConnection(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)V
    :try_end_c3
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_c3} :catch_c4

    goto :goto_7f

    .line 222
    :catch_c4
    move-exception v2

    .line 223
    .local v2, "e":Ljava/lang/Exception;
    new-instance v12, Loauth/signpost/exception/OAuthCommunicationException;

    invoke-direct {v12, v2}, Loauth/signpost/exception/OAuthCommunicationException;-><init>(Ljava/lang/Exception;)V

    throw v12

    .line 217
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "requestHandled":Z
    .end local v8    # "responseParams":Loauth/signpost/http/HttpParameters;
    .end local v9    # "secret":Ljava/lang/String;
    .end local v10    # "statusCode":I
    .end local v11    # "token":Ljava/lang/String;
    :catch_cb
    move-exception v2

    .line 218
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_cc
    new-instance v12, Loauth/signpost/exception/OAuthCommunicationException;

    invoke-direct {v12, v2}, Loauth/signpost/exception/OAuthCommunicationException;-><init>(Ljava/lang/Exception;)V

    throw v12
    :try_end_d2
    .catchall {:try_start_cc .. :try_end_d2} :catchall_40

    .line 222
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_d2
    move-exception v2

    .line 223
    .restart local v2    # "e":Ljava/lang/Exception;
    new-instance v12, Loauth/signpost/exception/OAuthCommunicationException;

    invoke-direct {v12, v2}, Loauth/signpost/exception/OAuthCommunicationException;-><init>(Ljava/lang/Exception;)V

    throw v12
.end method

.method protected abstract sendRequest(Loauth/signpost/http/HttpRequest;)Loauth/signpost/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public setResponseParameters(Loauth/signpost/http/HttpParameters;)V
    .registers 2
    .param p1, "parameters"    # Loauth/signpost/http/HttpParameters;

    .prologue
    .line 307
    iput-object p1, p0, Loauth/signpost/AbstractOAuthProvider;->responseParameters:Loauth/signpost/http/HttpParameters;

    .line 308
    return-void
.end method
