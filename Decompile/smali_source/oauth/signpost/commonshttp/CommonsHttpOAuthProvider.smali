.class public Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;
.super Loauth/signpost/AbstractOAuthProvider;
.source "CommonsHttpOAuthProvider.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private transient httpClient:Lorg/apache/http/client/HttpClient;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "requestTokenEndpointUrl"    # Ljava/lang/String;
    .param p2, "accessTokenEndpointUrl"    # Ljava/lang/String;
    .param p3, "authorizationWebsiteUrl"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Loauth/signpost/AbstractOAuthProvider;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    iput-object v0, p0, Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 44
    return-void
.end method


# virtual methods
.method protected closeConnection(Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpResponse;)V
    .registers 6
    .param p1, "request"    # Loauth/signpost/http/HttpRequest;
    .param p2, "response"    # Loauth/signpost/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 71
    if-eqz p2, :cond_11

    .line 72
    invoke-interface {p2}, Loauth/signpost/http/HttpResponse;->unwrap()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/HttpResponse;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 73
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v1, :cond_11

    .line 76
    :try_start_e
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_11} :catch_12

    .line 83
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    :cond_11
    :goto_11
    return-void

    .line 77
    .restart local v1    # "entity":Lorg/apache/http/HttpEntity;
    :catch_12
    move-exception v0

    .line 79
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_11
.end method

.method protected createRequest(Ljava/lang/String;)Loauth/signpost/http/HttpRequest;
    .registers 4
    .param p1, "endpointUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v0, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 59
    .local v0, "request":Lorg/apache/http/client/methods/HttpPost;
    new-instance v1, Loauth/signpost/commonshttp/HttpRequestAdapter;

    invoke-direct {v1, v0}, Loauth/signpost/commonshttp/HttpRequestAdapter;-><init>(Lorg/apache/http/client/methods/HttpUriRequest;)V

    return-object v1
.end method

.method protected sendRequest(Loauth/signpost/http/HttpRequest;)Loauth/signpost/http/HttpResponse;
    .registers 5
    .param p1, "request"    # Loauth/signpost/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v2, p0, Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {p1}, Loauth/signpost/http/HttpRequest;->unwrap()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v2, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 65
    .local v0, "response":Lorg/apache/http/HttpResponse;
    new-instance v1, Loauth/signpost/commonshttp/HttpResponseAdapter;

    invoke-direct {v1, v0}, Loauth/signpost/commonshttp/HttpResponseAdapter;-><init>(Lorg/apache/http/HttpResponse;)V

    return-object v1
.end method
