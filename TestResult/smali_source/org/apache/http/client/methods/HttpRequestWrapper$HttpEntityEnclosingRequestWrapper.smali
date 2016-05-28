.class Lorg/apache/http/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;
.super Lorg/apache/http/client/methods/HttpRequestWrapper;
.source "HttpRequestWrapper.java"

# interfaces
.implements Lorg/apache/http/HttpEntityEnclosingRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/client/methods/HttpRequestWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HttpEntityEnclosingRequestWrapper"
.end annotation


# instance fields
.field private entity:Lorg/apache/http/HttpEntity;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    .registers 3
    .param p1, "request"    # Lorg/apache/http/HttpEntityEnclosingRequest;

    .prologue
    .line 128
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/client/methods/HttpRequestWrapper;-><init>(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/methods/HttpRequestWrapper$1;)V

    .line 129
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;->entity:Lorg/apache/http/HttpEntity;

    .line 130
    return-void
.end method


# virtual methods
.method public expectContinue()Z
    .registers 4

    .prologue
    .line 141
    const-string v1, "Expect"

    invoke-virtual {p0, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 142
    .local v0, "expect":Lorg/apache/http/Header;
    if-eqz v0, :cond_16

    const-string v1, "100-continue"

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    const/4 v1, 0x1

    :goto_15
    return v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method

.method public getEntity()Lorg/apache/http/HttpEntity;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;->entity:Lorg/apache/http/HttpEntity;

    return-object v0
.end method

.method public setEntity(Lorg/apache/http/HttpEntity;)V
    .registers 2
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 137
    iput-object p1, p0, Lorg/apache/http/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;->entity:Lorg/apache/http/HttpEntity;

    .line 138
    return-void
.end method
