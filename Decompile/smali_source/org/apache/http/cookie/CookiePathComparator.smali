.class public Lorg/apache/http/cookie/CookiePathComparator;
.super Ljava/lang/Object;
.source "CookiePathComparator.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/apache/http/cookie/Cookie;",
        ">;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x68695b9a07ff953aL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private normalizePath(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;
    .registers 5
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;

    .prologue
    .line 56
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "path":Ljava/lang/String;
    if-nez v0, :cond_8

    .line 58
    const-string v0, "/"

    .line 60
    :cond_8
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_23

    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 63
    :cond_23
    return-object v0
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 50
    check-cast p1, Lorg/apache/http/cookie/Cookie;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/apache/http/cookie/Cookie;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/cookie/CookiePathComparator;->compare(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/Cookie;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/Cookie;)I
    .registers 7
    .param p1, "c1"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "c2"    # Lorg/apache/http/cookie/Cookie;

    .prologue
    const/4 v2, 0x0

    .line 67
    invoke-direct {p0, p1}, Lorg/apache/http/cookie/CookiePathComparator;->normalizePath(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "path1":Ljava/lang/String;
    invoke-direct {p0, p2}, Lorg/apache/http/cookie/CookiePathComparator;->normalizePath(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "path2":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 77
    :cond_f
    :goto_f
    return v2

    .line 71
    :cond_10
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 72
    const/4 v2, -0x1

    goto :goto_f

    .line 73
    :cond_18
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 74
    const/4 v2, 0x1

    goto :goto_f
.end method
