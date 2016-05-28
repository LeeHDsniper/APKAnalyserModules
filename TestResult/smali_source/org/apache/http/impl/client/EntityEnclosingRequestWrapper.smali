.class public Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;
.super Lorg/apache/http/impl/client/RequestWrapper;
.source "EntityEnclosingRequestWrapper.java"

# interfaces
.implements Lorg/apache/http/HttpEntityEnclosingRequest;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper$EntityWrapper;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private consumed:Z

.field private entity:Lorg/apache/http/HttpEntity;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    .registers 3
    .param p1, "request"    # Lorg/apache/http/HttpEntityEnclosingRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/RequestWrapper;-><init>(Lorg/apache/http/HttpRequest;)V

    .line 65
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 66
    return-void
.end method

.method static synthetic access$002(Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;
    .param p1, "x1"    # Z

    .prologue
    .line 56
    iput-boolean p1, p0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;->consumed:Z

    return p1
.end method


# virtual methods
.method public expectContinue()Z
    .registers 4

    .prologue
    .line 78
    const-string v1, "Expect"

    invoke-virtual {p0, v1}, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 79
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
    .line 69
    iget-object v0, p0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;->entity:Lorg/apache/http/HttpEntity;

    return-object v0
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;->entity:Lorg/apache/http/HttpEntity;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isRepeatable()Z

    move-result v0

    if-nez v0, :cond_10

    iget-boolean v0, p0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;->consumed:Z

    if-nez v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public setEntity(Lorg/apache/http/HttpEntity;)V
    .registers 3
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 73
    if-eqz p1, :cond_d

    new-instance v0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper$EntityWrapper;

    invoke-direct {v0, p0, p1}, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper$EntityWrapper;-><init>(Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;Lorg/apache/http/HttpEntity;)V

    :goto_7
    iput-object v0, p0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;->entity:Lorg/apache/http/HttpEntity;

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;->consumed:Z

    .line 75
    return-void

    .line 73
    :cond_d
    const/4 v0, 0x0

    goto :goto_7
.end method
