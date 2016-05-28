.class public Lorg/apache/http/impl/cookie/BasicClientCookie2;
.super Lorg/apache/http/impl/cookie/BasicClientCookie;
.source "BasicClientCookie2.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lorg/apache/http/cookie/SetCookie2;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6b7a571e07b044e1L


# instance fields
.field private commentURL:Ljava/lang/String;

.field private discard:Z

.field private ports:[I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
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
    .line 94
    invoke-super {p0}, Lorg/apache/http/impl/cookie/BasicClientCookie;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/impl/cookie/BasicClientCookie2;

    .line 95
    .local v0, "clone":Lorg/apache/http/impl/cookie/BasicClientCookie2;
    iget-object v1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->ports:[I

    if-eqz v1, :cond_14

    .line 96
    iget-object v1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->ports:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->ports:[I

    .line 98
    :cond_14
    return-object v0
.end method

.method public getCommentURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->commentURL:Ljava/lang/String;

    return-object v0
.end method

.method public getPorts()[I
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->ports:[I

    return-object v0
.end method

.method public isExpired(Ljava/util/Date;)Z
    .registers 3
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 89
    iget-boolean v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->discard:Z

    if-nez v0, :cond_a

    invoke-super {p0, p1}, Lorg/apache/http/impl/cookie/BasicClientCookie;->isExpired(Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isPersistent()Z
    .registers 2

    .prologue
    .line 84
    iget-boolean v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->discard:Z

    if-nez v0, :cond_c

    invoke-super {p0}, Lorg/apache/http/impl/cookie/BasicClientCookie;->isPersistent()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public setCommentURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "commentURL"    # Ljava/lang/String;

    .prologue
    .line 75
    iput-object p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->commentURL:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public setDiscard(Z)V
    .registers 2
    .param p1, "discard"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->discard:Z

    .line 80
    return-void
.end method

.method public setPorts([I)V
    .registers 2
    .param p1, "ports"    # [I

    .prologue
    .line 66
    iput-object p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie2;->ports:[I

    .line 67
    return-void
.end method
