.class public Lorg/apache/http/impl/cookie/BasicClientCookie;
.super Ljava/lang/Object;
.source "BasicClientCookie.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;
.implements Lorg/apache/http/cookie/ClientCookie;
.implements Lorg/apache/http/cookie/SetCookie;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x35b4469645674e32L


# instance fields
.field private attribs:Ljava/util/Map;
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

.field private cookieComment:Ljava/lang/String;

.field private cookieDomain:Ljava/lang/String;

.field private cookieExpiryDate:Ljava/util/Date;

.field private cookiePath:Ljava/lang/String;

.field private cookieVersion:I

.field private isSecure:Z

.field private final name:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const-string v0, "Name"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 60
    iput-object p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->name:Ljava/lang/String;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->attribs:Ljava/util/Map;

    .line 62
    iput-object p2, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->value:Ljava/lang/String;

    .line 63
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 302
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/impl/cookie/BasicClientCookie;

    .line 303
    .local v0, "clone":Lorg/apache/http/impl/cookie/BasicClientCookie;
    new-instance v1, Ljava/util/HashMap;

    iget-object v2, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->attribs:Ljava/util/Map;

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v1, v0, Lorg/apache/http/impl/cookie/BasicClientCookie;->attribs:Ljava/util/Map;

    .line 304
    return-object v0
.end method

.method public containsAttribute(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 297
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->attribs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 293
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->attribs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getComment()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieComment:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 121
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDomain()Ljava/lang/String;
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieDomain:Ljava/lang/String;

    return-object v0
.end method

.method public getExpiryDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieExpiryDate:Ljava/util/Date;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookiePath:Ljava/lang/String;

    return-object v0
.end method

.method public getPorts()[I
    .registers 2

    .prologue
    .line 247
    const/4 v0, 0x0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 261
    iget v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieVersion:I

    return v0
.end method

.method public isExpired(Ljava/util/Date;)Z
    .registers 6
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 283
    const-string v0, "Date"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 284
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieExpiryDate:Ljava/util/Date;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieExpiryDate:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_19

    const/4 v0, 0x1

    :goto_18
    return v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method public isPersistent()Z
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieExpiryDate:Ljava/util/Date;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isSecure()Z
    .registers 2

    .prologue
    .line 223
    iget-boolean v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->isSecure:Z

    return v0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 289
    iget-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->attribs:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .registers 2
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 113
    iput-object p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieComment:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public setDomain(Ljava/lang/String;)V
    .registers 3
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    .line 187
    if-eqz p1, :cond_b

    .line 188
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieDomain:Ljava/lang/String;

    .line 192
    :goto_a
    return-void

    .line 190
    :cond_b
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieDomain:Ljava/lang/String;

    goto :goto_a
.end method

.method public setExpiryDate(Ljava/util/Date;)V
    .registers 2
    .param p1, "expiryDate"    # Ljava/util/Date;

    .prologue
    .line 152
    iput-object p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieExpiryDate:Ljava/util/Date;

    .line 153
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .registers 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 215
    iput-object p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookiePath:Ljava/lang/String;

    .line 216
    return-void
.end method

.method public setSecure(Z)V
    .registers 2
    .param p1, "secure"    # Z

    .prologue
    .line 239
    iput-boolean p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->isSecure:Z

    .line 240
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->value:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public setVersion(I)V
    .registers 2
    .param p1, "version"    # I

    .prologue
    .line 273
    iput p1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieVersion:I

    .line 274
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 309
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 310
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "[version: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    iget v1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieVersion:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    const-string v1, "[name: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    iget-object v1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    const-string v1, "[value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    iget-object v1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    const-string v1, "[domain: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    iget-object v1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieDomain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    const-string v1, "[path: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    iget-object v1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookiePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    const-string v1, "[expiry: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    iget-object v1, p0, Lorg/apache/http/impl/cookie/BasicClientCookie;->cookieExpiryDate:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 327
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
