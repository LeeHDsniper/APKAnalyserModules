.class public final Lcom/squareup/okhttp/internal/http/HttpMethod;
.super Ljava/lang/Object;
.source "HttpMethod.java"


# static fields
.field public static final METHODS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 23
    new-instance v0, Ljava/util/LinkedHashSet;

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "OPTIONS"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "GET"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "HEAD"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "POST"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "PUT"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "DELETE"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "TRACE"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "PATCH"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/squareup/okhttp/internal/http/HttpMethod;->METHODS:Ljava/util/Set;

    return-void
.end method

.method public static invalidatesCache(Ljava/lang/String;)Z
    .registers 2
    .param p0, "method"    # Ljava/lang/String;

    .prologue
    .line 27
    const-string v0, "POST"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "PATCH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "PUT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "DELETE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    :cond_20
    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method

.method public static permitsRequestBody(Ljava/lang/String;)Z
    .registers 2
    .param p0, "method"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-static {p0}, Lcom/squareup/okhttp/internal/http/HttpMethod;->requiresRequestBody(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "DELETE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public static requiresRequestBody(Ljava/lang/String;)Z
    .registers 2
    .param p0, "method"    # Ljava/lang/String;

    .prologue
    .line 34
    const-string v0, "POST"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "PUT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "PATCH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method
