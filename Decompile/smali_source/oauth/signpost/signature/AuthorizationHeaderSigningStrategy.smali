.class public Loauth/signpost/signature/AuthorizationHeaderSigningStrategy;
.super Ljava/lang/Object;
.source "AuthorizationHeaderSigningStrategy.java"

# interfaces
.implements Loauth/signpost/signature/SigningStrategy;


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public writeSignature(Ljava/lang/String;Loauth/signpost/http/HttpRequest;Loauth/signpost/http/HttpParameters;)Ljava/lang/String;
    .registers 11
    .param p1, "signature"    # Ljava/lang/String;
    .param p2, "request"    # Loauth/signpost/http/HttpRequest;
    .param p3, "requestParameters"    # Loauth/signpost/http/HttpParameters;

    .prologue
    .line 20
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .local v4, "sb":Ljava/lang/StringBuilder;
    const-string v5, "OAuth "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    const-string v5, "realm"

    invoke-virtual {p3, v5}, Loauth/signpost/http/HttpParameters;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_20

    .line 26
    const-string v5, "realm"

    invoke-virtual {p3, v5}, Loauth/signpost/http/HttpParameters;->getAsHeaderElement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    :cond_20
    invoke-virtual {p3}, Loauth/signpost/http/HttpParameters;->getOAuthParameters()Loauth/signpost/http/HttpParameters;

    move-result-object v3

    .line 32
    .local v3, "oauthParams":Loauth/signpost/http/HttpParameters;
    const-string v5, "oauth_signature"

    const/4 v6, 0x1

    invoke-virtual {v3, v5, p1, v6}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 34
    invoke-virtual {v3}, Loauth/signpost/http/HttpParameters;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 35
    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_32
    :goto_32
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_51

    .line 36
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 37
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v3, v2}, Loauth/signpost/http/HttpParameters;->getAsHeaderElement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_32

    .line 39
    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_32

    .line 43
    .end local v2    # "key":Ljava/lang/String;
    :cond_51
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 44
    .local v0, "header":Ljava/lang/String;
    const-string v5, "Auth Header"

    invoke-static {v5, v0}, Loauth/signpost/OAuth;->debugOut(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    const-string v5, "Authorization"

    invoke-interface {p2, v5, v0}, Loauth/signpost/http/HttpRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    return-object v0
.end method
