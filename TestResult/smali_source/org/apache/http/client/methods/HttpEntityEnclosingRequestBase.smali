.class public abstract Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
.super Lorg/apache/http/client/methods/HttpRequestBase;
.source "HttpEntityEnclosingRequestBase.java"

# interfaces
.implements Lorg/apache/http/HttpEntityEnclosingRequest;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private entity:Lorg/apache/http/HttpEntity;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/http/client/methods/HttpRequestBase;-><init>()V

    .line 51
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-super {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;

    .line 70
    .local v0, "clone":Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;
    iget-object v1, p0, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v1, :cond_14

    .line 71
    iget-object v1, p0, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->entity:Lorg/apache/http/HttpEntity;

    invoke-static {v1}, Lorg/apache/http/client/utils/CloneUtils;->cloneObject(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/HttpEntity;

    iput-object v1, v0, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->entity:Lorg/apache/http/HttpEntity;

    .line 73
    :cond_14
    return-object v0
.end method

.method public expectContinue()Z
    .registers 4

    .prologue
    .line 62
    const-string v1, "Expect"

    invoke-virtual {p0, v1}, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 63
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
    .line 54
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->entity:Lorg/apache/http/HttpEntity;

    return-object v0
.end method

.method public setEntity(Lorg/apache/http/HttpEntity;)V
    .registers 2
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 58
    iput-object p1, p0, Lorg/apache/http/client/methods/HttpEntityEnclosingRequestBase;->entity:Lorg/apache/http/HttpEntity;

    .line 59
    return-void
.end method
